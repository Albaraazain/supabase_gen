// test/repository_generator_test.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:supabase_gen/src/generators/repository_generator.dart';
import 'package:supabase_gen/src/schema/table_info.dart';
import 'package:supabase_gen/src/utils/logger.dart';
import 'package:test/test.dart';

void main() {
  group('Repository Generator Tests', () {
    late SupabaseGenConfig config;
    late RepositoryGenerator repositoryGenerator;
    late Directory tempDir;

    setUp(() {
      Logger.initializeLogging();
      
      // Create a temporary directory for output
      tempDir = Directory.systemTemp.createTempSync('supabase_gen_test_');
      
      config = SupabaseGenConfig(
        host: 'localhost',
        port: 5432,
        database: 'postgres',
        username: 'postgres',
        password: 'postgres',
        outputDirectory: tempDir.path,
      );
      
      repositoryGenerator = RepositoryGenerator(config);
    });

    tearDown(() {
      // Clean up temporary directory
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('Repository generator creates valid Dart files', () async {
      // Create models directory and necessary model files for foreign keys
      final modelsDir = Directory(path.join(tempDir.path, 'models'));
      if (!modelsDir.existsSync()) {
        modelsDir.createSync(recursive: true);
      }

      // Create a profiles model file that will be imported by the repository
      final profilesModelFile = File(path.join(modelsDir.path, 'profiles_model.dart'));
      profilesModelFile.writeAsStringSync('''
// Generated model for profiles table
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilesModel {
  final String id;
  final String? userId;
  final String? name;

  ProfilesModel({
    required this.id,
    this.userId,
    this.name,
  });

  factory ProfilesModel.fromJson(Map<String, dynamic> json) {
    return ProfilesModel(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'name': name,
    };
  }
}
''');

      // Create a users model file
      final usersModelFile = File(path.join(modelsDir.path, 'users_model.dart'));
      usersModelFile.writeAsStringSync('''
// Generated model for users table
import 'package:supabase_flutter/supabase_flutter.dart';

class UsersModel {
  final String id;
  final String name;
  final String email;
  final String? profileId;

  UsersModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileId,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileId: json['profile_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profile_id': profileId,
    };
  }
}
''');

      // Create a test table structure
      final columns = [
        ColumnInfo(
          name: 'id',
          type: 'uuid',
          isNullable: false,
          isPrimaryKey: true,
          comment: 'Primary key',
        ),
        ColumnInfo(
          name: 'name',
          type: 'text',
          isNullable: false,
          isPrimaryKey: false,
          comment: 'User name',
        ),
        ColumnInfo(
          name: 'email',
          type: 'varchar',
          isNullable: false,
          isPrimaryKey: false,
          isUnique: true,
        ),
        ColumnInfo(
          name: 'profile_id',
          type: 'uuid',
          isNullable: true,
          isPrimaryKey: false,
          foreignKey: 'id',
          foreignTable: 'public.profiles',
          comment: 'Reference to user profile',
        ),
      ];

      final table = TableInfo(
        name: 'users',
        schema: 'public',
        columns: columns,
        comment: 'Users table',
      );

      // Generate repository
      await repositoryGenerator.generateRepositories([table]);

      // Check if base repository file was created
      final baseRepoFile = File(path.join(tempDir.path, 'repositories', 'base_repository.dart'));
      expect(baseRepoFile.existsSync(), true);

      // Check if table repository file was created
      final repoFile = File(path.join(tempDir.path, 'repositories', 'users_repository.dart'));
      expect(repoFile.existsSync(), true);

      // Check file content
      final content = repoFile.readAsStringSync();
      
      // Print the content for debugging
      print('Generated repository file content:');
      print(content);
      
      // Check class name
      expect(content.contains('class UsersRepository extends BaseRepository'), true);
      
      // Check primary key methods
      expect(content.contains('Future<UsersModel?> find(String id)'), true);
      expect(content.contains('Future<UsersModel?> update(UsersModel model)'), true);
      expect(content.contains('Future<void> delete(String id)'), true);
      
      // Check standard methods
      expect(content.contains('Future<List<UsersModel>> findAll('), true);
      expect(content.contains('Future<UsersModel> insert(UsersModel model)'), true);
      expect(content.contains('Future<UsersModel> upsert(UsersModel model)'), true);
      
      // Check foreign key method - the method name should be based on the column name
      expect(content.contains('Future<List<ProfilesModel>> findByProfileId(String? profileId)'), true);
      
      // Check barrel file
      final barrelFile = File(path.join(tempDir.path, 'repositories', 'repositories.dart'));
      expect(barrelFile.existsSync(), true);
      expect(barrelFile.readAsStringSync().contains("export 'users_repository.dart';"), true);
    });
  });
}