// lib/src/config/config_model.dart
class SupabaseGenConfig {
  /// Connection type - remote or local
  final ConnectionType connectionType;

  /// Local database connection settings
  final String host;
  final int port;
  final String database;
  final String username;
  final String password;
  final bool ssl;
  
  /// Remote Supabase connection settings
  final String? supabaseUrl;
  final String? supabaseKey;

  /// Code generation settings
  final String outputDirectory;
  final String? modelPrefix;
  final String? modelSuffix;
  final String? repositorySuffix;
  final List<String> excludeTables;
  final List<String> includeTables;
  final List<String> probeTables; // Tables to probe when using remote connection
  final bool generateForAllTables;
  final bool useNullSafety;
  
  /// Generated column handling
  final bool excludeGeneratedColumns;
  final Map<String, List<String>> columnExclusions;

  /// Provider generation settings
  final bool generateProviders;
  final String? providerSuffix;
  final String stateManagementType;
  final bool useAppException;
  final bool useKeepAlive;
  final bool invalidateOnChange;
  final bool generateAsyncValueWidget;
  
  /// RPC function generation settings
  final bool generateRpcServices;
  final String rpcGroupingStrategy; // 'category', 'alphabetical', 'schema'
  final Map<String, List<String>> rpcCategories;
  final List<String> excludeRpcFunctions;
  final List<String> includeRpcFunctions;
  final bool generateRpcProviders;
  final bool generateRpcModels;
  final String rpcServiceSuffix;
  final String rpcModelSuffix;
  final String rpcProviderSuffix;
  final bool enableRpcLogging;
  final bool enableRpcCaching;
  final bool generateRpcDocumentation;

  const SupabaseGenConfig({
    this.connectionType = ConnectionType.local,
    this.host = 'localhost',
    this.port = 5432,
    required this.database,
    this.username = '',
    this.password = '',
    this.ssl = false,
    this.supabaseUrl,
    this.supabaseKey,
    required this.outputDirectory,
    this.modelPrefix = '',
    this.modelSuffix = 'Model',
    this.repositorySuffix = 'Repository',
    this.excludeTables = const [
      'migrations', 
      'schema_migrations',
      'spatial_ref_sys',
      'geography_columns', 
      'geometry_columns',
      'raster_columns',
      'raster_overviews'
    ],
    this.includeTables = const [],
    this.probeTables = const ['users', 'profiles', 'games'],
    this.generateForAllTables = true,
    this.useNullSafety = true,
    this.excludeGeneratedColumns = false,
    this.columnExclusions = const {},
    this.generateProviders = false,
    this.providerSuffix = 'Provider',
    this.stateManagementType = 'riverpod',
    this.useAppException = false,
    this.useKeepAlive = false,
    this.invalidateOnChange = true,
    this.generateAsyncValueWidget = true,
    // RPC function generation defaults
    this.generateRpcServices = false,
    this.rpcGroupingStrategy = 'category',
    this.rpcCategories = const {
      'auth': ['login_*', 'register_*', 'verify_*', '*_auth*'],
      'analytics': ['get_*_stats', 'calculate_*', '*_metrics*', '*_report*'],
      'business': ['process_*', '*_payment*', '*_order*', '*_invoice*'],
      'admin': ['*_admin*', 'manage_*', '*_system*', '*_config*'],
      'search': ['search_*', 'find_*', '*_lookup*', 'filter_*'],
    },
    this.excludeRpcFunctions = const [
      'pg_*', 
      'system_*', 
      'internal_*',
      'get_table_*',  // Exclude our schema introspection functions
      'list_tables',
      'list_rpc_functions',
      'get_rpc_*',
      'get_generated_columns',
      'get_function_*',
    ],
    this.includeRpcFunctions = const [],
    this.generateRpcProviders = false,
    this.generateRpcModels = true,
    this.rpcServiceSuffix = 'RpcService',
    this.rpcModelSuffix = 'Result',
    this.rpcProviderSuffix = 'RpcProvider',
    this.enableRpcLogging = true,
    this.enableRpcCaching = false,
    this.generateRpcDocumentation = true,
  }) : assert(
         (connectionType == ConnectionType.local) || 
         (connectionType == ConnectionType.remote && 
          supabaseUrl != null && 
          supabaseKey != null),
         'For remote connections, supabaseUrl and supabaseKey must be provided'
       );

