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
    sb.writeln("import 'dart:convert';");
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
    
    // Add properties
    for (final column in table.columns) {
      final dartType = TypeConverter.postgresTypeToDart(
        column.type, 
        isNullable: column.isNullable,
      );
      
      final propertyName = StringUtils.toVariableName(column.name);
      
      // Add property documentation if available
      if (column.comment != null) {
        sb.writeln(StringUtils.createDocComment(column.comment));
      }
      
      sb.writeln('  final $dartType $propertyName;');
    }
    
    sb.writeln();
    
    // Add constructor
    sb.writeln('  const $className({');
    for (final column in table.columns) {
      final propertyName = StringUtils.toVariableName(column.name);
      
      if (column.isNullable) {
        sb.writeln('    this.$propertyName,');
      } else {
        sb.writeln('    required this.$propertyName,');
      }
    }
    sb.writeln('  });');
    
    sb.writeln();
    
    // Add fromJson factory
    sb.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
    sb.writeln('    return $className(');
    
    for (final column in table.columns) {
      final propertyName = StringUtils.toVariableName(column.name);
      final dartType = TypeConverter.postgresTypeToDart(column.type);
      
      sb.write('      $propertyName: ');
      
      // Handle special case conversions based on type
      if (dartType.startsWith('DateTime')) {
        sb.write('json[\'${column.name}\'] != null ? ');
        sb.write('DateTime.parse(json[\'${column.name}\'].toString()) : ');
        sb.write(column.isNullable ? 'null' : 'DateTime.now()');
      } 
      else if (dartType.startsWith('Map<String, dynamic>')) {
        sb.write('json[\'${column.name}\'] != null ? ');
        sb.write('json[\'${column.name}\'] is String ? ');
        sb.write('jsonDecode(json[\'${column.name}\']) : ');
        sb.write('json[\'${column.name}\'] : ');
        sb.write(column.isNullable ? 'null' : '{}');
      }
      else if (dartType.startsWith('List<')) {
        sb.write('json[\'${column.name}\'] != null ? ');
        sb.write('(json[\'${column.name}\'] as List).cast<${dartType.substring(5, dartType.length - 1)}>() : ');
        sb.write(column.isNullable ? 'null' : '[]');
      }
      else if (dartType.startsWith('Uint8List')) {
        sb.write('json[\'${column.name}\'] != null ? ');
        sb.write('Uint8List.fromList(List<int>.from(json[\'${column.name}\'])) : ');
        sb.write(column.isNullable ? 'null' : 'Uint8List(0)');
      }
      else {
        sb.write('json[\'${column.name}\']');
        if (!column.isNullable) {
          String defaultValue;
          if (dartType == 'String') {
            defaultValue = "''";
          } else if (dartType == 'int') {
            defaultValue = '0';
          } else if (dartType == 'double') {
            defaultValue = '0.0';
          } else if (dartType == 'bool') {
            defaultValue = 'false';
          } else {
            defaultValue = 'null!';
          }
          sb.write(' ?? $defaultValue');
        }
      }
      
      sb.writeln(',');
    }
    
    sb.writeln('    );');
    sb.writeln('  }');
    
    sb.writeln();
    
    // Add toJson method
    sb.writeln('  Map<String, dynamic> toJson() {');
    sb.writeln('    return {');
    
    for (final column in table.columns) {
      final propertyName = StringUtils.toVariableName(column.name);
      final dartType = TypeConverter.postgresTypeToDart(column.type);
      
      sb.write('      \'${column.name}\': ');
      
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
    for (final column in table.columns) {
      final propertyName = StringUtils.toVariableName(column.name);
      final dartType = TypeConverter.postgresTypeToDart(column.type, isNullable: true);
      
      sb.writeln('    $dartType $propertyName,');
    }
    sb.writeln('  }) {');
    sb.writeln('    return $className(');
    for (final column in table.columns) {
      final propertyName = StringUtils.toVariableName(column.name);
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
    
    // Add exports for each model
    for (final table in tables) {
      final fileName = '${StringUtils.toFileName(table.name)}_model.dart';
      sb.writeln("export '$fileName';");
    }
    
    // Write to file
    await File(filePath).writeAsString(sb.toString());
    
    _logger.info('Generated models barrel file: $filePath');
  }
}