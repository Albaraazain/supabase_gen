import 'dart:io';
import 'package:path/path.dart' as path;

import '../config/config_model.dart';
import '../schema/table_info.dart';
import '../utils/logger.dart';
import '../utils/string_utils.dart';
import '../templates/provider_template.dart';

/// Generates Riverpod providers for each table in the database schema
class ProviderGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('ProviderGenerator');

  ProviderGenerator(this.config);

  /// Generate provider files for the given tables
  Future<void> generateProviders(List<TableInfo> tables) async {
    _logger.info('Generating providers for ${tables.length} tables...');

    // Create providers directory
    final providersDir = Directory(path.join(
      config.outputDirectory,
      'providers',
    ));
    
    if (!providersDir.existsSync()) {
      providersDir.createSync(recursive: true);
    }
    
    // Create shared directory and generate AppException if needed
    if (config.useAppException) {
      final sharedDir = Directory(path.join(
        config.outputDirectory,
        'shared',
      ));
      
      if (!sharedDir.existsSync()) {
        sharedDir.createSync(recursive: true);
      }
      
      final errorsDir = Directory(path.join(
        sharedDir.path,
        'errors',
      ));
      
      if (!errorsDir.existsSync()) {
        errorsDir.createSync(recursive: true);
      }
      
      await _generateAppExceptionClass(errorsDir.path);
      _logger.info('Generated AppException class');
    }

    // Generate AsyncValueWidget if enabled
    if (config.generateAsyncValueWidget) {
      await _generateAsyncValueWidget(providersDir.path);
    }

    // Generate provider files
    for (final table in tables) {
      await _generateProviderForTable(table, providersDir.path);
    }

    // Generate barrel file
    await _generateBarrelFile(tables, providersDir.path);

    _logger.success('Provider generation completed.');
  }

  /// Generate the AppException class
  Future<void> _generateAppExceptionClass(String outputDir) async {
    final filePath = path.join(outputDir, 'app_exception.dart');
    final code = ProviderTemplate.appExceptionClass();
    
    await File(filePath).writeAsString(code);
  }

  /// Generate a provider file for a single table
  Future<void> _generateProviderForTable(TableInfo table, String outputDir) async {
    final className = StringUtils.toClassName(table.name);
    final fileName = '${table.name}_provider.dart';
    final filePath = path.join(outputDir, fileName);
    
    final modelName = config.getModelClassName(table.name);
    final repositoryName = config.getRepositoryClassName(table.name);
    final camelCaseTableName = StringUtils.toVariableName(table.name);

    // Generate the Riverpod provider code (using the non-annotation based approach)
    final code = ProviderTemplate.notifierClass(
      tableName: table.name,
      pascalCaseTableName: className,
      modelName: modelName,
      repositoryName: repositoryName,
      camelCaseTableName: camelCaseTableName,
      useAppException: config.useAppException,
      useNullSafety: config.useNullSafety,
    );

    await File(filePath).writeAsString(code);
    _logger.info('Generated provider for ${table.name}');
  }

  /// Generate the AsyncValueWidget utility
  Future<void> _generateAsyncValueWidget(String outputDir) async {
    final sharedDir = Directory(path.join(
      config.outputDirectory,
      'shared',
    ));
    
    if (!sharedDir.existsSync()) {
      sharedDir.createSync(recursive: true);
    }
    
    final widgetsDir = Directory(path.join(
      sharedDir.path,
      'widgets',
    ));
    
    if (!widgetsDir.existsSync()) {
      widgetsDir.createSync(recursive: true);
    }
    
    final filePath = path.join(widgetsDir.path, 'async_value_widget.dart');
    final code = ProviderTemplate.asyncValueWidgetIntegration(true); // Use null safety
    
    await File(filePath).writeAsString(code);
    _logger.info('Generated AsyncValueWidget');
  }

  /// Generate a barrel file that exports all providers
  Future<void> _generateBarrelFile(List<TableInfo> tables, String outputDir) async {
    final filePath = path.join(outputDir, 'providers.dart');
    
    final exports = tables.map((table) => 
      "export '${table.name}_provider.dart';").join('\n');
    
    final content = '''// Generated providers for Supabase tables
// Do not modify by hand

$exports
''';

    await File(filePath).writeAsString(content);
  }
}