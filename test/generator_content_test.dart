// test/generator_content_test.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:supabase_gen/src/generator.dart';
import 'package:supabase_gen/src/utils/logger.dart';
import 'package:test/test.dart';

void main() {
  group('Generated Code Content Tests', () {
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
        port: 54322,
        database: 'postgres',
        username: 'postgres',
        password: 'postgres',
        outputDirectory: tempDir.path,
        // Test with a specific table to make the test faster and more focused
        includeTables: ['professional_profiles'],
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

    test('Generated model has correct structure', () async {
      await generator.generate();
      
      final modelFile = File(path.join(tempDir.path, 'models', 'professional_profiles_model.dart'));
      expect(modelFile.existsSync(), true, reason: 'Model file should exist');
      
      final modelContent = modelFile.readAsStringSync();
      
      // Check imports
      expect(modelContent.contains("import 'dart:convert';"), true, 
        reason: 'Model should import dart:convert');
      
      // Check class definition
      expect(modelContent.contains('class ProfessionalProfilesModel {'), true, 
        reason: 'Model class should be defined with correct name');
      
      // Check for expected properties
      expect(modelContent.contains('final String professionalId;'), true, 
        reason: 'Model should have professionalId property');
      expect(modelContent.contains('final String userId;'), true, 
        reason: 'Model should have userId property');
      expect(modelContent.contains('final String? businessName;'), true, 
        reason: 'Model should have businessName property');
      
      // Check for constructor
      expect(modelContent.contains('const ProfessionalProfilesModel({'), true, 
        reason: 'Model should have a constructor');
      expect(modelContent.contains('required this.professionalId,'), true, 
        reason: 'Constructor should have required parameters for non-nullable fields');
      
      // Check for fromJson factory
      expect(modelContent.contains('factory ProfessionalProfilesModel.fromJson(Map<String, dynamic> json)'), true, 
        reason: 'Model should have fromJson factory');
      
      // Check for toJson method
      expect(modelContent.contains('Map<String, dynamic> toJson()'), true, 
        reason: 'Model should have toJson method');
      
      // Check for copyWith method
      expect(modelContent.contains('ProfessionalProfilesModel copyWith({'), true, 
        reason: 'Model should have copyWith method');
    });

    test('Generated repository has correct structure', () async {
      await generator.generate();
      
      final repoFile = File(path.join(tempDir.path, 'repositories', 'professional_profiles_repository.dart'));
      expect(repoFile.existsSync(), true, reason: 'Repository file should exist');
      
      final repoContent = repoFile.readAsStringSync();
      
      // Check imports
      expect(repoContent.contains("import 'package:supabase_flutter/supabase_flutter.dart';"), true, 
        reason: 'Repository should import supabase_flutter');
      expect(repoContent.contains("import '../models/professional_profiles_model.dart';"), true, 
        reason: 'Repository should import the model');
      expect(repoContent.contains("import 'base_repository.dart';"), true, 
        reason: 'Repository should import base repository');
      
      // Check class definition
      expect(repoContent.contains('class ProfessionalProfilesRepository extends BaseRepository {'), true, 
        reason: 'Repository class should be defined with correct name and extend BaseRepository');
      
      // Check for constructor
      expect(repoContent.contains('const ProfessionalProfilesRepository(SupabaseClient client) : super(client);'), true, 
        reason: 'Repository should have a constructor that passes client to super');
      
      // Check for tableName getter
      expect(repoContent.contains("String get tableName => 'professional_profiles';"), true, 
        reason: 'Repository should have tableName getter');
      
      // Check for CRUD methods
      expect(repoContent.contains('Future<ProfessionalProfilesModel?> find('), true, 
        reason: 'Repository should have find method');
      expect(repoContent.contains('Future<List<ProfessionalProfilesModel>> findAll('), true, 
        reason: 'Repository should have findAll method');
      expect(repoContent.contains('Future<ProfessionalProfilesModel> insert(ProfessionalProfilesModel model)'), true, 
        reason: 'Repository should have insert method');
      expect(repoContent.contains('Future<ProfessionalProfilesModel?> update(ProfessionalProfilesModel model)'), true, 
        reason: 'Repository should have update method');
      expect(repoContent.contains('Future<ProfessionalProfilesModel> upsert(ProfessionalProfilesModel model)'), true, 
        reason: 'Repository should have upsert method');
      expect(repoContent.contains('Future<void> delete('), true, 
        reason: 'Repository should have delete method');
    });

    test('Base repository has correct structure', () async {
      await generator.generate();
      
      final baseRepoFile = File(path.join(tempDir.path, 'repositories', 'base_repository.dart'));
      expect(baseRepoFile.existsSync(), true, reason: 'Base repository file should exist');
      
      final baseRepoContent = baseRepoFile.readAsStringSync();
      
      // Check imports
      expect(baseRepoContent.contains("import 'package:supabase_flutter/supabase_flutter.dart';"), true, 
        reason: 'Base repository should import supabase_flutter');
      
      // Check class definition
      expect(baseRepoContent.contains('abstract class BaseRepository {'), true, 
        reason: 'Base repository should be an abstract class');
      
      // Check for client field
      expect(baseRepoContent.contains('final SupabaseClient client;'), true, 
        reason: 'Base repository should have client field');
      
      // Check for constructor
      expect(baseRepoContent.contains('const BaseRepository(this.client);'), true, 
        reason: 'Base repository should have a constructor');
      
      // Check for tableName getter
      expect(baseRepoContent.contains('String get tableName;'), true, 
        reason: 'Base repository should have abstract tableName getter');
      
      // Check for query getter
      expect(baseRepoContent.contains('PostgrestQueryBuilder get query => client.from(tableName);'), true, 
        reason: 'Base repository should have query getter');
    });

    test('Barrel files contain all expected exports', () async {
      await generator.generate();
      
      final modelsBarrelFile = File(path.join(tempDir.path, 'models', 'models.dart'));
      expect(modelsBarrelFile.existsSync(), true, reason: 'Models barrel file should exist');
      
      final modelsBarrelContent = modelsBarrelFile.readAsStringSync();
      expect(modelsBarrelContent.contains("export 'professional_profiles_model.dart';"), true, 
        reason: 'Models barrel should export professional_profiles_model.dart');
      
      final reposBarrelFile = File(path.join(tempDir.path, 'repositories', 'repositories.dart'));
      expect(reposBarrelFile.existsSync(), true, reason: 'Repositories barrel file should exist');
      
      final reposBarrelContent = reposBarrelFile.readAsStringSync();
      expect(reposBarrelContent.contains("export 'professional_profiles_repository.dart';"), true, 
        reason: 'Repositories barrel should export professional_profiles_repository.dart');
      expect(reposBarrelContent.contains("export 'base_repository.dart';"), true, 
        reason: 'Repositories barrel should export base_repository.dart');
    });
  });
} 