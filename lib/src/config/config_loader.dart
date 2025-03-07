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
database:
  host: localhost
  port: 5432
  database: supabase_db
  username: postgres
  password: postgres
  ssl: false

generation:
  output_directory: lib/generated
  model_prefix: ''
  model_suffix: Model
  repository_suffix: Repository
  exclude_tables:
    - migrations
    - schema_migrations
  include_tables: []
  generate_for_all_tables: true
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