import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:supabase_gen/src/generators/repository_generator.dart';
import 'package:supabase_gen/src/schema/table_info.dart';
import 'package:supabase_gen/src/utils/string_utils.dart';

void main() {
  group('Repository Imports Tests', () {
    late Directory tempDir;
    late SupabaseGenConfig config;
    late RepositoryGenerator repositoryGenerator;

    setUp(() {
      // Create a temporary directory for test output
      tempDir = Directory.systemTemp.createTempSync('supabase_gen_test_');
      
      // Create a basic config for testing
      config = SupabaseGenConfig(
        host: 'localhost',
        port: 5432,
        database: 'postgres',
        username: 'postgres',
        password: 'postgres',
        outputDirectory: tempDir.path,
        modelPrefix: '',
        modelSuffix: 'Model',
        repositorySuffix: 'Repository',
        generateForAllTables: true,
        includeTables: [],
        excludeTables: [],
        useNullSafety: true,
      );
      
      repositoryGenerator = RepositoryGenerator(config);
    });

    tearDown(() {
      // Clean up the temporary directory
      if (tempDir.existsSync()) {
        tempDir.deleteSync(recursive: true);
      }
    });

    test('Repository has imports for foreign key models', () async {
      // Create test tables with foreign key relationships
      final parentTable = TableInfo(
        name: 'parent',
        schema: 'public',
        columns: [
          ColumnInfo(
            name: 'id',
            type: 'uuid',
            isPrimaryKey: true,
            isNullable: false,
          ),
          ColumnInfo(
            name: 'name',
            type: 'text',
            isPrimaryKey: false,
            isNullable: false,
          ),
        ],
      );

      final childTable = TableInfo(
        name: 'child',
        schema: 'public',
        columns: [
          ColumnInfo(
            name: 'id',
            type: 'uuid',
            isPrimaryKey: true,
            isNullable: false,
          ),
          ColumnInfo(
            name: 'parent_id',
            type: 'uuid',
            isPrimaryKey: false,
            isNullable: false,
            foreignKey: 'id',
            foreignTable: 'public.parent',
          ),
          ColumnInfo(
            name: 'name',
            type: 'text',
            isPrimaryKey: false,
            isNullable: false,
          ),
        ],
      );

      // Generate repositories
      await repositoryGenerator.generateRepositories([parentTable, childTable]);

      // Check if the child repository has an import for the parent model
      final childRepoPath = path.join(tempDir.path, 'repositories', 'child_repository.dart');
      final childRepoContent = File(childRepoPath).readAsStringSync();

      // Verify that the parent model is imported
      expect(
        childRepoContent.contains("import '../models/parent_model.dart';"), 
        isTrue, 
        reason: 'Child repository should import parent model for foreign key relationship'
      );

      // Verify that the repository has a method to find by the foreign key
      expect(
        childRepoContent.contains('Future<List<ParentModel>> findByParentId'), 
        isTrue, 
        reason: 'Child repository should have a method to find by parent_id'
      );
    });

    test('Repository with multiple foreign keys has all required imports', () async {
      // Create test tables with multiple foreign key relationships
      final table1 = TableInfo(
        name: 'table1',
        schema: 'public',
        columns: [
          ColumnInfo(
            name: 'id',
            type: 'uuid',
            isPrimaryKey: true,
            isNullable: false,
          ),
        ],
      );

      final table2 = TableInfo(
        name: 'table2',
        schema: 'public',
        columns: [
          ColumnInfo(
            name: 'id',
            type: 'uuid',
            isPrimaryKey: true,
            isNullable: false,
          ),
        ],
      );

      final complexTable = TableInfo(
        name: 'complex',
        schema: 'public',
        columns: [
          ColumnInfo(
            name: 'id',
            type: 'uuid',
            isPrimaryKey: true,
            isNullable: false,
          ),
          ColumnInfo(
            name: 'table1_id',
            type: 'uuid',
            isPrimaryKey: false,
            isNullable: false,
            foreignKey: 'id',
            foreignTable: 'public.table1',
          ),
          ColumnInfo(
            name: 'table2_id',
            type: 'uuid',
            isPrimaryKey: false,
            isNullable: true,
            foreignKey: 'id',
            foreignTable: 'public.table2',
          ),
        ],
      );

      // Generate repositories
      await repositoryGenerator.generateRepositories([table1, table2, complexTable]);

      // Check if the complex repository has imports for both foreign models
      final complexRepoPath = path.join(tempDir.path, 'repositories', 'complex_repository.dart');
      final complexRepoContent = File(complexRepoPath).readAsStringSync();

      // Verify that both foreign models are imported
      expect(
        complexRepoContent.contains("import '../models/table1_model.dart';"), 
        isTrue, 
        reason: 'Complex repository should import table1 model'
      );
      
      expect(
        complexRepoContent.contains("import '../models/table2_model.dart';"), 
        isTrue, 
        reason: 'Complex repository should import table2 model'
      );

      // Verify that the repository has methods to find by both foreign keys
      expect(
        complexRepoContent.contains('Future<List<Table1Model>> findByTable1Id'), 
        isTrue, 
        reason: 'Complex repository should have a method to find by table1_id'
      );
      
      expect(
        complexRepoContent.contains('Future<List<Table2Model>> findByTable2Id'), 
        isTrue, 
        reason: 'Complex repository should have a method to find by table2_id'
      );
    });
  });
} 