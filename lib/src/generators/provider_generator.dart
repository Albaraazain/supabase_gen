import 'dart:io';
import 'package:path/path.dart' as path;

import '../config/config_model.dart';
import '../schema/table_info.dart';
import '../utils/logger.dart';
import '../utils/string_utils.dart';
import '../templates/provider_template.dart';
import '../templates/logger_template.dart';
import '../templates/cache_template.dart';
import '../templates/best_practices_template.dart';

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
    
    // Create utils directory for logger
    final utilsDir = Directory(path.join(
      config.outputDirectory,
      'utils',
    ));
    
    if (!utilsDir.existsSync()) {
      utilsDir.createSync(recursive: true);
    }
    
    // Generate logger utility
    final loggerPath = path.join(utilsDir.path, 'app_logger.dart');
    await File(loggerPath).writeAsString(LoggerTemplate.loggerUtility());
    _logger.info('Generated app logger utility: $loggerPath');
    
    // Generate provider logging extension
    final providerLoggingPath = path.join(utilsDir.path, 'provider_logging.dart');
    await File(providerLoggingPath).writeAsString(LoggerTemplate.providerLoggingExtension());
    _logger.info('Generated provider logging utility: $providerLoggingPath');
    
    // Generate app cache utility
    final appCachePath = path.join(utilsDir.path, 'app_cache.dart');
    await File(appCachePath).writeAsString(CacheTemplate.cacheUtility());
    _logger.info('Generated app cache utility: $appCachePath');
    
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
      
      // Generate exception handler
      final exceptionHandlerPath = path.join(errorsDir.path, 'app_exception_handler.dart');
      await File(exceptionHandlerPath).writeAsString(LoggerTemplate.exceptionHandler());
      _logger.info('Generated exception handler: $exceptionHandlerPath');
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
    
    // Generate best practices documentation
    await _generateBestPracticesDocumentation(config.outputDirectory);

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

    // Generate the Riverpod provider code with logging
    String code = LoggerTemplate.modifyProviderTemplate(
      table.name,
      className,
      modelName, 
      repositoryName,
      camelCaseTableName
    );
    
    // Add trigger information as documentation if available
    if (table.triggers.isNotEmpty) {
      final triggerComment = _generateTriggersDocumentation(table);
      
      // Insert the trigger documentation after import statements
      final importEndIndex = code.indexOf('\n\n', code.lastIndexOf('import'));
      if (importEndIndex > 0) {
        code = code.substring(0, importEndIndex + 2) + 
              triggerComment + 
              code.substring(importEndIndex + 2);
      }
    }

    await File(filePath).writeAsString(code);
    _logger.info('Generated provider for ${table.name}');
  }
  
  /// Generate documentation string for table triggers
  String _generateTriggersDocumentation(TableInfo table) {
    if (table.triggers.isEmpty) {
      return '';
    }
    
    final triggersList = table.triggers.map((trigger) {
      return _formatTriggerDocumentation(trigger);
    }).join('\n');
    
    return '''/// Database triggers associated with this table that may affect operations:
$triggersList

''';
  }
  
  /// Format trigger documentation with enhanced function details
  String _formatTriggerDocumentation(TriggerInfo trigger) {
    // Basic trigger info
    final basicInfo = '/// - ${trigger.name}: ${trigger.eventType} ${trigger.actionTime}';
    
    // If we have function details, format them more helpfully
    if (trigger.functionName != null) {
      String doc = '$basicInfo - EXECUTE FUNCTION ${trigger.functionName}()';
      
      // Add function details if available
      if (trigger.functionDefinition != null || trigger.functionParameters != null || trigger.functionReturnType != null) {
        // Function signature and return type
        doc += '\n///   Signature: ${trigger.functionName}';
        
        if (trigger.functionParameters != null && trigger.functionParameters!.isNotEmpty) {
          doc += '(${trigger.functionParameters})';
        } else {
          doc += '()';
        }
        
        if (trigger.functionReturnType != null) {
          doc += ' RETURNS ${trigger.functionReturnType}';
        } else {
          doc += ' RETURNS trigger';
        }
        
        // Language
        if (trigger.functionLanguage != null) {
          doc += '\n///   Language: ${trigger.functionLanguage}';
        }
        
        // Description from function comment
        if (trigger.functionComment != null && trigger.functionComment!.isNotEmpty) {
          doc += '\n///   Description: ${trigger.functionComment}';
        }
        
        // Add function body preview in a readable format
        final functionBody = trigger.extractFunctionBody();
        if (functionBody.isNotEmpty) {
          // If the function body is long, truncate it with ellipsis but preserve formatting
          String formattedBody = functionBody.replaceAll('\n', ' ');
          if (formattedBody.length > 120) {
            formattedBody = '${formattedBody.substring(0, 117)}...';
          }
          doc += '\n///   Body: $formattedBody';
        } else if (trigger.actionStatement.contains('EXECUTE')) {
          // If we couldn't get the function body but have an action statement with EXECUTE,
          // extract just the function name for reference
          final functionMatch = RegExp(r'EXECUTE(?:\s+PROCEDURE|\s+FUNCTION)?\s+(\w+)\(\)').firstMatch(trigger.actionStatement);
          if (functionMatch != null && functionMatch.groupCount >= 1) {
            final funcName = functionMatch.group(1);
            doc += '\n///   Body: <Function body not available for $funcName>';
          }
        }
      } else {
        // We have a function name but no details, add a placeholder
        doc += '\n///   Function details not available - see advanced_function_introspection.sql';
      }
      
      return doc;
    } else {
      // Fallback to just showing the action statement
      final cleanStatement = trigger.actionStatement.replaceAll('\n', ' ').trim();
      return '$basicInfo - $cleanStatement';
    }
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
  
  /// Generate best practices documentation
  Future<void> _generateBestPracticesDocumentation(String outputDir) async {
    // Create docs directory
    final docsDir = Directory(path.join(outputDir, 'docs'));
    if (!docsDir.existsSync()) {
      docsDir.createSync(recursive: true);
    }
    
    // Generate filter usage guide
    final filterUsagePath = path.join(docsDir.path, 'filter_usage_guide.dart');
    await File(filterUsagePath).writeAsString(BestPracticesTemplate.filterUsageGuide());
    _logger.info('Generated filter usage guide: $filterUsagePath');
    
    // Generate UI rebuilding guide
    final uiRebuildingPath = path.join(docsDir.path, 'ui_rebuilding_guide.dart');
    await File(uiRebuildingPath).writeAsString(BestPracticesTemplate.uiRebuildingGuide());
    _logger.info('Generated UI rebuilding guide: $uiRebuildingPath');
    
    // Generate user feedback guide
    final userFeedbackPath = path.join(docsDir.path, 'user_feedback_guide.dart');
    await File(userFeedbackPath).writeAsString(BestPracticesTemplate.userFeedbackGuide());
    _logger.info('Generated user feedback guide: $userFeedbackPath');
  }
}