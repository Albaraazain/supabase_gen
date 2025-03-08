import 'package:postgres/postgres.dart';
import '../config/config_model.dart';
import 'table_info.dart';
import '../utils/logger.dart';
import 'schema_reader.dart';

/// Enhanced schema reader that properly handles schema-qualified table names and wildcard patterns
class EnhancedSchemaReader extends SchemaReader {
  final Logger _logger = Logger('EnhancedSchemaReader');

  EnhancedSchemaReader(SupabaseGenConfig config) : super(config);

  @override
  Future<List<TableInfo>> readTables() async {
    final tables = <TableInfo>[];

    // Get a list of tables in the database (excluding system tables)
    final connection = await getConnection();
    final tablesResult = await connection.query('''
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
      
      final fullyQualifiedName = '$schemaName.$tableName';

      if (!_shouldProcessTable(schemaName, tableName, fullyQualifiedName)) {
        _logger.info('Skipping table $fullyQualifiedName');
        continue;
      }

      _logger.info('Reading schema for table $fullyQualifiedName');

      final columnsResult = await readTableColumns(schemaName, tableName);
      
      tables.add(TableInfo(
        name: tableName,
        schema: schemaName,
        columns: columnsResult,
        comment: tableComment,
      ));
    }

    return tables;
  }

  /// Determines if a table should be processed based on include/exclude patterns
  bool _shouldProcessTable(String schema, String tableName, String fullyQualifiedName) {
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