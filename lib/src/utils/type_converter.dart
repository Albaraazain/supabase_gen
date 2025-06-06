// lib/src/utils/type_converter.dart
import 'dart:convert';
import 'package:supabase_gen/src/utils/string_utils.dart';

import '../schema/table_info.dart';

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

    // Geographic types
    if (lowerType == 'geography' ||
        lowerType == 'geometry' ||
        lowerType == 'point') {
      return 'Point$nullableSuffix'; // Use Point class for all geographic types
    }

    // Point type is already handled by geographic types above

    // Latitude/Longitude specific fields
    if (lowerType == 'latitude' ||
        lowerType == 'longitude' ||
        lowerType.contains('lat') ||
        lowerType.contains('lng') ||
        lowerType.contains('lon')) {
      return 'double$nullableSuffix';
    }

    // Array types
    if (lowerType.startsWith('_') || lowerType.endsWith('[]')) {
      String baseType =
          lowerType.startsWith('_')
              ? lowerType.substring(1)
              : lowerType.substring(0, lowerType.length - 2);

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
    String pgType,
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

    // Handle PostgreSQL type cast syntax (::type)
    if (defaultValue.contains('::')) {
      // Extract the value part before the :: cast operator
      final valuePart = defaultValue.split('::').first.trim();
      // Process the extracted value part recursively
      return postgresDefaultToDartLiteral(valuePart, pgType);
    }

    // Handle UUID generation functions
    if (defaultValue.contains('uuid_generate') ||
        defaultValue.contains('gen_random_uuid')) {
      if (pgType.toLowerCase() == 'uuid') {
        return "''"; // Empty string for UUID defaults
      }
    }

    // Extract quoted string literals - handle both single and double quotes
    if ((defaultValue.startsWith("'") && defaultValue.endsWith("'")) ||
        (defaultValue.startsWith('"') && defaultValue.endsWith('"'))) {
      // Remove the quotes and escape any inner quotes for Dart
      String content = defaultValue.substring(1, defaultValue.length - 1);
      return "'$content'"; // Consistently use single quotes for Dart
    }

    // Numeric values
    if (RegExp(r'^-?\d+(\.\d+)?$').hasMatch(defaultValue)) {
      // For floating point types, ensure there's a decimal point for Dart
      if (isNumericType(pgType) &&
          !defaultValue.contains('.') &&
          !isIntegerType(pgType)) {
        return '$defaultValue.0';
      }
      return defaultValue;
    }

    // JSON defaults
    if ((defaultValue.startsWith('{') && defaultValue.endsWith('}')) ||
        (defaultValue.startsWith('[') && defaultValue.endsWith(']'))) {
      if (pgType.toLowerCase() == 'jsonb' || pgType.toLowerCase() == 'json') {
        return defaultValue;
      }
    }

    // Fall back to string representation
    return "'$defaultValue'";
  }

  // Utility method to safely convert values from JSON to double
  // This handles the case where numeric PostgreSQL fields might come back as int or double
  static String generateSafeNumericConversion(
    String columnName,
    String propertyName,
    bool isNullable,
  ) {
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
  static String generateJsonConversion(
    String columnName,
    String propertyName,
    String pgType,
    bool isNullable,
  ) {
    final lowerType = pgType.toLowerCase();

    // Handle DateTime types with proper parsing based on PostgreSQL type
    if (lowerType.contains('timestamp') ||
        lowerType.contains('date') ||
        lowerType.contains('time')) {
      
      if (isDateType(pgType)) {
        // Parse DATE format (YYYY-MM-DD)
        if (isNullable) {
          return 'json[\'$columnName\'] != null ? _parseDate(json[\'$columnName\'].toString()) : null';
        } else {
          return '_parseDate(json[\'$columnName\'].toString())';
        }
      } else if (isTimeType(pgType)) {
        // Parse TIME format (HH:MM:SS)
        if (isNullable) {
          return 'json[\'$columnName\'] != null ? _parseTime(json[\'$columnName\'].toString()) : null';
        } else {
          return '_parseTime(json[\'$columnName\'].toString())';
        }
      } else {
        // Parse TIMESTAMP format (ISO8601)
        if (isNullable) {
          return 'json[\'$columnName\'] != null ? DateTime.parse(json[\'$columnName\'].toString()) : null';
        } else {
          return 'DateTime.parse(json[\'$columnName\'].toString())';
        }
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
      // Extract inner type from List<Type> by finding the content between < and >
      int startIndex = dartType.indexOf('<') + 1;
      int endIndex = dartType.indexOf('>');
      String innerType = dartType.substring(startIndex, endIndex);

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
      return generateSafeNumericConversion(
        columnName,
        propertyName,
        isNullable,
      );
    }

    // Handle integer types
    if (isIntegerType(lowerType)) {
      // For bigint, consider special handling if values might exceed int range
      if (lowerType == 'bigint' ||
          lowerType == 'int8' ||
          lowerType == 'bigserial') {
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

    // Handle UUID type
    if (lowerType == 'uuid') {
      if (isNullable) {
        return 'json[\'$columnName\']';
      } else {
        return 'json[\'$columnName\'] ?? \'\'';
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
        defaultValue =
            'null!'; // Should never reach here for non-nullable types
      }
      return 'json[\'$columnName\'] ?? $defaultValue';
    }
  }

  // Check if a PostgreSQL type is a DATE type (needs YYYY-MM-DD format)
  static bool isDateType(String pgType) {
    final lowerType = pgType.toLowerCase();
    return lowerType == 'date';
  }

  // Check if a PostgreSQL type is a TIME type (needs HH:MM:SS format)
  static bool isTimeType(String pgType) {
    final lowerType = pgType.toLowerCase();
    return lowerType == 'time' || 
           lowerType == 'time without time zone' ||
           lowerType == 'time with time zone';
  }

  // Check if a PostgreSQL type is a TIMESTAMP type (can use ISO8601 format)
  static bool isTimestampType(String pgType) {
    final lowerType = pgType.toLowerCase();
    return lowerType == 'timestamp' ||
           lowerType == 'timestamp without time zone' ||
           lowerType == 'timestamp with time zone' ||
           lowerType == 'timestamptz';
  }

  // Generate proper JSON serialization for date/time types
  static String generateDateTimeJsonSerialization(String fieldName, String pgType, bool isNullable) {
    if (isDateType(pgType)) {
      // Format as YYYY-MM-DD for DATE type
      if (isNullable) {
        return '$fieldName != null ? "\${$fieldName!.year.toString().padLeft(4, \'0\')}-\${$fieldName!.month.toString().padLeft(2, \'0\')}-\${$fieldName!.day.toString().padLeft(2, \'0\')}" : null';
      } else {
        return '"\${$fieldName.year.toString().padLeft(4, \'0\')}-\${$fieldName.month.toString().padLeft(2, \'0\')}-\${$fieldName.day.toString().padLeft(2, \'0\')}"';
      }
    } else if (isTimeType(pgType)) {
      // Format as HH:MM:SS for TIME type
      if (isNullable) {
        return '$fieldName != null ? "\${$fieldName!.hour.toString().padLeft(2, \'0\')}:\${$fieldName!.minute.toString().padLeft(2, \'0\')}:\${$fieldName!.second.toString().padLeft(2, \'0\')}" : null';
      } else {
        return '"\${$fieldName.hour.toString().padLeft(2, \'0\')}:\${$fieldName.minute.toString().padLeft(2, \'0\')}:\${$fieldName.second.toString().padLeft(2, \'0\')}"';
      }
    } else {
      // Default to ISO8601 for TIMESTAMP types
      if (isNullable) {
        return '$fieldName?.toIso8601String()';
      } else {
        return '$fieldName.toIso8601String()';
      }
    }
  }

  // Check if a PostgreSQL type is a UUID type
  static bool isUuidType(String pgType) {
    final lowerType = pgType.toLowerCase();
    return lowerType == 'uuid';
  }

  // Check if a column is a primary key with UUID type
  static bool isUuidPrimaryKey(ColumnInfo column) {
    return column.isPrimaryKey && isUuidType(column.type);
  }

  // Get the appropriate Dart type validator for a constraint
  static String getConstraintValidator(
    ColumnInfo column,
    ConstraintInfo? constraint,
  ) {
    if (constraint == null) {
      return '';
    }

    final columnName = StringUtils.toVariableName(column.name);

    switch (constraint.type.toUpperCase()) {
      case 'CHECK':
        // For now, just generate a comment about the CHECK constraint
        return '// CHECK constraint: ${constraint.name}';

      case 'UNIQUE':
        return 'assert(${columnName} != null, "${column.name} must be unique")';

      case 'NOT NULL':
        return 'assert(${columnName} != null, "${column.name} cannot be null")';

      case 'FOREIGN KEY':
        final refTable = constraint.referenceTable;
        final refColumn = constraint.referenceColumn;
        if (refTable != null && refColumn != null) {
          return '// References $refTable($refColumn)';
        }
        return '';

      default:
        return '';
    }
  }
}

// UUID class for better type safety
class UUID {
  final String value;

  UUID(this.value) {
    if (!_isValidUUID(value)) {
      throw FormatException('Invalid UUID format: $value');
    }
  }

  static bool _isValidUUID(String value) {
    // UUID validation logic
    return RegExp(
      r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
    ).hasMatch(value.toLowerCase());
  }

  @override
  String toString() => value;

  static UUID? fromJson(dynamic json) {
    if (json == null) return null;
    return UUID(json.toString());
  }

  String toJson() => value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UUID && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

/// Represents a geographic point with latitude and longitude
class Point {
  final double latitude;
  final double longitude;

  Point({required this.latitude, required this.longitude});

  /// Create a point from GeoJSON format
  factory Point.fromGeoJson(Map<String, dynamic> json) {
    if (json['type'] == 'Point' && json['coordinates'] is List) {
      final coordinates = json['coordinates'] as List;
      if (coordinates.length >= 2) {
        return Point(
          // GeoJSON uses [longitude, latitude] order
          longitude:
              coordinates[0] is num ? (coordinates[0] as num).toDouble() : 0.0,
          latitude:
              coordinates[1] is num ? (coordinates[1] as num).toDouble() : 0.0,
        );
      }
    }
    throw FormatException('Invalid GeoJSON Point format: $json');
  }

  /// Create a point from WKT (Well-Known Text) format
  factory Point.fromWkt(String wkt) {
    final pointRegex = RegExp(
      r'POINT\s*\(\s*([-+]?\d*\.?\d+)\s+([-+]?\d*\.?\d+)\s*\)',
    );
    final match = pointRegex.firstMatch(wkt);

    if (match != null && match.groupCount >= 2) {
      return Point(
        // WKT format is 'POINT(longitude latitude)'
        longitude: double.parse(match.group(1)!),
        latitude: double.parse(match.group(2)!),
      );
    }
    throw FormatException('Invalid WKT Point format: $wkt');
  }

  /// Parse point from various formats
  static Point? parse(dynamic value) {
    if (value == null) return null;

    if (value is Map<String, dynamic>) {
      // Try to parse as GeoJSON
      try {
        return Point.fromGeoJson(value);
      } catch (e) {
        // Check if it's a simple {lat, lng} map
        if (value.containsKey('latitude') && value.containsKey('longitude')) {
          return Point(
            latitude: (value['latitude'] as num).toDouble(),
            longitude: (value['longitude'] as num).toDouble(),
          );
        } else if (value.containsKey('lat') && value.containsKey('lng')) {
          return Point(
            latitude: (value['lat'] as num).toDouble(),
            longitude: (value['lng'] as num).toDouble(),
          );
        }
      }
    } else if (value is String) {
      // Try to parse as WKT
      try {
        return Point.fromWkt(value);
      } catch (e) {
        // Try to parse as GeoJSON string
        try {
          final json = jsonDecode(value);
          if (json is Map<String, dynamic>) {
            return Point.fromGeoJson(json);
          }
        } catch (_) {}
      }
    }

    return null;
  }

  /// Convert to GeoJSON format
  Map<String, dynamic> toGeoJson() {
    return {
      'type': 'Point',
      'coordinates': [longitude, latitude],
    };
  }

  /// Convert to a simple map
  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude};
  }

  /// Convert to WKT format
  String toWkt() {
    return 'POINT($longitude $latitude)';
  }

  @override
  String toString() => 'Point($latitude, $longitude)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Point &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

/// Helper class for handling JSON data
class JsonData {
  final dynamic _data;

  JsonData(this._data);

  /// Create JSON data from various sources
  static JsonData? parse(dynamic value) {
    if (value == null) return null;

    if (value is Map<String, dynamic>) {
      return JsonData(value);
    } else if (value is String) {
      try {
        final decoded = jsonDecode(value);
        return JsonData(decoded);
      } catch (_) {
        return JsonData(value);
      }
    } else if (value is List) {
      return JsonData(value);
    }

    return JsonData(value);
  }

  /// Get the raw data
  dynamic get data => _data;

  /// Convert to a JSON string
  String toJsonString() {
    return jsonEncode(_data);
  }

  @override
  String toString() {
    if (_data is Map || _data is List) {
      return toJsonString();
    }
    return _data.toString();
  }

  /// Convert to JSON
  dynamic toJson() => _data;
}

// No longer needed - now imported at the top
