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

    // Generate timezone utilities first
    await _generateTimezoneUtils(dir);

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

  /// Generate timezone utility functions for consistent timestamp handling
  Future<void> _generateTimezoneUtils(Directory dir) async {
    final filePath = path.join(dir.path, 'app_time.dart');
    final content = '''
/// Timezone utilities for consistent timestamp handling
/// 
/// All database timestamps should be stored in UTC to avoid timezone issues
/// between client and server, and when users are in different timezones.
class AppTime {
  /// Get current time in UTC for database storage
  /// Use this instead of DateTime.now() for all database timestamps
  static DateTime nowUtc() => DateTime.now().toUtc();
  
  /// Get current time in local timezone for UI display
  static DateTime nowLocal() => DateTime.now();
  
  /// Convert a UTC timestamp from database to local time for display
  /// Use this when showing timestamps to users
  static DateTime toLocal(DateTime? utcTime) => 
    utcTime?.toLocal() ?? DateTime.now();
  
  /// Convert local time input to UTC for database storage
  /// Use this when user provides a datetime input
  static DateTime toUtc(DateTime localTime) => localTime.toUtc();
  
  /// Parse a timestamp string from database (already in UTC)
  /// and convert to local time for display
  static DateTime? parseUtcToLocal(String? timestampStr) {
    if (timestampStr == null) return null;
    try {
      final utcTime = DateTime.parse(timestampStr);
      return utcTime.toLocal();
    } catch (e) {
      return null;
    }
  }
}
''';

    await File(filePath).writeAsString(content);
    _logger.info('Generated timezone utilities file: $filePath');
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

    final hasDateTimeFields = table.columns.any(
      (col) {
        final type = col.type.toLowerCase();
        return type.contains('timestamp') ||
               type.contains('date') ||
               type.contains('time');
      },
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

    // Include timezone utilities if we have datetime fields
    if (hasDateTimeFields) {
      imports.add("import '../utils/app_time.dart';");
    }

    final importSection = imports.join('\n');

    // Generate class properties with constraint annotations
    final properties = table.columns
        .map((column) {
          final type = _getDartType(column);
          final name = StringUtils.toVariableName(column.name);

          // nullabilitySuffix is no longer needed since _getDartType already handles nullability correctly

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
              
          return '$docs  ${annotationStr}final $type $name;';
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
          final isFieldNullable = type.endsWith('?'); // Check if the generated type is nullable
          final lowerType = column.type.toLowerCase();

          // Handle auto-generated columns
          if (column.isAutoGenerated) {
            // Auto-generated columns are optional in constructor (field type is already nullable)
            return 'this.$name';
          }

          // Handle columns with default values
          if (column.defaultValue != null) {
            // Columns with defaults are optional in constructor (field type is already nullable)
            if (!isFieldNullable) {
              // Non-nullable fields with database defaults need a default parameter value
              // For interval types, use a null default and handle in initializer
              if (lowerType.contains('interval')) {
                initializerParams.add('$name = $name ?? \'\'');
                return 'String? $name';
              }
              // For other types with defaults, still require them in constructor
              return 'required this.$name';
            }
            return 'this.$name';
          }

          // Handle DateTime fields specially to avoid non-constant default values
          if (lowerType.contains('timestamp') ||
              lowerType.contains('date') ||
              lowerType.contains('time')) {
            if (!isFieldNullable) {
              // For required non-nullable DateTime fields, use an optional param and initializer
              // Use UTC time for database consistency across timezones
              initializerParams.add('$name = $name ?? AppTime.nowUtc()');
              return 'DateTime? $name';
            } else {
              // For nullable DateTime fields, just use a normal param
              return 'this.$name';
            }
          }

          // For required fields without defaults or auto-generation
          if (!isFieldNullable) {
            return 'required this.$name';
          }

          // For nullable fields, just use a normal param
          return 'this.$name';
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
    final insertColumns = table.columns
        .where((column) => !column.excludeFromSerialization && !column.isAutoGenerated)
        .toList();
    
    final uuidPrimaryKeys = insertColumns
        .where((column) => column.type.toLowerCase() == 'uuid' && column.isPrimaryKey)
        .toList();
    
    final regularColumns = insertColumns
        .where((column) => !(column.type.toLowerCase() == 'uuid' && column.isPrimaryKey))
        .toList();

    final regularMappers = regularColumns
        .map((column) => _generateToJsonMapper(column))
        .join('\n      ');

    String toJsonForInsertBody;
    if (uuidPrimaryKeys.isNotEmpty) {
      final uuidChecks = uuidPrimaryKeys.map((column) {
        final name = StringUtils.toVariableName(column.name);
        final jsonKey = column.name;
        // Get the actual Dart type to check nullability
        final dartType = _getDartType(column);
        final isFieldNullable = dartType.endsWith('?');
        
        if (isFieldNullable) {
          return "    if ($name != null && $name!.isNotEmpty) json['$jsonKey'] = $name;";
        } else {
          return "    if ($name.isNotEmpty) json['$jsonKey'] = $name;";
        }
      }).join('\n');

      toJsonForInsertBody = '''
    final json = <String, dynamic>{
      $regularMappers
    };
    
$uuidChecks
    
    return json;''';
    } else {
      toJsonForInsertBody = '''
    return {
      $regularMappers
    };''';
    }

    final toJsonForInsertMethod = '''
  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
$toJsonForInsertBody
  }''';

    // Generate toJsonForUpdate method (excludes auto-generated fields except ID)
    final updateColumns = table.columns
        .where((column) => !column.excludeFromSerialization)
        .where((column) {
          // Include ID field even if auto-generated (needed for updates)
          if (column.isPrimaryKey) return true;
          
          // Exclude auto-generated fields like created_at timestamps
          if (column.isAutoGenerated) {
            final lowerType = column.type.toLowerCase();
            final lowerDefault = column.defaultValue?.toLowerCase() ?? '';
            
            // Exclude timestamp fields with DEFAULT NOW() - they shouldn't be updated
            if ((lowerType.contains('timestamp') || lowerType.contains('date')) &&
                (lowerDefault.contains('now()') || lowerDefault.contains('current_timestamp'))) {
              return false;
            }
          }
          
          return true;
        })
        .toList();

    final toJsonForUpdateMappers = updateColumns
        .map((column) => _generateToJsonUpdateMapper(column))
        .join('\n      ');

    final toJsonForUpdateMethod = '''
  /// Convert to JSON for UPDATE operations (includes ID, excludes auto-generated timestamps)
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
    
    // Get the Dart type of the primary key field to check nullability
    final primaryKeyDartType = _getDartType(primaryKeyColumn);
    final isPrimaryKeyNullable = primaryKeyDartType.endsWith('?');
    
    if (table.isView) {
      // For views, only add the id getter if there's an identifiable primary key
      if (table.hasPrimaryKey) {
        final needsIdGetter = primaryKeyField != 'id';
        if (needsIdGetter) {
          // Handle nullable primary keys
          if (isPrimaryKeyNullable) {
            idGetter = '''
  /// Get the primary identifier for this record
  String? get id => $primaryKeyField;''';
          } else {
            idGetter = '''
  /// Get the primary identifier for this record
  String get id => $primaryKeyField;''';
          }
        } else {
          idGetter = '''
  // Primary identifier is already defined as a field''';
        }
      } else {
        // For views without primary keys, check for common ID patterns
        final idColumn = table.columns.firstWhere(
          (col) => col.name.toLowerCase().endsWith('_id') || col.name.toLowerCase() == 'id',
          orElse: () => table.columns.first,
        );
        
        if (idColumn.name.toLowerCase().endsWith('_id') || idColumn.name.toLowerCase() == 'id') {
          final idFieldName = StringUtils.toVariableName(idColumn.name);
          final idType = _getDartType(idColumn);
          final getterNullability = idType.endsWith('?') ? '?' : '';
          idGetter = '''
  /// Get the primary identifier for this record
  String$getterNullability get id => $idFieldName;''';
        } else {
          // For views without any ID-like field, don't add an id getter
          idGetter = '''
  // This is a view and no primary key could be determined''';
        }
      }
    } else {
      // For regular tables, use the standard approach
      final needsIdGetter = primaryKeyField != 'id';
      if (needsIdGetter) {
        // Handle nullable primary keys
        if (isPrimaryKeyNullable) {
          idGetter = '''
  /// Get the primary identifier for this record
  String? get id => $primaryKeyField;''';
        } else {
          idGetter = '''
  /// Get the primary identifier for this record
  String get id => $primaryKeyField;''';
        }
      } else {
        idGetter = '''
  // Primary identifier is already defined as a field''';
      }
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
    
    // Get the actual Dart type to check nullability
    final dartType = _getDartType(column);
    final isFieldNullable = dartType.endsWith('?');

    // Handle special types
    final type = column.type.toLowerCase();
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      if (isFieldNullable) {
        return "'$jsonKey': $name?.toGeoJson(),";
      } else {
        return "'$jsonKey': $name.toGeoJson(),";
      }
    } else if (type == 'jsonb' || type == 'json') {
      return "'$jsonKey': $name,";
    } else if (type.contains('timestamp') ||
        type.contains('date') ||
        type.contains('time')) {
      // Handle DateTime fields with proper formatting based on PostgreSQL type
      final serialization = TypeConverter.generateDateTimeJsonSerialization(
        name, 
        column.type, 
        isFieldNullable
      );
      return "'$jsonKey': $serialization,";
    } else {
      return "'$jsonKey': $name,";
    }
  }

  /// Generate a toJson mapper for UPDATE operations with null checks
  String _generateToJsonUpdateMapper(ColumnInfo column) {
    final name = StringUtils.toVariableName(column.name);
    final jsonKey = column.name;
    final type = column.type.toLowerCase();
    final fieldType = _getDartType(column);
    final isNullable = fieldType.endsWith('?');

    // Handle special types with nullability
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      if (isNullable) {
        return "if ($name != null) '$jsonKey': $name!.toGeoJson(),";
      } else {
        return "'$jsonKey': $name.toGeoJson(),";
      }
    } else if (type == 'jsonb' || type == 'json') {
      if (isNullable) {
        return "if ($name != null) '$jsonKey': $name,";
      } else {
        return "'$jsonKey': $name,";
      }
    } else if (type.contains('timestamp') ||
        type.contains('date') ||
        type.contains('time')) {
      // Handle DateTime fields with proper formatting
      final serialization = TypeConverter.generateDateTimeJsonSerialization(
        name, 
        column.type, 
        isNullable
      );
      if (isNullable) {
        return "if ($name != null) '$jsonKey': $serialization,";
      } else {
        return "'$jsonKey': $serialization,";
      }
    } else {
      // Handle regular fields with nullability
      if (isNullable) {
        return "if ($name != null) '$jsonKey': $name,";
      } else {
        return "'$jsonKey': $name,";
      }
    }
  }

  /// Generate a toJson mapper for INSERT operations with special UUID handling
  String _generateToJsonForInsertMapper(ColumnInfo column) {
    final name = StringUtils.toVariableName(column.name);
    final jsonKey = column.name;
    final type = column.type.toLowerCase();
    
    // Get the actual Dart type to check nullability
    final dartType = _getDartType(column);
    final isFieldNullable = dartType.endsWith('?');

    // Special handling for UUID fields - exclude empty values to allow auto-generation
    if (type == 'uuid' && column.isPrimaryKey) {
      if (isFieldNullable) {
        return "if ($name != null && $name!.isNotEmpty) '$jsonKey': $name,";
      } else {
        return "if ($name.isNotEmpty) '$jsonKey': $name,";
      }
    }

    // Handle special types (same as regular mapper)
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      if (isFieldNullable) {
        return "'$jsonKey': $name?.toGeoJson(),";
      } else {
        return "'$jsonKey': $name.toGeoJson(),";
      }
    } else if (type == 'jsonb' || type == 'json') {
      return "'$jsonKey': $name,";
    } else if (type.contains('timestamp') ||
        type.contains('date') ||
        type.contains('time')) {
      // Handle DateTime fields with proper formatting based on PostgreSQL type
      final serialization = TypeConverter.generateDateTimeJsonSerialization(
        name, 
        column.type, 
        isFieldNullable
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
    
    // Determine if this field should be nullable in Dart (same logic as _getDartType)
    bool shouldBeNullable;
    if (column.isAutoGenerated) {
      shouldBeNullable = true;
    } else if (column.defaultValue != null) {
      shouldBeNullable = true;
    } else {
      shouldBeNullable = column.isNullable;
    }
    final isFieldNullable = shouldBeNullable && config.useNullSafety;

    // Handle geographic types
    if (type == 'geography' || type == 'geometry' || type == 'point') {
      hasGeoFields = true;
      if (isFieldNullable) {
        return "$fieldName: json['$jsonKey'] != null ? _toPoint(json['$jsonKey']) : null,";
      } else {
        return "$fieldName: _toPoint(json['$jsonKey']) ?? Point(latitude: 0, longitude: 0),";
      }
    }

    // Handle interval type
    if (type == 'interval') {
      if (isFieldNullable) {
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
        isFieldNullable,
      );
      return "$fieldName: $conversion,";
    }

    // Handle JSON types
    if (type == 'jsonb' || type == 'json') {
      hasJsonFields = true;
      if (isFieldNullable) {
        return "$fieldName: json['$jsonKey'],";
      } else {
        return "$fieldName: json['$jsonKey'] ?? {},";
      }
    }

    // Handle numeric types
    if (TypeConverter.isNumericType(type)) {
      hasNumericFields = true;
      if (isFieldNullable) {
        return "$fieldName: json['$jsonKey'] != null ? _toDouble(json['$jsonKey']) : null,";
      } else {
        return "$fieldName: _toDouble(json['$jsonKey']) ?? 0.0,";
      }
    }

    // Handle integer types
    if (TypeConverter.isIntegerType(type)) {
      if (isFieldNullable) {
        return "$fieldName: json['$jsonKey'] as int?,";
      } else {
        return "$fieldName: json['$jsonKey'] ?? 0,";
      }
    }

    // Handle boolean types
    if (type == 'boolean' || type == 'bool') {
      if (isFieldNullable) {
        return "$fieldName: json['$jsonKey'] as bool?,";
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
        isFieldNullable,
      );
      return "$fieldName: $conversion,";
    }

    // Handle string types and others
    if (isFieldNullable) {
      return "$fieldName: json['$jsonKey'] as String?,";
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

    // Interval type handling is now done by TypeConverter, so remove this special case

    // Determine if this field should be nullable in Dart
    bool shouldBeNullable;
    
    if (column.isAutoGenerated) {
      // Auto-generated columns should be nullable in Dart even if NOT NULL in database
      // This represents the "not yet assigned" state for new records
      shouldBeNullable = true;
    } else if (column.defaultValue != null) {
      // Columns with defaults should be nullable in Dart to allow using defaults
      shouldBeNullable = true;
    } else {
      // Use the database nullability for other columns
      shouldBeNullable = column.isNullable;
    }

    // Use the TypeConverter to get the standard mapping
    String dartType = TypeConverter.postgresTypeToDart(
      type,
      isNullable: shouldBeNullable,
    );
    
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

    // Check if any tables have datetime fields
    final hasDateTimeFields = tables.any(
      (table) => table.columns.any(
        (col) {
          final type = col.type.toLowerCase();
          return type.contains('timestamp') ||
                 type.contains('date') ||
                 type.contains('time');
        },
      ),
    );

    // Build utility exports
    final utilityExports = <String>[];
    
    if (hasGeoFields) {
      utilityExports.add("export '../utils/geo_json.dart';");
    }
    
    if (hasDateTimeFields) {
      utilityExports.add("export '../utils/app_time.dart';");
    }

    final utilityExportSection = utilityExports.isNotEmpty
        ? "\n// Export utility classes\n${utilityExports.join('\n')}"
        : '';

    return '''// Generated barrel file for models
// Do not modify by hand

$exports$utilityExportSection
''';
  }
}