  factory SupabaseGenConfig.fromYaml(Map<String, dynamic> yaml) {
    final dbConfig = yaml['database'] ?? {};
    final genConfig = yaml['generation'] ?? {};
    final providerConfig = genConfig['providers'] ?? {};
    final rpcConfig = genConfig['rpc_functions'] ?? {};
    
    // Check if remote connection settings exist
    final isRemote = dbConfig['connection_type'] == 'remote' || 
                    (dbConfig['supabase_url'] != null && dbConfig['supabase_key'] != null);
    
    return SupabaseGenConfig(
      connectionType: isRemote ? ConnectionType.remote : ConnectionType.local,
      host: dbConfig['host'] ?? 'localhost',
      port: dbConfig['port'] ?? 5432,
      database: dbConfig['database'] ?? '',
      username: dbConfig['username'] ?? '',
      password: dbConfig['password'] ?? '',
      ssl: dbConfig['ssl'] ?? false,
      supabaseUrl: dbConfig['supabase_url'],
      supabaseKey: dbConfig['supabase_key'],
      outputDirectory: genConfig['output_directory'] ?? 'lib/generated',
      modelPrefix: genConfig['model_prefix'],
      modelSuffix: genConfig['model_suffix'] ?? 'Model',
      repositorySuffix: genConfig['repository_suffix'] ?? 'Repository',
      excludeTables: List<String>.from(genConfig['exclude_tables'] ?? []),
      includeTables: List<String>.from(genConfig['include_tables'] ?? []),
      probeTables: List<String>.from(genConfig['probe_tables'] ?? []),
      generateForAllTables: genConfig['generate_for_all_tables'] ?? true,
      useNullSafety: genConfig['use_null_safety'] ?? true,
      
      // Generated column handling
      excludeGeneratedColumns: genConfig['exclude_generated_columns'] ?? false,
      columnExclusions: _parseColumnExclusions(genConfig['column_exclusions']),
      
      // Provider generation options
      generateProviders: providerConfig['generate'] ?? false,
      providerSuffix: providerConfig['suffix'] ?? 'Provider',
      stateManagementType: providerConfig['type'] ?? 'riverpod',
      useAppException: providerConfig['use_app_exception'] ?? false,
      useKeepAlive: providerConfig['use_keep_alive'] ?? false,
      invalidateOnChange: providerConfig['invalidate_on_change'] ?? true,
      generateAsyncValueWidget: providerConfig['generate_async_value_widget'] ?? true,
      
      // RPC function generation options
      generateRpcServices: rpcConfig['generate'] ?? false,
      rpcGroupingStrategy: rpcConfig['grouping_strategy'] ?? 'category',
      rpcCategories: _parseRpcCategories(rpcConfig['categories']),
      excludeRpcFunctions: List<String>.from(rpcConfig['exclude_functions'] ?? []),
      includeRpcFunctions: List<String>.from(rpcConfig['include_functions'] ?? []),
      generateRpcProviders: rpcConfig['generate_providers'] ?? false,
      generateRpcModels: rpcConfig['generate_models'] ?? true,
      rpcServiceSuffix: rpcConfig['service_suffix'] ?? 'RpcService',
      rpcModelSuffix: rpcConfig['model_suffix'] ?? 'Result',
      rpcProviderSuffix: rpcConfig['provider_suffix'] ?? 'RpcProvider',
      enableRpcLogging: rpcConfig['enable_logging'] ?? true,
      enableRpcCaching: rpcConfig['enable_caching'] ?? false,
      generateRpcDocumentation: rpcConfig['generate_documentation'] ?? true,
    );
  }

  /// Parse column exclusions from YAML configuration
  static Map<String, List<String>> _parseColumnExclusions(dynamic exclusions) {
    if (exclusions == null) return {};
    
    if (exclusions is! Map) return {};
    
    final Map<String, List<String>> result = {};
    exclusions.forEach((table, columns) {
      if (table is String && columns is List) {
        result[table] = columns.map((col) => col.toString()).toList();
      }
    });
    
    return result;
  }

