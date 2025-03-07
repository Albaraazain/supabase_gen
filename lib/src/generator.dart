// lib/src/generator.dart
import 'dart:io';
import 'config/config_model.dart';
import 'generators/model_generator.dart';
import 'generators/repository_generator.dart';
import 'schema/schema_reader.dart';
import 'utils/logger.dart';

class SupabaseGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('SupabaseGenerator');

  SupabaseGenerator(this.config);

  Future<void> generate() async {
    // Ensure output directory exists
    final outputDir = Directory(config.outputDirectory);
    if (!outputDir.existsSync()) {
      outputDir.createSync(recursive: true);
      _logger.info('Created output directory: ${config.outputDirectory}');
    }

    // Read database schema
    final schemaReader = SchemaReader(config);
    
    try {
      await schemaReader.connect();
      _logger.info('Connected to database ${config.database} on ${config.host}:${config.port}');
      
      final tables = await schemaReader.readTables();
      _logger.info('Read schema for ${tables.length} tables');
      
      // Generate models
      final modelGenerator = ModelGenerator(config);
      await modelGenerator.generateModels(tables);
      
      // Generate repositories
      final repositoryGenerator = RepositoryGenerator(config);
      await repositoryGenerator.generateRepositories(tables);
      
      _logger.info('Generated code for ${tables.length} tables');
    } finally {
      await schemaReader.disconnect();
    }
  }
}