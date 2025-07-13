// lib/src/generator.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:supabase_gen/src/schema/constraint_metadata.dart';
import 'package:supabase_gen/src/templates/best_practices_template.dart';
import 'package:supabase_gen/src/templates/documentation_template.dart';
import 'package:supabase_gen/supabase_gen.dart';
import 'config/config_model.dart';
import 'generators/model_generator.dart';
import 'generators/repository_generator.dart';
import 'generators/provider_generator.dart';
import 'generators/rpc_service_generator.dart';
import 'schema/schema_reader.dart';
import 'utils/logger.dart';
import 'templates/logger_template.dart';
import 'templates/query_builder_template.dart';

class SupabaseGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('SupabaseGenerator');

  SupabaseGenerator(this.config);

  /// Generate documentation based on table constraints
  Future<void> generateConstraintDocumentation(List<TableInfo> tables) async {
    _logger.info('Generating constraint-based documentation');

    // Create the docs directory
    final docsDir = Directory(path.join(config.outputDirectory, 'docs'));
    if (!await docsDir.exists()) {
      await docsDir.create(recursive: true);
    }

    // Generate guides first using DocumentationTemplate
    await File(
      path.join(docsDir.path, 'filter_usage_guide.dart'),
    ).writeAsString(DocumentationTemplate.generateFilterUsageGuide());

    await File(
      path.join(docsDir.path, 'ui_rebuilding_guide.dart'),
    ).writeAsString(DocumentationTemplate.generateUiRebuildingGuide());

    await File(
      path.join(docsDir.path, 'user_feedback_guide.dart'),
    ).writeAsString(DocumentationTemplate.generateUserFeedbackGuide());

    // Create the tables docs directory
    final tablesDocsDir = Directory(path.join(docsDir.path, 'tables'));
    if (!await tablesDocsDir.exists()) {
      await tablesDocsDir.create(recursive: true);
    }

    // Generate documentation for each table
    for (final table in tables) {
      final modelClassName = config.getModelClassName(table.name);
      final constraintMetadata = TableConstraintMetadata.fromTableInfo(table);

      final documentation = BestPracticesTemplate.generateTableDocumentation(
        table,
        modelClassName,
        constraintMetadata,
      );

      await File(
        path.join(tablesDocsDir.path, '${table.name}.md'),
      ).writeAsString(documentation);

      _logger.info('Generated documentation for ${table.name}');
    }

    // Generate index file
    final indexContent = '''# Database Documentation

## Guides

- [Filter Usage Guide](./filter_usage_guide.dart)
- [UI Rebuilding Guide](./ui_rebuilding_guide.dart)
- [User Feedback Guide](./user_feedback_guide.dart)

## Tables

${tables.map((t) => '- [${config.getModelClassName(t.name)}](./tables/${t.name}.md)').join('\n')}
''';

    await File(path.join(docsDir.path, 'index.md')).writeAsString(indexContent);

    _logger.info('Generated constraint-based documentation');
  }

  /// Generate type-safe query builders for tables
  Future<void> generateQueryBuilders(List<TableInfo> tables) async {
    _logger.info('Generating type-safe query builders');

    final dir = Directory(path.join(config.outputDirectory, 'query_builders'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    for (final table in tables) {
      // Generate query builders for both tables and views
      final modelClassName = config.getModelClassName(table.name);
      final constraintMetadata = TableConstraintMetadata.fromTableInfo(table);
      final queryBuilderContent = QueryBuilderTemplate.generateQueryBuilder(
        table,
        modelClassName,
        constraintMetadata,
      );

      final filePath = path.join(dir.path, '${table.name}_query_builder.dart');
      await File(filePath).writeAsString(queryBuilderContent);
      _logger.info('Generated query builder: $filePath');
    }

    // Generate barrel file - include all tables and views
    final barrelContent = tables
        .map((t) => "export '${t.name}_query_builder.dart';")
        .join('\n');

    final barrelFile = '''// Generated barrel file for query builders
// Do not modify by hand

$barrelContent
''';

    final barrelPath = path.join(dir.path, 'query_builders.dart');
    await File(barrelPath).writeAsString(barrelFile);
    _logger.info('Generated query builders barrel file: $barrelPath');
  }

  /// Generate SQL scripts to create required RPC functions in Supabase
  Future<void> generateRpcSetupDocumentation() async {
    final outputDir = Directory(path.join(config.outputDirectory, 'docs'));
    if (!await outputDir.exists()) {
      await outputDir.create(recursive: true);
    }

    // Create SQL file with the RPC function definitions
    final sqlFilePath = path.join(outputDir.path, 'rpc_functions_setup.sql');
    await File(sqlFilePath).writeAsString(SchemaReader.getRpcFunctionScripts());

    // Create markdown documentation
    final mdFilePath = path.join(outputDir.path, 'rpc_functions_setup.md');
    final mdContent = '''# Supabase RPC Functions Setup

This document explains how to set up the required RPC functions for the Supabase schema reader.

## Required RPC Functions

The following RPC functions need to be created in your Supabase project to enable remote schema reading:

1. `list_tables()` - Lists all tables in the public schema
2. `get_table_columns(p_table_name text)` - Gets column information for a table
3. `get_table_constraints(p_table_name text)` - Gets constraint information for a table
4. `get_table_indexes(p_table_name text)` - Gets index information for a table
5. `get_table_triggers(p_table_name text)` - Gets trigger information for a table

## Installation

You can install these functions in your Supabase project using the SQL Editor:

1. Open your Supabase project dashboard
2. Go to the SQL Editor
3. Copy and paste the SQL code from the `rpc_functions_setup.sql` file
4. Run the SQL script

The SQL code is available in the accompanying `rpc_functions_setup.sql` file.
''';

    await File(mdFilePath).writeAsString(mdContent);

    _logger.info('Generated RPC setup documentation at:');
    _logger.info('  SQL: $sqlFilePath');
    _logger.info('  Documentation: $mdFilePath');
  }

  Future<void> generate() async {
    // Ensure output directory exists
    final outputDir = Directory(config.outputDirectory);
    if (!outputDir.existsSync()) {
      outputDir.createSync(recursive: true);
      _logger.info('Created output directory: ${config.outputDirectory}');
    }

    // If it's a remote connection, generate RPC setup documentation
    if (config.connectionType == ConnectionType.remote) {
      _logger.info(
        'Remote connection detected, generating RPC setup documentation...',
      );
      await generateRpcSetupDocumentation();
    }

    // Read database schema
    final schemaReader = SchemaReader(config);

    try {
      await schemaReader.connect();

      if (config.connectionType == ConnectionType.local) {
        _logger.info(
          'Connected to database ${config.database} on ${config.host}:${config.port}',
        );
      } else {
        _logger.info('Connected to Supabase at ${config.supabaseUrl}');
      }

      final tables = await schemaReader.readTables();
      _logger.info('Read schema for ${tables.length} tables');

      // Read RPC functions if enabled
      final functions = await schemaReader.readRpcFunctions();
      _logger.info('Read ${functions.length} RPC functions');

      // Generate constraint-based documentation
      await generateConstraintDocumentation(tables);

      // Generate models
      final modelGenerator = ModelGenerator(config);
      await modelGenerator.generateModels(tables);

      // Generate repositories
      final repositoryGenerator = RepositoryGenerator(config);
      await repositoryGenerator.generateRepositories(tables);

      // Generate providers if enabled
      if (config.generateProviders) {
        _logger.info('Generating Riverpod providers...');
        final providerGenerator = ProviderGenerator(config);
        await providerGenerator.generateProviders(tables);
      }

      // Generate type-safe query builders if repositories are enabled
      _logger.info('Generating type-safe query builders...');
      await generateQueryBuilders(tables);

      // Generate RPC services if enabled
      if (config.generateRpcServices && functions.isNotEmpty) {
        _logger.info('Generating RPC services...');
        final rpcGenerator = RpcServiceGenerator(config);
        await rpcGenerator.generateRpcServices(functions);
      }

      // Create utilities directory
      final utilsDir = Directory(path.join(config.outputDirectory, 'utils'));
      if (!utilsDir.existsSync()) {
        utilsDir.createSync(recursive: true);
      }

      // Generate shared logger utility
      final loggerPath = path.join(utilsDir.path, 'app_logger.dart');
      await File(loggerPath).writeAsString(LoggerTemplate.loggerUtility());
      _logger.info('Generated app logger utility: $loggerPath');

      // Generate exception handler
      final errorsDir = Directory(
        path.join(config.outputDirectory, 'shared', 'errors'),
      );
      if (!errorsDir.existsSync()) {
        errorsDir.createSync(recursive: true);
      }

      final exceptionHandlerPath = path.join(
        errorsDir.path,
        'app_exception_handler.dart',
      );
      await File(
        exceptionHandlerPath,
      ).writeAsString(LoggerTemplate.exceptionHandler());
      _logger.info('Generated exception handler: $exceptionHandlerPath');

      // Add initialization code to main app
      _logger.info('Adding logger initialization code...');
      final initFilePath = path.join(
        config.outputDirectory,
        'logger_init.dart',
      );
      final initContent = '''// Generated logger initialization code
import 'package:logger/logger.dart';
import './utils/app_logger.dart';

/// Initialize all logging for the application
void initializeLogging({
  Level? level, 
  bool colorize = true,
  bool includeCallerInfo = true,
}) {
  AppLogger.initialize(
    level: level,
    includeCallerInfo: includeCallerInfo,
    colorize: colorize,
  );

  // Example usage in your application:
  //
  // 1. In your app's main() function:
  // ```dart
  // void main() {
  //   // Initialize logging with more detailed logs during development
  //   initializeLogging(
  //     level: kDebugMode ? Level.FINE : Level.INFO,
  //     colorize: true,
  //   );
  //   runApp(MyApp());
  // }
  // ```
  //
  // 2. The repositories and providers already use logging extensively.
  //
  // 3. In your own code, use these methods:
  // ```dart
  //   // For informational messages:
  //   AppLogger.info('User logged in', loggerName: 'Auth');
  //
  //   // For debug messages (only shown if level is FINE or lower):
  //   AppLogger.debug('Processing item \$id', loggerName: 'SyncService');
  //
  //   // For warnings:
  //   AppLogger.warning('Rate limit approaching', loggerName: 'API');
  //
  //   // For errors with stack traces:
  //   try {
  //     // Some code that might throw
  //   } catch (e, stackTrace) {
  //     AppLogger.error(
  //       'Failed to process data', 
  //       loggerName: 'DataProcessor', 
  //       error: e, 
  //       stackTrace: stackTrace
  //     );
  //   }
  //
  //   // For success messages (with checkmark):
  //   AppLogger.success('Data synchronized successfully', loggerName: 'SyncService');
  // ```
  //
  // 4. For operations that need timing:
  // ```dart
  //   // Use the RepositoryLogging extension:
  //   final result = await RepositoryLogging.timeOperation(
  //     'UserRepository', 
  //     'fetchProfileData', 
  //     () async {
  //       // Your expensive operation here
  //       return await someExpensiveOperation();
  //     }
  //   );
  // ```
}''';
      await File(initFilePath).writeAsString(initContent);

      _logger.success(
        'Generated code for ${tables.length} tables with comprehensive logging system',
      );
    } finally {
      await schemaReader.disconnect();
    }
  }
}
