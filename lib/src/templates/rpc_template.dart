// Templates for generating RPC services and related classes

/// Templates for generating RPC services and related utilities
class RpcTemplate {
  /// Generate the base RPC service class that all RPC services extend
  static String baseRpcService() {
    return '''import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/app_logger.dart';

/// Exception thrown when RPC operations fail
class RpcException implements Exception {
  final String message;
  final String? functionName;
  final dynamic originalError;

  const RpcException(
    this.message, {
    this.functionName,
    this.originalError,
  });

  @override
  String toString() {
    final funcInfo = functionName != null ? ' in function \$functionName' : '';
    return 'RpcException: \$message\$funcInfo';
  }
}

/// Represents a parameter for RPC function validation
class RpcParameter {
  final String name;
  final String type;
  final bool isRequired;

  const RpcParameter({
    required this.name,
    required this.type,
    this.isRequired = true,
  });
}

/// Base class for all RPC services providing common functionality
abstract class BaseRpcService {
  final SupabaseClient client;
  final String category;
  final bool enableLogging;
  final bool enableCaching;
  
  // Cache for function results (if caching is enabled)
  final Map<String, dynamic> _cache = {};
  final Map<String, DateTime> _cacheTimestamps = {};
  final Duration _cacheExpiry = const Duration(minutes: 5);

  BaseRpcService(
    this.client, 
    this.category, {
    this.enableLogging = true,
    this.enableCaching = false,
  });

  /// Call an RPC function that returns a single value
  Future<T> callFunction<T>(
    String functionName, {
    required Map<String, dynamic> parameters,
    required T Function(dynamic) fromJson,
    Duration? timeout,
  }) async {
    if (enableLogging) {
      AppLogger.info(
        'Calling RPC function: \$functionName with parameters: \$parameters',
        loggerName: 'RpcService[\$category]',
      );
    }

    try {
      // Check cache first if enabled
      if (enableCaching) {
        final cacheKey = _generateCacheKey(functionName, parameters);
        final cachedResult = _getCachedResult<T>(cacheKey);
        if (cachedResult != null) {
          if (enableLogging) {
            AppLogger.debug(
              'Returning cached result for \$functionName',
              loggerName: 'RpcService[\$category]',
            );
          }
          return cachedResult;
        }
      }

      // Execute the RPC function
      final stopwatch = Stopwatch()..start();
      
      final response = await (timeout != null
          ? client.rpc(functionName, params: parameters).timeout(timeout)
          : client.rpc(functionName, params: parameters));
      
      stopwatch.stop();

      if (enableLogging) {
        AppLogger.debug(
          'RPC function \$functionName completed in \${stopwatch.elapsedMilliseconds}ms',
          loggerName: 'RpcService[\$category]',
        );
      }

      if (response == null) {
        throw RpcException(
          'Function \$functionName returned null',
          functionName: functionName,
        );
      }

      // Convert response to expected type
      final result = fromJson(response);

      // Cache the result if caching is enabled
      if (enableCaching) {
        final cacheKey = _generateCacheKey(functionName, parameters);
        _setCachedResult(cacheKey, result);
      }

      if (enableLogging) {
        AppLogger.success(
          'RPC function \$functionName executed successfully',
          loggerName: 'RpcService[\$category]',
        );
      }

      return result;
    } catch (e, stackTrace) {
      if (enableLogging) {
        AppLogger.error(
          'RPC function \$functionName failed: \$e',
          loggerName: 'RpcService[\$category]',
          error: e,
          stackTrace: stackTrace,
        );
      }

      if (e is RpcException) {
        rethrow;
      }

      // Wrap other exceptions in RpcException
      throw RpcException(
        'Failed to execute RPC function \$functionName: \$e',
        functionName: functionName,
        originalError: e,
      );
    }
  }

  /// Call an RPC function that returns a list of values
  Future<List<T>> callFunctionList<T>(
    String functionName, {
    required Map<String, dynamic> parameters,
    required T Function(Map<String, dynamic>) fromJson,
    Duration? timeout,
  }) async {
    if (enableLogging) {
      AppLogger.info(
        'Calling RPC function (list): \$functionName with parameters: \$parameters',
        loggerName: 'RpcService[\$category]',
      );
    }

    try {
      // Check cache first if enabled
      if (enableCaching) {
        final cacheKey = _generateCacheKey(functionName, parameters);
        final cachedResult = _getCachedResult<List<T>>(cacheKey);
        if (cachedResult != null) {
          if (enableLogging) {
            AppLogger.debug(
              'Returning cached list result for \$functionName',
              loggerName: 'RpcService[\$category]',
            );
          }
          return cachedResult;
        }
      }

      // Execute the RPC function
      final stopwatch = Stopwatch()..start();
      
      final response = await (timeout != null
          ? client.rpc(functionName, params: parameters).timeout(timeout)
          : client.rpc(functionName, params: parameters));
      
      stopwatch.stop();

      if (enableLogging) {
        AppLogger.debug(
          'RPC function (list) \$functionName completed in \${stopwatch.elapsedMilliseconds}ms',
          loggerName: 'RpcService[\$category]',
        );
      }

      if (response == null) {
        if (enableLogging) {
          AppLogger.warning(
            'RPC function \$functionName returned null, returning empty list',
            loggerName: 'RpcService[\$category]',
          );
        }
        return [];
      }

      List<dynamic> responseList;
      if (response is List) {
        responseList = response;
      } else {
        // Single item, wrap in list
        responseList = [response];
      }

      // Convert each item in the response
      final result = responseList
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList();

      // Cache the result if caching is enabled
      if (enableCaching) {
        final cacheKey = _generateCacheKey(functionName, parameters);
        _setCachedResult(cacheKey, result);
      }

      if (enableLogging) {
        AppLogger.success(
          'RPC function (list) \$functionName executed successfully, returned \${result.length} items',
          loggerName: 'RpcService[\$category]',
        );
      }

      return result;
    } catch (e, stackTrace) {
      if (enableLogging) {
        AppLogger.error(
          'RPC function (list) \$functionName failed: \$e',
          loggerName: 'RpcService[\$category]',
          error: e,
          stackTrace: stackTrace,
        );
      }

      if (e is RpcException) {
        rethrow;
      }

      // Wrap other exceptions in RpcException
      throw RpcException(
        'Failed to execute RPC function (list) \$functionName: \$e',
        functionName: functionName,
        originalError: e,
      );
    }
  }

  /// Call an RPC function that returns void
  Future<void> callFunctionVoid(
    String functionName, {
    required Map<String, dynamic> parameters,
    Duration? timeout,
  }) async {
    if (enableLogging) {
      AppLogger.info(
        'Calling RPC function (void): \$functionName with parameters: \$parameters',
        loggerName: 'RpcService[\$category]',
      );
    }

    try {
      // Execute the RPC function
      final stopwatch = Stopwatch()..start();
      
      await (timeout != null
          ? client.rpc(functionName, params: parameters).timeout(timeout)
          : client.rpc(functionName, params: parameters));
      
      stopwatch.stop();

      if (enableLogging) {
        AppLogger.success(
          'RPC function (void) \$functionName completed in \${stopwatch.elapsedMilliseconds}ms',
          loggerName: 'RpcService[\$category]',
        );
      }
    } catch (e, stackTrace) {
      if (enableLogging) {
        AppLogger.error(
          'RPC function (void) \$functionName failed: \$e',
          loggerName: 'RpcService[\$category]',
          error: e,
          stackTrace: stackTrace,
        );
      }

      if (e is RpcException) {
        rethrow;
      }

      // Wrap other exceptions in RpcException
      throw RpcException(
        'Failed to execute RPC function (void) \$functionName: \$e',
        functionName: functionName,
        originalError: e,
      );
    }
  }

  /// Generate a cache key for a function call
  String _generateCacheKey(String functionName, Map<String, dynamic> parameters) {
    final paramString = parameters.entries
        .map((e) => '\${e.key}=\${e.value}')
        .join('&');
    return '\$functionName?\$paramString';
  }

  /// Get a cached result if it exists and hasn't expired
  T? _getCachedResult<T>(String cacheKey) {
    if (!_cache.containsKey(cacheKey)) {
      return null;
    }

    final timestamp = _cacheTimestamps[cacheKey];
    if (timestamp == null || DateTime.now().difference(timestamp) > _cacheExpiry) {
      // Cache expired, remove it
      _cache.remove(cacheKey);
      _cacheTimestamps.remove(cacheKey);
      return null;
    }

    return _cache[cacheKey] as T?;
  }

  /// Set a cached result
  void _setCachedResult<T>(String cacheKey, T result) {
    _cache[cacheKey] = result;
    _cacheTimestamps[cacheKey] = DateTime.now();
  }

  /// Clear all cached results for this service
  void clearCache() {
    _cache.clear();
    _cacheTimestamps.clear();
    
    if (enableLogging) {
      AppLogger.info(
        'Cleared cache for RPC service',
        loggerName: 'RpcService[\$category]',
      );
    }
  }

  /// Get cache statistics
  Map<String, dynamic> getCacheStats() {
    final validEntries = _cache.keys.where((key) {
      final timestamp = _cacheTimestamps[key];
      return timestamp != null && 
             DateTime.now().difference(timestamp) <= _cacheExpiry;
    }).length;

    return {
      'total_entries': _cache.length,
      'valid_entries': validEntries,
      'expired_entries': _cache.length - validEntries,
      'cache_expiry_minutes': _cacheExpiry.inMinutes,
    };
  }

  /// Validate parameters before making RPC call
  void validateParameters(
    String functionName,
    Map<String, dynamic> parameters,
    List<RpcParameter> expectedParameters,
  ) {
    for (final expectedParam in expectedParameters) {
      if (expectedParam.isRequired && !parameters.containsKey(expectedParam.name)) {
        throw RpcException(
          'Missing required parameter: \${expectedParam.name}',
          functionName: functionName,
        );
      }

      if (parameters.containsKey(expectedParam.name)) {
        final value = parameters[expectedParam.name];
        if (!_isValidParameterType(value, expectedParam.type)) {
          throw RpcException(
            'Invalid parameter type for \${expectedParam.name}: expected \${expectedParam.type}, got \${value.runtimeType}',
            functionName: functionName,
          );
        }
      }
    }
  }

  /// Check if a parameter value matches the expected type
  bool _isValidParameterType(dynamic value, String expectedType) {
    if (value == null) return true; // Null is valid for optional parameters

    final lowerType = expectedType.toLowerCase();
    
    switch (lowerType) {
      case 'text':
      case 'varchar':
      case 'char':
      case 'uuid':
        return value is String;
      case 'integer':
      case 'int4':
      case 'smallint':
      case 'bigint':
        return value is int;
      case 'real':
      case 'float4':
      case 'double precision':
      case 'numeric':
      case 'decimal':
        return value is num;
      case 'boolean':
      case 'bool':
        return value is bool;
      case 'jsonb':
      case 'json':
        return value is Map || value is List;
      case 'timestamp with time zone':
      case 'timestamp':
      case 'date':
        return value is DateTime || value is String;
      default:
        // For unknown types, accept any value
        return true;
    }
  }
}

/// Exception thrown when RPC service operations fail
class RpcServiceException extends RpcException {
  final String serviceName;
  
  RpcServiceException(
    String message, {
    required this.serviceName,
    String? functionName,
    dynamic originalError,
  }) : super(message, functionName: functionName, originalError: originalError);

  @override
  String toString() {
    final funcInfo = functionName != null ? ' in function \$functionName' : '';
    return 'RpcServiceException[\$serviceName]: \$message\$funcInfo';
  }
}
''';
  }

