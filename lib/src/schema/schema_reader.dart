// lib/src/schema/schema_reader.dart
import 'package:postgres/postgres.dart';
import '../utils/logger.dart';
import '../config/config_model.dart';
import 'table_info.dart';

class SchemaReader {
  final SupabaseGenConfig config;
  Connection? _connection;
  final Logger _logger = Logger('SchemaReader');

  SchemaReader(this.config);

  Future<void> connect() async {
    _logger.info(
      'Connecting to ${config.host}:${config.port}/${config.database}',
    );

    try {
      _connection = await Connection.open(
        Endpoint(
          host: config.host,
          port: config.port,
          database: config.database,
          username: config.username,
          password: config.password,
        ),
        settings: ConnectionSettings(sslMode: SslMode.disable),
      );
      _logger.info('Connected successfully');
    } catch (e) {
      _logger.severe('Connection failed: $e');
      rethrow;
    }
  }

  Future<void> disconnect() async {
    await _connection?.close();
    _connection = null;
    _logger.info('Disconnected from database');
  }

  Future<List<TableInfo>> readTables() async {
    if (_connection == null) {
      throw StateError(
        'Database connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading tables from database');

    final tables = <TableInfo>[];

    final result = await _connection!.execute(
      'SELECT DISTINCT ON (t.table_schema, t.table_name) t.table_schema, t.table_name, obj_description(pgc.oid) as table_comment '
      'FROM information_schema.tables t '
      'JOIN pg_class pgc ON pgc.relname = t.table_name '
      'WHERE t.table_schema NOT IN (\'information_schema\', \'pg_catalog\') '
      'AND t.table_type = \'BASE TABLE\' '
      'ORDER BY t.table_schema, t.table_name',
    );

    for (final row in result) {
      final schema = row[0] as String;
      final name = row[1] as String;
      final comment = row[2] as String?;

      if (!_shouldProcessTable(schema, name)) {
        _logger.info('Skipping table $schema.$name');
        continue;
      }

      _logger.info('Reading schema for table $schema.$name');

      final columns = await _readTableColumns(schema, name);

      // Deduplicate all columns, not just primary keys
      final deduplicatedColumns = <ColumnInfo>[];
      final processedColumnNames = <String>{};

      for (final column in columns) {
        if (processedColumnNames.contains(column.name)) {
          // Skip duplicate column
          continue;
        }

        processedColumnNames.add(column.name);
        deduplicatedColumns.add(column);
      }

      tables.add(
        TableInfo(
          name: name,
          schema: schema,
          columns: deduplicatedColumns,
          comment: comment,
        ),
      );
    }

    return tables;
  }

  Future<List<ColumnInfo>> _readTableColumns(
    String schema,
    String tableName,
  ) async {
    if (_connection == null) {
      throw StateError(
        'Database connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading columns for $schema.$tableName');

    final columns = <ColumnInfo>[];

    // Get column information - Fix the subquery that's returning multiple rows
    final columnsResult = await _connection!.execute(
      'SELECT DISTINCT ON (c.column_name) c.column_name, c.data_type, c.is_nullable, c.column_default, '
      'col_description(pgc.oid, c.ordinal_position) as column_comment, '
      '(SELECT EXISTS (SELECT 1 FROM information_schema.table_constraints tc '
      'JOIN information_schema.constraint_column_usage ccu ON tc.constraint_name = ccu.constraint_name '
      'WHERE tc.table_schema = c.table_schema AND tc.table_name = c.table_name '
      'AND ccu.column_name = c.column_name AND tc.constraint_type = \'PRIMARY KEY\' LIMIT 1)) as is_primary_key, '
      '(SELECT EXISTS (SELECT 1 FROM information_schema.table_constraints tc '
      'JOIN information_schema.constraint_column_usage ccu ON tc.constraint_name = ccu.constraint_name '
      'WHERE tc.table_schema = c.table_schema AND tc.table_name = c.table_name '
      'AND ccu.column_name = c.column_name AND tc.constraint_type = \'UNIQUE\' LIMIT 1)) as is_unique '
      'FROM information_schema.columns c '
      'JOIN pg_class pgc ON pgc.relname = c.table_name '
      'WHERE c.table_schema = \$1 AND c.table_name = \$2 '
      'ORDER BY c.column_name, c.ordinal_position',
      parameters: [schema, tableName],
    );

    // Get foreign key information
    final foreignKeysResult = await _connection!.execute(
      'SELECT kcu.column_name, ccu.table_schema AS foreign_table_schema, '
      'ccu.table_name AS foreign_table_name, ccu.column_name AS foreign_column_name '
      'FROM information_schema.table_constraints AS tc '
      'JOIN information_schema.key_column_usage AS kcu '
      'ON tc.constraint_name = kcu.constraint_name AND tc.table_schema = kcu.table_schema '
      'JOIN information_schema.constraint_column_usage AS ccu '
      'ON ccu.constraint_name = tc.constraint_name '
      'WHERE tc.constraint_type = \'FOREIGN KEY\' AND tc.table_schema = \$1 AND tc.table_name = \$2',
      parameters: [schema, tableName],
    );

    // Create a map of column name to foreign key information
    final foreignKeyMap = <String, Map<String, String>>{};
    for (final fkRow in foreignKeysResult) {
      final columnName = fkRow[0] as String;
      final foreignSchema = fkRow[1] as String;
      final foreignTable = fkRow[2] as String;
      foreignKeyMap[columnName] = {
        'foreignTable': '$foreignSchema.$foreignTable',
        'foreignKey': fkRow[3] as String,
      };
    }

    // Create column info objects
    for (final columnRow in columnsResult) {
      final columnName = columnRow[0] as String;
      final dataType = columnRow[1] as String;
      final isNullable = columnRow[2] == 'YES';
      final defaultValue = columnRow[3] as String?;
      final comment = columnRow[4] as String?;
      final isPrimaryKey = columnRow[5] as bool? ?? false;
      final isUnique = columnRow[6] as bool? ?? false;

      final foreignKeyInfo = foreignKeyMap[columnName];

      columns.add(
        ColumnInfo(
          name: columnName,
          type: dataType,
          isNullable: isNullable,
          isPrimaryKey: isPrimaryKey,
          isUnique: isUnique,
          defaultValue: defaultValue,
          comment: comment,
          foreignKey: foreignKeyInfo?['foreignKey'],
          foreignTable: foreignKeyInfo?['foreignTable'],
        ),
      );
    }

    return columns;
  }

  bool _shouldProcessTable(String schema, String tableName) {
    if (config.includeTables.isNotEmpty) {
      for (final pattern in config.includeTables) {
        final parts = pattern.split('.');
        if (parts.length == 2) {
          final schemaPattern = parts[0];
          final tablePattern = parts[1];
          if (_matchesPattern(schema, schemaPattern) &&
              _matchesPattern(tableName, tablePattern)) {
            return true;
          }
        } else if (_matchesPattern(tableName, pattern)) {
          return true;
        }
      }
      return false;
    }

    if (config.excludeTables.isNotEmpty) {
      for (final pattern in config.excludeTables) {
        final parts = pattern.split('.');
        if (parts.length == 2) {
          final schemaPattern = parts[0];
          final tablePattern = parts[1];
          if (_matchesPattern(schema, schemaPattern) &&
              _matchesPattern(tableName, tablePattern)) {
            return false;
          }
        } else if (_matchesPattern(tableName, pattern)) {
          return false;
        }
      }
    }

    return config.generateForAllTables;
  }

  bool _matchesPattern(String text, String pattern) {
    if (pattern == '*') return true;
    if (pattern.contains('*')) {
      final regex = RegExp('^${pattern.replaceAll('*', '.*')}\$');
      return regex.hasMatch(text);
    }
    return text == pattern;
  }
}