  /// Parse RPC categories from YAML configuration
  static Map<String, List<String>> _parseRpcCategories(dynamic categories) {
    if (categories == null) {
      // Return default categories if none specified
      return {
        'auth': ['login_*', 'register_*', 'verify_*', '*_auth*'],
        'analytics': ['get_*_stats', 'calculate_*', '*_metrics*', '*_report*'],
        'business': ['process_*', '*_payment*', '*_order*', '*_invoice*'],
        'admin': ['*_admin*', 'manage_*', '*_system*', '*_config*'],
        'search': ['search_*', 'find_*', '*_lookup*', 'filter_*'],
      };
    }
    
    if (categories is! Map) return {};
    
    final Map<String, List<String>> result = {};
    categories.forEach((category, patterns) {
      if (category is String && patterns is List) {
        result[category] = patterns.map((pattern) => pattern.toString()).toList();
      }
    });
    
    return result;
  }

  /// Get the full model class name for a table
  String getModelClassName(String tableName) {
    // Convert snake_case to PascalCase
    final pascalCase = tableName
        .split('_')
        .map((part) => part.isNotEmpty 
            ? part.substring(0, 1).toUpperCase() + part.substring(1) 
            : '')
        .join('');
    
    return '${modelPrefix ?? ''}$pascalCase${modelSuffix ?? 'Model'}';
  }

  /// Get the repository class name for a table
  String getRepositoryClassName(String tableName) {
    // Convert snake_case to PascalCase
    final pascalCase = tableName
        .split('_')
        .map((part) => part.isNotEmpty 
            ? part.substring(0, 1).toUpperCase() + part.substring(1) 
            : '')
        .join('');
    
    return '${pascalCase}${repositorySuffix ?? 'Repository'}';
  }

  /// Get the provider class name for a table
  String getProviderClassName(String tableName) {
    return '${tableName.substring(0, 1).toUpperCase() + tableName.substring(1)}${providerSuffix ?? 'Provider'}';
  }

  /// Get the notifier class name for a table
  String getNotifierClassName(String tableName) {
    return '${tableName.substring(0, 1).toUpperCase() + tableName.substring(1)}Notifier';
  }

  /// Get the RPC service class name for a category
  String getRpcServiceClassName(String category) {
    final capitalizedCategory = category.substring(0, 1).toUpperCase() + category.substring(1);
    return '$capitalizedCategory${rpcServiceSuffix}';
  }

  /// Get the RPC model class name for a function
  String getRpcModelClassName(String functionName) {
    // Convert snake_case to PascalCase
    final pascalCase = functionName
        .split('_')
        .map((part) => part.isNotEmpty 
            ? part.substring(0, 1).toUpperCase() + part.substring(1) 
            : '')
        .join('');
    
    return '$pascalCase$rpcModelSuffix';
  }

  /// Get the RPC provider class name for a category
  String getRpcProviderClassName(String category) {
    final capitalizedCategory = category.substring(0, 1).toUpperCase() + category.substring(1);
    return '$capitalizedCategory$rpcProviderSuffix';
  }

  /// Get the RPC notifier class name for a category
  String getRpcNotifierClassName(String category) {
    final capitalizedCategory = category.substring(0, 1).toUpperCase() + category.substring(1);
    return '${capitalizedCategory}RpcNotifier';
  }

  /// Check if RPC function should be excluded based on patterns
  bool shouldExcludeRpcFunction(String functionName) {
    // If include list is specified, function must be in it
    if (includeRpcFunctions.isNotEmpty) {
      bool included = false;
      for (final pattern in includeRpcFunctions) {
        if (_matchesPattern(functionName, pattern)) {
          included = true;
          break;
        }
      }
      if (!included) return true;
    }

    // Check exclusion patterns
    for (final pattern in excludeRpcFunctions) {
      if (_matchesPattern(functionName, pattern)) {
        return true;
      }
    }

    return false;
  }

  /// Get the category for an RPC function based on configuration patterns
  String getRpcFunctionCategory(String functionName) {
    for (final entry in rpcCategories.entries) {
      final category = entry.key;
      final patterns = entry.value;
      
      for (final pattern in patterns) {
        if (_matchesPattern(functionName, pattern)) {
          return category;
        }
      }
    }
    
    return 'general'; // Default category
  }

  /// Helper method to match patterns with wildcards
  bool _matchesPattern(String text, String pattern) {
    if (pattern == '*') return true;
    if (pattern.contains('*')) {
      final regex = RegExp('^${pattern.replaceAll('*', '.*')}\$');
      return regex.hasMatch(text);
    }
    return text == pattern;
  }
}

enum ConnectionType {
  local,
  remote
}