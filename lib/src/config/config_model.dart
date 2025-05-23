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

  /// Provider generation settings
  final bool generateProviders;
  final String? providerSuffix;
  final String stateManagementType;
  final bool useAppException;
  final bool useKeepAlive;
  final bool invalidateOnChange;
  final bool generateAsyncValueWidget;

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
    this.excludeTables = const ['migrations', 'schema_migrations'],
    this.includeTables = const [],
    this.probeTables = const ['users', 'profiles', 'games'],
    this.generateForAllTables = true,
    this.useNullSafety = true,
    this.generateProviders = false,
    this.providerSuffix = 'Provider',
    this.stateManagementType = 'riverpod',
    this.useAppException = false,
    this.useKeepAlive = false,
    this.invalidateOnChange = true,
    this.generateAsyncValueWidget = true,
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
      
      // Provider generation options
      generateProviders: providerConfig['generate'] ?? false,
      providerSuffix: providerConfig['suffix'] ?? 'Provider',
      stateManagementType: providerConfig['type'] ?? 'riverpod',
      useAppException: providerConfig['use_app_exception'] ?? false,
      useKeepAlive: providerConfig['use_keep_alive'] ?? false,
      invalidateOnChange: providerConfig['invalidate_on_change'] ?? true,
      generateAsyncValueWidget: providerConfig['generate_async_value_widget'] ?? true,
    );
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
}

enum ConnectionType {
  local,
  remote
}