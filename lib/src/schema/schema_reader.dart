// lib/src/schema/schema_reader.dart
import 'package:postgres/postgres.dart';
import '../config/config_model.dart';
import 'table_info.dart';
import '../utils/logger.dart';

class SchemaReader {
  final SupabaseGenConfig config;
  late PostgreSQLConnection _connection;
  final Logger _logger = Logger('SchemaReader');

  SchemaReader(this.config);

  Future<void> connect() async {
    _logger.info('Connecting to ${config.host}:${config.port}/${config.database}');
    
    _connection = PostgreSQLConnection(
      config.host,
      config.port,
      config.database,
      username: config.username,
      password: config.password,
      useSSL: config.ssl,
    );

    try {
      await _connection.open();
      _logger.info('Connected successfully');
    } catch (e) {
      _logger.severe('Connection failed: $e');
      rethrow;
    }
  }

  Future<void> disconnect() async {
    await _connection.close();
    _logger.info('Disconnected from database');
  }

  Future<List<TableInfo>> readTables() async {
    final tables = <TableInfo>[];

    // Get a list of tables in the database (excluding system tables)
    final tablesResult = await _connection.query('''
      SELECT 
        t.table_name, 
        t.table_schema,
        obj_description(pgc.oid) as table_comment
      FROM 
        information_schema.tables t
      JOIN 
        pg_class pgc ON pgc.relname = t.table_name
      WHERE 
        t.table_schema NOT IN ('pg_catalog', 'information_schema')
        AND t.table_type = 'BASE TABLE'
      ORDER BY 
        t.table_schema, t.table_name
    ''');

    // Filter tables based on configuration
    for (final tableRow in tablesResult) {
      final tableName = tableRow[0] as String;
      final schemaName = tableRow[1] as String;
      final tableComment = tableRow[2] as String?;

      if (!_shouldProcessTable(schemaName, tableName)) {
        _logger.info('Skipping table $schemaName.$tableName');
        continue;
      }

      _logger.info('Reading schema for table $schemaName.$tableName');

      final columnsResult = await _readTableColumns(schemaName, tableName);
      
      tables.add(TableInfo(
        name: tableName,
        schema: schemaName,
        columns: columnsResult,
        comment: tableComment,
      ));
    }

    return tables;
  }

  Future<List<ColumnInfo>> _readTableColumns(String schema, String table) async {
    final columns = <ColumnInfo>[];

    // Get column information
    final columnsResult = await _connection.query('''
      SELECT 
        c.column_name,
        c.data_type,
        c.is_nullable = 'YES' as is_nullable,
        c.column_default,
        col_description(pgc.oid, c.ordinal_position) as column_comment,
        (
          SELECT 
            TRUE 
          FROM 
            information_schema.table_constraints tc
          JOIN 
            information_schema.constraint_column_usage ccu ON tc.constraint_name = ccu.constraint_name
          WHERE 
            tc.table_schema = c.table_schema
            AND tc.table_name = c.table_name
            AND ccu.column_name = c.column_name
            AND tc.constraint_type = 'PRIMARY KEY'
        ) as is_primary_key,
        (
          SELECT 
            TRUE 
          FROM 
            information_schema.table_constraints tc
          JOIN 
            information_schema.constraint_column_usage ccu ON tc.constraint_name = ccu.constraint_name
          WHERE 
            tc.table_schema = c.table_schema
            AND tc.table_name = c.table_name
            AND ccu.column_name = c.column_name
            AND tc.constraint_type = 'UNIQUE'
        ) as is_unique
      FROM 
        information_schema.columns c
      JOIN 
        pg_class pgc ON pgc.relname = c.table_name
      WHERE 
        c.table_schema = @schema
        AND c.table_name = @table
      ORDER BY 
        c.ordinal_position
    ''', substitutionValues: {'schema': schema, 'table': table});

    // Get foreign key information
    final foreignKeysResult = await _connection.query('''
      SELECT
        kcu.column_name,
        ccu.table_schema AS foreign_table_schema,
        ccu.table_name AS foreign_table_name,
        ccu.column_name AS foreign_column_name
      FROM
        information_schema.table_constraints AS tc
      JOIN
        information_schema.key_column_usage AS kcu ON tc.constraint_name = kcu.constraint_name
      JOIN
        information_schema.constraint_column_usage AS ccu ON ccu.constraint_name = tc.constraint_name
      WHERE
        tc.constraint_type = 'FOREIGN KEY'
        AND tc.table_schema = @schema
        AND tc.table_name = @table
    ''', substitutionValues: {'schema': schema, 'table': table});

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
      final isNullable = columnRow[2] as bool;
      final defaultValue = columnRow[3] as String?;
      final comment = columnRow[4] as String?;
      final isPrimaryKey = columnRow[5] as bool? ?? false;
      final isUnique = columnRow[6] as bool? ?? false;

      final foreignKeyInfo = foreignKeyMap[columnName];

      columns.add(ColumnInfo(
        name: columnName,
        type: dataType,
        isNullable: isNullable,
        isPrimaryKey: isPrimaryKey,
        isUnique: isUnique,
        defaultValue: defaultValue,
        comment: comment,
        foreignKey: foreignKeyInfo?['foreignKey'],
        foreignTable: foreignKeyInfo?['foreignTable'],
      ));
    }

    return columns;
  }

  bool _shouldProcessTable(String schema, String tableName) {
    final fullyQualifiedName = '$schema.$tableName';

    // If include patterns are specified, check if the table matches any of them
    if (config.includeTables.isNotEmpty) {
      return _matchesAnyPattern(schema, tableName, fullyQualifiedName, config.includeTables);
    }
    
    // If exclude patterns are specified, check if the table matches any of them
    if (config.excludeTables.isNotEmpty) {
      return !_matchesAnyPattern(schema, tableName, fullyQualifiedName, config.excludeTables);
    }
    
    // If no include or exclude patterns are specified, use the generateForAllTables flag
    return config.generateForAllTables;
  }

  /// Checks if a table matches any of the given patterns
  bool _matchesAnyPattern(String schema, String tableName, String fullyQualifiedName, List<String> patterns) {
    for (final pattern in patterns) {
      if (_matchesPattern(schema, tableName, fullyQualifiedName, pattern)) {
        return true;
      }
    }
    return false;
  }

  /// Checks if a table matches a specific pattern
  bool _matchesPattern(String schema, String tableName, String fullyQualifiedName, String pattern) {
    // Exact match for fully qualified name
    if (pattern == fullyQualifiedName) {
      return true;
    }
    
    // Handle wildcard patterns like 'schema.*'
    if (pattern.endsWith('.*')) {
      final schemaPattern = pattern.substring(0, pattern.length - 2);
      return schema == schemaPattern;
    }
    
    // Handle table name only (no schema)
    if (!pattern.contains('.')) {
      return tableName == pattern;
    }
    
    return false;
  }
}