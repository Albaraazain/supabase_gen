// lib/src/utils/type_converter.dart
class TypeConverter {
  // Map PostgreSQL types to Dart types
  static String postgresTypeToDart(String pgType, {bool isNullable = false}) {
    final nullableSuffix = isNullable ? '?' : '';
    final lowerType = pgType.toLowerCase();
    
    // Integer types
    if (lowerType == 'integer' || 
        lowerType == 'int' || 
        lowerType == 'int4' || 
        lowerType == 'smallint' || 
        lowerType == 'int2' ||
        lowerType == 'serial') {
      return 'int$nullableSuffix';
    }
    
    // Big integer types
    if (lowerType == 'bigint' || 
        lowerType == 'int8' ||
        lowerType == 'bigserial') {
      // Consider BigInt for bigint if needed
      return 'int$nullableSuffix';
    }
    
    // Floating-point and decimal types
    if (lowerType == 'numeric' || 
        lowerType == 'decimal' || 
        lowerType == 'real' || 
        lowerType == 'double precision' || 
        lowerType == 'float4' || 
        lowerType == 'float8' ||
        lowerType == 'float') {
      return 'double$nullableSuffix';
    }
    
    // Boolean type
    if (lowerType == 'boolean' || lowerType == 'bool') {
      return 'bool$nullableSuffix';
    }
    
    // Date/Time types
    if (lowerType == 'timestamp' || 
        lowerType == 'timestamp without time zone' || 
        lowerType == 'timestamp with time zone' || 
        lowerType == 'date' || 
        lowerType == 'time' || 
        lowerType == 'time without time zone' || 
        lowerType == 'time with time zone') {
      return 'DateTime$nullableSuffix';
    }
    
    // UUID type
    if (lowerType == 'uuid') {
      return 'String$nullableSuffix'; // UUID is typically represented as String
    }
    
    // JSON types
    if (lowerType == 'jsonb' || lowerType == 'json') {
      return 'Map<String, dynamic>$nullableSuffix';
    }
    
    // Array types
    if (lowerType.startsWith('_') || lowerType.endsWith('[]')) {
      String baseType = lowerType.startsWith('_') ? lowerType.substring(1) : lowerType.substring(0, lowerType.length - 2);
      
      if (baseType == 'text' || 
          baseType == 'varchar' || 
          baseType == 'character varying' || 
          baseType == 'char' || 
          baseType == 'character') {
        return 'List<String>$nullableSuffix';
      }
      
      if (baseType == 'int' || 
          baseType == 'integer' || 
          baseType == 'int2' || 
          baseType == 'int4' || 
          baseType == 'int8' || 
          baseType == 'smallint' || 
          baseType == 'bigint') {
        return 'List<int>$nullableSuffix';
      }
      
      if (baseType == 'numeric' || 
          baseType == 'decimal' || 
          baseType == 'real' || 
          baseType == 'double precision' || 
          baseType == 'float4' || 
          baseType == 'float8') {
        return 'List<double>$nullableSuffix';
      }
      
      // Default for other array types
      return 'List<dynamic>$nullableSuffix';
    }
    
    // Binary data
    if (lowerType == 'bytea') {
      return 'Uint8List$nullableSuffix';
    }
    
    // Default for other types (text, varchar, etc.)
    return 'String$nullableSuffix';
  }

  // Convert PostgreSQL default value to Dart literal
  static String? postgresDefaultToDartLiteral(
    String? defaultValue, 
    String pgType
  ) {
    if (defaultValue == null) return null;
    
    // Handle special PostgreSQL defaults
    if (defaultValue.contains('nextval(')) {
      return null; // Skip sequence defaults
    }
    
    if (defaultValue.toLowerCase() == 'now()' || 
        defaultValue.toLowerCase() == 'current_timestamp') {
      return 'DateTime.now()';
    }

    if (defaultValue.toLowerCase() == 'true') {
      return 'true';
    }
    
    if (defaultValue.toLowerCase() == 'false') {
      return 'false';
    }
    
    // Extract quoted string literals
    if (defaultValue.startsWith("'") && defaultValue.endsWith("'")) {
      return defaultValue;
    }
    
    // Numeric values
    if (RegExp(r'^-?\d+(\.\d+)?$').hasMatch(defaultValue)) {
      // For floating point types, ensure there's a decimal point for Dart
      if (isNumericType(pgType) && !defaultValue.contains('.') && !isIntegerType(pgType)) {
        return '$defaultValue.0';
      }
      return defaultValue;
    }
    
    // Fall back to string representation
    return "'$defaultValue'";
  }