  /// Generate an RPC service class for a specific category
  static String rpcServiceClass({
    required String categoryName,
    required String className,
    required List<String> functions,
    bool enableLogging = true,
    bool enableCaching = false,
  }) {
    final capitalizedCategory = categoryName.substring(0, 1).toUpperCase() + 
                               categoryName.substring(1);
    
    // Generate method stubs for each function
    final methodStubs = functions.map((functionName) {
      final methodName = _convertToMethodName(functionName);
      return '''
  /// Call the $functionName RPC function
  /// TODO: Replace parameters and return type based on actual function signature
  Future<dynamic> $methodName({
    required Map<String, dynamic> parameters,
  }) async {
    return await callFunction<dynamic>(
      '$functionName',
      parameters: parameters,
      fromJson: (json) => json,
    );
  }''';
    }).join('\n');

    return '''import 'package:supabase_flutter/supabase_flutter.dart';
import '../rpc/base_rpc_service.dart';

/// RPC service for $categoryName-related functions
class $className extends BaseRpcService {
  $className(
    SupabaseClient client, {
    bool enableLogging = $enableLogging,
    bool enableCaching = $enableCaching,
  }) : super(
         client, 
         '$categoryName',
         enableLogging: enableLogging,
         enableCaching: enableCaching,
       );
$methodStubs
}
''';
  }

