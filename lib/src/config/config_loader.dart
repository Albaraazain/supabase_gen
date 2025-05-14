// lib/src/config/config_loader.dart
import 'dart:io';
import 'package:yaml/yaml.dart';
import 'config_model.dart';

class ConfigLoader {
  /// Loads configuration from a YAML file
  static SupabaseGenConfig fromFile(String filePath) {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw FileSystemException('Configuration file not found', filePath);
    }

    final yamlContent = file.readAsStringSync();
    final yamlMap = loadYaml(yamlContent) as Map;
    
    // Convert YamlMap to regular Map<String, dynamic>
    final config = _convertYamlToMap(yamlMap);
    
    return SupabaseGenConfig.fromYaml(config);
  }

  /// Creates a sample configuration file
  static Future<void> createSampleConfig(String filePath) async {
    final file = File(filePath);
    if (file.existsSync()) {
      throw FileSystemException('Configuration file already exists', filePath);
    }

    final sampleConfig = '''
# Local database configuration - use this for local development with Supabase CLI
database:
  connection_type: local
  host: localhost
  port: 54322  # Default port for Supabase local development
  database: postgres
  username: postgres
  password: postgres
  ssl: false

# Remote database configuration - use this for cloud Supabase instances
# Uncomment and fill in details to use remote mode
# database:
#   connection_type: remote
#   supabase_url: https://your-project-id.supabase.co
#   supabase_key: your-service-role-key
#   database: postgres  # Database name is still required even for remote connection

generation:
  output_directory: lib/generated
  model_prefix: ''
  model_suffix: Model
  repository_suffix: Repository
  exclude_tables:
    # Exclude system schemas
    - '_realtime.*'
    - 'auth.*'
    - 'net.*'
    - 'pgsodium.*'
    - 'realtime.*'
    - 'storage.*'
    - 'supabase_functions.*'
    - 'vault.*'
    # Exclude views and system tables from public schema
    - 'public.*_view'
  include_tables: 
    - 'public.*'  # Include all tables from public schema
  generate_for_all_tables: false  # Only generate for explicitly included tables
  use_null_safety: true
''';

    await file.writeAsString(sampleConfig);
  }

  // Helper method to convert YamlMap to Map<String, dynamic>
  static Map<String, dynamic> _convertYamlToMap(Map yamlMap) {
    final result = <String, dynamic>{};
    
    for (final entry in yamlMap.entries) {
      final key = entry.key.toString();
      
      if (entry.value is Map) {
        result[key] = _convertYamlToMap(entry.value as Map);
      } else if (entry.value is YamlList) {
        result[key] = (entry.value as YamlList).map((item) {
          if (item is Map) {
            return _convertYamlToMap(item);
          } else {
            return item;
          }
        }).toList();
      } else {
        result[key] = entry.value;
      }
    }
    
    return result;
  }
}