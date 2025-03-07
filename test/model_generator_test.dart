// test/model_generator_test.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:supabase_gen/src/generators/model_generator.dart';
import 'package:supabase_gen/src/schema/table_info.dart';
import 'package:supabase_gen/src/utils/logger.dart';
import 'package:test/test.dart';

void main() {
  group('Model Generator Tests', () {
    late SupabaseGenConfig config;
    late ModelGenerator modelGenerator;
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
      
      modelGenerator = ModelGenerator(config);
    });

    tearDown(() {
      // Clean up temporary directory
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('Model generator creates valid Dart files', () async {
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
          name: 'created_at',
          type: 'timestamp with time zone',
          isNullable: false,
          isPrimaryKey: false,
          defaultValue: 'now()',
        ),
        ColumnInfo(
          name: 'profile',
          type: 'jsonb',
          isNullable: true,
          isPrimaryKey: false,
        ),
      ];

      final table = TableInfo(
        name: 'users',
        schema: 'public',
        columns: columns,
        comment: 'Users table',
      );

      // Generate model
      await modelGenerator.generateModels([table]);

      // Check if file was created
      final modelFile = File(path.join(tempDir.path, 'models', 'users_model.dart'));
      expect(modelFile.existsSync(), true);

      // Check file content
      final content = modelFile.readAsStringSync();
      
      // Check class name
      expect(content.contains('class UsersModel'), true);
      
      // Check properties
      expect(content.contains('final String id;'), true);
      expect(content.contains('final String name;'), true);
      expect(content.contains('final String email;'), true);
      expect(content.contains('final DateTime createdAt;'), true);
      expect(content.contains('final Map<String, dynamic>? profile;'), true);
      
      // Check constructor
      expect(content.contains('required this.id'), true);
      expect(content.contains('this.profile'), true);
      
      // Check fromJson method
      expect(content.contains('factory UsersModel.fromJson'), true);
      
      // Check toJson method
      expect(content.contains('Map<String, dynamic> toJson()'), true);
      
      // Check copyWith method
      expect(content.contains('UsersModel copyWith({'), true);
      
      // Check barrel file
      final barrelFile = File(path.join(tempDir.path, 'models', 'models.dart'));
      expect(barrelFile.existsSync(), true);
      expect(barrelFile.readAsStringSync().contains("export 'users_model.dart';"), true);
    });
  });
}