  /// Convert snake_case function name to camelCase method name
  static String _convertToMethodName(String functionName) {
    final parts = functionName.split('_');
    if (parts.isEmpty) return functionName;
    
    final first = parts.first.toLowerCase();
    final rest = parts.skip(1).map((part) => 
      part.isNotEmpty ? part[0].toUpperCase() + part.substring(1).toLowerCase() : '');
    
    return first + rest.join('');
  }

  /// Generate a simple RPC model class for function return types
  static String rpcModelClass({
    required String className,
    required Map<String, String> fields,
    String? description,
  }) {
    // Generate field declarations
    final fieldDeclarations = fields.entries.map((entry) {
      final fieldName = entry.key;
      final fieldType = entry.value;
      return '  final $fieldType $fieldName;';
    }).join('\n');

    // Generate constructor parameters
    final constructorParams = fields.keys.map((fieldName) {
      return 'required this.$fieldName';
    }).join(', ');

    // Generate fromJson mapping
    final fromJsonMappings = fields.entries.map((entry) {
      final fieldName = entry.key;
      final fieldType = entry.value;
      return '      $fieldName: json[\'$fieldName\'] as $fieldType,';
    }).join('\n');

    // Generate toJson mapping
    final toJsonMappings = fields.keys.map((fieldName) {
      return '      \'$fieldName\': $fieldName,';
    }).join('\n');

    // Generate toString properties
    final toStringProps = fields.keys.map((fieldName) {
      return '$fieldName: \$$fieldName';
    }).join(', ');

    final docComment = description != null 
        ? '/// $description\n' 
        : '/// Generated model for RPC function result\n';

    return '''$docComment/// 
/// This class represents the result of an RPC function call.
class $className {
$fieldDeclarations

  const $className({
    $constructorParams,
  });

  /// Create from JSON response
  factory $className.fromJson(Map<String, dynamic> json) {
    return $className(
$fromJsonMappings
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
$toJsonMappings
    };
  }

  @override
  String toString() {
    return '$className($toStringProps)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is $className &&
${fields.keys.map((field) => '           other.$field == $field').join(' &&\n')};
  }

  @override
  int get hashCode {
    return ${fields.keys.map((field) => '$field.hashCode').join(' ^ ')};
  }
}
''';
  }

  /// Generate barrel file for RPC services
  static String rpcServicesBarrel(List<String> serviceFiles) {
    final exports = serviceFiles.map((file) => "export '$file';").join('\n');
    
    return '''// Generated barrel file for RPC services
// Do not modify by hand

export 'base_rpc_service.dart';
$exports
''';
  }

  /// Generate barrel file for RPC models
  static String rpcModelsBarrel(List<String> modelFiles) {
    final exports = modelFiles.map((file) => "export '$file';").join('\n');
    
    return '''// Generated barrel file for RPC models
// Do not modify by hand

$exports
''';
  }

  /// Generate barrel file for RPC services (no base_rpc_service.dart export)
  static String rpcServicesBarrelNoBase(List<String> serviceFiles) {
    final exports = serviceFiles.map((file) => "export '$file';").join('\n');
    
    return '''// Generated barrel file for RPC services
// Do not modify by hand

$exports
''';
  }
}