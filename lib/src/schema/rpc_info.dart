// lib/src/schema/rpc_info.dart

/// Information about a database RPC function parameter
class RpcParameter {
  final String name;
  final String type;
  final String mode; // 'IN', 'OUT', 'INOUT', 'VARIADIC'
  final bool isRequired;
  final dynamic defaultValue;
  final String? description;
  final int position;

  RpcParameter({
    required this.name,
    required this.type,
    this.mode = 'IN',
    this.isRequired = true,
    this.defaultValue,
    this.description,
    required this.position,
  });

  /// Whether this parameter is an input parameter
  bool get isInput => mode == 'IN' || mode == 'INOUT';

  /// Whether this parameter is an output parameter
  bool get isOutput => mode == 'OUT' || mode == 'INOUT';

  /// Whether this parameter is variadic (variable number of arguments)
  bool get isVariadic => mode == 'VARIADIC';

  /// Get the Dart type equivalent for this parameter
  String getDartType() {
    final lowerType = type.toLowerCase();
    
    // Handle common PostgreSQL types
    switch (lowerType) {
      case 'text':
      case 'varchar':
      case 'char':
      case 'character varying':
      case 'uuid':
        return 'String';
      case 'integer':
      case 'int4':
      case 'smallint':
      case 'int2':
      case 'bigint':
      case 'int8':
        return 'int';
      case 'real':
      case 'float4':
      case 'double precision':
      case 'float8':
      case 'numeric':
      case 'decimal':
        return 'double';
      case 'boolean':
      case 'bool':
        return 'bool';
      case 'jsonb':
      case 'json':
        return 'Map<String, dynamic>';
      case 'timestamp with time zone':
      case 'timestamp without time zone':
      case 'timestamptz':
      case 'timestamp':
      case 'date':
        return 'DateTime';
      case 'time':
        return 'Duration';
      default:
        // Handle array types
        if (lowerType.endsWith('[]')) {
          final baseType = lowerType.substring(0, lowerType.length - 2);
          return 'List<${_getBaseTypeDart(baseType)}>';
        }
        return 'dynamic';
    }
  }

  String _getBaseTypeDart(String type) {
    switch (type) {
      case 'text':
      case 'varchar':
        return 'String';
      case 'integer':
        return 'int';
      case 'real':
      case 'numeric':
        return 'double';
      case 'boolean':
        return 'bool';
      default:
        return 'dynamic';
    }
  }

  @override
  String toString() => 
    'Parameter $name ($type, mode: $mode, required: $isRequired, position: $position)';
}

/// Information about an RPC function's return type
class RpcReturnType {
  final String type;
  final bool isTable; // Returns TABLE vs single value
  final List<RpcParameter>? tableColumns; // If returns table
  final bool isArray; // Returns array of values
  final bool isVoid; // Returns void
  final String? description;

  RpcReturnType({
    required this.type,
    this.isTable = false,
    this.tableColumns,
    this.isArray = false,
    this.isVoid = false,
    this.description,
  });

  /// Get the Dart type equivalent for this return type
  String getDartType() {
    if (isVoid) {
      return 'void';
    }

    if (isTable && tableColumns != null && tableColumns!.isNotEmpty) {
      // For table returns, we'll generate a custom model class
      return 'Map<String, dynamic>'; // Will be replaced with actual model name
    }

    final lowerType = type.toLowerCase();
    
    // Handle array returns
    if (isArray || lowerType.endsWith('[]')) {
      final baseType = isArray ? type : lowerType.substring(0, lowerType.length - 2);
      return 'List<${_getBaseTypeDart(baseType)}>';
    }

    return _getBaseTypeDart(type);
  }

  String _getBaseTypeDart(String type) {
    final lowerType = type.toLowerCase();
    
    switch (lowerType) {
      case 'text':
      case 'varchar':
      case 'char':
      case 'character varying':
      case 'uuid':
        return 'String';
      case 'integer':
      case 'int4':
      case 'smallint':
      case 'int2':
      case 'bigint':
      case 'int8':
        return 'int';
      case 'real':
      case 'float4':
      case 'double precision':
      case 'float8':
      case 'numeric':
      case 'decimal':
        return 'double';
      case 'boolean':
      case 'bool':
        return 'bool';
      case 'jsonb':
      case 'json':
        return 'Map<String, dynamic>';
      case 'timestamp with time zone':
      case 'timestamp without time zone':
      case 'timestamptz':
      case 'timestamp':
      case 'date':
        return 'DateTime';
      case 'time':
        return 'Duration';
      default:
        return 'dynamic';
    }
  }

  @override
  String toString() => 
    'ReturnType $type (table: $isTable, array: $isArray, void: $isVoid)';
}

