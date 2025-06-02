import 'dart:io';
import 'package:path/path.dart' as path;

import '../config/config_model.dart';
import '../schema/rpc_info.dart';
import '../templates/rpc_template.dart';
import '../utils/logger.dart';
import '../utils/string_utils.dart';

/// Generator for RPC services and related classes
class RpcServiceGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('RpcServiceGenerator');

  RpcServiceGenerator(this.config);

  /// Generate RPC services, models, and related classes
  Future<void> generateRpcServices(List<RpcFunctionInfo> functions) async {
    if (!config.generateRpcServices) {
      _logger.info('RPC service generation is disabled in configuration');
      return;
    }

    _logger.info('Generating RPC services for ${functions.length} functions...');

    // Filter functions based on configuration
    final filteredFunctions = _filterFunctions(functions);
    _logger.info('After filtering: ${filteredFunctions.length} functions will be processed');

    if (filteredFunctions.isEmpty) {
      _logger.warning('No RPC functions to generate after filtering');
      return;
    }

    // Create RPC directory structure
    await _createDirectoryStructure();

    // Generate base RPC service
    await _generateBaseRpcService();

    // Group functions by category
    final groupedFunctions = _groupFunctionsByCategory(filteredFunctions);
    _logger.info('Functions grouped into ${groupedFunctions.length} categories');

    // Generate service classes for each category
    final generatedServiceFiles = <String>[];
    for (final entry in groupedFunctions.entries) {
      final category = entry.key;
      final categoryFunctions = entry.value;
      
      final serviceFile = await _generateCategoryService(category, categoryFunctions);
      if (serviceFile != null) {
        generatedServiceFiles.add(serviceFile);
      }
    }

    // Generate RPC models if enabled
    final generatedModelFiles = <String>[];
    if (config.generateRpcModels) {
      for (final function in filteredFunctions) {
        final modelFiles = await _generateRpcModelsForFunction(function);
        generatedModelFiles.addAll(modelFiles);
      }
    }

    // Generate barrel files
    await _generateBarrelFiles(generatedServiceFiles, generatedModelFiles);

    // Generate RPC providers if enabled
    if (config.generateRpcProviders) {
      await _generateRpcProviders(groupedFunctions);
    }

    // Generate documentation if enabled
    if (config.generateRpcDocumentation) {
      await _generateRpcDocumentation(groupedFunctions, filteredFunctions);
    }

    _logger.success('RPC service generation completed successfully');
    _logger.info('Generated ${generatedServiceFiles.length} service classes and ${generatedModelFiles.length} model classes');
  }

  /// Filter functions based on configuration include/exclude patterns
  List<RpcFunctionInfo> _filterFunctions(List<RpcFunctionInfo> functions) {
    return functions.where((function) {
      // Check exclusion patterns first
      if (config.shouldExcludeRpcFunction(function.name)) {
        _logger.fine('Excluding function: ${function.name}');
        return false;
      }

      // If include patterns are specified, function must match one
      if (config.includeRpcFunctions.isNotEmpty) {
        bool included = false;
        for (final pattern in config.includeRpcFunctions) {
          if (_matchesPattern(function.name, pattern)) {
            included = true;
            break;
          }
        }
        if (!included) {
          _logger.fine('Function not in include list: ${function.name}');
          return false;
        }
      }

      return true;
    }).toList();
  }

  /// Group functions by category based on configuration
  Map<String, List<RpcFunctionInfo>> _groupFunctionsByCategory(List<RpcFunctionInfo> functions) {
    final Map<String, List<RpcFunctionInfo>> grouped = {};

    for (final function in functions) {
      String category;
      
      if (config.rpcGroupingStrategy == 'schema') {
        category = function.schema;
      } else if (config.rpcGroupingStrategy == 'alphabetical') {
        category = function.name.substring(0, 1).toLowerCase();
      } else {
        // Default: category-based grouping
        category = config.getRpcFunctionCategory(function.name);
      }

      if (!grouped.containsKey(category)) {
        grouped[category] = [];
      }
      grouped[category]!.add(function);
    }

    // Sort functions within each category
    for (final categoryFunctions in grouped.values) {
      categoryFunctions.sort((a, b) => a.name.compareTo(b.name));
    }

    return grouped;
  }

  /// Create the directory structure for RPC services
  Future<void> _createDirectoryStructure() async {
    final directories = [
      'rpc',
      'rpc/services',
      if (config.generateRpcModels) 'rpc/models',
      if (config.generateRpcProviders) 'rpc/providers',
    ];

    for (final dir in directories) {
      final directory = Directory(path.join(config.outputDirectory, dir));
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        _logger.fine('Created directory: ${directory.path}');
      }
    }
  }

  /// Generate the base RPC service class
  Future<void> _generateBaseRpcService() async {
    final filePath = path.join(config.outputDirectory, 'rpc', 'base_rpc_service.dart');
    final content = RpcTemplate.baseRpcService();
    
    await File(filePath).writeAsString(content);
    _logger.info('Generated base RPC service: $filePath');
  }

  /// Generate a service class for a specific category
  Future<String?> _generateCategoryService(String category, List<RpcFunctionInfo> functions) async {
    try {
      final className = config.getRpcServiceClassName(category);
      final fileName = '${category}_rpc_service.dart';
      final filePath = path.join(config.outputDirectory, 'rpc', 'services', fileName);

      // Generate comprehensive service class with type-safe methods
      final content = _generateDetailedServiceClass(
        category: category,
        className: className,
        functions: functions,
      );

      await File(filePath).writeAsString(content);
      _logger.info('Generated RPC service for $category: $filePath');
      
      return fileName;
    } catch (e) {
      _logger.severe('Failed to generate service for category $category: $e');
      return null;
    }
  }

  /// Generate a detailed service class with type-safe methods
  String _generateDetailedServiceClass({
    required String category,
    required String className,
    required List<RpcFunctionInfo> functions,
  }) {
    final buffer = StringBuffer();

    // Import statements
    buffer.writeln("import 'package:supabase_flutter/supabase_flutter.dart';");
    buffer.writeln("import '../base_rpc_service.dart';");
    buffer.writeln("import '../models/models.dart';");
    buffer.writeln("import '../../schema/rpc_info.dart';");
    buffer.writeln();

    // Class documentation
    buffer.writeln('/// RPC service for $category-related functions');
    buffer.writeln('/// ');
    buffer.writeln('/// This service provides type-safe access to the following RPC functions:');
    for (final function in functions) {
      buffer.writeln('/// - ${function.name}: ${function.description ?? 'No description'}');
    }
    buffer.writeln('class $className extends BaseRpcService {');
    
    // Constructor
    buffer.writeln('  $className(');
    buffer.writeln('    SupabaseClient client, {');
    buffer.writeln('    bool enableLogging = ${config.enableRpcLogging},');
    buffer.writeln('    bool enableCaching = ${config.enableRpcCaching},');
    buffer.writeln('  }) : super(');
    buffer.writeln('         client,');
    buffer.writeln("         '$category',");
    buffer.writeln('         enableLogging: enableLogging,');
    buffer.writeln('         enableCaching: enableCaching,');
    buffer.writeln('       );');
    buffer.writeln();

    // Generate methods for each function
    for (final function in functions) {
      buffer.writeln(_generateFunctionMethod(function));
      buffer.writeln();
    }

    buffer.writeln('}');

    return buffer.toString();
  }

  /// Generate a type-safe method for a specific RPC function
  String _generateFunctionMethod(RpcFunctionInfo function) {
    final buffer = StringBuffer();
    final methodName = function.getDartMethodName();
    final returnType = _getDartReturnType(function);
    
    // Method documentation
    buffer.writeln('  /// ${function.description ?? 'Call the ${function.name} RPC function'}');
    buffer.writeln('  /// ');
    buffer.writeln('  /// Function signature: ${function.getSignature()}');
    if (function.inputParameters.isNotEmpty) {
      buffer.writeln('  /// Parameters:');
      for (final param in function.inputParameters) {
        final required = param.isRequired ? '(required)' : '(optional)';
        buffer.writeln('  /// - ${param.name}: ${param.type} $required');
      }
    }
    buffer.writeln('  /// Returns: ${function.returnType.type}');
    
    // Method signature
    buffer.write('  Future<$returnType> $methodName(');
    
    // Generate parameters
    final parameterLines = <String>[];
    
    // Required parameters first
    final requiredParams = function.inputParameters.where((p) => p.isRequired).toList();
    for (final param in requiredParams) {
      final dartType = param.getDartType();
      parameterLines.add('    required $dartType ${StringUtils.toCamelCase(param.name)}');
    }
    
    // Optional parameters
    final optionalParams = function.inputParameters.where((p) => !p.isRequired).toList();
    for (final param in optionalParams) {
      final dartType = param.getDartType();
      parameterLines.add('    $dartType? ${StringUtils.toCamelCase(param.name)}');
    }
    
    // Add timeout parameter
    parameterLines.add('    Duration? timeout');
    
    if (parameterLines.isNotEmpty) {
      buffer.writeln('{');
      buffer.writeln(parameterLines.join(',\n'));
      buffer.writeln('  }');
    }
    buffer.writeln(') async {');

    // Method body
    buffer.writeln('    // Validate parameters');
    buffer.writeln('    final parameters = <String, dynamic>{};');
    
    // Add parameter validation and mapping
    for (final param in function.inputParameters) {
      final camelName = StringUtils.toCamelCase(param.name);
      if (param.isRequired) {
        buffer.writeln("    parameters['${param.name}'] = $camelName;");
      } else {
        buffer.writeln('    if ($camelName != null) {');
        buffer.writeln("      parameters['${param.name}'] = $camelName;");
        buffer.writeln('    }');
      }
    }
    
    buffer.writeln();
    buffer.writeln('    // Call the RPC function');
    
    if (function.returnsVoid) {
      buffer.writeln('    await callFunctionVoid(');
      buffer.writeln("      '${function.name}',");
      buffer.writeln('      parameters: parameters,');
      buffer.writeln('      timeout: timeout,');
      buffer.writeln('    );');
    } else if (function.returnsMultiple) {
      if (function.returnType.isTable) {
        // Table return - generate specific model
        final modelClass = config.getRpcModelClassName(function.name);
        buffer.writeln('    return await callFunctionList<$modelClass>(');
        buffer.writeln("      '${function.name}',");
        buffer.writeln('      parameters: parameters,');
        buffer.writeln('      fromJson: (json) => $modelClass.fromJson(json),');
        buffer.writeln('      timeout: timeout,');
        buffer.writeln('    );');
      } else {
        // Array return
        final baseType = _getBaseReturnType(function.returnType.type);
        buffer.writeln('    return await callFunctionList<$baseType>(');
        buffer.writeln("      '${function.name}',");
        buffer.writeln('      parameters: parameters,');
        buffer.writeln('      fromJson: (json) => json as $baseType,');
        buffer.writeln('      timeout: timeout,');
        buffer.writeln('    );');
      }
    } else {
      // Single value return
      if (_isComplexReturnType(function.returnType.type)) {
        final modelClass = config.getRpcModelClassName(function.name);
        buffer.writeln('    return await callFunction<$modelClass>(');
        buffer.writeln("      '${function.name}',");
        buffer.writeln('      parameters: parameters,');
        buffer.writeln('      fromJson: (json) => $modelClass.fromJson(json),');
        buffer.writeln('      timeout: timeout,');
        buffer.writeln('    );');
      } else {
        buffer.writeln('    return await callFunction<$returnType>(');
        buffer.writeln("      '${function.name}',");
        buffer.writeln('      parameters: parameters,');
        buffer.writeln('      fromJson: (json) => json as $returnType,');
        buffer.writeln('      timeout: timeout,');
        buffer.writeln('    );');
      }
    }
    
    buffer.writeln('  }');

    return buffer.toString();
  }

  /// Get the Dart return type for a function
  String _getDartReturnType(RpcFunctionInfo function) {
    if (function.returnsVoid) {
      return 'void';
    }
    
    if (function.returnsMultiple) {
      if (function.returnType.isTable) {
        final modelClass = config.getRpcModelClassName(function.name);
        return 'List<$modelClass>';
      } else {
        final baseType = _getBaseReturnType(function.returnType.type);
        return 'List<$baseType>';
      }
    }
    
    if (_isComplexReturnType(function.returnType.type)) {
      return config.getRpcModelClassName(function.name);
    }
    
    return function.returnType.getDartType();
  }

  /// Get the base type for a return type (removing SETOF prefix)
  String _getBaseReturnType(String returnType) {
    if (returnType.toUpperCase().startsWith('SETOF ')) {
      return returnType.substring(6).trim();
    }
    return returnType;
  }

  /// Check if a return type is complex and needs a model class
  bool _isComplexReturnType(String returnType) {
    final lowerType = returnType.toLowerCase();
    return lowerType == 'table' || 
           lowerType == 'record' || 
           lowerType.contains('composite') ||
           lowerType.startsWith('custom_');
  }

  /// Generate RPC model classes for a function's return type
  Future<List<String>> _generateRpcModelsForFunction(RpcFunctionInfo function) async {
    final generatedFiles = <String>[];
    
    if (function.returnsVoid || !_shouldGenerateModel(function)) {
      return generatedFiles;
    }

    try {
      final modelClass = config.getRpcModelClassName(function.name);
      final fileName = '${StringUtils.toFileName(modelClass)}.dart';
      final filePath = path.join(config.outputDirectory, 'rpc', 'models', fileName);
      
      // Generate model based on return type
      final content = _generateModelForReturnType(function, modelClass);
      
      if (content != null) {
        await File(filePath).writeAsString(content);
        _logger.info('Generated RPC model: $filePath');
        generatedFiles.add(fileName);
      }
    } catch (e) {
      _logger.severe('Failed to generate model for function ${function.name}: $e');
    }

    return generatedFiles;
  }

  /// Check if a model should be generated for a function
  bool _shouldGenerateModel(RpcFunctionInfo function) {
    return function.returnType.isTable || 
           _isComplexReturnType(function.returnType.type);
  }

  /// Generate a model class for a function's return type
  String? _generateModelForReturnType(RpcFunctionInfo function, String className) {
    if (function.returnType.isTable && function.returnType.tableColumns != null) {
      // Generate from table columns
      final fields = <String, String>{};
      for (final column in function.returnType.tableColumns!) {
        fields[StringUtils.toCamelCase(column.name)] = column.getDartType();
      }
      
      return RpcTemplate.rpcModelClass(
        className: className,
        fields: fields,
        description: 'Result model for ${function.name} RPC function',
      );
    } else {
      // Generate a simple wrapper for the return value
      final fields = <String, String>{
        'value': function.returnType.getDartType(),
      };
      
      return RpcTemplate.rpcModelClass(
        className: className,
        fields: fields,
        description: 'Result model for ${function.name} RPC function',
      );
    }
  }

  /// Generate barrel files for services and models
  Future<void> _generateBarrelFiles(List<String> serviceFiles, List<String> modelFiles) async {
    // Services barrel file
    final servicesBarrelPath = path.join(config.outputDirectory, 'rpc', 'services', 'services.dart');
    final servicesBarrelContent = RpcTemplate.rpcServicesBarrel(serviceFiles);
    await File(servicesBarrelPath).writeAsString(servicesBarrelContent);
    _logger.info('Generated services barrel file: $servicesBarrelPath');

    // Models barrel file
    if (modelFiles.isNotEmpty) {
      final modelsBarrelPath = path.join(config.outputDirectory, 'rpc', 'models', 'models.dart');
      final modelsBarrelContent = RpcTemplate.rpcModelsBarrel(modelFiles);
      await File(modelsBarrelPath).writeAsString(modelsBarrelContent);
      _logger.info('Generated models barrel file: $modelsBarrelPath');
    }

    // Main RPC barrel file
    final mainBarrelPath = path.join(config.outputDirectory, 'rpc', 'rpc.dart');
    final mainBarrelContent = '''// Generated barrel file for RPC functionality
// Do not modify by hand

export 'base_rpc_service.dart';
export 'services/services.dart';
${modelFiles.isNotEmpty ? "export 'models/models.dart';" : ""}
${config.generateRpcProviders ? "export 'providers/providers.dart';" : ""}
''';
    await File(mainBarrelPath).writeAsString(mainBarrelContent);
    _logger.info('Generated main RPC barrel file: $mainBarrelPath');
  }

  /// Generate RPC providers (placeholder for now)
  Future<void> _generateRpcProviders(Map<String, List<RpcFunctionInfo>> groupedFunctions) async {
    _logger.info('RPC provider generation is not yet implemented');
    // TODO: Implement RPC provider generation in a future task
  }

  /// Generate RPC documentation
  Future<void> _generateRpcDocumentation(
    Map<String, List<RpcFunctionInfo>> groupedFunctions,
    List<RpcFunctionInfo> allFunctions,
  ) async {
    final docsDir = Directory(path.join(config.outputDirectory, 'docs', 'rpc'));
    if (!docsDir.existsSync()) {
      docsDir.createSync(recursive: true);
    }

    // Generate overview documentation
    final overviewPath = path.join(docsDir.path, 'overview.md');
    final overviewContent = _generateRpcOverviewDocumentation(groupedFunctions, allFunctions);
    await File(overviewPath).writeAsString(overviewContent);
    
    _logger.info('Generated RPC documentation: $overviewPath');
  }

  /// Generate overview documentation for RPC functions
  String _generateRpcOverviewDocumentation(
    Map<String, List<RpcFunctionInfo>> groupedFunctions,
    List<RpcFunctionInfo> allFunctions,
  ) {
    final buffer = StringBuffer();
    
    buffer.writeln('# RPC Functions Documentation');
    buffer.writeln();
    buffer.writeln('Generated documentation for ${allFunctions.length} RPC functions.');
    buffer.writeln();
    
    buffer.writeln('## Categories');
    buffer.writeln();
    
    for (final entry in groupedFunctions.entries) {
      final category = entry.key;
      final functions = entry.value;
      
      buffer.writeln('### ${category.substring(0, 1).toUpperCase()}${category.substring(1)} (${functions.length} functions)');
      buffer.writeln();
      
      for (final function in functions) {
        buffer.writeln('#### `${function.name}`');
        buffer.writeln();
        if (function.description != null) {
          buffer.writeln(function.description!);
          buffer.writeln();
        }
        buffer.writeln('**Signature:** `${function.getSignature()}`');
        buffer.writeln();
        
        if (function.inputParameters.isNotEmpty) {
          buffer.writeln('**Parameters:**');
          for (final param in function.inputParameters) {
            final required = param.isRequired ? '(required)' : '(optional)';
            buffer.writeln('- `${param.name}`: ${param.type} $required');
          }
          buffer.writeln();
        }
        
        buffer.writeln('**Returns:** ${function.returnType.type}');
        buffer.writeln();
      }
    }
    
    return buffer.toString();
  }

  /// Helper method to match patterns with wildcards
  bool _matchesPattern(String text, String pattern) {
    if (pattern == '*') return true;
    if (pattern.contains('*')) {
      final regex = RegExp('^${pattern.replaceAll('*', '.*')}\$');
      return regex.hasMatch(text);
    }
    return text == pattern;
  }
}