// lib/src/generators/repository_generator.dart
import 'dart:io';
import 'package:path/path.dart' as path;
import '../config/config_model.dart';
import '../schema/table_info.dart';
import '../utils/string_utils.dart';
import '../utils/type_converter.dart';
import '../utils/logger.dart';

class RepositoryGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('RepositoryGenerator');

  RepositoryGenerator(this.config);

  Future<void> generateRepositories(List<TableInfo> tables) async {
    final reposDir = Directory(path.join(config.outputDirectory, 'repositories'));
    if (!reposDir.existsSync()) {
      reposDir.createSync(recursive: true);
    }

    // First, generate the base repository
    await _generateBaseRepository(reposDir.path);

    // Then generate repositories for each table
    for (final table in tables) {
      await _generateRepositoryForTable(table, reposDir.path);
    }

    // Generate barrel file
    await _generateBarrelFile(tables, reposDir.path);

    _logger.info('Generated repositories for ${tables.length} tables');
  }

  Future<void> _generateBaseRepository(String outputDir) async {
    final filePath = path.join(outputDir, 'base_repository.dart');
    
    _logger.info('Generating base repository');

    final sb = StringBuffer();
    
    // Add imports
    sb.writeln("import 'package:supabase_flutter/supabase_flutter.dart';");
    sb.writeln();
    
    // Begin abstract class definition
    sb.writeln('/// Base repository class that all generated repositories extend');
    sb.writeln('abstract class BaseRepository<T> {');
    sb.writeln('  final SupabaseClient client;');
    sb.writeln('  final String tableName;');
    sb.writeln();
    sb.writeln('  const BaseRepository(this.client, this.tableName);');
    sb.writeln();
    sb.writeln('  /// Get the base query builder for this table');
    sb.writeln('  SupabaseQueryBuilder get query => client.from(tableName);');
    sb.writeln();
    sb.writeln('  /// Convert a JSON map to a model instance');
    sb.writeln('  T fromJson(Map<String, dynamic> json);');
    sb.writeln('}');
    
    // Write to file
    await File(filePath).writeAsString(sb.toString());
    
    _logger.info('Generated base repository file: $filePath');
  }

  Future<void> _generateRepositoryForTable(TableInfo table, String outputDir) async {
    final modelClassName = StringUtils.toClassName(
      table.name,
      prefix: config.modelPrefix,
      suffix: config.modelSuffix,
    );
    
    final repoClassName = StringUtils.toClassName(
      table.name,
      prefix: '',
      suffix: config.repositorySuffix,
    );
    
    final fileName = '${StringUtils.toFileName(table.name)}_repository.dart';
    final filePath = path.join(outputDir, fileName);
    
    _logger.info('Generating repository for ${table.name} as $repoClassName');

    final sb = StringBuffer();
    
    // Collect all foreign key tables to add imports
    final foreignKeyColumns = table.columns.where((col) => col.foreignKey != null && col.foreignTable != null).toList();
    final foreignTableImports = <String>{};
    
    for (final fkColumn in foreignKeyColumns) {
      if (fkColumn.foreignTable != null) {
        // Extract the table name from the fully qualified name (schema.table)
        final foreignTableParts = fkColumn.foreignTable!.split('.');
        final foreignTableName = foreignTableParts.length > 1 ? foreignTableParts[1] : foreignTableParts[0];
        
        // Add import for the foreign model
        foreignTableImports.add("import '../models/${StringUtils.toFileName(foreignTableName)}_model.dart';");
      }
    }
    
    // Add imports
    sb.writeln("import 'package:supabase_flutter/supabase_flutter.dart';");
    sb.writeln("import '../models/${StringUtils.toFileName(table.name)}_model.dart';");
    
    // Add imports for foreign key models
    for (final import in foreignTableImports) {
      sb.writeln(import);
    }
    
    sb.writeln("import 'base_repository.dart';");
    sb.writeln();
    
    // Begin class definition
    sb.writeln('/// Repository for the ${table.name} table');
    sb.writeln('class $repoClassName extends BaseRepository<$modelClassName> {');
    sb.writeln('  const $repoClassName(SupabaseClient client) : super(client, \'${table.name}\');');
    sb.writeln();
    sb.writeln('  @override');
    sb.writeln('  $modelClassName fromJson(Map<String, dynamic> json) => $modelClassName.fromJson(json);');
    sb.writeln();
    
    // Find function for primary key
    final primaryKeys = table.columns.where((col) => col.isPrimaryKey).toList();
    final hasPrimaryKey = primaryKeys.isNotEmpty;
    
    if (hasPrimaryKey) {
      // Create a map to track parameter names and ensure uniqueness
      final paramNameMap = <String, int>{};
      
      final pkParams = primaryKeys.map((pk) {
        final dartType = TypeConverter.postgresTypeToDart(pk.type);
        var paramName = StringUtils.toVariableName(pk.name);
        
        // Ensure parameter name is unique by adding a suffix if needed
        if (paramNameMap.containsKey(paramName)) {
          final count = paramNameMap[paramName]! + 1;
          paramNameMap[paramName] = count;
          paramName = '${paramName}$count';
        } else {
          paramNameMap[paramName] = 1;
        }
        
        return '$dartType $paramName';
      }).join(', ');
      
      sb.writeln('  /// Find a record by its primary key');
      sb.writeln('  Future<$modelClassName?> find($pkParams) async {');
      sb.writeln('    final response = await query.select()');
      
      // Reset the map for reuse
      paramNameMap.clear();
      
      for (final pk in primaryKeys) {
        var paramName = StringUtils.toVariableName(pk.name);
        
        // Ensure parameter name is unique by adding a suffix if needed
        if (paramNameMap.containsKey(paramName)) {
          final count = paramNameMap[paramName]! + 1;
          paramNameMap[paramName] = count;
          paramName = '${paramName}$count';
        } else {
          paramNameMap[paramName] = 1;
        }
        
        sb.writeln('        .eq(\'${pk.name}\', $paramName)');
      }
      
      sb.writeln('        .maybeSingle();');
      sb.writeln();
      sb.writeln('    if (response == null) return null;');
      sb.writeln('    return fromJson(response);');
      sb.writeln('  }');
      sb.writeln();
    }
    
    // FindAll function with pagination and sorting
    sb.writeln('  /// Get all records from this table with pagination and sorting');
    sb.writeln('  Future<List<$modelClassName>> findAll({');
    sb.writeln('    int? limit,');
    sb.writeln('    int? offset,');
    sb.writeln('    String? orderBy,');
    sb.writeln('    bool ascending = true,');
    sb.writeln('  }) async {');
    sb.writeln('    dynamic queryBuilder = query.select();');
    sb.writeln();
    sb.writeln('    if (orderBy != null) {');
    sb.writeln('      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);');
    sb.writeln('    }');
    sb.writeln();
    sb.writeln('    if (limit != null) {');
    sb.writeln('      queryBuilder = queryBuilder.limit(limit);');
    sb.writeln('    }');
    sb.writeln();
    sb.writeln('    if (offset != null) {');
    sb.writeln('      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);');
    sb.writeln('    }');
    sb.writeln();
    sb.writeln('    final response = await queryBuilder;');
    sb.writeln('    return (response as List).map((json) => fromJson(json)).toList();');
    sb.writeln('  }');
    sb.writeln();
    
    // Insert function
    sb.writeln('  /// Insert a new record');
    sb.writeln('  Future<$modelClassName> insert($modelClassName model) async {');
    sb.writeln('    final response = await query.insert(model.toJson()).select().single();');
    sb.writeln('    return fromJson(response);');
    sb.writeln('  }');
    sb.writeln();
    
    // Update function
    if (hasPrimaryKey) {
      sb.writeln('  /// Update an existing record');
      sb.writeln('  Future<$modelClassName?> update($modelClassName model) async {');
      sb.writeln('    final queryBuilder = query.update(model.toJson())');
      
      // Use a set to track field names to avoid duplicates
      final processedFields = <String>{};
      
      for (final pk in primaryKeys) {
        final paramName = StringUtils.toVariableName(pk.name);
        // Only add the condition if we haven't processed this field yet
        if (processedFields.add(pk.name)) {
          sb.writeln('        .eq(\'${pk.name}\', model.$paramName)');
        }
      }
      
      sb.writeln('        .select()');
      sb.writeln('        .maybeSingle();');
      sb.writeln();
      sb.writeln('    final response = await queryBuilder;');
      sb.writeln('    if (response == null) return null;');
      sb.writeln('    return fromJson(response);');
      sb.writeln('  }');
      sb.writeln();
    }
    
    // Upsert function
    sb.writeln('  /// Insert or update a record');
    sb.writeln('  Future<$modelClassName> upsert($modelClassName model) async {');
    sb.writeln('    final response = await query');
    sb.writeln('        .upsert(model.toJson())');
    sb.writeln('        .select()');
    sb.writeln('        .single();');
    sb.writeln();
    sb.writeln('    return fromJson(response);');
    sb.writeln('  }');
    sb.writeln();
    
    // Delete function
    if (hasPrimaryKey) {
      // Create a map to track parameter names and ensure uniqueness
      final paramNameMap = <String, int>{};
      
      final pkParams = primaryKeys.map((pk) {
        final dartType = TypeConverter.postgresTypeToDart(pk.type);
        var paramName = StringUtils.toVariableName(pk.name);
        
        // Ensure parameter name is unique by adding a suffix if needed
        if (paramNameMap.containsKey(paramName)) {
          final count = paramNameMap[paramName]! + 1;
          paramNameMap[paramName] = count;
          paramName = '${paramName}$count';
        } else {
          paramNameMap[paramName] = 1;
        }
        
        return '$dartType $paramName';
      }).join(', ');
      
      sb.writeln('  /// Delete a record by its primary key');
      sb.writeln('  Future<void> delete($pkParams) async {');
      sb.writeln('    final queryBuilder = query.delete()');
      
      // Reset the map for reuse
      paramNameMap.clear();
      
      for (final pk in primaryKeys) {
        var paramName = StringUtils.toVariableName(pk.name);
        
        // Ensure parameter name is unique by adding a suffix if needed
        if (paramNameMap.containsKey(paramName)) {
          final count = paramNameMap[paramName]! + 1;
          paramNameMap[paramName] = count;
          paramName = '${paramName}$count';
        } else {
          paramNameMap[paramName] = 1;
        }
        
        sb.writeln('        .eq(\'${pk.name}\', $paramName)');
      }
      
      sb.writeln('        ;');
      sb.writeln('    await queryBuilder;');
      sb.writeln('  }');
      sb.writeln();
    }
    
    // Add additional utility methods for foreign key relationships
    for (final fkColumn in foreignKeyColumns) {
      if (fkColumn.foreignTable != null && fkColumn.foreignKey != null) {
        // Extract the table name from the fully qualified name (schema.table)
        final foreignTableParts = fkColumn.foreignTable!.split('.');
        final foreignTableName = foreignTableParts.length > 1 ? foreignTableParts[1] : foreignTableParts[0];
        
        // Create the proper model class name
        final foreignModelName = StringUtils.toClassName(
          foreignTableName,
          prefix: config.modelPrefix,
          suffix: config.modelSuffix,
        );
        
        sb.writeln('  /// Find related $foreignTableName records');
        sb.writeln('  /// based on the ${fkColumn.name} foreign key');
        
        final methodName = 'findBy${StringUtils.toClassName(fkColumn.name)}';
        final paramName = StringUtils.toVariableName(fkColumn.name);
        final paramType = TypeConverter.postgresTypeToDart(fkColumn.type);
        final nullableSuffix = fkColumn.isNullable ? '?' : '';
        
        sb.writeln('  Future<List<$foreignModelName>> $methodName($paramType$nullableSuffix $paramName) async {');
        sb.writeln('    final queryBuilder = client');
        sb.writeln('        .from(\'$foreignTableName\')');
        sb.writeln('        .select()');
        
        if (fkColumn.isNullable) {
          // Handle nullable parameters correctly by using a non-null value for the query
          sb.writeln('        .eq(\'${fkColumn.foreignKey}\', $paramName as Object);');
        } else {
          sb.writeln('        .eq(\'${fkColumn.foreignKey}\', $paramName);');
        }
        
        sb.writeln();
        sb.writeln('    final response = await queryBuilder;');
        sb.writeln('    return (response as List).map((json) => $foreignModelName.fromJson(json)).toList();');
        sb.writeln('  }');
        sb.writeln();
      }
    }
    
    // Close class definition
    sb.writeln('}');
    
    // Write to file
    await File(filePath).writeAsString(sb.toString());
    
    _logger.info('Generated repository file: $filePath');
  }

  Future<void> _generateBarrelFile(List<TableInfo> tables, String outputDir) async {
    final filePath = path.join(outputDir, 'repositories.dart');
    final sb = StringBuffer();
    
    sb.writeln('// Generated repositories barrel file');
    sb.writeln();
    
    // Add base repository export
    sb.writeln("export 'base_repository.dart';");
    sb.writeln();
    
    // Use a set to track unique export paths
    final uniqueExports = <String>{};
    
    // Add exports for each repository
    for (final table in tables) {
      final fileName = '${StringUtils.toFileName(table.name)}_repository.dart';
      uniqueExports.add("export '$fileName';");
    }
    
    // Write unique exports in sorted order
    for (final export in uniqueExports.toList()..sort()) {
      sb.writeln(export);
    }
    
    // Write to file
    await File(filePath).writeAsString(sb.toString());
    
    _logger.info('Generated repositories barrel file: $filePath');
  }
}