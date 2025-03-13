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
    final needsJsonConvert = table.columns.any(
      (col) =>
          col.type.toLowerCase() == 'json' ||
          col.type.toLowerCase() == 'jsonb' ||
          col.type.toLowerCase().startsWith(
            '_',
          ), // Array types start with underscore
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
    // This map will store the mapping from database column names to Dart property names
    final propertyNameMap = <String, String>{};

    // First pass: generate unique property names for all columns
    for (final column in table.columns) {
      var propertyName = StringUtils.toVariableName(column.name);

      // Check if this property name is already used
      if (propertyNameMap.values.contains(propertyName)) {
        // Find a unique name by adding a suffix
        var suffix = 1;
        var uniquePropertyName = propertyName;
        while (propertyNameMap.values.contains(uniquePropertyName)) {
          uniquePropertyName = '$propertyName$suffix';
          suffix++;
        }
        propertyName = uniquePropertyName;
      }

      // Store the mapping from column name to property name
      propertyNameMap[column.name] = propertyName;
    }

    // Add properties
    for (final column in table.columns) {
      // Check if this is a UUID primary key
      final isUuidPrimaryKey = TypeConverter.isUuidPrimaryKey(column);

      // For UUID primary keys, always make them nullable
      final isNullable = column.isNullable || isUuidPrimaryKey;

      final dartType = TypeConverter.postgresTypeToDart(
        column.type,
        isNullable: isNullable,
      );

      var propertyName = propertyNameMap[column.name]!;

      // Add property documentation if available
      if (column.comment != null) {
        sb.writeln(StringUtils.createDocComment(column.comment));
      }

      sb.writeln('  final $dartType $propertyName;');
    }

    sb.writeln();

    // Add constructor
    sb.writeln('  $className({');

    for (final column in table.columns) {
      var propertyName = propertyNameMap[column.name]!;

      // Check if this is a UUID primary key
      final isUuidPrimaryKey = TypeConverter.isUuidPrimaryKey(column);

      // For UUID primary keys or nullable fields, don't make them required
      if (column.isNullable || isUuidPrimaryKey) {
        sb.writeln('    this.$propertyName,');
      } else {
        sb.writeln('    required this.$propertyName,');
      }
    }
    sb.writeln('  });');

    sb.writeln();

    // Add helper method for numeric conversion only if needed
    final hasNumericFields = table.columns.any(
      (col) =>
          col.type.toLowerCase().contains('int') ||
          col.type.toLowerCase().contains('float') ||
          col.type.toLowerCase().contains('double') ||
          col.type.toLowerCase().contains('decimal') ||
          col.type.toLowerCase().contains('numeric') ||
          col.type.toLowerCase().contains('real'),
    );

    if (hasNumericFields) {
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
    }

    // Add fromJson factory
    sb.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
    sb.writeln('    return $className(');

    for (final column in table.columns) {
      var propertyName = propertyNameMap[column.name]!;

      sb.write('      $propertyName: ');
      sb.write(
        TypeConverter.generateJsonConversion(
          column.name,
          propertyName,
          column.type,
          column.isNullable || TypeConverter.isUuidPrimaryKey(column),
        ),
      );
      sb.writeln(',');
    }

    sb.writeln('    );');
    sb.writeln('  }');

    sb.writeln();

    // Add toJson method
    sb.writeln('  Map<String, dynamic> toJson() {');
    sb.writeln('    final json = <String, dynamic>{};');

    for (final column in table.columns) {
      var propertyName = propertyNameMap[column.name]!;
      var columnKey = column.name;

      final dartType = TypeConverter.postgresTypeToDart(column.type);

      // Check if this is a UUID primary key
      final isUuidPrimaryKey = TypeConverter.isUuidPrimaryKey(column);

      // For UUID primary keys, only include them if they're not null
      if (isUuidPrimaryKey || column.isNullable) {
        sb.writeln('    if ($propertyName != null) {');
        sb.write('      json[\'$columnKey\'] = ');

        // Handle special case conversions based on type
        if (dartType.startsWith('DateTime')) {
          sb.write('$propertyName!.toIso8601String()');
        } else if (dartType.startsWith('Map<')) {
          sb.write('$propertyName');
        } else {
          sb.write('$propertyName');
        }

        sb.writeln(';');
        sb.writeln('    }');
      } else {
        sb.write('    json[\'$columnKey\'] = ');

        // Handle special case conversions based on type
        if (dartType.startsWith('DateTime')) {
          sb.write('$propertyName.toIso8601String()');
        } else if (dartType.startsWith('Map<')) {
          sb.write('$propertyName');
        } else {
          sb.write('$propertyName');
        }

        sb.writeln(';');
      }
    }

    sb.writeln('    return json;');
    sb.writeln('  }');

    // Add copyWith method
    sb.writeln();
    sb.writeln('  $className copyWith({');

    for (final column in table.columns) {
      var propertyName = propertyNameMap[column.name]!;

      final dartType = TypeConverter.postgresTypeToDart(
        column.type,
        isNullable: true,
      );

      sb.writeln('    $dartType $propertyName,');
    }
    sb.writeln('  }) {');
    sb.writeln('    return $className(');

    for (final column in table.columns) {
      var propertyName = propertyNameMap[column.name]!;

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

  Future<void> _generateBarrelFile(
    List<TableInfo> tables,
    String outputDir,
  ) async {
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