/// Information about a database RPC function
class RpcFunctionInfo {
  final String name;
  final String schema;
  final List<RpcParameter> parameters;
  final RpcReturnType returnType;
  final String? description;
  final bool isSecurityDefiner;
  final String language;
  final String? category; // For grouping: 'auth', 'analytics', 'business', etc.
  final String? functionBody;
  final bool isStrict; // Function behavior with NULL inputs
  final String? cost; // Execution cost estimate
  final String? rows; // Estimated rows returned for set-returning functions
  final bool isVolatile; // VOLATILE, STABLE, or IMMUTABLE
  final String volatility; // Volatility category

  RpcFunctionInfo({
    required this.name,
    this.schema = 'public',
    required this.parameters,
    required this.returnType,
    this.description,
    this.isSecurityDefiner = false,
    required this.language,
    this.category,
    this.functionBody,
    this.isStrict = false,
    this.cost,
    this.rows,
    this.isVolatile = true,
    this.volatility = 'VOLATILE',
  });

  /// Get input parameters only
  List<RpcParameter> get inputParameters => 
    parameters.where((p) => p.isInput).toList();

  /// Get output parameters only
  List<RpcParameter> get outputParameters => 
    parameters.where((p) => p.isOutput).toList();

  /// Whether this function has any input parameters
  bool get hasInputParameters => inputParameters.isNotEmpty;

  /// Whether this function has any output parameters
  bool get hasOutputParameters => outputParameters.isNotEmpty;

  /// Whether this function returns a table
  bool get returnsTable => returnType.isTable;

  /// Whether this function returns void
  bool get returnsVoid => returnType.isVoid;

  /// Whether this function returns multiple values (array or table)
  bool get returnsMultiple => returnType.isArray || returnType.isTable;

  /// Get the function signature for documentation
  String getSignature() {
    final paramStrings = parameters.map((p) => '${p.name} ${p.type}').join(', ');
    return '$name($paramStrings) RETURNS ${returnType.type}';
  }

  /// Get a safe Dart method name for this function
  String getDartMethodName() {
    // Convert snake_case to camelCase
    final parts = name.split('_');
    if (parts.isEmpty) return name;
    
    final first = parts.first.toLowerCase();
    final rest = parts.skip(1).map((part) => 
      part.isNotEmpty ? part[0].toUpperCase() + part.substring(1).toLowerCase() : '');
    
    return first + rest.join('');
  }

  /// Get the category for this function (used for grouping)
  String getEffectiveCategory() {
    if (category != null && category!.isNotEmpty) {
      return category!;
    }

    // Auto-detect category from function name patterns
    final lowerName = name.toLowerCase();
    
    if (lowerName.contains('auth') || lowerName.contains('login') || 
        lowerName.contains('register') || lowerName.contains('user') ||
        lowerName.contains('session') || lowerName.contains('token')) {
      return 'auth';
    }
    
    if (lowerName.contains('stats') || lowerName.contains('analytics') || 
        lowerName.contains('report') || lowerName.contains('metrics') ||
        lowerName.contains('calculate') || lowerName.contains('aggregate')) {
      return 'analytics';
    }
    
    if (lowerName.contains('payment') || lowerName.contains('order') || 
        lowerName.contains('invoice') || lowerName.contains('billing') ||
        lowerName.contains('transaction')) {
      return 'business';
    }
    
    if (lowerName.contains('admin') || lowerName.contains('manage') || 
        lowerName.contains('system') || lowerName.contains('config')) {
      return 'admin';
    }
    
    if (lowerName.contains('search') || lowerName.contains('filter') || 
        lowerName.contains('find') || lowerName.contains('lookup')) {
      return 'search';
    }
    
    // Default category
    return 'general';
  }

  /// Whether this function should be excluded from generation
  bool shouldExclude(List<String> excludePatterns) {
    for (final pattern in excludePatterns) {
      if (pattern.contains('*')) {
        // Handle wildcard patterns
        final regex = RegExp('^${pattern.replaceAll('*', '.*')}\$');
        if (regex.hasMatch(name)) {
          return true;
        }
      } else if (name == pattern) {
        return true;
      }
    }
    return false;
  }

  /// Whether this function should be included in generation
  bool shouldInclude(List<String> includePatterns) {
    if (includePatterns.isEmpty) {
      return true; // Include all if no specific patterns
    }
    
    for (final pattern in includePatterns) {
      if (pattern.contains('*')) {
        // Handle wildcard patterns
        final regex = RegExp('^${pattern.replaceAll('*', '.*')}\$');
        if (regex.hasMatch(name)) {
          return true;
        }
      } else if (name == pattern) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() => 
    'RPC Function $schema.$name (${parameters.length} params, returns ${returnType.type}, category: ${getEffectiveCategory()})';
}

/// Exception thrown when RPC function operations fail
class RpcException implements Exception {
  final String message;
  final String? functionName;
  final dynamic originalError;

  RpcException(this.message, {this.functionName, this.originalError});

  @override
  String toString() {
    final funcInfo = functionName != null ? ' in function $functionName' : '';
    return 'RpcException: $message$funcInfo';
  }
}