  // Utility method to safely convert values from JSON to double
  // This handles the case where numeric PostgreSQL fields might come back as int or double
  static String generateSafeNumericConversion(String columnName, String propertyName, bool isNullable) {
    if (isNullable) {
      return 'json[\'$columnName\'] != null ? _toDouble(json[\'$columnName\']) : null';
    } else {
      return '_toDouble(json[\'$columnName\']) ?? 0.0';
    }
  }

  // Check if a PostgreSQL type should be treated as a numeric type that needs safe conversion
  static bool isNumericType(String pgType) {
    final lowerType = pgType.toLowerCase();
    return lowerType == 'numeric' || 
           lowerType == 'decimal' || 
           lowerType == 'real' || 
           lowerType == 'double precision' || 
           lowerType == 'float4' || 
           lowerType == 'float8' ||
           lowerType == 'float';
  }
  
  // Check if a PostgreSQL type is an integer type
  static bool isIntegerType(String pgType) {
    final lowerType = pgType.toLowerCase();
    return lowerType == 'integer' || 
           lowerType == 'int' || 
           lowerType == 'int4' || 
           lowerType == 'smallint' || 
           lowerType == 'int2' ||
           lowerType == 'bigint' || 
           lowerType == 'int8' ||
           lowerType == 'serial' ||
           lowerType == 'bigserial';
  }
  
  // Generate appropriate JSON conversion code based on PostgreSQL type
  static String generateJsonConversion(String columnName, String propertyName, String pgType, bool isNullable) {
    final lowerType = pgType.toLowerCase();
    
    // Handle DateTime types
    if (lowerType.contains('timestamp') || lowerType.contains('date') || lowerType.contains('time')) {
      if (isNullable) {
        return 'json[\'$columnName\'] != null ? DateTime.parse(json[\'$columnName\'].toString()) : null';
      } else {
        return 'json[\'$columnName\'] != null ? DateTime.parse(json[\'$columnName\'].toString()) : DateTime.now()';
      }
    }
    
    // Handle JSON types
    if (lowerType == 'jsonb' || lowerType == 'json') {
      if (isNullable) {
        return 'json[\'$columnName\'] != null ? '
               '(json[\'$columnName\'] is String ? '
               'jsonDecode(json[\'$columnName\']) : '
               'json[\'$columnName\']) : null';
      } else {
        return 'json[\'$columnName\'] != null ? '
               '(json[\'$columnName\'] is String ? '
               'jsonDecode(json[\'$columnName\']) : '
               'json[\'$columnName\']) : {}';
      }
    }
    
    // Handle List/Array types
    if (lowerType.startsWith('_') || lowerType.endsWith('[]')) {
      String dartType = postgresTypeToDart(lowerType);
      String innerType = dartType.substring(5, dartType.length - (isNullable ? 2 : 1)); // Extract inner type from List<Type>
      
      if (isNullable) {
        return 'json[\'$columnName\'] != null ? (json[\'$columnName\'] as List).cast<$innerType>() : null';
      } else {
        return 'json[\'$columnName\'] != null ? (json[\'$columnName\'] as List).cast<$innerType>() : []';
      }
    }
    
    // Handle binary data
    if (lowerType == 'bytea') {
      if (isNullable) {
        return 'json[\'$columnName\'] != null ? Uint8List.fromList(List<int>.from(json[\'$columnName\'])) : null';
      } else {
        return 'json[\'$columnName\'] != null ? Uint8List.fromList(List<int>.from(json[\'$columnName\'])) : Uint8List(0)';
      }
    }
    
    // Handle numeric types
    if (isNumericType(lowerType)) {
      return generateSafeNumericConversion(columnName, propertyName, isNullable);
    }
    
    // Handle integer types
    if (isIntegerType(lowerType)) {
      // For bigint, consider special handling if values might exceed int range
      if (lowerType == 'bigint' || lowerType == 'int8' || lowerType == 'bigserial') {
        if (isNullable) {
          return 'json[\'$columnName\'] != null ? (json[\'$columnName\'] is String ? '
                 'int.parse(json[\'$columnName\']) : json[\'$columnName\'] as int) : null';
        } else {
          return '(json[\'$columnName\'] is String ? '
                 'int.parse(json[\'$columnName\']) : json[\'$columnName\'] as int) ?? 0';
        }
      }
      
      // Regular int handling
      if (isNullable) {
        return 'json[\'$columnName\']';
      } else {
        return 'json[\'$columnName\'] ?? 0';
      }
    }
    
    // Default case for strings and other types
    if (isNullable) {
      return 'json[\'$columnName\']';
    } else {
      String defaultValue;
      String dartType = postgresTypeToDart(pgType);
      if (dartType == 'String') {
        defaultValue = "''";
      } else if (dartType == 'bool') {
        defaultValue = 'false';
      } else {
        defaultValue = 'null!'; // Should never reach here for non-nullable types
      }
      return 'json[\'$columnName\'] ?? $defaultValue';
    }
  }
}