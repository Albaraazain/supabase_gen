import 'dart:io';
import 'package:path/path.dart' as path;

import '../config/config_model.dart';
import '../schema/table_info.dart';
import '../utils/logger.dart';
import '../utils/string_utils.dart';
import '../utils/type_converter.dart';

class ModelGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('ModelGenerator');

  ModelGenerator(this.config);

  Future<void> generateModels(List<TableInfo> tables) async {
    // Generate utility classes
    await _generateUtilityClasses();
    
    // Generate models for each table
    for (final table in tables) {
      await _generateModelForTable(table);
    }
    
    // Generate barrel file
    final barrelContent = _generateBarrelFile(tables);
    final barrelPath = path.join(config.outputDirectory, 'models', 'models.dart');
    await File(barrelPath).writeAsString(barrelContent);
    
    _logger.info('Generated models for ${tables.length} tables');
  }
  
  Future<void> _generateUtilityClasses() async {
    // Generate directory
    final dir = Directory(path.join(config.outputDirectory, 'utils'));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    
    // Generate utility classes file with Point and JsonData
    final filePath = path.join(dir.path, 'geo_json.dart');
    final content = '''
import 'dart:convert';

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
          longitude: coordinates[0] is num ? (coordinates[0] as num).toDouble() : 0.0,
          latitude: coordinates[1] is num ? (coordinates[1] as num).toDouble() : 0.0,
        );
      }
    }
    throw FormatException('Invalid GeoJSON Point format: \$json');
  }

  /// Create a point from WKT (Well-Known Text) format 
  factory Point.fromWkt(String wkt) {
    final pointRegex = RegExp(r'POINT\\s*\\(\\s*([-+]?\\d*\\.?\\d+)\\s+([-+]?\\d*\\.?\\d+)\\s*\\)');
    final match = pointRegex.firstMatch(wkt);
    
    if (match != null && match.groupCount >= 2) {
      return Point(
        // WKT format is 'POINT(longitude latitude)'
        longitude: double.parse(match.group(1)!),
        latitude: double.parse(match.group(2)!),
      );
    }
    throw FormatException('Invalid WKT Point format: \$wkt');
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
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  /// Convert to WKT format
  String toWkt() {
    return 'POINT(\$longitude \$latitude)';
  }
  
  @override
  String toString() => 'Point(\$latitude, \$longitude)';
  
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

/// Helper function to convert dynamic values to double
double? _toDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) {
    try {
      return double.parse(value);
    } catch (_) {
      return null;
    }
  }
  return null;
}

/// Helper function to convert geographic values to Point objects
Point? _toPoint(dynamic value) {
  return Point.parse(value);
}
''';
    
    await File(filePath).writeAsString(content);
    _logger.info('Generated utility classes file: $filePath');
  }

  Future<void> _generateModelForTable(TableInfo table) async {
    final className = config.getModelClassName(table.name);
    final fileName = '${table.name}_model.dart';
    
    final dir = Directory(path.join(config.outputDirectory, 'models'));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    
    final filePath = path.join(dir.path, fileName);
    final fileContent = _generateModelClass(table, className);
    
    await File(filePath).writeAsString(fileContent);
    _logger.info('Generated model file: $filePath');
  }

  String _generateModelClass(TableInfo table, String className) {
    final hasGeoFields = table.columns.any((col) => 
      col.type.toLowerCase() == 'geography' || 
      col.type.toLowerCase() == 'geometry' ||
      col.type.toLowerCase() == 'point'
    );
    
    final hasJsonFields = table.columns.any((col) => 
      col.type.toLowerCase() == 'jsonb' || 
      col.type.toLowerCase() == 'json'
    );
    
    // Import statements
    final imports = <String>[];
    
    // Add necessary imports
    if (hasGeoFields || hasJsonFields) {
      imports.add("import '../utils/geo_json.dart';");
    }
    
    final importSection = imports.join('\n');
    
    // Generate class properties
    final properties = table.columns.map((column) {
      final type = _getDartType(column);
      final name = StringUtils.toVariableName(column.name);
      
      final nullabilitySuffix = column.isNullable && config.useNullSafety ? '?' : '';
      
      // Add documentation if available
      final docs = column.comment != null 
          ? '  /// ${column.comment}\n' 
          : '';
      
      return '$docs  final $type$nullabilitySuffix $name;';
    }).join('\n');
    
    // Generate constructor
    final initializerParams = <String>[];
    final constructorParams = table.columns.map((column) {
      final name = StringUtils.toVariableName(column.name);
      final type = _getDartType(column);
      final isNullable = column.isNullable && config.useNullSafety;
      final lowerType = column.type.toLowerCase();
      
      // Handle DateTime fields specially to avoid non-constant default values
      if (lowerType.contains('timestamp') || lowerType.contains('date') || lowerType.contains('time')) {
        // Date fields need to be initialized in the initializer list
        if (!isNullable) {
          // For required non-nullable DateTime fields, use an optional param and initializer
          initializerParams.add('$name = $name ?? DateTime.now()');
          return 'DateTime? $name';
        } else {
          // For nullable DateTime fields, just use a normal param
          return 'this.$name';
        }
      }
      
      // Normal handling for other types
      if (!isNullable) {
        // For non-nullable types, either mark as required or provide a default
        if (column.defaultValue != null) {
          // Use the provided default value
          final dartDefault = TypeConverter.postgresDefaultToDartLiteral(
            column.defaultValue, column.type);
          
          // For UUID and similar functions, use empty string as default
          if (dartDefault != null && dartDefault.contains('(')) {
            return 'this.$name = ""';
          }
          
          return 'this.$name = $dartDefault';
        } else {
          // No default available, mark as required
          return 'required this.$name';
        }
      } else {
        // For nullable types, no need for defaults
        return 'this.$name';
      }
    }).join(', ');
    
    // Create constructor with initializer list if needed
    String constructor;
    if (initializerParams.isEmpty) {
      constructor = '  $className({$constructorParams});';
    } else {
      constructor = '  $className({$constructorParams})\n      : ${initializerParams.join(',\n        ')};';
    }
    
    // Generate fromJson method
    final fromJsonMappers = table.columns.map((column) {
      final name = StringUtils.toVariableName(column.name);
      return _generateParseField(column);
    }).join('\n      ');
    
    final fromJsonMethod = '''
  factory $className.fromJson(Map<String, dynamic> json) {
    return $className(
      $fromJsonMappers
    );
  }''';
    
    // Generate toJson method
    final toJsonMappers = table.columns.map((column) {
      final name = StringUtils.toVariableName(column.name);
      final jsonKey = column.name;
      
      // Handle special types
      final type = column.type.toLowerCase();
      if (type == 'geography' || type == 'geometry' || type == 'point') {
        if (column.isNullable && config.useNullSafety) {
          return "'$jsonKey': $name?.toGeoJson(),";
        } else {
          return "'$jsonKey': $name.toGeoJson(),";
        }
      } else if (type == 'jsonb' || type == 'json') {
        if (column.isNullable && config.useNullSafety) {
          return "'$jsonKey': $name,";
        } else {
          return "'$jsonKey': $name,";
        }
      } else {
        return "'$jsonKey': $name,";
      }
    }).join('\n      ');
    
    final toJsonMethod = '''
  Map<String, dynamic> toJson() {
    return {
      $toJsonMappers
    };
  }''';
    
    // Generate equality operator and hashCode
    final equalsChecks = table.columns.map((column) {
      final name = StringUtils.toVariableName(column.name);
      return 'other.$name == $name';
    }).join(' && ');
    
    final hashProperties = table.columns.map((column) {
      final name = StringUtils.toVariableName(column.name);
      return '$name.hashCode';
    }).join(' ^ ');
    
    final equalsMethod = '''
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is $className && $equalsChecks;
  }''';
    
    final hashMethod = '''
  @override
  int get hashCode => $hashProperties;''';
    
    // Generate helper methods
    final helperMethods = hasGeoFields || hasJsonFields ? '''
  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
  
  /// Helper function to convert dynamic values to Point
  Point? _toPoint(dynamic value) {
    return Point.parse(value);
  }''' : '';
    
    // Generate toString method
    final stringProps = table.columns.map((column) {
      final name = StringUtils.toVariableName(column.name);
      return '$name: \$$name';
    }).join(', ');
    
    final toStringMethod = '''
  @override
  String toString() {
    return '$className($stringProps)';
  }''';
    
    // Assemble the final class
    final classDefinition = '''${importSection.isNotEmpty ? '$importSection\n' : ''}
/// Generated model class for table ${table.name}
class $className {
$properties

$constructor

$fromJsonMethod

$toJsonMethod

$equalsMethod

$hashMethod

$toStringMethod
}

$helperMethods
''';
    
    return classDefinition;
  }

  String _generateParseField(ColumnInfo column) {
    final fieldName = StringUtils.toVariableName(column.name);
    final jsonKey = column.name;
    final type = column.type.toLowerCase();
    
    // Handle geographic types
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'] != null ? _toPoint(json['$jsonKey']) : null,";
      } else {
        return "$fieldName: _toPoint(json['$jsonKey']) ?? Point(latitude: 0, longitude: 0),";
      }
    }
    
    // Handle JSON types
    if (type == 'jsonb' || type == 'json') {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'],";
      } else {
        return "$fieldName: json['$jsonKey'] ?? {},";
      }
    }
    
    // Handle numeric types
    if (TypeConverter.isNumericType(type)) {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'] != null ? _toDouble(json['$jsonKey']) : null,";
      } else {
        return "$fieldName: _toDouble(json['$jsonKey']) ?? 0.0,";
      }
    }
    
    // Handle integer types
    if (TypeConverter.isIntegerType(type)) {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'],";
      } else {
        return "$fieldName: json['$jsonKey'] ?? 0,";
      }
    }
    
    // Handle boolean types
    if (type == 'boolean' || type == 'bool') {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'],";
      } else {
        return "$fieldName: json['$jsonKey'] ?? false,";
      }
    }
    
    // Handle date/time types
    if (type.contains('timestamp') || type.contains('date') || type.contains('time')) {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'] != null ? DateTime.parse(json['$jsonKey'].toString()) : null,";
      } else {
        return "$fieldName: json['$jsonKey'] != null ? DateTime.parse(json['$jsonKey'].toString()) : DateTime.now(),";
      }
    }
    
    // Handle string types and others
    if (column.isNullable && config.useNullSafety) {
      return "$fieldName: json['$jsonKey'],";
    } else {
      return "$fieldName: json['$jsonKey'] ?? '',";
    }
  }

  String _getDartType(ColumnInfo column) {
    final type = column.type.toLowerCase();
    final name = column.name.toLowerCase();
    
    // Special handling for geographic types
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      return 'Point';
    }
    
    // Use the TypeConverter to get the standard mapping
    String dartType = TypeConverter.postgresTypeToDart(type, isNullable: column.isNullable);
    // Remove the nullable suffix if present
    if (dartType.endsWith('?')) {
      return dartType.substring(0, dartType.length - 1);
    }
    return dartType;
  }

  String _generateBarrelFile(List<TableInfo> tables) {
    final exports = tables.map((table) => "export '${table.name}_model.dart';").join('\n');
    
    // Check if any tables have geographic data
    final hasGeoFields = tables.any((table) => 
      table.columns.any((col) => 
        col.type.toLowerCase() == 'geography' || 
        col.type.toLowerCase() == 'geometry' ||
        col.type.toLowerCase() == 'point'
      )
    );
    
    // Add Point class export if needed
    final geoExport = hasGeoFields ? 
      "\n// Export utility classes\nexport '../utils/geo_json.dart';" : '';
    
    return '''// Generated barrel file for models
// Do not modify by hand

$exports$geoExport
''';
  }
}