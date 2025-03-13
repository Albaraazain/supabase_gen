import 'dart:io';
import 'package:supabase_gen/supabase_gen.dart';
import 'package:supabase_gen/src/utils/type_converter.dart';

Future<void> main() async {
  // Configuration for the local Supabase instance
  final config = SupabaseGenConfig(
    host: '127.0.0.1',
    port: 54322,
    database: 'postgres',
    username: 'postgres',
    password: 'postgres',
    outputDirectory: 'lib/generated',
    generateForAllTables: true,
    // Exclude Supabase system tables
    excludeTables: [
      'auth.*',
      'storage.*',
      'extensions',
      'pg_*',
      'information_schema.*',
    ],
    modelPrefix: '',
    modelSuffix: 'Model',
  );

  print('Starting model generation from local Supabase...');

  try {
    // Create the schema reader
    final schemaReader = SchemaReader(config);

    // Connect to the database
    await schemaReader.connect();
    print('Connected to database successfully');

    // Read the tables
    final tables = await schemaReader.readTables();
    print('Found ${tables.length} tables:');
    for (final table in tables) {
      print(
        '- ${table.schema}.${table.name} (${table.columns.length} columns)',
      );

      // Print primary keys and their types
      final primaryKeys =
          table.columns.where((col) => col.isPrimaryKey).toList();
      if (primaryKeys.isNotEmpty) {
        print('  Primary keys:');
        for (final pk in primaryKeys) {
          print('  - ${pk.name} (${pk.type})');
          if (TypeConverter.isUuidType(pk.type)) {
            print(
              '    * UUID primary key detected - will be handled specially',
            );
          }
        }
      }
    }

    // Generate models
    final modelGenerator = ModelGenerator(config);
    await modelGenerator.generateModels(tables);
    print('Models generated successfully');

    // Generate repositories
    final repositoryGenerator = RepositoryGenerator(config);
    await repositoryGenerator.generateRepositories(tables);
    print('Repositories generated successfully');

    // Disconnect from the database
    await schemaReader.disconnect();
    print('Disconnected from database');

    print('Generation completed successfully!');
  } catch (e, stackTrace) {
    print('Error during generation: $e');
    print(stackTrace);
    exit(1);
  }
}
