// lib/src/generators/model_generator.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import '../config/config_model.dart';
import '../schema/table_info.dart';
import '../utils/string_utils.dart';
import '../utils/type_converter.dart';
import '../utils/logger.dart';

class ModelGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('ModelGenerator');

  ModelGenerator(this.config);

  Future<void> generateModels(List<TableInfo> tables) async {
    final modelsDir = Directory(path.join(config.outputDirectory, 'models'));
    if (!modelsDir.existsSync()) {
      modelsDir.createSync(recursive: true);
    }

    for (final table in tables) {
      await _generateModelForTable(table, modelsDir.path);
    }

    // Generate barrel file
    await _generateBarrelFile(tables, modelsDir.path);

    _logger.info('Generated models for ${tables.length} tables');
  }

  Future<void> _generateModelForTable(TableInfo table, String outputDir) async {
    final className = StringUtils.toClassName(
      table.name,
      prefix: config.modelPrefix,
      suffix: config.modelSuffix,
    );
    
    final fileName = '${StringUtils.toFileName(table.name)}_model.dart';
    final filePath = path.join(outputDir, fileName);
    
    _logger.info('Generating model for ${table.name} as $className');

    final sb = StringBuffer();
    
    // Add imports
    final needsJsonConvert = table.columns.any((col) => 
      col.type.toLowerCase() == 'json' || 
      col.type.toLowerCase() == 'jsonb' ||
      col.type.toLowerCase().startsWith('_')  // Array types start with underscore
    );
    
    if (needsJsonConvert) {
      sb.writeln("import 'dart:convert';");
    }
    
    // Check if we need Uint8List for bytea columns
    if (table.columns.any((col) => col.type.toLowerCase() == 'bytea')) {
      sb.writeln("import 'dart:typed_data';");
    }
    sb.writeln();
    
    // Add class documentation if available
    if (table.comment != null) {
      sb.writeln(StringUtils.createDocComment(table.comment));
    }
    
    // Begin class definition
    sb.writeln('class $className {');
    
    // Create a map to track property names and ensure uniqueness
    final propertyNameMap = <String, int>{};
    
    // Add properties
    for (final column in table.columns) {
      final dartType = TypeConverter.postgresTypeToDart(
        column.type, 
        isNullable: column.isNullable,
      );
      
      var propertyName = StringUtils.toVariableName(column.name);
      
      // Ensure property name is unique by adding a suffix if needed
      if (propertyNameMap.containsKey(propertyName)) {
        final count = propertyNameMap[propertyName]! + 1;
        propertyNameMap[propertyName] = count;
        propertyName = '${propertyName}$count';
      } else {
        propertyNameMap[propertyName] = 1;
      }
      
      // Add property documentation if available
      if (column.comment != null) {
        sb.writeln(StringUtils.createDocComment(column.comment));
      }
      
      sb.writeln('  final $dartType $propertyName;');
    }
    
    sb.writeln();
    
    // Add constructor
    sb.writeln('  $className({');
    
    // Reset the property name map for reuse
    propertyNameMap.clear();
    
    for (final column in table.columns) {
      var propertyName = StringUtils.toVariableName(column.name);
      
      // Ensure property name is unique by adding a suffix if needed
      if (propertyNameMap.containsKey(propertyName)) {
        final count = propertyNameMap[propertyName]! + 1;
        propertyNameMap[propertyName] = count;
        propertyName = '${propertyName}$count';
      } else {
        propertyNameMap[propertyName] = 1;
      }
      
      if (column.isNullable) {
        sb.writeln('    this.$propertyName,');
      } else {
        sb.writeln('    required this.$propertyName,');
      }
    }
    sb.writeln('  });');
    
    sb.writeln();
    
    // Add helper method for numeric conversion
    sb.writeln('  // Helper method to safely convert numeric values');
    sb.writeln('  static double? _toDouble(dynamic value) {');
    sb.writeln('    if (value == null) return null;');
    sb.writeln('    if (value is double) return value;');
    sb.writeln('    if (value is int) return value.toDouble();');
    sb.writeln('    if (value is String) {');
    sb.writeln('      try {');
    sb.writeln('        return double.parse(value);');
    sb.writeln('      } catch (_) {}');
    sb.writeln('    }');
    sb.writeln('    return null;');
    sb.writeln('  }');
    sb.writeln();
    
    // Add fromJson factory
    sb.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
    sb.writeln('    return $className(');
    
    // Reset the property name map for reuse
    propertyNameMap.clear();
    
    for (final column in table.columns) {
      var propertyName = StringUtils.toVariableName(column.name);
      
      // Ensure property name is unique by adding a suffix if needed
      if (propertyNameMap.containsKey(propertyName)) {
        final count = propertyNameMap[propertyName]! + 1;
        propertyNameMap[propertyName] = count;
        propertyName = '${propertyName}$count';
      } else {
        propertyNameMap[propertyName] = 1;
      }
      
      sb.write('      $propertyName: ');
      sb.write(TypeConverter.generateJsonConversion(
        column.name, 
        propertyName, 
        column.type, 
        column.isNullable
      ));
      sb.writeln(',');
    }
    
    sb.writeln('    );');
    sb.writeln('  }');
    
    sb.writeln();
    
    // Add toJson method
    sb.writeln('  Map<String, dynamic> toJson() {');
    sb.writeln('    return {');
    
    // Reset the property name map for reuse
    propertyNameMap.clear();
    
    // Track used column names to ensure unique keys
    final usedColumnNames = <String, int>{};
    
    for (final column in table.columns) {
      var propertyName = StringUtils.toVariableName(column.name);
      var columnKey = column.name;
      
      // Ensure property name is unique by adding a suffix if needed
      if (propertyNameMap.containsKey(propertyName)) {
        final count = propertyNameMap[propertyName]! + 1;
        propertyNameMap[propertyName] = count;
        propertyName = '${propertyName}$count';
      } else {
        propertyNameMap[propertyName] = 1;
      }
      
      // Ensure column key is unique by adding a suffix if needed
      if (usedColumnNames.containsKey(columnKey)) {
        final count = usedColumnNames[columnKey]! + 1;
        usedColumnNames[columnKey] = count;
        columnKey = '${columnKey}_$count';
      } else {
        usedColumnNames[columnKey] = 1;
      }
      
      final dartType = TypeConverter.postgresTypeToDart(column.type);
      
      sb.write('      \'$columnKey\': ');
      
      // Handle special case conversions based on type
      if (dartType.startsWith('DateTime')) {
        if (column.isNullable) {
          sb.write('$propertyName?.toIso8601String()');
        } else {
          sb.write('$propertyName.toIso8601String()');
        }
      }
      else if (dartType.startsWith('Map<')) {
        if (column.isNullable) {
          sb.write('$propertyName');
        } else {
          sb.write('$propertyName');
        }
      } 
      else {
        sb.write('$propertyName');
      }
      
      sb.writeln(',');
    }
    
    sb.writeln('    };');
    sb.writeln('  }');
    
    // Add copyWith method
    sb.writeln();
    sb.writeln('  $className copyWith({');
    
    // Reset the property name map for reuse
    propertyNameMap.clear();
    
    for (final column in table.columns) {
      var propertyName = StringUtils.toVariableName(column.name);
      
      // Ensure property name is unique by adding a suffix if needed
      if (propertyNameMap.containsKey(propertyName)) {
        final count = propertyNameMap[propertyName]! + 1;
        propertyNameMap[propertyName] = count;
        propertyName = '${propertyName}$count';
      } else {
        propertyNameMap[propertyName] = 1;
      }
      
      final dartType = TypeConverter.postgresTypeToDart(column.type, isNullable: true);
      
      sb.writeln('    $dartType $propertyName,');
    }
    sb.writeln('  }) {');
    sb.writeln('    return $className(');
    
    // Reset the property name map for reuse
    propertyNameMap.clear();
    
    for (final column in table.columns) {
      var propertyName = StringUtils.toVariableName(column.name);
      
      // Ensure property name is unique by adding a suffix if needed
      if (propertyNameMap.containsKey(propertyName)) {
        final count = propertyNameMap[propertyName]! + 1;
        propertyNameMap[propertyName] = count;
        propertyName = '${propertyName}$count';
      } else {
        propertyNameMap[propertyName] = 1;
      }
      
      sb.writeln('      $propertyName: $propertyName ?? this.$propertyName,');
    }
    sb.writeln('    );');
    sb.writeln('  }');
    
    // Close class definition
    sb.writeln('}');
    
    // Write to file
    await File(filePath).writeAsString(sb.toString());
    
    _logger.info('Generated model file: $filePath');
  }

  Future<void> _generateBarrelFile(List<TableInfo> tables, String outputDir) async {
    final filePath = path.join(outputDir, 'models.dart');
    final sb = StringBuffer();
    
    sb.writeln('// Generated models barrel file');
    sb.writeln();
    
    // Use a set to track unique export paths
    final uniqueExports = <String>{};
    
    // Add exports for each model
    for (final table in tables) {
      final fileName = '${StringUtils.toFileName(table.name)}_model.dart';
      uniqueExports.add("export '$fileName';");
    }
    
    // Write unique exports in sorted order
    for (final export in uniqueExports.toList()..sort()) {
      sb.writeln(export);
    }
    
    // Write to file
    await File(filePath).writeAsString(sb.toString());
    
    _logger.info('Generated models barrel file: $filePath');
  }
}