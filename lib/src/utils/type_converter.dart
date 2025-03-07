// lib/src/utils/type_converter.dart
class TypeConverter {
  // Map PostgreSQL types to Dart types
  static String postgresTypeToDart(String pgType, {bool isNullable = false}) {
    final nullableSuffix = isNullable ? '?' : '';
    
    switch (pgType.toLowerCase()) {
      case 'integer':
      case 'int':
      case 'int2':
      case 'int4':
      case 'int8':
      case 'smallint':
      case 'bigint':
        return 'int$nullableSuffix';
      
      case 'numeric':
      case 'decimal':
      case 'real':
      case 'double precision':
      case 'float4':
      case 'float8':
        return 'double$nullableSuffix';
      
      case 'boolean':
      case 'bool':
        return 'bool$nullableSuffix';
      
      case 'timestamp':
      case 'timestamp without time zone':
      case 'timestamp with time zone':
      case 'date':
      case 'time':
      case 'time without time zone':
      case 'time with time zone':
        return 'DateTime$nullableSuffix';
      
      case 'uuid':
        return 'String$nullableSuffix'; // UUID is typically represented as String
      
      case 'jsonb':
      case 'json':
        return 'Map<String, dynamic>$nullableSuffix';
      
      case 'text[]':
      case 'varchar[]':
      case 'character varying[]':
      case 'char[]':
      case 'character[]':
        return 'List<String>$nullableSuffix';
      
      case 'int[]':
      case 'integer[]':
      case 'int2[]':
      case 'int4[]':
      case 'int8[]':
      case 'smallint[]':
      case 'bigint[]':
        return 'List<int>$nullableSuffix';
      
      case 'bytea':
        return 'Uint8List$nullableSuffix';
      
      default:
        // For any other type including text, varchar, etc.
        return 'String$nullableSuffix';
    }
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
      return defaultValue;
    }
    
    // Fall back to string representation
    return "'$defaultValue'";
  }
}