// lib/src/config/config_model.dart
class SupabaseGenConfig {
  /// Database connection settings
  final String host;
  final int port;
  final String database;
  final String username;
  final String password;
  final bool ssl;

  /// Code generation settings
  final String outputDirectory;
  final String? modelPrefix;
  final String? modelSuffix;
  final String? repositorySuffix;
  final List<String> excludeTables;
  final List<String> includeTables;
  final bool generateForAllTables;
  final bool useNullSafety;

  const SupabaseGenConfig({
    required this.host,
    this.port = 5432,
    required this.database,
    required this.username,
    required this.password,
    this.ssl = false,
    required this.outputDirectory,
    this.modelPrefix = '',
    this.modelSuffix = 'Model',
    this.repositorySuffix = 'Repository',
    this.excludeTables = const ['migrations', 'schema_migrations'],
    this.includeTables = const [],
    this.generateForAllTables = true,
    this.useNullSafety = true,
  });

  factory SupabaseGenConfig.fromYaml(Map<String, dynamic> yaml) {
    final dbConfig = yaml['database'] ?? {};
    final genConfig = yaml['generation'] ?? {};

    return SupabaseGenConfig(
      host: dbConfig['host'] ?? 'localhost',
      port: dbConfig['port'] ?? 5432,
      database: dbConfig['database'] ?? '',
      username: dbConfig['username'] ?? '',
      password: dbConfig['password'] ?? '',
      ssl: dbConfig['ssl'] ?? false,
      outputDirectory: genConfig['output_directory'] ?? 'lib/generated',
      modelPrefix: genConfig['model_prefix'],
      modelSuffix: genConfig['model_suffix'],
      repositorySuffix: genConfig['repository_suffix'],
      excludeTables: List<String>.from(genConfig['exclude_tables'] ?? []),
      includeTables: List<String>.from(genConfig['include_tables'] ?? []),
      generateForAllTables: genConfig['generate_for_all_tables'] ?? true,
      useNullSafety: genConfig['use_null_safety'] ?? true,
    );
  }
}