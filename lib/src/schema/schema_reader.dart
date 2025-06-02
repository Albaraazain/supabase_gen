// lib/src/schema/schema_reader.dart
import 'dart:convert';
import 'dart:math' show min;
import 'package:postgres/postgres.dart';
import 'package:dio/dio.dart';
import '../utils/logger.dart';
import '../config/config_model.dart';
import 'table_info.dart';
import 'rpc_info.dart';

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
          validateStatus:
              (status) => true, // Accept all status codes to handle manually
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

  // NOTE: We now use multiple RPC functions for more accurate schema introspection:
  /*
  -- 1. Function to get all table columns information
  CREATE OR REPLACE FUNCTION public.get_table_columns(p_table_name text)
  RETURNS TABLE (
      schema_name text,
      tbl_name text,
      col_name text,
      col_type text,
      max_length int,
      col_default text,
      nullable text,
      ord_position int
  )
  LANGUAGE sql SECURITY DEFINER AS $$
    SELECT 
      c.table_schema as schema_name,
      c.table_name as tbl_name,
      c.column_name as col_name,
      c.data_type as col_type,
      CASE 
          WHEN c.character_maximum_length IS NOT NULL THEN c.character_maximum_length::int 
          ELSE NULL 
      END as max_length,
      c.column_default,
      c.is_nullable as nullable,
      c.ordinal_position as ord_position
    FROM 
      information_schema.columns c
    WHERE 
      c.table_schema = 'public' AND 
      c.table_name = p_table_name
    ORDER BY 
      c.ordinal_position;
  $$;

  -- 2. Function to get all table constraints
  CREATE OR REPLACE FUNCTION public.get_table_constraints(p_table_name text)
  RETURNS TABLE (
      schema_name text,
      tbl_name text,
      constraint_name text,
      constraint_type text,
      col_name text,
      ref_table text,
      ref_column text
  )
  LANGUAGE sql SECURITY DEFINER AS $$
    SELECT
      tc.table_schema as schema_name,
      tc.table_name as tbl_name,
      tc.constraint_name,
      tc.constraint_type,
      kcu.column_name as col_name,
      ccu.table_name as ref_table,
      ccu.column_name as ref_column
    FROM
      information_schema.table_constraints tc
    LEFT JOIN
      information_schema.key_column_usage kcu ON tc.constraint_name = kcu.constraint_name
    LEFT JOIN
      information_schema.constraint_column_usage ccu ON tc.constraint_name = ccu.constraint_name
    WHERE
      tc.table_schema = 'public' AND
      tc.table_name = p_table_name
    ORDER BY
      tc.constraint_name;
  $$;

  -- 3. Function to get all table indexes
  CREATE OR REPLACE FUNCTION public.get_table_indexes(p_table_name text)
  RETURNS TABLE (
      tbl_name text,
      idx_name text,
      col_name text,
      is_unique boolean,
      is_primary boolean
  )
  LANGUAGE sql SECURITY DEFINER AS $$
    SELECT
      t.relname as tbl_name,
      i.relname as idx_name,
      a.attname as col_name,
      ix.indisunique as is_unique,
      ix.indisprimary as is_primary
    FROM
      pg_class t,
      pg_class i,
      pg_index ix,
      pg_attribute a
    WHERE
      t.relname = p_table_name AND
      t.oid = ix.indrelid AND
      i.oid = ix.indexrelid AND
      a.attrelid = t.oid AND
      a.attnum = ANY(ix.indkey) AND
      t.relkind = 'r' AND
      t.relnamespace IN (SELECT oid FROM pg_namespace WHERE nspname = 'public')
    ORDER BY
      t.relname,
      i.relname;
  $$;

  -- 4. Function to get all table triggers
  CREATE OR REPLACE FUNCTION public.get_table_triggers(p_table_name text)
  RETURNS TABLE (
      tbl_name text,
      trg_name text,
      event_type text,
      action_time text,
      action_stmt text
  )
  LANGUAGE sql SECURITY DEFINER AS $$
    SELECT
      event_object_table as tbl_name,
      trigger_name as trg_name,
      string_agg(event_manipulation, ', ') as event_type,
      action_timing as action_time,
      action_statement as action_stmt
    FROM
      information_schema.triggers
    WHERE
      event_object_schema = 'public' AND
      event_object_table = p_table_name
    GROUP BY
      event_object_table,
      trigger_name,
      action_timing,
      action_statement
    ORDER BY
      trigger_name;
  $$;
  */

  Future<List<TableInfo>> readTables() async {
    if (config.connectionType == ConnectionType.local) {
      return _readTablesLocal();
    } else {
      return _readTablesRemote();
    }
  }

  /// Read RPC functions from the database
  Future<List<RpcFunctionInfo>> readRpcFunctions() async {
    if (config.connectionType == ConnectionType.local) {
      return _readRpcFunctionsLocal();
    } else {
      return _readRpcFunctionsRemote();
    }
  }

  Future<List<TableInfo>> _readTablesLocal() async {
    if (_connection == null) {
      throw StateError(
        'Local database connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading tables and views from local database');

    final tables = <TableInfo>[];

    final result = await _connection!.execute(
      'SELECT DISTINCT ON (t.table_schema, t.table_name) t.table_schema, t.table_name, '
      't.table_type, obj_description(pgc.oid) as table_comment '
      'FROM information_schema.tables t '
      'JOIN pg_class pgc ON pgc.relname = t.table_name '
      'WHERE t.table_schema NOT IN (\'information_schema\', \'pg_catalog\') '
      'AND (t.table_type = \'BASE TABLE\' OR t.table_type = \'VIEW\') '
      'ORDER BY t.table_schema, t.table_name',
    );

    for (final row in result) {
      final schema = row[0] as String;
      final name = row[1] as String;
      final tableType = row[2] as String;
      final comment = row[3] as String?;
      final isView = tableType == 'VIEW';

      if (!_shouldProcessTable(schema, name)) {
        _logger.info('Skipping ${isView ? "view" : "table"} $schema.$name');
        continue;
      }

      _logger.info(
        'Reading schema for ${isView ? "view" : "table"} $schema.$name',
      );

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

      // For views, we also need to fetch constraints, but they might be empty
      final constraints =
          isView
              ? <ConstraintInfo>[]
              : await _readConstraintsLocal(schema, name);

      // Apply generated column settings for local connections
      final finalColumns = await _applyGeneratedColumnSettingsLocal(
        deduplicatedColumns,
        schema,
        name,
      );

      tables.add(
        TableInfo(
          name: name,
          schema: schema,
          columns: finalColumns,
          comment: comment,
          isView: isView,
          constraints: constraints,
        ),
      );
    }

    return tables;
  }

  /// Read constraints for a table from local database
  Future<List<ConstraintInfo>> _readConstraintsLocal(
    String schema,
    String tableName,
  ) async {
    try {
      final result = await _connection!.execute(
        'SELECT '
        'tc.constraint_name, tc.constraint_type, kcu.column_name, '
        'ccu.table_name AS reference_table, ccu.column_name AS reference_column '
        'FROM information_schema.table_constraints AS tc '
        'JOIN information_schema.key_column_usage AS kcu '
        'ON tc.constraint_name = kcu.constraint_name AND tc.table_schema = kcu.table_schema '
        'LEFT JOIN information_schema.constraint_column_usage AS ccu '
        'ON ccu.constraint_name = tc.constraint_name AND ccu.table_schema = tc.table_schema '
        'WHERE tc.table_name = \$1 AND tc.table_schema = \$2',
        parameters: [tableName, schema],
      );

      if (result.isEmpty) {
        return [];
      }

      return result.map((row) {
        return ConstraintInfo(
          name: row[0] as String,
          type: row[1] as String,
          columnName: row[2] as String,
          referenceTable: row[3] as String?,
          referenceColumn: row[4] as String?,
        );
      }).toList();
    } catch (e) {
      _logger.severe(
        'Error reading constraints for table $schema.$tableName: $e',
      );
      return [];
    }
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

      /// Method 1: Call the RPC function to get tables.
      /// 
      /// This method uses the 'list_tables' RPC function that has been created in the Supabase
      /// project. This function returns a list of all tables in the public schema.
      /// 
      /// The RPC function was created with:
      /// ```sql
      /// CREATE OR REPLACE FUNCTION public.list_tables()
      /// RETURNS TABLE (table_name text) 
      /// SECURITY DEFINER
      /// LANGUAGE sql
      /// AS $$
      ///   SELECT table_name::text
      ///   FROM information_schema.tables
      ///   WHERE table_schema = 'public'
      ///   AND table_type = 'BASE TABLE';
      /// $$;
      /// ```
      _logger.info('METHOD 1: Using RPC function to get tables');
      try {
        // Call the function to get tables
        final response = await _dioClient!.post(
          '/rest/v1/rpc/list_tables',
          data: {},
        );

        _logger.info('RPC list_tables response status: ${response.statusCode}');
        _logger.info(
          'RPC list_tables response type: ${response.data.runtimeType}',
        );
        if (response.data != null) {
          _logger.info(
            'RPC Response sample: ${response.data.toString().substring(0, min(100, response.data.toString().length))}...',
          );
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
              tableNames.addAll(
                tables
                    .split(',')
                    .map((t) => t.trim())
                    .where((t) => t.isNotEmpty),
              );
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
              _logger.info(
                'Sample endpoints: ${endpoints.take(5).join(', ')}...',
              );
            }

            for (final endpoint in endpoints) {
              if (endpoint.startsWith('/rest/v1/')) {
                // Extract table name from endpoint
                final parts = endpoint
                    .replaceFirst('/rest/v1/', '')
                    .split('/')
                    .first
                    .split('?');
                if (parts.isNotEmpty && parts[0].isNotEmpty) {
                  final tableName = parts[0];
                  // Exclude system tables and other non-data endpoints
                  if (!tableName.startsWith('_') &&
                      !['rpc', 'graphql', 'storage'].contains(tableName) &&
                      !tableNames.contains(tableName)) {
                    tableNames.add(tableName);
                    _logger.info(
                      'Found potential table from endpoint: $tableName',
                    );
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
          _logger.info(
            'System view response type: ${response.data.runtimeType}',
          );
          if (response.data != null) {
            _logger.info(
              'System view sample: ${response.data.toString().substring(0, min(100, response.data.toString().length))}...',
            );
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
              if (table is Map<String, dynamic> &&
                  table['table_name'] != null) {
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
        _logger.info(
          'METHOD 5: No tables found through API methods, probing for tables',
        );
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
              _logger.info(
                'Found table by probing: $tableName (status ${response.statusCode})',
              );
            } else if (response.statusCode == 404) {
              // Table doesn't exist - normal case
            } else {
              _logger.info(
                'Unexpected status for $tableName: ${response.statusCode}',
              );
            }
          } catch (e) {
            _logger.info('Error probing table $tableName: $e');
          }
        }

        _logger.info(
          'Probing found $foundCount tables out of ${probeTables.length} attempted',
        );
      }

      _logger.info(
        'Discovered ${tableNames.length} tables: ${tableNames.join(', ')}',
      );

      // Process each table to get schema information
      for (final tableName in tableNames) {
        try {
          // Use our RPC functions to get complete table definition
          final tableInfo = await _getTableDefinition(tableName);

          if (tableInfo != null && tableInfo.columns.isNotEmpty) {
            _logger.info(
              'Got complete table definition for $tableName with ${tableInfo.columns.length} columns, '
                '${tableInfo.constraints.length} constraints, ${tableInfo.indexes.length} indexes, '
                'and ${tableInfo.triggers.length} triggers',
            );
            tables.add(tableInfo);
            continue;
          }

          // Fallback to sample data inference if RPC function calls fail
          _logger.warning(
            'No table definition available for $tableName, falling back to inference',
          );
          final response = await _dioClient!.get(
            '/rest/v1/$tableName',
            queryParameters: {
              'limit': 5, // Get a few rows to better infer types
            },
          );

          if (response.statusCode == 200) {
            _logger.info('Processing table through inference: $tableName');
            _logger.info('Sample data type: ${response.data.runtimeType}');
            if (response.data is List) {
              _logger.info(
                'Sample data count: ${(response.data as List).length}',
              );
            }

            // Get column information from the data or use our database conventions
            final columns = await _inferTableColumnsWithConventions(
              tableName,
              response.data,
            );

            _logger.info('Inferred ${columns.length} columns for $tableName');
            if (columns.isNotEmpty) {
              _logger.info(
                'Column names: ${columns.map((c) => c.name).join(', ')}',
              );

              tables.add(
                TableInfo(
                  name: tableName,
                  schema:
                      'public', // Assume public schema for Supabase REST API
                  columns: columns,
                  comment: null,
                  // For inferred tables, these collections will be empty
                  constraints: [],
                  indexes: [],
                  triggers: [],
                ),
              );
            }
          } else {
            _logger.warning(
              'Error fetching data for $tableName: status ${response.statusCode}',
            );
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

  /// Read RPC functions from local database
  Future<List<RpcFunctionInfo>> _readRpcFunctionsLocal() async {
    if (_connection == null) {
      throw StateError(
        'Local database connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading RPC functions from local database');

    try {
      final functions = <RpcFunctionInfo>[];

      // Get all user-defined functions
      final functionsResult = await _connection!.execute('''
        SELECT
          p.proname AS function_name,
          n.nspname AS schema_name,
          l.lanname AS language_name,
          CASE 
            WHEN p.proretset THEN 
              CASE 
                WHEN t.typname = 'record' THEN 'TABLE'
                ELSE 'SETOF ' || t.typname
              END
            ELSE t.typname
          END AS return_type,
          p.prosecdef AS is_security_definer,
          CASE p.provolatile
            WHEN 'i' THEN 'IMMUTABLE'
            WHEN 's' THEN 'STABLE'
            WHEN 'v' THEN 'VOLATILE'
          END AS volatility,
          p.proisstrict AS is_strict,
          p.procost AS cost,
          CASE WHEN p.proretset THEN p.prorows ELSE NULL END AS estimated_rows,
          obj_description(p.oid, 'pg_proc') AS function_description,
          p.prosrc AS function_source,
          p.proretset AS is_set_returning,
          p.pronargs AS parameter_count
        FROM 
          pg_proc p
          JOIN pg_namespace n ON p.pronamespace = n.oid
          JOIN pg_language l ON p.prolang = l.oid
          JOIN pg_type t ON p.prorettype = t.oid
        WHERE 
          n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
          AND NOT p.proisagg
          AND l.lanname != 'internal'
        ORDER BY 
          n.nspname, p.proname
      ''');

      for (final functionRow in functionsResult) {
        final functionName = functionRow[0] as String;
        final schemaName = functionRow[1] as String;
        final languageName = functionRow[2] as String;
        final returnType = functionRow[3] as String;
        final isSecurityDefiner = functionRow[4] as bool;
        final volatility = functionRow[5] as String;
        final isStrict = functionRow[6] as bool;
        final cost = functionRow[7] as int?;
        final estimatedRows = functionRow[8] as int?;
        final description = functionRow[9] as String?;
        final functionSource = functionRow[10] as String?;
        final isSetReturning = functionRow[11] as bool;
        final parameterCount = functionRow[12] as int;

        // Get parameters for this function
        final parameters = await _readFunctionParametersLocal(functionName);

        // Create return type info
        final rpcReturnType = RpcReturnType(
          type: returnType,
          isTable: returnType.toUpperCase() == 'TABLE',
          isArray: returnType.toUpperCase().startsWith('SETOF'),
          isVoid: returnType.toUpperCase() == 'VOID',
          description: 'Returns $returnType',
        );

        functions.add(RpcFunctionInfo(
          name: functionName,
          schema: schemaName,
          parameters: parameters,
          returnType: rpcReturnType,
          description: description,
          isSecurityDefiner: isSecurityDefiner,
          language: languageName,
          functionBody: functionSource,
          isStrict: isStrict,
          cost: cost?.toString(),
          rows: estimatedRows?.toString(),
          isVolatile: volatility == 'VOLATILE',
          volatility: volatility,
        ));
      }

      _logger.info('Read ${functions.length} RPC functions from local database');
      return functions;
    } catch (e) {
      _logger.severe('Error reading RPC functions from local database: $e');
      return [];
    }
  }

  /// Read function parameters from local database
  Future<List<RpcParameter>> _readFunctionParametersLocal(String functionName) async {
    try {
      final parametersResult = await _connection!.execute('''
        SELECT
          p.proname AS function_name,
          CASE 
            WHEN p.proargnames IS NOT NULL AND array_length(p.proargnames, 1) >= pos.i 
            THEN p.proargnames[pos.i]
            ELSE 'param_' || pos.i::text
          END AS parameter_name,
          format_type(unnest_types.arg_type, NULL) AS parameter_type,
          CASE 
            WHEN p.proargmodes IS NOT NULL AND array_length(p.proargmodes, 1) >= pos.i THEN
              CASE p.proargmodes[pos.i]
                WHEN 'i' THEN 'IN'
                WHEN 'o' THEN 'OUT'
                WHEN 'b' THEN 'INOUT'
                WHEN 'v' THEN 'VARIADIC'
                WHEN 't' THEN 'TABLE'
                ELSE 'IN'
              END
            ELSE 'IN'
          END AS parameter_mode,
          pos.i AS parameter_position,
          (p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults)) AS has_default,
          NOT (p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults)) AS is_required
        FROM 
          pg_proc p
          JOIN pg_namespace n ON p.pronamespace = n.oid,
          LATERAL (SELECT unnest(p.proargtypes) AS arg_type, generate_series(1, p.pronargs) AS i) AS unnest_types(arg_type, i),
          LATERAL (SELECT unnest_types.i) AS pos(i)
        WHERE 
          p.proname = \$1
          AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
          AND NOT p.proisagg
          AND unnest_types.i <= p.pronargs
        ORDER BY 
          p.proname, pos.i
      ''', parameters: [functionName]);

      final parameters = <RpcParameter>[];
      for (final paramRow in parametersResult) {
        final paramName = paramRow[1] as String;
        final paramType = paramRow[2] as String;
        final paramMode = paramRow[3] as String;
        final position = paramRow[4] as int;
        final hasDefault = paramRow[5] as bool;
        final isRequired = paramRow[6] as bool;

        parameters.add(RpcParameter(
          name: paramName,
          type: paramType,
          mode: paramMode,
          isRequired: isRequired,
          defaultValue: hasDefault ? 'DEFAULT' : null,
          position: position,
        ));
      }

      return parameters;
    } catch (e) {
      _logger.warning('Error reading parameters for function $functionName: $e');
      return [];
    }
  }

  /// Read RPC functions from remote Supabase database
  Future<List<RpcFunctionInfo>> _readRpcFunctionsRemote() async {
    if (_dioClient == null) {
      throw StateError(
        'Remote connection not initialized. Call connect() first.',
      );
    }

    _logger.info('Reading RPC functions from remote Supabase database');

    try {
      final functions = <RpcFunctionInfo>[];

      // Call the list_rpc_functions RPC to get all functions
      final response = await _dioClient!.post(
        '/rest/v1/rpc/list_rpc_functions',
        data: {},
      );

      if (response.statusCode == 200 && response.data is List) {
        final functionList = response.data as List;
        _logger.info('Found ${functionList.length} RPC functions');

        for (final functionData in functionList) {
          if (functionData is Map<String, dynamic>) {
            final functionName = functionData['function_name'] as String?;
            if (functionName == null) continue;

            try {
              // Get detailed information for this function
              final functionInfo = await _getRpcFunctionDetailsRemote(functionName);
              if (functionInfo != null) {
                functions.add(functionInfo);
              }
            } catch (e) {
              _logger.warning('Error processing RPC function $functionName: $e');
            }
          }
        }
      } else {
        _logger.warning('Failed to fetch RPC functions list: ${response.statusCode}');
      }

      _logger.info('Successfully read ${functions.length} RPC functions from remote database');
      return functions;
    } catch (e, stackTrace) {
      _logger.severe('Error reading RPC functions from remote database: $e');
      _logger.severe('Stack trace: $stackTrace');
      return [];
    }
  }

  /// Get detailed information for a specific RPC function from remote database
  Future<RpcFunctionInfo?> _getRpcFunctionDetailsRemote(String functionName) async {
    try {
      // Get function details
      final detailsResponse = await _dioClient!.post(
        '/rest/v1/rpc/get_rpc_function_details',
        data: {'p_function_name': functionName},
      );

      if (detailsResponse.statusCode != 200 || detailsResponse.data is! List) {
        _logger.warning('Failed to get details for function $functionName');
        return null;
      }

      final detailsList = detailsResponse.data as List;
      if (detailsList.isEmpty) {
        _logger.warning('No details found for function $functionName');
        return null;
      }

      final details = detailsList.first as Map<String, dynamic>;

      // Get parameters for this function
      final parameters = await _getRpcFunctionParametersRemote(functionName);

      // Extract function information
      final schemaName = details['schema_name'] as String? ?? 'public';
      final languageName = details['language_name'] as String? ?? 'unknown';
      final returnType = details['return_type'] as String? ?? 'void';
      final isSecurityDefiner = details['is_security_definer'] as bool? ?? false;
      final volatility = details['volatility'] as String? ?? 'VOLATILE';
      final isStrict = details['is_strict'] as bool? ?? false;
      final cost = details['cost']?.toString();
      final estimatedRows = details['estimated_rows']?.toString();
      final description = details['function_description'] as String?;
      final functionSource = details['function_source'] as String?;
      final isSetReturning = details['is_set_returning'] as bool? ?? false;

      // Create return type info
      final rpcReturnType = RpcReturnType(
        type: returnType,
        isTable: returnType.toUpperCase() == 'TABLE',
        isArray: returnType.toUpperCase().startsWith('SETOF'),
        isVoid: returnType.toUpperCase() == 'VOID',
        description: 'Returns $returnType',
      );

      return RpcFunctionInfo(
        name: functionName,
        schema: schemaName,
        parameters: parameters,
        returnType: rpcReturnType,
        description: description,
        isSecurityDefiner: isSecurityDefiner,
        language: languageName,
        functionBody: functionSource,
        isStrict: isStrict,
        cost: cost,
        rows: estimatedRows,
        isVolatile: volatility == 'VOLATILE',
        volatility: volatility,
      );
    } catch (e) {
      _logger.warning('Error getting details for function $functionName: $e');
      return null;
    }
  }

  /// Get parameters for a specific RPC function from remote database
  Future<List<RpcParameter>> _getRpcFunctionParametersRemote(String functionName) async {
    try {
      final response = await _dioClient!.post(
        '/rest/v1/rpc/get_rpc_function_parameters',
        data: {'p_function_name': functionName},
      );

      if (response.statusCode == 200 && response.data is List) {
        final parametersList = response.data as List;
        final parameters = <RpcParameter>[];

        for (final paramData in parametersList) {
          if (paramData is Map<String, dynamic>) {
            final paramName = paramData['parameter_name'] as String? ?? 'unknown';
            final paramType = paramData['parameter_type'] as String? ?? 'text';
            final paramMode = paramData['parameter_mode'] as String? ?? 'IN';
            final position = paramData['parameter_position'] as int? ?? 1;
            final hasDefault = paramData['has_default'] as bool? ?? false;
            final isRequired = paramData['is_required'] as bool? ?? true;
            final defaultValue = paramData['default_value'] as String?;

            parameters.add(RpcParameter(
              name: paramName,
              type: paramType,
              mode: paramMode,
              isRequired: isRequired,
              defaultValue: hasDefault ? defaultValue : null,
              position: position,
            ));
          }
        }

        return parameters;
      } else {
        _logger.warning('Failed to get parameters for function $functionName');
        return [];
      }
    } catch (e) {
      _logger.warning('Error getting parameters for function $functionName: $e');
      return [];
    }
  }

  /// Get complete table information using the four RPC functions
  ///
  /// This method calls the new RPC functions that have been created in the Supabase project:
  /// - get_table_columns: Returns column information
  /// - get_table_constraints: Returns constraint information
  /// - get_table_indexes: Returns index information
  /// - get_table_triggers: Returns trigger information
  ///
  /// Combined, these provide comprehensive schema introspection for a given table.
  Future<TableInfo?> _getTableDefinition(String tableName) async {
    try {
      _logger.info('Getting complete table definition for: $tableName');

      // 1. Get table columns using the get_table_columns RPC function
      final columns = await _getTableColumns(tableName);
      if (columns.isEmpty) {
        _logger.warning('No columns found for table: $tableName');
        return null;
      }

      // 2. Get table constraints using the get_table_constraints RPC function
      final constraints = await _getTableConstraints(tableName);

      // 3. Get table indexes using the get_table_indexes RPC function
      final indexes = await _getTableIndexes(tableName);

      // 4. Get table triggers using the get_table_triggers RPC function
      final triggers = await _getTableTriggers(tableName);

      // 5. Get generated columns information
      final generatedColumns = await _getGeneratedColumns(tableName);

      // 6. Enrich column information with constraint data (primary keys, foreign keys, etc.)
      final enrichedColumns = _enrichColumnsWithConstraints(
        columns,
        constraints,
      );

      // 7. Apply generated column information and exclusion settings
      final finalColumns = _applyGeneratedColumnSettings(
        enrichedColumns,
        generatedColumns,
        tableName,
      );

      // Explicitly check if this is a view by querying information_schema
      final isView = await _isTableAView(tableName);
      
      // Create and return the TableInfo object with all collected data
      return TableInfo(
        name: tableName,
        schema: 'public', // Assume public schema for Supabase
        columns: finalColumns,
        constraints: constraints,
        indexes: indexes,
        triggers: triggers,
        comment: null, // Comment isn't available through our RPC functions
        isView: isView,
      );
    } catch (e) {
      _logger.warning(
        'Error getting complete table definition for $tableName: $e',
      );
      return null;
    }
  }

  /// Get table columns using the get_table_columns RPC function
  Future<List<ColumnInfo>> _getTableColumns(String tableName) async {
    try {
      _logger.info('Calling get_table_columns RPC for table: $tableName');

      // Setup a timeout to prevent hanging
      final response = await _dioClient!.post(
        '/rest/v1/rpc/get_table_columns',
        data: {'p_table_name': tableName},
        options: Options(
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      );

      _logger.info(
        'RPC get_table_columns response status: ${response.statusCode}',
      );

      if (response.statusCode == 200 && response.data is List) {
        final columnList = response.data as List;
        _logger.info(
          'RPC get_table_columns returned ${columnList.length} columns',
        );

        if (columnList.isEmpty) {
          _logger.warning(
            'No columns returned from get_table_columns RPC for table: $tableName',
          );
          return await _inferColumnsFromMetadata(tableName);
        }

        final result =
            columnList
                .map((column) {
                  if (column is Map<String, dynamic>) {
                    try {
                      // Convert string 'NO'/'YES' to boolean
                      bool isNullable = column['nullable'] == 'YES';
                      int? maxLength;
                      if (column['max_length'] != null) {
                        maxLength = int.tryParse(
                          column['max_length'].toString(),
                        );
                      }
                      int? ordPosition;
                      if (column['ord_position'] != null) {
                        ordPosition = int.tryParse(
                          column['ord_position'].toString(),
                        );
                      }

                      return ColumnInfo(
                        name: column['col_name'] as String,
                        type: column['col_type'] as String,
                        isNullable: isNullable,
                        isPrimaryKey:
                            false, // Will be set from constraints later
                        isUnique: false, // Will be set from constraints later
                        defaultValue: column['col_default'] as String?,
                        comment: null, // Not available through RPC
                        foreignKey: null, // Will be set from constraints later
                        foreignTable:
                            null, // Will be set from constraints later
                        maxLength: maxLength,
                        ordinalPosition: ordPosition,
                      );
                    } catch (e) {
                      _logger.warning('Error parsing column data: $e');
                      _logger.info('Problematic column data: $column');
                      return null;
                    }
                  }
                  return null;
                })
                .whereType<ColumnInfo>()
                .toList();

        if (result.isNotEmpty) {
          return result;
        } else {
          _logger.warning(
            'Failed to parse any columns from get_table_columns RPC response',
          );
          return await _inferColumnsFromMetadata(tableName);
        }
      }

      _logger.warning(
        'Invalid response from get_table_columns RPC: ${response.statusCode}',
      );
      // Try to extract error message if available
      if (response.data is Map<String, dynamic> &&
          response.data['message'] != null) {
        _logger.warning('Error message: ${response.data['message']}');
      }

      return await _inferColumnsFromMetadata(tableName);
    } catch (e) {
      _logger.warning('Error calling get_table_columns RPC: $e');
      return await _inferColumnsFromMetadata(tableName);
    }
  }

  /// Fallback method to infer columns by querying the table metadata
  Future<List<ColumnInfo>> _inferColumnsFromMetadata(String tableName) async {
    _logger.info('Falling back to metadata inference for table: $tableName');

    try {
      // Try to get metadata from the table endpoint
      final response = await _dioClient!.get(
        '/rest/v1/$tableName',
        queryParameters: {'limit': 0},
        options: Options(
          headers: {'Accept': 'application/json', 'Prefer': 'count=exact'},
        ),
      );

      if (response.statusCode == 200) {
        // Check for column information in response headers
        Map<String, String> columnTypes = {};

        if (response.headers.map.containsKey('x-postgres-types')) {
          final typesHeader = response.headers.map['x-postgres-types']?.first;
          if (typesHeader != null) {
            try {
              final types = json.decode(typesHeader) as Map<String, dynamic>;
              types.forEach((key, value) {
                columnTypes[key] = value.toString();
              });
              _logger.info(
                'Found column types in headers: ${columnTypes.length} columns',
              );
            } catch (e) {
              _logger.warning('Failed to parse column types from header: $e');
            }
          }
        }

        // If we have data in the response, use it to infer columns
        if (response.data is List && (response.data as List).isNotEmpty) {
          final sampleRow = (response.data as List).first;
          if (sampleRow is Map<String, dynamic>) {
            return _createColumnsFromSample(sampleRow, columnTypes);
          }
        }

        // If no data but we have column types, create minimal columns
        if (columnTypes.isNotEmpty) {
          final columns = <ColumnInfo>[];
          columnTypes.forEach((name, type) {
            columns.add(
              ColumnInfo(
                name: name,
                type: type,
                isNullable: true, // Assume nullable by default
                isPrimaryKey: name == 'id', // Assume 'id' is primary key
                isUnique: name == 'id', // Assume 'id' is unique
                defaultValue: null,
                comment: null,
                maxLength: null,
                ordinalPosition: null,
              ),
            );
          });
          return columns;
        }
      }

      // Final fallback to sample data inference
      return await _inferTableColumnsWithConventions(tableName, null);
    } catch (e) {
      _logger.warning('Error in metadata inference: $e');
      return await _inferTableColumnsWithConventions(tableName, null);
    }
  }

  /// Create column definitions from a sample row and optional type information
  List<ColumnInfo> _createColumnsFromSample(
    Map<String, dynamic> sampleRow,
    Map<String, String> columnTypes,
  ) {
    final columns = <ColumnInfo>[];

    sampleRow.forEach((key, value) {
      final type = columnTypes[key] ?? _determineDataType(value);

      columns.add(
        ColumnInfo(
          name: key,
          type: type,
          isNullable: value == null,
          isPrimaryKey: key == 'id',
          isUnique: key == 'id',
          defaultValue: null,
          comment: null,
          foreignKey: key.endsWith('_id') ? 'id' : null,
          foreignTable:
              key.endsWith('_id')
                  ? _guessForeignTableFromColumnName(key)
                  : null,
          maxLength: null,
          ordinalPosition: null,
        ),
      );
    });

    return columns;
  }

  /// Guess foreign table from a column name (for columns ending with _id)
  String? _guessForeignTableFromColumnName(String columnName) {
    if (!columnName.endsWith('_id')) return null;

    final entityName = columnName.substring(0, columnName.length - 3);

    // Try to pluralize the entity name
    String tableName;
    if (entityName.endsWith('y')) {
      tableName = '${entityName.substring(0, entityName.length - 1)}ies';
    } else if (entityName.endsWith('s') ||
        entityName.endsWith('x') ||
        entityName.endsWith('z') ||
        entityName.endsWith('ch') ||
        entityName.endsWith('sh')) {
      tableName = '${entityName}es';
    } else {
      tableName = '${entityName}s';
    }

    return 'public.$tableName';
  }

  /// Helper method to call an RPC function with consistent error handling
  Future<List<Map<String, dynamic>>> _callRpcFunction(
    String functionName,
    String tableName, {
    Map<String, dynamic>? additionalParams,
  }) async {
    try {
      _logger.info('Calling $functionName RPC for table: $tableName');

      final params = <String, dynamic>{'p_table_name': tableName};
      if (additionalParams != null) {
        params.addAll(additionalParams);
      }

      final response = await _dioClient!.post(
        '/rest/v1/rpc/$functionName',
        data: params,
        options: Options(
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      );

      if (response.statusCode == 200) {
        if (response.data is List) {
          final resultList = response.data as List;
          _logger.info(
            'RPC $functionName returned ${resultList.length} records',
          );

          return resultList.whereType<Map<String, dynamic>>().toList();
        } else if (response.data is Map) {
          // Some RPCs may return a single object instead of a list
          _logger.info('RPC $functionName returned a single record');
          return [response.data as Map<String, dynamic>];
        }
      }

      _logger.warning(
        'Invalid response from $functionName RPC: Status ${response.statusCode}',
      );
      if (response.statusCode != 200) {
        _logger.warning('Response body: ${response.data}');
      }

      return [];
    } catch (e, stackTrace) {
      _logger.warning('Error calling $functionName RPC: $e');
      _logger.fine('Stack trace: $stackTrace');
      return [];
    }
  }

  /// Get table constraints using the get_table_constraints RPC function
  Future<List<ConstraintInfo>> _getTableConstraints(String tableName) async {
    final results = await _callRpcFunction('get_table_constraints', tableName);

    return results
        .map((constraint) {
          try {
            return ConstraintInfo(
              name:
                  constraint['constraint_name'] as String? ??
                  'unknown_constraint',
              type: constraint['constraint_type'] as String? ?? 'UNKNOWN',
              columnName: constraint['col_name'] as String?,
              referenceTable: constraint['ref_table'] as String?,
              referenceColumn: constraint['ref_column'] as String?,
            );
          } catch (e) {
            _logger.warning('Error parsing constraint data: $e');
            _logger.info('Problematic constraint data: $constraint');
            return null;
          }
        })
        .whereType<ConstraintInfo>()
        .toList();
  }

  /// Get table indexes using the get_table_indexes RPC function
  Future<List<IndexInfo>> _getTableIndexes(String tableName) async {
    final results = await _callRpcFunction('get_table_indexes', tableName);

    return results
        .map((index) {
          try {
            return IndexInfo(
              name: index['idx_name'] as String? ?? 'unknown_index',
              columnName: index['col_name'] as String? ?? 'unknown_column',
              isUnique: index['is_unique'] == true,
              isPrimary: index['is_primary'] == true,
            );
          } catch (e) {
            _logger.warning('Error parsing index data: $e');
            _logger.info('Problematic index data: $index');
            return null;
          }
        })
        .whereType<IndexInfo>()
        .toList();
  }

  /// Get generated columns using the get_generated_columns RPC function
  Future<List<Map<String, dynamic>>> _getGeneratedColumns(String tableName) async {
    final results = await _callRpcFunction('get_generated_columns', tableName);

    return results
        .map((generatedColumn) {
          try {
            return {
              'column_name': generatedColumn['column_name'] as String? ?? '',
              'is_generated': generatedColumn['is_generated'] as String? ?? 'NO',
              'generation_expression': generatedColumn['generation_expression'] as String?,
            };
          } catch (e) {
            _logger.warning('Error parsing generated column data: $e');
            _logger.info('Problematic generated column data: $generatedColumn');
            return null;
          }
        })
        .whereType<Map<String, dynamic>>()
        .toList();
  }

  /// Get table triggers using the get_table_triggers RPC function
  Future<List<TriggerInfo>> _getTableTriggers(String tableName) async {
    final results = await _callRpcFunction('get_table_triggers', tableName);
    
    final triggers = <TriggerInfo>[];
    
    for (final triggerData in results) {
      try {
        final name = triggerData['trg_name'] as String? ?? 'unknown_trigger';
        final eventType = triggerData['event_type'] as String? ?? 'UNKNOWN';
        final actionTime = triggerData['action_time'] as String? ?? 'UNKNOWN';
        final actionStatement = triggerData['action_stmt'] as String? ?? '';
        
        // Extract function name if this is a function-based trigger
        String? functionName;
        final functionMatch = RegExp(r'EXECUTE(?:\s+PROCEDURE|\s+FUNCTION)?\s+(\w+)\(\)').firstMatch(actionStatement);
        if (functionMatch != null && functionMatch.groupCount >= 1) {
          functionName = functionMatch.group(1);
        }
        
        // Only fetch function details if we have a function name
        String? functionDefinition;
        String? functionParameters;
        String? functionReturnType;
        String? functionLanguage;
        String? functionComment;
        
        if (functionName != null) {
          // Fetch function details using the new RPC function
          final functionDetails = await _getFunctionDetails(functionName);
          
          if (functionDetails.isNotEmpty) {
            final details = functionDetails.first;
            functionDefinition = details['function_body'] as String? ?? 
                                details['function_definition'] as String? ?? 
                                'Function body unavailable';
            functionParameters = details['parameters'] as String? ?? 
                                details['complete_signature'] as String? ?? 
                                null;
            functionReturnType = details['return_type'] as String?;
            functionLanguage = details['language_name'] as String?;
            functionComment = details['comment'] as String?;
          }
        }
        
        triggers.add(TriggerInfo(
          name: name,
          eventType: eventType,
          actionTime: actionTime,
          actionStatement: actionStatement,
          functionName: functionName,
          functionDefinition: functionDefinition,
          functionParameters: functionParameters,
          functionReturnType: functionReturnType,
          functionLanguage: functionLanguage,
          functionComment: functionComment,
        ));
      } catch (e) {
        _logger.warning('Error parsing trigger data: $e');
        _logger.info('Problematic trigger data: $triggerData');
      }
    }
    
    return triggers;
  }
  
  /// Get function details using the get_function_details RPC function
  Future<List<Map<String, dynamic>>> _getFunctionDetails(String functionName) async {
    try {
      _logger.info('Fetching function details for: $functionName');
      
      // First try the advanced function details
      final response = await _dioClient!.post(
        '/rest/v1/rpc/get_function_details',
        data: {'p_function_name': functionName},
        options: Options(
          receiveTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 10),
        ),
      );
      
      if (response.statusCode == 200) {
        if (response.data is List) {
          final resultList = response.data as List;
          _logger.info('Function details returned ${resultList.length} results for $functionName');
          
          return resultList.whereType<Map<String, dynamic>>().toList();
        } else if (response.data is Map) {
          // Sometimes RPC may return a single object
          _logger.info('Function details returned a single result for $functionName');
          return [response.data as Map<String, dynamic>];
        }
      }
      
      // If the advanced function fails, try the simpler version
      _logger.info('Trying simplified function definition fetch for: $functionName');
      final simpleResponse = await _trySimpleFunctionInfo(functionName);
      if (simpleResponse.isNotEmpty) {
        return simpleResponse;
      }
      
      _logger.warning('Failed to get function details for: $functionName');
      _logger.warning('Consider deploying the improved function introspection SQL in lib/generated/docs/advanced_function_introspection.sql');
      
      // Fallback to just a basic result with the name
      return [{
        'function_name': functionName,
        'function_body': 'Function body unavailable - deploy advanced_function_introspection.sql to see details'
      }];
    } catch (e) {
      _logger.warning('Error fetching function details for $functionName: $e');
      return [];
    }
  }
  
  /// Fallback approach to get basic function info
  Future<List<Map<String, dynamic>>> _trySimpleFunctionInfo(String functionName) async {
    try {
      // Try a simpler approach to get just the function name and language
      final response = await _dioClient!.post(
        '/rest/v1/rpc/get_function_simple_info',
        data: {'p_function_name': functionName},
        options: Options(
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
        ),
      );
      
      if (response.statusCode == 200) {
        if (response.data is List) {
          return (response.data as List).whereType<Map<String, dynamic>>().toList();
        } else if (response.data is Map) {
          return [response.data as Map<String, dynamic>];
        }
      }
      
      return [];
    } catch (e) {
      _logger.warning('Error with simple function info: $e');
      return [];
    }
  }

  /// Enrich column information with constraint data to add primary key, foreign key, and unique flags
  List<ColumnInfo> _enrichColumnsWithConstraints(
    List<ColumnInfo> columns,
    List<ConstraintInfo> constraints,
  ) {
    // Create a map from column name to its index in the columns list for faster lookups
    final Map<String, int> columnIndexMap = {};
    for (int i = 0; i < columns.length; i++) {
      columnIndexMap[columns[i].name] = i;
    }

    // Create copies of columns for immutability
    final List<ColumnInfo> enrichedColumns = List.from(columns);

    // Process each constraint
    for (final constraint in constraints) {
      try {
        // Skip constraints without a column
        if (constraint.columnName == null) continue;

        // Check if we have this column in our list
        final columnIndex = columnIndexMap[constraint.columnName];
        if (columnIndex == null) {
          _logger.info(
            'Column ${constraint.columnName} not found for constraint ${constraint.name}',
          );
          continue;
        }

        // Get the current column values
        final column = enrichedColumns[columnIndex];
        ColumnInfo updatedColumn;

        switch (constraint.type.toUpperCase()) {
          case 'PRIMARY KEY':
            // Update with primary key flag
            updatedColumn = ColumnInfo(
              name: column.name,
              type: column.type,
              isNullable: column.isNullable,
              isPrimaryKey: true,
              isUnique: true, // Primary keys are also unique
              defaultValue: column.defaultValue,
              comment: column.comment,
              foreignKey: column.foreignKey,
              foreignTable: column.foreignTable,
              maxLength: column.maxLength,
              ordinalPosition: column.ordinalPosition,
            );
            break;

          case 'FOREIGN KEY':
            // Update with foreign key information
            updatedColumn = ColumnInfo(
              name: column.name,
              type: column.type,
              isNullable: column.isNullable,
              isPrimaryKey: column.isPrimaryKey,
              isUnique: column.isUnique,
              defaultValue: column.defaultValue,
              comment: column.comment,
              foreignKey: constraint.referenceColumn,
              foreignTable:
                  constraint.referenceTable != null
                      ? 'public.${constraint.referenceTable}'
                      : null,
              maxLength: column.maxLength,
              ordinalPosition: column.ordinalPosition,
            );
            break;

          case 'UNIQUE':
            // Update with unique flag
            updatedColumn = ColumnInfo(
              name: column.name,
              type: column.type,
              isNullable: column.isNullable,
              isPrimaryKey: column.isPrimaryKey,
              isUnique: true,
              defaultValue: column.defaultValue,
              comment: column.comment,
              foreignKey: column.foreignKey,
              foreignTable: column.foreignTable,
              maxLength: column.maxLength,
              ordinalPosition: column.ordinalPosition,
            );
            break;

          default:
            // For any other constraint type, keep the column as is
            continue;
        }

        // Update our column in the enriched list
        enrichedColumns[columnIndex] = updatedColumn;
      } catch (e) {
        _logger.warning('Error processing constraint ${constraint.name}: $e');
      }
    }

    return enrichedColumns;
  }

  /// Apply generated column information and exclusion settings
  List<ColumnInfo> _applyGeneratedColumnSettings(
    List<ColumnInfo> columns,
    List<Map<String, dynamic>> generatedColumns,
    String tableName,
  ) {
    // Create a map of generated column names for quick lookup
    final generatedColumnMap = <String, Map<String, dynamic>>{};
    for (final genCol in generatedColumns) {
      final columnName = genCol['column_name'] as String;
      if (columnName.isNotEmpty) {
        generatedColumnMap[columnName] = genCol;
      }
    }

    // Get manual exclusions for this table from config
    final manualExclusions = config.columnExclusions[tableName] ?? <String>[];

    final updatedColumns = <ColumnInfo>[];

    for (final column in columns) {
      // Check if this column is generated
      final generatedInfo = generatedColumnMap[column.name];
      final isGenerated = generatedInfo != null;
      
      // Determine if this column should be excluded from serialization
      bool excludeFromSerialization = false;
      
      // Apply automatic exclusion for generated columns
      if (isGenerated && config.excludeGeneratedColumns) {
        excludeFromSerialization = true;
      }
      
      // Apply automatic exclusion for spatial/geographic columns
      if (_isSpatialColumn(column)) {
        excludeFromSerialization = true;
      }
      
      // Apply manual exclusions from config
      if (manualExclusions.contains(column.name)) {
        excludeFromSerialization = true;
      }

      // Create updated column with generated column information
      final updatedColumn = column.copyWith(
        isGenerated: isGenerated,
        generationExpression: generatedInfo?['generation_expression'] as String?,
        excludeFromSerialization: excludeFromSerialization,
      );

      updatedColumns.add(updatedColumn);

      // Log generated column detection
      if (isGenerated) {
        _logger.info(
          'Detected generated column: ${tableName}.${column.name} '
          '(excluded from serialization: $excludeFromSerialization)',
        );
      }
      
      // Log manual exclusions
      if (manualExclusions.contains(column.name) && !isGenerated) {
        _logger.info(
          'Manually excluded column: ${tableName}.${column.name}',
        );
      }
    }

    return updatedColumns;
  }

  /// Apply generated column settings for local database connections
  Future<List<ColumnInfo>> _applyGeneratedColumnSettingsLocal(
    List<ColumnInfo> columns,
    String schema,
    String tableName,
  ) async {
    if (_connection == null) {
      // If no connection, just return columns as-is with manual exclusions applied
      return _applyManualExclusions(columns, tableName);
    }

    try {
      // Query information_schema for generated columns
      final result = await _connection!.execute(
        'SELECT column_name, is_generated, generation_expression '
        'FROM information_schema.columns '
        'WHERE table_schema = \$1 AND table_name = \$2 AND is_generated = \'ALWAYS\'',
        parameters: [schema, tableName],
      );

      // Create a map of generated column names for quick lookup
      final generatedColumnMap = <String, Map<String, dynamic>>{};
      for (final row in result) {
        final columnName = row[0] as String;
        generatedColumnMap[columnName] = {
          'column_name': columnName,
          'is_generated': row[1] as String,
          'generation_expression': row[2] as String?,
        };
      }

      // Get manual exclusions for this table from config
      final manualExclusions = config.columnExclusions[tableName] ?? <String>[];

      final updatedColumns = <ColumnInfo>[];

      for (final column in columns) {
        // Check if this column is generated
        final generatedInfo = generatedColumnMap[column.name];
        final isGenerated = generatedInfo != null;
        
        // Determine if this column should be excluded from serialization
        bool excludeFromSerialization = false;
        
        // Apply automatic exclusion for generated columns
        if (isGenerated && config.excludeGeneratedColumns) {
          excludeFromSerialization = true;
        }
        
        // Apply automatic exclusion for spatial/geographic columns  
        if (_isSpatialColumn(column)) {
          excludeFromSerialization = true;
        }
        
        // Apply manual exclusions from config
        if (manualExclusions.contains(column.name)) {
          excludeFromSerialization = true;
        }

        // Create updated column with generated column information
        final updatedColumn = column.copyWith(
          isGenerated: isGenerated,
          generationExpression: generatedInfo?['generation_expression'] as String?,
          excludeFromSerialization: excludeFromSerialization,
        );

        updatedColumns.add(updatedColumn);

        // Log generated column detection
        if (isGenerated) {
          _logger.info(
            'Detected generated column: ${tableName}.${column.name} '
            '(excluded from serialization: $excludeFromSerialization)',
          );
        }
        
        // Log manual exclusions
        if (manualExclusions.contains(column.name) && !isGenerated) {
          _logger.info(
            'Manually excluded column: ${tableName}.${column.name}',
          );
        }
      }

      return updatedColumns;
    } catch (e) {
      _logger.warning('Error detecting generated columns for $schema.$tableName: $e');
      // Fallback to just applying manual exclusions
      return _applyManualExclusions(columns, tableName);
    }
  }

  /// Apply only manual exclusions (fallback method)
  List<ColumnInfo> _applyManualExclusions(
    List<ColumnInfo> columns,
    String tableName,
  ) {
    final manualExclusions = config.columnExclusions[tableName] ?? <String>[];
    
    if (manualExclusions.isEmpty) {
      return columns; // No changes needed
    }

    return columns.map((column) {
      final shouldExclude = manualExclusions.contains(column.name);
      
      if (shouldExclude) {
        _logger.info('Manually excluded column: ${tableName}.${column.name}');
        return column.copyWith(excludeFromSerialization: true);
      }
      
      // Check for spatial columns and exclude them automatically
      if (_isSpatialColumn(column)) {
        _logger.info('Spatial column excluded: ${tableName}.${column.name}');
        return column.copyWith(excludeFromSerialization: true);
      }
      
      return column;
    }).toList();
  }

  /// Check if a column is a spatial/geographic column type
  bool _isSpatialColumn(ColumnInfo column) {
    final type = column.type.toLowerCase();
    
    // PostGIS spatial types
    if (type == 'geometry' || 
        type == 'geography' || 
        type == 'point' ||
        type == 'linestring' ||
        type == 'polygon' ||
        type == 'multipoint' ||
        type == 'multilinestring' ||
        type == 'multipolygon' ||
        type == 'geometrycollection' ||
        type.startsWith('geometry(') ||
        type.startsWith('geography(')) {
      return true;
    }
    
    // Raster types
    if (type == 'raster') {
      return true;
    }
    
    // Box types
    if (type == 'box2d' || 
        type == 'box3d' ||
        type == 'box') {
      return true;
    }
    
    return false;
  }

  /// Get SQL scripts for creating the required RPC functions
  static String getRpcFunctionScripts() {
    return '''
-- Function to detect generated columns in a table
CREATE OR REPLACE FUNCTION public.get_generated_columns(p_table_name text)
RETURNS TABLE (
    column_name text,
    is_generated text,
    generation_expression text
) 
SECURITY DEFINER
LANGUAGE plpgsql
AS \$\$
BEGIN
    RETURN QUERY
    SELECT
        c.column_name::text,
        c.is_generated::text,
        c.generation_expression::text
    FROM information_schema.columns c
    WHERE c.table_name = p_table_name
    AND c.table_schema = 'public'
    AND c.is_generated = 'ALWAYS';
END;
\$\$;

-- Simple lightweight function to get basic function info
CREATE OR REPLACE FUNCTION public.get_function_simple_info(p_function_name text)
RETURNS TABLE (
    function_name text,
    language_name text
) 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
    SELECT 
        p.proname::text AS function_name,
        l.lanname::text AS language_name
    FROM 
        pg_proc p
        JOIN pg_namespace n ON p.pronamespace = n.oid
        JOIN pg_language l ON p.prolang = l.oid
    WHERE 
        p.proname = p_function_name
        AND n.nspname NOT IN ('pg_catalog', 'information_schema')
    ORDER BY 
        p.proname;
\$\$;

-- Function to list all tables and views in the public schema
CREATE OR REPLACE FUNCTION public.list_tables()
RETURNS TABLE (table_name text, table_type text) 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT 
    table_name::text,
    table_type::text
  FROM information_schema.tables
  WHERE table_schema = 'public'
  AND (table_type = 'BASE TABLE' OR table_type = 'VIEW');
\$\$;

-- Function to get the type of a table (BASE TABLE or VIEW)
CREATE OR REPLACE FUNCTION public.get_table_type(p_table_name text)
RETURNS text 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT table_type::text
  FROM information_schema.tables
  WHERE table_schema = 'public'
  AND table_name = p_table_name
  LIMIT 1;
\$\$;

-- Function to get column information for a table
CREATE OR REPLACE FUNCTION public.get_table_columns(p_table_name text)
RETURNS TABLE (
  schema_name text,
  tbl_name text,
  col_name text,
  col_type text,
  max_length integer,
  col_default text,
  nullable text,
  ord_position integer
) 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT
    c.table_schema::text AS schema_name,
    c.table_name::text AS tbl_name,
    c.column_name::text AS col_name,
    c.data_type::text AS col_type,
    c.character_maximum_length AS max_length,
    c.column_default::text AS col_default,
    c.is_nullable::text AS nullable,
    c.ordinal_position AS ord_position
  FROM 
    information_schema.columns c
  WHERE 
    c.table_schema = 'public'
    AND c.table_name = p_table_name
  ORDER BY
    c.ordinal_position;
\$\$;

-- Function to get constraint information for a table
CREATE OR REPLACE FUNCTION public.get_table_constraints(p_table_name text)
RETURNS TABLE (
  schema_name text,
  tbl_name text,
  constraint_name text,
  constraint_type text,
  col_name text,
  ref_table text,
  ref_column text
) 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT 
    tc.table_schema::text AS schema_name,
    tc.table_name::text AS tbl_name,
    tc.constraint_name::text AS constraint_name,
    tc.constraint_type::text AS constraint_type,
    kcu.column_name::text AS col_name,
    ccu.table_name::text AS ref_table,
    ccu.column_name::text AS ref_column
  FROM 
    information_schema.table_constraints tc
  LEFT JOIN 
    information_schema.key_column_usage kcu
    ON tc.constraint_schema = kcu.constraint_schema 
    AND tc.constraint_name = kcu.constraint_name
  LEFT JOIN 
    information_schema.constraint_column_usage ccu
    ON tc.constraint_schema = ccu.constraint_schema 
    AND tc.constraint_name = ccu.constraint_name
  WHERE 
    tc.table_schema = 'public'
    AND tc.table_name = p_table_name
  ORDER BY
    tc.constraint_name,
    kcu.ordinal_position;
\$\$;

-- Function to get index information for a table
CREATE OR REPLACE FUNCTION public.get_table_indexes(p_table_name text)
RETURNS TABLE (
  tbl_name text,
  idx_name text,
  col_name text,
  is_unique boolean,
  is_primary boolean
) 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT
    t.relname::text AS tbl_name,
    i.relname::text AS idx_name,
    a.attname::text AS col_name,
    ix.indisunique AS is_unique,
    ix.indisprimary AS is_primary
  FROM
    pg_index ix
  JOIN
    pg_class i ON i.oid = ix.indexrelid
  JOIN
    pg_class t ON t.oid = ix.indrelid
  JOIN
    pg_attribute a ON a.attrelid = t.oid AND a.attnum = ANY(ix.indkey)
  JOIN
    pg_namespace n ON n.oid = t.relnamespace
  WHERE
    t.relkind = 'r'
    AND n.nspname = 'public'
    AND t.relname = p_table_name
  ORDER BY
    t.relname,
    i.relname;
\$\$;

-- Function to get trigger information for a table
CREATE OR REPLACE FUNCTION public.get_table_triggers(p_table_name text)
RETURNS TABLE (
  tbl_name text,
  trg_name text,
  event_type text,
  action_time text,
  action_stmt text
) 
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT
    event_object_table::text AS tbl_name,
    trigger_name::text AS trg_name,
    event_manipulation::text AS event_type,
    action_timing::text AS action_time,
    action_statement::text AS action_stmt
  FROM
    information_schema.triggers
  WHERE
    event_object_schema = 'public'
    AND event_object_table = p_table_name
  ORDER BY
    trigger_name;
\$\$;

-- Function to list all user-defined RPC functions
CREATE OR REPLACE FUNCTION public.list_rpc_functions()
RETURNS TABLE (
  function_name text,
  schema_name text,
  language_name text,
  return_type text,
  is_security_definer boolean,
  volatility text,
  is_strict boolean,
  cost integer,
  estimated_rows integer,
  function_description text
)
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT
    p.proname::text AS function_name,
    n.nspname::text AS schema_name,
    l.lanname::text AS language_name,
    CASE 
      WHEN p.proretset THEN 
        CASE 
          WHEN t.typname = 'record' THEN 'TABLE'
          ELSE 'SETOF ' || t.typname::text
        END
      ELSE t.typname::text
    END AS return_type,
    p.prosecdef AS is_security_definer,
    CASE p.provolatile
      WHEN 'i' THEN 'IMMUTABLE'
      WHEN 's' THEN 'STABLE'
      WHEN 'v' THEN 'VOLATILE'
    END AS volatility,
    p.proisstrict AS is_strict,
    p.procost::integer AS cost,
    CASE WHEN p.proretset THEN p.prorows::integer ELSE NULL END AS estimated_rows,
    obj_description(p.oid, 'pg_proc')::text AS function_description
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid
    JOIN pg_language l ON p.prolang = l.oid
    JOIN pg_type t ON p.prorettype = t.oid
  WHERE 
    n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND NOT p.proisagg  -- Exclude aggregate functions
    AND l.lanname != 'internal'  -- Exclude internal functions
  ORDER BY 
    n.nspname, p.proname;
\$\$;

-- Function to get detailed information about a specific RPC function
CREATE OR REPLACE FUNCTION public.get_rpc_function_details(p_function_name text)
RETURNS TABLE (
  function_name text,
  schema_name text,
  language_name text,
  return_type text,
  return_type_category text,
  is_security_definer boolean,
  volatility text,
  is_strict boolean,
  cost integer,
  estimated_rows integer,
  function_description text,
  function_source text,
  is_set_returning boolean,
  parameter_count integer
)
SECURITY DEFINER
LANGUAGE sql
AS \$\$
  SELECT
    p.proname::text AS function_name,
    n.nspname::text AS schema_name,
    l.lanname::text AS language_name,
    CASE 
      WHEN p.proretset THEN 
        CASE 
          WHEN t.typname = 'record' THEN 'TABLE'
          ELSE 'SETOF ' || t.typname::text
        END
      ELSE t.typname::text
    END AS return_type,
    CASE t.typcategory
      WHEN 'A' THEN 'Array'
      WHEN 'B' THEN 'Boolean'
      WHEN 'C' THEN 'Composite'
      WHEN 'D' THEN 'Date/time'
      WHEN 'E' THEN 'Enum'
      WHEN 'G' THEN 'Geometric'
      WHEN 'I' THEN 'Network address'
      WHEN 'N' THEN 'Numeric'
      WHEN 'P' THEN 'Pseudo-type'
      WHEN 'S' THEN 'String'
      WHEN 'T' THEN 'Timespan'
      WHEN 'U' THEN 'User-defined'
      WHEN 'V' THEN 'Bit-string'
      WHEN 'X' THEN 'Unknown'
      ELSE 'Other'
    END AS return_type_category,
    p.prosecdef AS is_security_definer,
    CASE p.provolatile
      WHEN 'i' THEN 'IMMUTABLE'
      WHEN 's' THEN 'STABLE'
      WHEN 'v' THEN 'VOLATILE'
    END AS volatility,
    p.proisstrict AS is_strict,
    p.procost::integer AS cost,
    CASE WHEN p.proretset THEN p.prorows::integer ELSE NULL END AS estimated_rows,
    obj_description(p.oid, 'pg_proc')::text AS function_description,
    p.prosrc::text AS function_source,
    p.proretset AS is_set_returning,
    p.pronargs::integer AS parameter_count
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid
    JOIN pg_language l ON p.prolang = l.oid
    JOIN pg_type t ON p.prorettype = t.oid
  WHERE 
    p.proname = p_function_name
    AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND NOT p.proisagg  -- Exclude aggregate functions
    AND l.lanname != 'internal'  -- Exclude internal functions
  ORDER BY 
    n.nspname, p.proname;
\$\$;

-- Function to get parameter information for a specific RPC function
CREATE OR REPLACE FUNCTION public.get_rpc_function_parameters(p_function_name text)
RETURNS TABLE (
  function_name text,
  parameter_name text,
  parameter_type text,
  parameter_mode text,
  parameter_position integer,
  has_default boolean,
  default_value text,
  is_required boolean
)
SECURITY DEFINER
LANGUAGE plpgsql
AS \$\$
BEGIN
  RETURN QUERY
  SELECT
    p.proname::text AS function_name,
    CASE 
      WHEN p.proargnames IS NOT NULL AND array_length(p.proargnames, 1) >= pos.i 
      THEN p.proargnames[pos.i]
      ELSE 'param_' || pos.i::text
    END AS parameter_name,
    format_type(unnest_types.arg_type, NULL)::text AS parameter_type,
    CASE 
      WHEN p.proargmodes IS NOT NULL AND array_length(p.proargmodes, 1) >= pos.i THEN
        CASE p.proargmodes[pos.i]
          WHEN 'i' THEN 'IN'
          WHEN 'o' THEN 'OUT'
          WHEN 'b' THEN 'INOUT'
          WHEN 'v' THEN 'VARIADIC'
          WHEN 't' THEN 'TABLE'
          ELSE 'IN'
        END
      ELSE 'IN'
    END AS parameter_mode,
    pos.i AS parameter_position,
    (p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults)) AS has_default,
    CASE 
      WHEN p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults) THEN
        'DEFAULT'  -- We can't easily extract the actual default value
      ELSE NULL
    END AS default_value,
    NOT (p.pronargdefaults > 0 AND pos.i > (p.pronargs - p.pronargdefaults)) AS is_required
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid,
    LATERAL (SELECT unnest(p.proargtypes) AS arg_type, generate_series(1, p.pronargs) AS i) AS unnest_types(arg_type, i),
    LATERAL (SELECT unnest_types.i) AS pos(i)
  WHERE 
    p.proname = p_function_name
    AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND NOT p.proisagg  -- Exclude aggregate functions
    AND unnest_types.i <= p.pronargs
  ORDER BY 
    p.proname, pos.i;
END;
\$\$;

-- Function to get return type information for table-returning functions
CREATE OR REPLACE FUNCTION public.get_rpc_function_return_columns(p_function_name text)
RETURNS TABLE (
  function_name text,
  column_name text,
  column_type text,
  column_position integer
)
SECURITY DEFINER
LANGUAGE plpgsql
AS \$\$
BEGIN
  -- This function tries to extract column information for functions that return TABLE
  -- It's complex because PostgreSQL doesn't store this information directly
  RETURN QUERY
  SELECT
    p.proname::text AS function_name,
    CASE 
      WHEN p.proargnames IS NOT NULL AND array_length(p.proargnames, 1) >= pos.i 
      THEN p.proargnames[pos.i]
      ELSE 'column_' || pos.i::text
    END AS column_name,
    format_type(out_types.arg_type, NULL)::text AS column_type,
    pos.i AS column_position
  FROM 
    pg_proc p
    JOIN pg_namespace n ON p.pronamespace = n.oid,
    LATERAL (
      SELECT 
        unnest(
          CASE 
            WHEN p.proargmodes IS NOT NULL THEN 
              -- Filter to only OUT and TABLE parameters
              (SELECT array_agg(p.proargtypes[i-1]) 
               FROM generate_series(1, array_length(p.proargmodes, 1)) i
               WHERE p.proargmodes[i] IN ('o', 't'))
            ELSE ARRAY[]::oid[]
          END
        ) AS arg_type, 
        generate_series(1, 
          CASE 
            WHEN p.proargmodes IS NOT NULL THEN 
              (SELECT count(*) FROM unnest(p.proargmodes) mode WHERE mode IN ('o', 't'))::integer
            ELSE 0
          END
        ) AS i
    ) AS out_types(arg_type, i),
    LATERAL (SELECT out_types.i) AS pos(i)
  WHERE 
    p.proname = p_function_name
    AND n.nspname NOT IN ('pg_catalog', 'information_schema', 'pg_toast')
    AND NOT p.proisagg  -- Exclude aggregate functions
    AND p.proretset  -- Only set-returning functions
    AND out_types.arg_type IS NOT NULL
  ORDER BY 
    p.proname, pos.i;
END;
\$\$;
''';
  }

  // Helper method to extract all REST API endpoints from response
  void _extractEndpoints(
    dynamic data,
    String currentPath,
    List<String> endpoints,
  ) {
    if (data is Map<String, dynamic>) {
      if (currentPath.isNotEmpty) {
        endpoints.add(currentPath);
      }

      for (final entry in data.entries) {
        final newPath =
            currentPath.isEmpty ? entry.key : '$currentPath/${entry.key}';
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

  // Infer table columns from sample data
  Future<List<ColumnInfo>> _inferTableColumnsWithConventions(
    String tableName,
    dynamic data,
  ) async {
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
          queryParameters: {'limit': 5},
        );

        if (response.statusCode == 200 && response.data is List) {
          rows = response.data;
        }
      }

      if (rows.isEmpty) {
        // Fallback to creating a definition based on table name patterns
        return _createImprovedMinimalColumns(tableName);
      }

      // Take the first row to infer columns
      final row = rows.first;

      if (row is! Map<String, dynamic>) {
        return _createImprovedMinimalColumns(tableName);
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
        final foreignKey = _guessForeignKeyFromName(name, tableName);

        columns.add(
          ColumnInfo(
            name: name,
            type: typeMap[name] ?? 'text',
            isNullable: nullabilityMap[name] ?? true,
            isPrimaryKey: name == 'id',
            isUnique: name == 'id',
            defaultValue: null,
            comment: null,
            foreignKey: foreignKey?.key,
            foreignTable: foreignKey?.table,
          ),
        );
      }

      return columns;
    } catch (e) {
      _logger.warning('Error inferring columns for $tableName: $e');
      return _createImprovedMinimalColumns(tableName);
    }
  }

  // IMPROVED: Create minimal columns with better heuristics
  List<ColumnInfo> _createImprovedMinimalColumns(String tableName) {
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
        defaultValue: 'uuid_generate_v4()',
        comment: null,
        foreignKey: null,
        foreignTable: null,
      ),
    );

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

    // If this is a junction table (e.g., user_games), add foreign keys
    if (tableName.contains('_')) {
      final parts = tableName.split('_');

      if (parts.length == 2) {
        // First entity (singular)
        final firstEntity =
            parts[0].endsWith('s')
                ? parts[0].substring(0, parts[0].length - 1)
                : parts[0];

        // Second entity (singular)
        final secondEntity =
            parts[1].endsWith('s')
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
            foreignTable: '${firstEntity}s',
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
            foreignTable: '${secondEntity}s',
          ),
        );
      }
    }

    return columns;
  }

  // Helper method to guess foreign key relationships from column names
  ({String key, String table})? _guessForeignKeyFromName(
    String columnName,
    String tableName,
  ) {
    if (columnName.endsWith('_id')) {
      final entityName = columnName.substring(0, columnName.length - 3);

      // Handle special cases first
      switch (entityName) {
        case 'user':
          return (key: 'id', table: 'public.users');
        case 'game':
          return (key: 'id', table: 'public.games');
        case 'match':
          return (key: 'id', table: 'public.match_results');
        case 'room':
          return (key: 'id', table: 'public.chat_rooms');
        case 'player':
          return (key: 'id', table: 'public.users');
      }

      // General case: pluralize the entity name
      var tablePluralName = '${entityName}s';

      // Special pluralization rules
      if (entityName.endsWith('y')) {
        tablePluralName =
            '${entityName.substring(0, entityName.length - 1)}ies';
      } else if (entityName.endsWith('s') ||
          entityName.endsWith('x') ||
          entityName.endsWith('z') ||
          entityName.endsWith('ch') ||
          entityName.endsWith('sh')) {
        tablePluralName = '${entityName}es';
      }

      return (key: 'id', table: 'public.$tablePluralName');
    }

    return null;
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
          value.contains(
            RegExp(
              r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
            ),
          )) {
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
    // First, check excludes - they take precedence over includes
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

    // Then check includes
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
  
  /// Check if a table is actually a view by querying information_schema
  Future<bool> _isTableAView(String tableName) async {
    try {
      if (config.connectionType == ConnectionType.local) {
        if (_connection == null) {
          throw StateError('Database connection not initialized');
        }
        
        final result = await _connection!.execute(
          'SELECT table_type FROM information_schema.tables '
          'WHERE table_schema = \'public\' AND table_name = \$1 '
          'LIMIT 1',
          parameters: [tableName],
        );
        
        if (result.isEmpty) return false;
        return (result[0][0] as String) == 'VIEW';
      } else {
        // For remote connections, try to query information_schema tables
        try {
          final response = await _dioClient!.get(
            '/rest/v1/information_schema/tables',
            queryParameters: {
              'select': 'table_type',
              'table_schema': 'eq.public',
              'table_name': 'eq.$tableName',
              'limit': 1
            },
          );
          
          if (response.statusCode == 200 && response.data is List && (response.data as List).isNotEmpty) {
            final data = response.data as List;
            if (data[0] is Map<String, dynamic> && data[0]['table_type'] != null) {
              return data[0]['table_type'] == 'VIEW';
            }
          }
          
          // Fallback: use get_table_type RPC if available
          final rpcResponse = await _dioClient!.post(
            '/rest/v1/rpc/get_table_type',
            data: {'p_table_name': tableName},
            options: Options(
              receiveTimeout: const Duration(seconds: 5),
              sendTimeout: const Duration(seconds: 5),
            ),
          );
          
          if (rpcResponse.statusCode == 200 && rpcResponse.data is String) {
            return rpcResponse.data == 'VIEW';
          }
        } catch (e) {
          _logger.warning('Error determining if $tableName is a view: $e');
        }
        
        // If we can't determine definitively, return false (assume table, not view)
        return false;
      }
    } catch (e) {
      _logger.warning('Error checking if $tableName is a view: $e');
      return false;
    }
  }
}