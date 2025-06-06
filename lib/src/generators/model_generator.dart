import 'dart:io';
import 'dart:convert';
import 'package:path/path.dart' as path;

import '../config/config_model.dart';
import '../schema/constraint_metadata.dart';
import '../schema/table_info.dart';
import '../utils/logger.dart';
import '../utils/string_utils.dart';
import '../utils/type_converter.dart';

class ModelGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('ModelGenerator');

  // Track special field types
  bool hasGeoFields = false;
  bool hasJsonFields = false;
  bool hasNumericFields = false;

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
    final barrelPath = path.join(
      config.outputDirectory,
      'models',
      'models.dart',
    );
    await File(barrelPath).writeAsString(barrelContent);

    _logger.info('Generated models for ${tables.length} tables');
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
    
    // Create constraint metadata for enhanced type safety
    final constraintMetadata = TableConstraintMetadata.fromTableInfo(table);
    final fileContent = _generateEnhancedModelClass(table, className, constraintMetadata);

    await File(filePath).writeAsString(fileContent);
    _logger.info('Generated model file: $filePath');
  }
  
  // Generate an enhanced model class with better constraint handling
  String _generateEnhancedModelClass(
    TableInfo table, 
    String className, 
    TableConstraintMetadata constraints
  ) {
    // Reuse most of the existing model generation logic
    return _generateModelClass(table, className, constraints: constraints);
  }

  String _generateModelClass(TableInfo table, String className, {TableConstraintMetadata? constraints}) {
    final hasGeoFields = table.columns.any(
      (col) =>
          col.type.toLowerCase() == 'geography' ||
          col.type.toLowerCase() == 'geometry' ||
          col.type.toLowerCase() == 'point',
    );

    final hasJsonFields = table.columns.any(
      (col) =>
          col.type.toLowerCase() == 'jsonb' || col.type.toLowerCase() == 'json',
    );

    final hasNumericFields = table.columns.any(
      (col) => TypeConverter.isNumericType(col.type.toLowerCase()),
    );

    // Determine primary key column and name
    ColumnInfo? primaryKeyColumn;
    
    // First check for primary key
    if (table.hasPrimaryKey) {
      primaryKeyColumn = table.primaryKeys.first;
    } else {
      // For views or tables without explicit primary key, look for id-like fields
      primaryKeyColumn = table.columns.firstWhere(
        (col) =>
            col.name.toLowerCase() == 'id' ||
            col.name.toLowerCase().endsWith('_id'),
        orElse: () => table.columns.first,
      );
    }
    
    final primaryKeyField = StringUtils.toVariableName(primaryKeyColumn.name);

    // Import statements
    final imports = <String>[];

    // Add necessary imports
    // Always include geo_json.dart if we use geographic types or numeric fields that need the _toPoint helper
    if (hasGeoFields || hasJsonFields || hasNumericFields) {
      imports.add("import '../utils/geo_json.dart';");
    }

    final importSection = imports.join('\n');

    // Generate class properties with constraint annotations
    final properties = table.columns
        .map((column) {
          final type = _getDartType(column);
          final name = StringUtils.toVariableName(column.name);

          final nullabilitySuffix =
              column.isNullable && config.useNullSafety ? '?' : '';

          // Enhanced documentation with constraint information
          final List<String> docLines = [];
          
          // Add column comment if available
          if (column.comment != null) {
            docLines.add(column.comment!);
          }
          
          // Add constraint information if available
          if (constraints != null) {
            // Find matching column constraint
            final columnConstraint = constraints.columns.firstWhere(
              (c) => c.columnName == column.name,
              orElse: () => ColumnConstraintMetadata(
                columnName: column.name,
                isNullable: column.isNullable,
                isUnique: false,
                isPrimaryKey: false,
                dartType: type,
              ),
            );
            
            // Add constraint docs
            if (columnConstraint.isPrimaryKey) {
              docLines.add('Primary key field');
            }
            
            if (columnConstraint.isUnique && !columnConstraint.isPrimaryKey) {
              docLines.add('Unique field');
            }
            
            if (!columnConstraint.isNullable) {
              docLines.add('Non-nullable field');
            }
            
            if (columnConstraint.maxLength != null) {
              docLines.add('Max length: ${columnConstraint.maxLength}');
            }
            
            // Find foreign key reference
            final foreignKey = constraints.foreignKeys.firstWhere(
              (fk) => fk.columnName == column.name,
              orElse: () => ForeignKeyConstraint(
                name: '', 
                columnName: '', 
                referenceTable: '', 
                referenceColumn: '',
              ),
            );
            
            if (foreignKey.columnName.isNotEmpty) {
              docLines.add('References ${foreignKey.referenceTable}(${foreignKey.referenceColumn})');
            }
          }
          
          // Format documentation
          final docs = docLines.isEmpty 
              ? ''
              : '  /// ${docLines.join('\n  /// ')}\n';

          // Build field with annotations
          final annotations = <String>[];
          
          // Add any field-level annotations based on constraints
          // e.g., for JSON serialization or validation libraries
          
          final annotationStr = annotations.isEmpty 
              ? '' 
              : '${annotations.join('\n  ')}\n  ';
              
          return '$docs  ${annotationStr}final $type$nullabilitySuffix $name;';
        })
        .join('\n');

    // Generate validations based on constraints
    final validations = <String>[];
    if (constraints != null) {
      for (final column in constraints.columns) {
        final validation = column.generateValidationCode();
        if (validation.isNotEmpty) {
          validations.add(validation);
        }
      }
    }
    
    // Generate constructor
    final initializerParams = <String>[];
    
    // Add any validations to initializer parameters if needed
    if (validations.isNotEmpty) {
      initializerParams.add('assert(() { ${validations.join('; ')}; return true; }())');
    }
    
    final constructorParams = table.columns
        .map((column) {
          final name = StringUtils.toVariableName(column.name);
          final type = _getDartType(column);
          final isNullable = column.isNullable && config.useNullSafety;
          final lowerType = column.type.toLowerCase();

          // Handle DateTime fields specially to avoid non-constant default values
          if (lowerType.contains('timestamp') ||
              lowerType.contains('date') ||
              lowerType.contains('time')) {
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

          // Handle auto-generated columns (like UUID primary keys with gen_random_uuid())
          if (column.isAutoGenerated) {
            // For auto-generated primary keys, provide a reasonable default
            if (column.isPrimaryKey && lowerType == 'uuid') {
              return 'this.$name = ""';
            }
            // For other auto-generated fields, make them optional
            return 'this.$name';
          }

          // Handle default values from database that may contain expressions
          if (column.defaultValue != null) {
            final defaultValue = column.defaultValue!;

            // If the default value contains a function call or expression, convert it
            // to an optional parameter with a default in the class
            if (defaultValue.contains('(') ||
                defaultValue.contains('::') ||
                defaultValue.contains("'")) {
              // For non-nullable fields, we need to provide a value
              if (!isNullable) {
                final dartDefault = TypeConverter.postgresDefaultToDartLiteral(
                  defaultValue,
                  column.type,
                );

                if (dartDefault != null) {
                  return 'this.$name = $dartDefault';
                } else {
                  // Fallback to using empty string for text, 0 for numbers, etc.
                  final defaultByType = _getDefaultForType(column.type);
                  return 'this.$name = $defaultByType';
                }
              } else {
                // For nullable fields with database defaults, make the param optional
                return 'this.$name';
              }
            }
          }

          // Normal handling for other types
          if (!isNullable) {
            // For non-nullable types, either mark as required or provide a default
            if (column.defaultValue != null) {
              // Use the provided default value
              final dartDefault = TypeConverter.postgresDefaultToDartLiteral(
                column.defaultValue,
                column.type,
              );

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
        })
        .join(', ');

    // Create constructor with initializer list if needed
    String constructor;
    if (initializerParams.isEmpty) {
      constructor = '  $className({$constructorParams});';
    } else {
      constructor =
          '  $className({$constructorParams})\n      : ${initializerParams.join(',\n        ')};';
    }

    // Generate fromJson method
    final fromJsonMappers = table.columns
        .map((column) {
          final name = StringUtils.toVariableName(column.name);
          return _generateParseField(column);
        })
        .join('\n      ');

    final fromJsonMethod = '''
  factory $className.fromJson(Map<String, dynamic> json) {
    return $className(
      $fromJsonMappers
    );
  }''';

    // Generate toJson method (includes all fields for reading)
    final toJsonMappers = table.columns
        .map((column) => _generateToJsonMapper(column))
        .join('\n      ');

    final toJsonMethod = '''
  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      $toJsonMappers
    };
  }''';

    // Generate toJsonForInsert method (excludes generated columns and auto-generated fields)
    final toJsonForInsertMappers = table.columns
        .where((column) => !column.excludeFromSerialization && !column.isAutoGenerated)
        .map((column) => _generateToJsonMapper(column))
        .join('\n      ');

    final toJsonForInsertMethod = '''
  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      $toJsonForInsertMappers
    };
  }''';

    // Generate toJsonForUpdate method (excludes generated columns but keeps ID)
    final toJsonForUpdateMappers = table.columns
        .where((column) => !column.excludeFromSerialization)
        .map((column) => _generateToJsonMapper(column))
        .join('\n      ');

    final toJsonForUpdateMethod = '''
  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      $toJsonForUpdateMappers
    };
  }''';

    // Generate equality operator and hashCode
    final equalsChecks = table.columns
        .map((column) {
          final name = StringUtils.toVariableName(column.name);
          return 'other.$name == $name';
        })
        .join(' && ');

    final hashProperties = table.columns
        .map((column) {
          final name = StringUtils.toVariableName(column.name);
          return '$name.hashCode';
        })
        .join(' ^ ');

    final equalsMethod = '''
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is $className && $equalsChecks;
  }''';

    final hashMethod = '''
  @override
  int get hashCode => $hashProperties;''';

    // Check which helper methods are actually used in the generated code
    // by scanning the parsing logic for each column
    final allFieldParsers = table.columns.map((col) => _generateParseField(col)).join('\n');
    
    final shouldIncludeDoubleHelper = allFieldParsers.contains('_toDouble');
    final shouldIncludePointHelper = allFieldParsers.contains('_toPoint');
    final shouldIncludeDateHelper = allFieldParsers.contains('_parseDate');
    final shouldIncludeTimeHelper = allFieldParsers.contains('_parseTime');
    
    // Generate the appropriate helper methods based on what's needed
    List<String> helperMethodsList = [];
    
    if (shouldIncludeDoubleHelper) {
      helperMethodsList.add('''
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
  }''');
    }
    
    if (shouldIncludePointHelper) {
      helperMethodsList.add('''
  /// Helper function to convert dynamic values to Point
  Point? _toPoint(dynamic value) {
    return Point.parse(value);
  }''');
    }
    
    if (shouldIncludeDateHelper) {
      helperMethodsList.add('''
  /// Helper function to parse DATE format (YYYY-MM-DD)
  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('-');
    return DateTime(
      int.parse(parts[0]), // year
      int.parse(parts[1]), // month
      int.parse(parts[2])  // day
    );
  }''');
    }
    
    if (shouldIncludeTimeHelper) {
      helperMethodsList.add('''
  /// Helper function to parse TIME format (HH:MM:SS)
  DateTime _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return DateTime(
      1970, 1, 1, // epoch date
      int.parse(parts[0]), // hour
      int.parse(parts[1]), // minute
      int.parse(parts[2])  // second
    );
  }''');
    }
    
    final helperMethods = helperMethodsList.join('\n\n');

    // Generate toString method
    final stringProps = table.columns
        .map((column) {
          final name = StringUtils.toVariableName(column.name);
          return '$name: \$$name';
        })
        .join(', ');

    final toStringMethod = '''
  @override
  String toString() {
    return '$className($stringProps)';
  }''';

    // For id getter, handle views differently
    String idGetter;
    
    if (table.isView) {
      // For views, only add the id getter if there's an identifiable primary key
      if (table.hasPrimaryKey) {
        final needsIdGetter = primaryKeyField != 'id';
        idGetter = needsIdGetter
            ? '''
  /// Get the primary identifier for this record
  String get id => $primaryKeyField;'''
            : '''
  // Primary identifier is already defined as a field''';
      } else {
        // For views without primary keys, don't add an id getter
        idGetter = '''
  // This is a view and no primary key could be determined''';
      }
    } else {
      // For regular tables, use the standard approach
      final needsIdGetter = primaryKeyField != 'id';
      idGetter = needsIdGetter
          ? '''
  /// Get the primary identifier for this record
  String get id => $primaryKeyField;'''
          : '''
  // Primary identifier is already defined as a field''';
    }

    // Generate triggers documentation
    String triggersDoc = '';
    if (table.triggers.isNotEmpty) {
      final triggersList = table.triggers.map((trigger) {
        return _formatTriggerDocumentation(trigger);
      }).join('\n');
      
      triggersDoc = '''
/// Database triggers associated with this table:
$triggersList
///''';
    }
    
    // Assemble the final class
    final classDefinition =
        '''${importSection.isNotEmpty ? '$importSection\n' : ''}
/// Generated model class for table ${table.name}
${triggersDoc.isNotEmpty ? '$triggersDoc\n' : ''}class $className {
$properties

$constructor

$fromJsonMethod

$toJsonMethod

$toJsonForInsertMethod

$toJsonForUpdateMethod

$equalsMethod

$hashMethod

$toStringMethod
$idGetter
}

$helperMethods
''';

    return classDefinition;
  }

  /// Generate a toJson mapper for a single column
  String _generateToJsonMapper(ColumnInfo column) {
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
    } else if (type.contains('timestamp') ||
        type.contains('date') ||
        type.contains('time')) {
      // Handle DateTime fields with proper formatting based on PostgreSQL type
      final serialization = TypeConverter.generateDateTimeJsonSerialization(
        name, 
        column.type, 
        column.isNullable && config.useNullSafety
      );
      return "'$jsonKey': $serialization,";
    } else {
      return "'$jsonKey': $name,";
    }
  }


  String _generateParseField(ColumnInfo column) {
    final fieldName = StringUtils.toVariableName(column.name);
    final jsonKey = column.name;
    final type = column.type.toLowerCase();

    // Handle geographic types
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      hasGeoFields = true;
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'] != null ? _toPoint(json['$jsonKey']) : null,";
      } else {
        return "$fieldName: _toPoint(json['$jsonKey']) ?? Point(latitude: 0, longitude: 0),";
      }
    }

    // Handle interval type
    if (type == 'interval') {
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey']?.toString(),";
      } else {
        return "$fieldName: json['$jsonKey']?.toString() ?? '',";
      }
    }

    // Handle Array types first (before other type checks)
    if (type.startsWith('_') || type.endsWith('[]')) {
      final conversion = TypeConverter.generateJsonConversion(
        jsonKey,
        fieldName,
        column.type,
        column.isNullable && config.useNullSafety,
      );
      return "$fieldName: $conversion,";
    }

    // Handle JSON types
    if (type == 'jsonb' || type == 'json') {
      hasJsonFields = true;
      if (column.isNullable && config.useNullSafety) {
        return "$fieldName: json['$jsonKey'],";
      } else {
        return "$fieldName: json['$jsonKey'] ?? {},";
      }
    }

    // Handle numeric types
    if (TypeConverter.isNumericType(type)) {
      hasNumericFields = true;
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

    // Handle date/time types with type-specific parsing
    if (type.contains('timestamp') ||
        type.contains('date') ||
        type.contains('time')) {
      final conversion = TypeConverter.generateJsonConversion(
        jsonKey,
        fieldName,
        column.type,
        column.isNullable && config.useNullSafety,
      );
      return "$fieldName: $conversion,";
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
      hasGeoFields = true;
      return 'Point';
    }

    // Special handling for interval type
    if (type == 'interval') {
      return 'String';
    }

    // Use the TypeConverter to get the standard mapping
    String dartType = TypeConverter.postgresTypeToDart(
      type,
      isNullable: column.isNullable,
    );
    // Remove the nullable suffix if present
    if (dartType.endsWith('?')) {
      return dartType.substring(0, dartType.length - 1);
    }
    return dartType;
  }

  // Helper method to provide default values based on type
  String _getDefaultForType(String sqlType) {
    final lowerType = sqlType.toLowerCase();

    if (lowerType == 'text' ||
        lowerType == 'varchar' ||
        lowerType == 'char' ||
        lowerType == 'uuid' ||
        lowerType == 'citext' ||
        lowerType == 'interval') {
      return '""';
    } else if (lowerType == 'int' ||
        lowerType == 'integer' ||
        lowerType == 'smallint' ||
        lowerType == 'bigint') {
      return '0';
    } else if (lowerType == 'float' ||
        lowerType == 'double' ||
        lowerType == 'real' ||
        lowerType == 'numeric' ||
        lowerType == 'decimal') {
      return '0.0';
    } else if (lowerType == 'bool' || lowerType == 'boolean') {
      return 'false';
    } else if (lowerType == 'jsonb' || lowerType == 'json') {
      return '{}';
    } else if (lowerType.contains('array')) {
      return '[]';
    } else {
      return '""';
    }
  }

  String _generateBarrelFile(List<TableInfo> tables) {
    final exports = tables
        .map((table) => "export '${table.name}_model.dart';")
        .join('\n');

    // Check if any tables have geographic data
    final hasGeoFields = tables.any(
      (table) => table.columns.any(
        (col) =>
            col.type.toLowerCase() == 'geography' ||
            col.type.toLowerCase() == 'geometry' ||
            col.type.toLowerCase() == 'point',
      ),
    );

    // Add Point class export if needed
    final geoExport =
        hasGeoFields
            ? "\n// Export utility classes\nexport '../utils/geo_json.dart';"
            : '';

    return '''// Generated barrel file for models
// Do not modify by hand

$exports$geoExport
''';
  }
}
