// test/config_test.dart
import 'dart:io';
import 'package:supabase_gen/src/config/config_loader.dart';
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:test/test.dart';

void main() {
  group('Config Tests', () {
    final tempConfigFile = File('test_config.yaml');

    setUp(() async {
      await ConfigLoader.createSampleConfig('test_config.yaml');
    });

    tearDown(() {
      if (tempConfigFile.existsSync()) {
        tempConfigFile.deleteSync();
      }
    });

    test('Config file is created successfully', () {
      expect(tempConfigFile.existsSync(), true);
    });

    test('Config is loaded correctly from file', () {
      final config = ConfigLoader.fromFile('test_config.yaml');
      
      expect(config.host, 'localhost');
      expect(config.port, 5432);
      expect(config.database, 'supabase_db');
      expect(config.username, 'postgres');
      expect(config.password, 'postgres');
      expect(config.ssl, false);
      
      expect(config.outputDirectory, 'lib/generated');
      expect(config.modelSuffix, 'Model');
      expect(config.repositorySuffix, 'Repository');
      expect(config.excludeTables, contains('migrations'));
    });
  });
}