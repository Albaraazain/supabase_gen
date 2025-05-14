// lib/src/schema/schema_reader.dart
import 'dart:convert';
import 'dart:math' show min;
import 'package:postgres/postgres.dart';
import 'package:dio/dio.dart';
import '../utils/logger.dart';
import '../config/config_model.dart';
import 'table_info.dart';

class SchemaReader {
  final SupabaseGenConfig config;
  Connection? _connection;
  Dio? _dioClient;
  final Logger _logger = Logger('SchemaReader');

  SchemaReader(this.config);

  Future<void> connect() async {
    if (config.connectionType == ConnectionType.local) {
      await _connectLocal();
    } else {
      _connectRemote();
    }
  }

  Future<void> _connectLocal() async {
    _logger.info(
      'Connecting to local database: ${config.host}:${config.port}/${config.database}',
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
        settings: ConnectionSettings(
          sslMode: config.ssl ? SslMode.require : SslMode.disable,
        ),
      );
      _logger.info('Connected successfully to local database');
    } catch (e) {
      _logger.severe('Local database connection failed: $e');
      rethrow;
    }
  }

  void _connectRemote() {
    _logger.info(
      'Setting up remote connection to Supabase: ${config.supabaseUrl}',
    );

    try {
      // Set up dio client with appropriate headers for Supabase
      _dioClient = Dio(
        BaseOptions(
          baseUrl: config.supabaseUrl!,
          headers: {
            'apikey': config.supabaseKey!,
            'Authorization': 'Bearer ${config.supabaseKey!}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          validateStatus: (status) => true, // Accept all status codes to handle manually
        ),
      );
      _logger.info('Remote connection configured successfully');
    } catch (e) {
      _logger.severe('Remote connection configuration failed: $e');
      rethrow;
    }
  }

  Future<void> disconnect() async {
    if (config.connectionType == ConnectionType.local) {
      await _connection?.close();
      _connection = null;
      _logger.info('Disconnected from local database');
    } else {
      _dioClient = null;
      _logger.info('Cleaned up remote connection');
    }
  }

  Future<List<TableInfo>> readTables() async {
    if (config.connectionType == ConnectionType.local) {
      return _readTablesLocal();
    } else {
      return _readTablesRemote();
    }
  }

  Future<List<TableInfo>> _readTablesLocal() async {
    if (_connection == null) {
      throw StateError(
        'Local database connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading tables from local database');

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

      final columns = await _readTableColumnsLocal(schema, name);

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

  Future<List<TableInfo>> _readTablesRemote() async {
    if (_dioClient == null) {
      throw StateError(
        'Remote connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading tables from remote Supabase database');
    _logger.info('Using URL: ${config.supabaseUrl}');

    try {
      final tables = <TableInfo>[];
      final tableNames = <String>[];
      
      // Method 1: Create and call the RPC function to get tables
      _logger.info('METHOD 1: Trying to create and use RPC to get tables');
      try {
        // First, create the function to list tables if it doesn't exist
        _logger.info('Creating list_tables RPC function...');
        final createFunctionResponse = await _dioClient!.post(
          '/rest/v1/rpc/pg_query',
          data: {
            'query': '''
            CREATE OR REPLACE FUNCTION public.list_tables()
            RETURNS TABLE (table_name text) 
            SECURITY DEFINER
            LANGUAGE sql
            AS \$\$
              SELECT table_name::text
              FROM information_schema.tables
              WHERE table_schema = 'public'
              AND table_type = 'BASE TABLE';
            \$\$;
            '''
          },
        );
        
        _logger.info('Function creation response: ${createFunctionResponse.statusCode}');
        
        // Now call the function to get tables
        final response = await _dioClient!.post(
          '/rest/v1/rpc/list_tables',
          data: {},
        );
        
        _logger.info('RPC list_tables response status: ${response.statusCode}');
        _logger.info('RPC list_tables response type: ${response.data.runtimeType}');
        if (response.data != null) {
          _logger.info('RPC Response sample: ${response.data.toString().substring(0, min(100, response.data.toString().length))}...');
        }
        
        if (response.statusCode == 200 && response.data is List) {
          final tableList = response.data as List;
          _logger.info('RPC returned ${tableList.length} tables');
          
          for (final table in tableList) {
            if (table is Map<String, dynamic> && table['table_name'] != null) {
              final name = table['table_name'] as String;
              if (_shouldProcessTable('public', name)) {
                tableNames.add(name);
                _logger.info('Added table from RPC: public.$name');
              }
            }
          }
        }
      } catch (e) {
        // RPC approach failed, continue to next method
        _logger.warning('RPC method failed: $e');
      }

      // Method 2: If RPC didn't work, try direct REST inspection
      if (tableNames.isEmpty) {
        _logger.info('METHOD 2: Trying direct REST API inspection');
        try {
          final response = await _dioClient!.get('/rest/v1/');
          
          _logger.info('REST root response status: ${response.statusCode}');
          _logger.info('REST root headers: ${response.headers.map}');
          
          // Some Supabase instances return table list in headers
          if (response.headers.map.containsKey('x-tables')) {
            final tables = response.headers.map['x-tables']?.first;
            _logger.info('Found x-tables header: $tables');
            if (tables != null) {
              tableNames.addAll(tables.split(',').map((t) => t.trim()).where((t) => t.isNotEmpty));
              _logger.info('Added ${tableNames.length} tables from headers');
            }
          }
          // Try to parse tables from the response body
          else if (response.data is Map<String, dynamic>) {
            _logger.info('Analyzing REST API response body for endpoints');
            final endpoints = <String>[];
            _extractEndpoints(response.data, '', endpoints);
            
            _logger.info('Found ${endpoints.length} endpoints in response');
            if (endpoints.isNotEmpty) {
              _logger.info('Sample endpoints: ${endpoints.take(5).join(', ')}...');
            }
            
            for (final endpoint in endpoints) {
              if (endpoint.startsWith('/rest/v1/')) {
                // Extract table name from endpoint
                final parts = endpoint.replaceFirst('/rest/v1/', '').split('/').first.split('?');
                if (parts.isNotEmpty && parts[0].isNotEmpty) {
                  final tableName = parts[0];
                  // Exclude system tables and other non-data endpoints
                  if (!tableName.startsWith('_') && 
                      !['rpc', 'graphql', 'storage'].contains(tableName) &&
                      !tableNames.contains(tableName)) {
                    tableNames.add(tableName);
                    _logger.info('Found potential table from endpoint: $tableName');
                  }
                }
              }
            }
          }
        } catch (e) {
          _logger.warning('REST inspection failed: $e');
        }
      }
      
      // Method 3: If we still don't have tables, query system views directly
      if (tableNames.isEmpty) {
        _logger.info('METHOD 3: Trying to query system views');
        try {
          // Try querying the system views through REST API
          final response = await _dioClient!.get(
            '/rest/v1/pg_tables',
            queryParameters: {
              'select': 'schemaname,tablename',
              'schemaname': 'eq.public',
            },
          );
          
          _logger.info('System view response status: ${response.statusCode}');
          _logger.info('System view response type: ${response.data.runtimeType}');
          if (response.data != null) {
            _logger.info('System view sample: ${response.data.toString().substring(0, min(100, response.data.toString().length))}...');
          }
          
          if (response.statusCode == 200 && response.data is List) {
            final tableList = response.data as List;
            _logger.info('System view returned ${tableList.length} tables');
            
            for (final table in tableList) {
              if (table is Map<String, dynamic> && table['tablename'] != null) {
                final name = table['tablename'] as String;
                final schema = table['schemaname'] as String? ?? 'public';
                if (_shouldProcessTable(schema, name)) {
                  tableNames.add(name);
                  _logger.info('Added table from system view: $schema.$name');
                }
              }
            }
          }
        } catch (e) {
          _logger.warning('System views query failed: $e');
        }
      }

      // Method 4: Try alternative system views
      if (tableNames.isEmpty) {
        _logger.info('METHOD 4: Trying alternative system views');
        try {
          // Try information_schema.tables through REST API
          final response = await _dioClient!.get(
            '/rest/v1/information_schema/tables',
            queryParameters: {
              'select': 'table_schema,table_name',
              'table_schema': 'eq.public',
              'table_type': 'eq.BASE TABLE',
            },
          );
          
          _logger.info('Info schema response status: ${response.statusCode}');
          if (response.statusCode != 200) {
            _logger.info('Info schema error response: ${response.data}');
          }
          
          if (response.statusCode == 200 && response.data is List) {
            final tableList = response.data as List;
            _logger.info('Info schema returned ${tableList.length} tables');
            
            for (final table in tableList) {
              if (table is Map<String, dynamic> && table['table_name'] != null) {
                final name = table['table_name'] as String;
                final schema = table['table_schema'] as String? ?? 'public';
                if (_shouldProcessTable(schema, name)) {
                  tableNames.add(name);
                  _logger.info('Added table from info schema: $schema.$name');
                }
              }
            }
          }
        } catch (e) {
          _logger.warning('Information schema query failed: $e');
        }
      }

      // Method 5: Brute force - probe tables from config file
      if (tableNames.isEmpty) {
        _logger.info('METHOD 5: No tables found through API methods, probing for tables');
        // Use probe tables from config
        final probeTables = config.probeTables;
        
        _logger.info('Probing ${probeTables.length} configured table names');
        int foundCount = 0;
        
        for (final tableName in probeTables) {
          try {
            final response = await _dioClient!.get(
              '/rest/v1/$tableName',
              queryParameters: {'limit': 1},
            );
            
            if (response.statusCode == 200) {
              tableNames.add(tableName);
              foundCount++;
              _logger.info('Found table by probing: $tableName (status ${response.statusCode})');
            } else if (response.statusCode == 404) {
              // Table doesn't exist - normal case
            } else {
              _logger.info('Unexpected status for $tableName: ${response.statusCode}');
            }
          } catch (e) {
            _logger.info('Error probing table $tableName: $e');
          }
        }
        
        _logger.info('Probing found $foundCount tables out of ${probeTables.length} attempted');
      }
      
      _logger.info('Discovered ${tableNames.length} tables: ${tableNames.join(', ')}');
      
      // Process each table to get column information
      for (final tableName in tableNames) {
        try {
          // Fetch sample data to infer columns
          final response = await _dioClient!.get(
            '/rest/v1/$tableName',
            queryParameters: {
              'limit': 5,  // Get a few rows to better infer types
            },
          );
          
          if (response.statusCode == 200) {
            _logger.info('Processing table: $tableName');
            _logger.info('Sample data type: ${response.data.runtimeType}');
            if (response.data is List) {
              _logger.info('Sample data count: ${(response.data as List).length}');
            }
            
            // Get column information from the data
            final columns = await _inferTableColumns(tableName, response.data);
            
            _logger.info('Inferred ${columns.length} columns for $tableName');
            if (columns.isNotEmpty) {
              _logger.info('Column names: ${columns.map((c) => c.name).join(', ')}');
              
              tables.add(
                TableInfo(
                  name: tableName,
                  schema: 'public',  // Assume public schema for Supabase REST API
                  columns: columns,
                  comment: null,
                ),
              );
            }
          } else {
            _logger.warning('Error fetching data for $tableName: status ${response.statusCode}');
          }
        } catch (e) {
          _logger.warning('Error processing table $tableName: $e');
        }
      }
      
      return tables;
    } catch (e, stackTrace) {
      _logger.severe('Error reading remote tables: $e');
      _logger.severe('Stack trace: $stackTrace');
      return [];
    }
  }
  
  // Helper method to extract all REST API endpoints from response
  void _extractEndpoints(dynamic data, String currentPath, List<String> endpoints) {
    if (data is Map<String, dynamic>) {
      if (currentPath.isNotEmpty) {
        endpoints.add(currentPath);
      }
      
      for (final entry in data.entries) {
        final newPath = currentPath.isEmpty ? entry.key : '$currentPath/${entry.key}';
        _extractEndpoints(entry.value, newPath, endpoints);
      }
    } else if (data is List) {
      if (currentPath.isNotEmpty) {
        endpoints.add(currentPath);
      }
    } else if (currentPath.isNotEmpty) {
      endpoints.add(currentPath);
    }
  }
  
  Future<List<ColumnInfo>> _inferTableColumns(String tableName, dynamic data) async {
    final columns = <ColumnInfo>[];
    
    try {
      // Try to get a row from the table to infer columns
      List<dynamic> rows = [];
      
      if (data is List) {
        rows = data;
      } else if (data is Map<String, dynamic>) {
        // Single object returned
        rows = [data];
      } else {
        // Try to get more data
        final response = await _dioClient!.get(
          '/rest/v1/$tableName',
          queryParameters: {
            'limit': 5,
          },
        );
        
        if (response.statusCode == 200 && response.data is List) {
          rows = response.data;
        }
      }
      
      if (rows.isEmpty) {
        // Try to create a definition based on what we know
        return _createMinimalColumns(tableName);
      }
      
      // Take the first row to infer columns
      final row = rows.first;
      
      if (row is! Map<String, dynamic>) {
        return _createMinimalColumns(tableName);
      }
      
      // Analyze all available rows to determine nullability and types
      final nullabilityMap = <String, bool>{};
      final typeMap = <String, String>{};
      
      // Initialize with first row
      for (final entry in row.entries) {
        nullabilityMap[entry.key] = entry.value == null;
        typeMap[entry.key] = _determineDataType(entry.value);
      }
      
      // Check other rows for more accurate type and nullability inference
      for (int i = 1; i < rows.length; i++) {
        final nextRow = rows[i];
        if (nextRow is! Map<String, dynamic>) continue;
        
        for (final entry in nextRow.entries) {
          // If we find a null value for a field that was previously non-null, mark it nullable
          if (nullabilityMap.containsKey(entry.key) && entry.value == null) {
            nullabilityMap[entry.key] = true;
          }
          
          // If the type differs from our initial guess, default to string
          if (typeMap.containsKey(entry.key) && 
              _determineDataType(entry.value) != typeMap[entry.key] &&
              entry.value != null) {
            typeMap[entry.key] = 'text';
          }
        }
      }
      
      // Create column definitions
      for (final entry in row.entries) {
        final name = entry.key;
        
        columns.add(
          ColumnInfo(
            name: name,
            type: typeMap[name] ?? 'text',
            isNullable: nullabilityMap[name] ?? true,
            isPrimaryKey: name == 'id',
            isUnique: name == 'id',
            defaultValue: null,
            comment: null,
            foreignKey: null,
            foreignTable: null,
          ),
        );
      }
      
      return columns;
    } catch (e) {
      _logger.warning('Error inferring columns for $tableName: $e');
      return _createMinimalColumns(tableName);
    }
  }
  
  List<ColumnInfo> _createMinimalColumns(String tableName) {
    // Create a minimal set of columns based on table name
    final columns = <ColumnInfo>[];
    
    // Always include an ID
    columns.add(
      ColumnInfo(
        name: 'id',
        type: 'uuid',
        isNullable: false,
        isPrimaryKey: true,
        isUnique: true,
        defaultValue: null,
        comment: null,
        foreignKey: null,
        foreignTable: null,
      ),
    );
    
    // If this is a junction table (e.g., user_games), add foreign keys
    if (tableName.contains('_')) {
      final parts = tableName.split('_');
      
      if (parts.length == 2) {
        // First entity (singular)
        final firstEntity = parts[0].endsWith('s') 
            ? parts[0].substring(0, parts[0].length - 1) 
            : parts[0];
            
        // Second entity (singular)
        final secondEntity = parts[1].endsWith('s') 
            ? parts[1].substring(0, parts[1].length - 1) 
            : parts[1];
        
        columns.add(
          ColumnInfo(
            name: '${firstEntity}_id',
            type: 'uuid',
            isNullable: false,
            isPrimaryKey: false,
            isUnique: false,
            defaultValue: null,
            comment: null,
            foreignKey: 'id',
            foreignTable: 'public.${firstEntity}s',
          ),
        );
        
        columns.add(
          ColumnInfo(
            name: '${secondEntity}_id',
            type: 'uuid',
            isNullable: false,
            isPrimaryKey: false,
            isUnique: false,
            defaultValue: null,
            comment: null,
            foreignKey: 'id',
            foreignTable: 'public.${secondEntity}s',
          ),
        );
      }
    }
    
    // Add common timestamps
    columns.add(
      ColumnInfo(
        name: 'created_at',
        type: 'timestamp with time zone',
        isNullable: false,
        isPrimaryKey: false,
        isUnique: false,
        defaultValue: 'now()',
        comment: null,
        foreignKey: null,
        foreignTable: null,
      ),
    );
    
    columns.add(
      ColumnInfo(
        name: 'updated_at',
        type: 'timestamp with time zone',
        isNullable: false,
        isPrimaryKey: false,
        isUnique: false,
        defaultValue: 'now()',
        comment: null,
        foreignKey: null,
        foreignTable: null,
      ),
    );
    
    return columns;
  }
  
  String _determineDataType(dynamic value) {
    if (value == null) return 'text';
    if (value is int) return 'integer';
    if (value is double) return 'numeric';
    if (value is bool) return 'boolean';
    if (value is Map) return 'jsonb';
    if (value is List) return 'array';
    
    // Try to determine if a string is actually a UUID, date, etc.
    if (value is String) {
      // UUID check - 36 characters with hyphens in the correct positions
      if (value.length == 36 && 
          value.contains(RegExp(r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$'))) {
        return 'uuid';
      }
      
      // ISO date check
      if (value.contains(RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}'))) {
        return 'timestamp with time zone';
      }
      
      // Simple date check
      if (value.contains(RegExp(r'^\d{4}-\d{2}-\d{2}'))) {
        return 'date';
      }
    }
    
    return 'text';
  }

  Future<List<ColumnInfo>> _readTableColumnsLocal(
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

    // Get column information
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