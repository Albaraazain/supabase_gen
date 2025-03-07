// test/generator_test.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:supabase_gen/src/generator.dart';
import 'package:supabase_gen/src/utils/logger.dart';
import 'package:test/test.dart';

void main() {
  group('Code Generator Tests', () {
    late SupabaseGenConfig config;
    late SupabaseGenerator generator;
    late Directory tempDir;

    setUp(() {
      Logger.initializeLogging();
      
      // Create a temporary directory for output
      tempDir = Directory.systemTemp.createTempSync('supabase_gen_test_');
      
      // Configuration for local Supabase instance
      config = SupabaseGenConfig(
        host: 'localhost',
        port: 54322,  // Updated to match local Supabase port
        database: 'postgres',
        username: 'postgres',
        password: 'postgres',
        outputDirectory: tempDir.path,
        // Test with specific tables to make the test faster
        includeTables: ['users', 'professional_profiles'],
        generateForAllTables: false,
      );
      
      generator = SupabaseGenerator(config);
    });

    tearDown(() {
      // Clean up the temporary directory
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('Can generate models and repositories', () async {
      try {
        await generator.generate();
        
        // Check if models directory was created
        final modelsDir = Directory(path.join(tempDir.path, 'models'));
        expect(modelsDir.existsSync(), true, reason: 'Models directory should exist');
        
        // Check if repositories directory was created
        final reposDir = Directory(path.join(tempDir.path, 'repositories'));
        expect(reposDir.existsSync(), true, reason: 'Repositories directory should exist');
        
        // Check if model files were created for the included tables
        final userModelFile = File(path.join(modelsDir.path, 'users_model.dart'));
        expect(userModelFile.existsSync(), true, reason: 'User model file should exist');
        
        final profileModelFile = File(path.join(modelsDir.path, 'professional_profiles_model.dart'));
        expect(profileModelFile.existsSync(), true, reason: 'Professional profile model file should exist');
        
        // Check if repository files were created for the included tables
        final userRepoFile = File(path.join(reposDir.path, 'users_repository.dart'));
        expect(userRepoFile.existsSync(), true, reason: 'User repository file should exist');
        
        final profileRepoFile = File(path.join(reposDir.path, 'professional_profiles_repository.dart'));
        expect(profileRepoFile.existsSync(), true, reason: 'Professional profile repository file should exist');
        
        // Check if base repository file was created
        final baseRepoFile = File(path.join(reposDir.path, 'base_repository.dart'));
        expect(baseRepoFile.existsSync(), true, reason: 'Base repository file should exist');
        
        // Check if barrel files were created
        final modelsBarrelFile = File(path.join(modelsDir.path, 'models.dart'));
        expect(modelsBarrelFile.existsSync(), true, reason: 'Models barrel file should exist');
        
        final reposBarrelFile = File(path.join(reposDir.path, 'repositories.dart'));
        expect(reposBarrelFile.existsSync(), true, reason: 'Repositories barrel file should exist');
        
        // Print the generated files for debugging
        print('Generated files:');
        print('Models:');
        for (final file in modelsDir.listSync()) {
          print('  ${path.basename(file.path)}');
        }
        
        print('Repositories:');
        for (final file in reposDir.listSync()) {
          print('  ${path.basename(file.path)}');
        }
        
      } catch (e) {
        fail('Failed to generate code: $e');
      }
    });
  });
} 