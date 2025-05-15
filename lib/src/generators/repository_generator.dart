import 'dart:io';
import 'package:path/path.dart' as path;

import '../config/config_model.dart';
import '../schema/table_info.dart';
import '../utils/logger.dart';
import '../utils/string_utils.dart';

class RepositoryGenerator {
  final SupabaseGenConfig config;
  final Logger _logger = Logger('RepositoryGenerator');

  RepositoryGenerator(this.config);

  Future<void> generateRepositories(List<TableInfo> tables) async {
    // Generate base repository
    await _generateBaseRepository();
    _logger.info('Generated base repository file: ${path.join(config.outputDirectory, 'repositories', 'base_repository.dart')}');

    // Generate repositories for each table, passing the full list of tables for validation
    for (final table in tables) {
      await _generateRepositoryForTable(table, tables);
    }

    // Generate barrel file
    final barrelContent = _generateBarrelFile(tables);
    final barrelPath = path.join(config.outputDirectory, 'repositories', 'repositories.dart');
    await File(barrelPath).writeAsString(barrelContent);
    _logger.info('Generated repositories barrel file: $barrelPath');

    _logger.info('Generated repositories for ${tables.length} tables');
  }

  Future<void> _generateBaseRepository() async {
    final dir = Directory(path.join(config.outputDirectory, 'repositories'));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    final filePath = path.join(dir.path, 'base_repository.dart');
    final content = '''import 'package:supabase_flutter/supabase_flutter.dart';

/// Base repository class that all generated repositories extend
abstract class BaseRepository<T> {
  final SupabaseClient client;
  final String tableName;

  const BaseRepository(this.client, this.tableName);

  /// Get the base query builder for this table
  SupabaseQueryBuilder get query => client.from(tableName);

  /// Convert a JSON map to a model instance
  T fromJson(Map<String, dynamic> json);

  /// Get all records from this table with pagination, sorting and filtering
  Future<List<T>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    List<String>? select, // Fields to select
  }) async {
    // Start with a select query
    dynamic queryBuilder = select != null 
        ? query.select(select.join(','))
        : query.select();
    
    // Apply filters if provided
    if (filters != null) {
      // Apply each filter as an equality condition
      filters.forEach((key, value) {
        if (value != null) {
          queryBuilder = queryBuilder.eq(key, value);
        }
      });
    }
    
    // Apply ordering if provided
    if (orderBy != null) {
      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);
    }

    // Apply limit if provided
    if (limit != null) {
      queryBuilder = queryBuilder.limit(limit);
    }

    // Apply pagination range if provided
    if (offset != null) {
      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);
    }

    // Execute the query
    final response = await queryBuilder;
    
    // Convert the response to model instances
    return (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Find a single record by ID
  Future<T?> find(String id) async {
    final response = await query.select().eq('id', id).maybeSingle();
    if (response == null) return null;
    return fromJson(response);
  }
  
  /// Find a single record by a specific field value
  Future<T?> findBy(String field, dynamic value) async {
    final response = await query.select().eq(field, value).maybeSingle();
    if (response == null) return null;
    return fromJson(response);
  }
  
  /// Find records matching multiple field values (AND condition)
  Future<List<T>> findWhere(Map<String, dynamic> conditions) async {
    dynamic queryBuilder = query.select();
    
    // Apply each condition as an equality filter
    conditions.forEach((key, value) {
      if (value != null) {
        queryBuilder = queryBuilder.eq(key, value);
      }
    });
    
    final response = await queryBuilder;
    return (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count records in this table, optionally filtered
  Future<int> count({Map<String, dynamic>? filters}) async {
    // Start with a select query and use count method
    dynamic queryBuilder = query.select();
    
    // Apply filters if provided
    if (filters != null) {
      filters.forEach((key, value) {
        if (value != null) {
          queryBuilder = queryBuilder.eq(key, value);
        }
      });
    }
    
    // Apply count operation after filters
    queryBuilder = queryBuilder.count();
    
    final response = await queryBuilder;
    
    // Extract count from the response
    if (response.count != null) {
      return response.count;
    } else if (response.data is List) {
      return (response.data as List).length;
    }
    return 0;
  }

  /// Insert a new record
  Future<T> insert(T model) async {
    final dynamic json = (model as dynamic).toJson();
    if (json is Map<String, dynamic> && json.containsKey('id') && json['id'] == null) {
      json.remove('id'); // Remove null ID for auto-generation
    }
    
    final response = await query.insert(json).select();
    
    if ((response as List<dynamic>).isNotEmpty) {
      return fromJson(response.first as Map<String, dynamic>);
    }
    
    throw Exception('Failed to insert record');
  }
  
  /// Insert multiple records in a single operation
  Future<List<T>> insertMany(List<T> models) async {
    if (models.isEmpty) return [];
    
    final jsonList = models.map((model) {
      final dynamic json = (model as dynamic).toJson();
      if (json is Map<String, dynamic> && json.containsKey('id') && json['id'] == null) {
        json.remove('id'); // Remove null ID for auto-generation
      }
      return json;
    }).toList();
    
    final response = await query.insert(jsonList).select();
    return (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Update an existing record
  Future<T?> update(T model) async {
    final dynamic json = (model as dynamic).toJson();
    if (json is Map<String, dynamic> && (!json.containsKey('id') || json['id'] == null)) {
      throw Exception('Cannot update record without ID');
    }
    
    final response = await query
        .update(json)
        .eq('id', json['id'])
        .select();
    
    final results = response as List;
    if (results.isNotEmpty) {
      return fromJson(results.first);
    }
    
    return null;
  }
  
  /// Update specific fields on records matching a condition
  Future<List<T>> updateWhere(
    Map<String, dynamic> values, 
    Map<String, dynamic> conditions
  ) async {
    if (values.isEmpty || conditions.isEmpty) {
      throw Exception('Both values and conditions must be provided');
    }
    
    dynamic updateBuilder = query.update(values);
    
    // Apply conditions
    conditions.forEach((key, value) {
      if (value != null) {
        updateBuilder = updateBuilder.eq(key, value);
      }
    });
    
    final response = await updateBuilder.select();
    return (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Upsert a record (insert or update)
  Future<T> upsert(T model) async {
    final dynamic json = (model as dynamic).toJson();
    final response = await query.upsert(json).select();
    
    final results = response as List;
    if (results.isNotEmpty) {
      return fromJson(results.first);
    }
    
    throw Exception('Failed to upsert record');
  }
  
  /// Upsert multiple records in a single operation
  Future<List<T>> upsertMany(List<T> models) async {
    if (models.isEmpty) return [];
    
    final jsonList = models.map((model) => (model as dynamic).toJson()).toList();
    
    final response = await query.upsert(jsonList).select();
    return (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }

  /// Delete a record by ID
  Future<void> delete(String id) async {
    await query.delete().eq('id', id);
  }
  
  /// Delete records matching a condition
  Future<void> deleteWhere(Map<String, dynamic> conditions) async {
    if (conditions.isEmpty) {
      throw Exception('Cannot delete with empty conditions - this would delete all records');
    }
    
    dynamic deleteBuilder = query.delete();
    
    // Apply conditions
    conditions.forEach((key, value) {
      if (value != null) {
        deleteBuilder = deleteBuilder.eq(key, value);
      }
    });
    
    await deleteBuilder;
  }
  
  /// Check if a record exists by ID
  Future<bool> exists(String id) async {
    final response = await query
        .select('id')
        .eq('id', id)
        .maybeSingle();
    return response != null;
  }
  
  /// Check if any records exist matching conditions
  Future<bool> existsWhere(Map<String, dynamic> conditions) async {
    if (conditions.isEmpty) return false;
    
    dynamic queryBuilder = query.select('id').limit(1);
    
    // Apply conditions
    conditions.forEach((key, value) {
      if (value != null) {
        queryBuilder = queryBuilder.eq(key, value);
      }
    });
    
    final response = await queryBuilder;
    return (response as List).isNotEmpty;
  }
}
''';

    await File(filePath).writeAsString(content);
  }

  Future<void> _generateRepositoryForTable(TableInfo table, List<TableInfo> allTables) async {
    // Use the config method to get consistent class names
    final className = config.getRepositoryClassName(table.name);
    final modelClassName = config.getModelClassName(table.name);
    final fileName = '${table.name}_repository.dart';
    
    final dir = Directory(path.join(config.outputDirectory, 'repositories'));
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }
    
    final filePath = path.join(dir.path, fileName);
    final fileContent = _generateRepositoryClass(table, className, modelClassName, allTables);
    
    await File(filePath).writeAsString(fileContent);
    _logger.info('Generated repository file: $filePath');
  }

  String _generateRepositoryClass(TableInfo table, String className, String modelClassName, List<TableInfo> allTables) {
    // First import barrel file for models
    String imports = "import 'package:supabase_flutter/supabase_flutter.dart';\n";
    imports += "import '../models/models.dart';\n";
    imports += "import './base_repository.dart';\n";
    
    return '''$imports

class $className extends BaseRepository<$modelClassName> {
  $className(SupabaseClient client) : super(client, '${table.name}');
  
  @override
  $modelClassName fromJson(Map<String, dynamic> json) {
    return $modelClassName.fromJson(json);
  }
${_generateRelatedRepositoryMethods(table, modelClassName, allTables)}
}
''';
  }

  /// Get a list of related table names from columns that appear to be foreign keys
  List<String> _getRelatedTableNames(TableInfo table, [List<TableInfo>? allTables]) {
    final relatedTables = <String>{};
    
    // Find columns that are references to other tables
    for (final column in table.columns) {
      // If we have explicit foreign key info
      if (column.foreignTable != null) {
        if (_isKnownTable(column.foreignTable!, allTables)) {
          relatedTables.add(column.foreignTable!);
        }
      }
      // Try to guess from column name (e.g., user_id -> users)
      else if (column.name.endsWith('_id')) {
        final possibleTable = _guessTableNameFromColumn(column.name);
        if (_isKnownTable(possibleTable, allTables)) {
          relatedTables.add(possibleTable);
        }
      }
    }
    
    return relatedTables.toList();
  }
  
  /// Check if a table name exists in our real database schema and is included for generation
  bool _isKnownTable(String tableName, [List<TableInfo>? allTables]) {
    // Strip public. prefix if present
    final cleanTableName = tableName.startsWith('public.') ? tableName.substring(7) : tableName;
    
    // First, check if the table exists in our probe tables list
    // This is the primary check for remote Supabase connections
    if (config.probeTables.isNotEmpty) {
      if (!config.probeTables.contains(cleanTableName)) {
        return false; // Not in our probe tables list
      }
    }
    
    // If include tables are specified, it must be in that list
    if (config.includeTables.isNotEmpty) {
      // Check for direct name or with wildcards
      bool included = false;
      for (final includePattern in config.includeTables) {
        final parts = includePattern.split('.');
        if (parts.length == 2 && parts[0] == 'public' && _matchesPattern(cleanTableName, parts[1])) {
          included = true;
          break;
        } else if (_matchesPattern(cleanTableName, includePattern)) {
          included = true;
          break;
        }
      }
      if (!included) return false;
    }
    
    // Check exclusion list
    for (final excludePattern in config.excludeTables) {
      final parts = excludePattern.split('.');
      if (parts.length == 2 && parts[0] == 'public' && _matchesPattern(cleanTableName, parts[1])) {
        return false; // Explicitly excluded
      } else if (_matchesPattern(cleanTableName, excludePattern)) {
        return false; // Explicitly excluded
      }
    }
    
    // Only include the table if it's part of the tables that we're actually generating
    if (allTables != null) {
      return allTables.any((table) => table.name == cleanTableName);
    }
    
    // If we can't verify against actual tables list, use the more restrictive approach
    return config.probeTables.contains(cleanTableName);
  }
  
  /// Helper to match patterns with wildcards
  bool _matchesPattern(String text, String pattern) {
    if (pattern == '*') return true;
    if (pattern.contains('*')) {
      final regex = RegExp('^${pattern.replaceAll('*', '.*')}\$');
      return regex.hasMatch(text);
    }
    return text == pattern;
  }
  
  /// Try to guess a table name from a column name (e.g., user_id -> users)
  String _guessTableNameFromColumn(String columnName) {
    if (columnName.endsWith('_id')) {
      final baseName = columnName.substring(0, columnName.length - 3);
      // Handle common singular/plural cases
      if (baseName.endsWith('y')) {
        return '${baseName.substring(0, baseName.length - 1)}ies';
      } else if (!baseName.endsWith('s')) {
        return '${baseName}s';
      }
      return baseName;
    }
    return columnName;
  }

  String _generateRelatedRepositoryMethods(TableInfo table, String modelClassName, [List<TableInfo>? allTables]) {
    final methods = <String>[];
    final methodNames = <String>{}; // Track generated method names to avoid duplicates
    
    // 1. Generate methods to get parent records (existing functionality - foreign key relationships)
    for (final column in table.columns) {
      String? relatedTableName;
      String paramName = column.name;
      
      // If we have explicit foreign key info
      if (column.foreignTable != null) {
        if (_isKnownTable(column.foreignTable!, allTables)) {
          relatedTableName = column.foreignTable!;
        }
      }
      // Try to guess from column name (e.g., user_id -> users)
      else if (column.name.endsWith('_id')) {
        final possibleTable = _guessTableNameFromColumn(column.name);
        if (_isKnownTable(possibleTable, allTables)) {
          relatedTableName = possibleTable;
        }
      }
      
      if (relatedTableName != null) {
        // Strip public. prefix if present
        final cleanTableName = relatedTableName.startsWith('public.') ? relatedTableName.substring(7) : relatedTableName;
        
        // Double check that the table exists in our actual database or probe tables
        if (allTables != null) {
          if (!allTables.any((t) => t.name == cleanTableName) && !config.probeTables.contains(cleanTableName)) {
            _logger.info('Skipping relation method for ${cleanTableName} as it does not exist in actual tables');
            continue;
          }
        } else if (!config.probeTables.contains(cleanTableName)) {
          _logger.info('Skipping relation method for ${cleanTableName} as it is not in probe_tables');
          continue;
        }
        
        // Use direct model class name without Public namespace
        final relatedModelClassName = config.getModelClassName(cleanTableName);
        
        final cleanParamName = paramName.endsWith('_id') 
            ? paramName.substring(0, paramName.length - 3) 
            : paramName;
        
        // Method name tracking to avoid duplicates
        final methodName = "get${StringUtils.toClassName(cleanParamName)}";
        if (methodNames.contains(methodName)) {
          _logger.info('Skipping duplicate method: $methodName');
          continue;
        }
        
        methodNames.add(methodName);
        methods.add('''
  /// Get the ${cleanParamName} record associated with this ${table.name}
  /// 
  /// This retrieves the parent ${cleanParamName} record for this ${table.name}.
  /// It represents a foreign key relationship from ${table.name}.${paramName} to ${cleanTableName}.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<${relatedModelClassName}?> get${StringUtils.toClassName(cleanParamName)}(String ${StringUtils.toCamelCase(cleanParamName)}Id) async {
    final result = await client
        .from('${cleanTableName}')
        .select()
        .eq('id', ${StringUtils.toCamelCase(cleanParamName)}Id)
        .maybeSingle();
    
    if (result == null) return null;
    return ${relatedModelClassName}.fromJson(result);
  }
  
  /// Check if the ${cleanParamName} record exists for this ${table.name}
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.${cleanParamName}Exists(message.userId);
  /// ```
  Future<bool> ${cleanParamName}Exists(String ${StringUtils.toCamelCase(cleanParamName)}Id) async {
    final result = await client
        .from('${cleanTableName}')
        .select('id')
        .eq('id', ${StringUtils.toCamelCase(cleanParamName)}Id)
        .maybeSingle();
    
    return result != null;
  }''');
      }
    }
    
    // 2. Generate methods to get child records (inverse relationships)
    if (allTables != null) {
      for (final relatedTable in allTables) {
        // Skip self-references to avoid duplication
        if (relatedTable.name == table.name) continue;
        
        // Look for columns in the related table that reference this table
        for (final column in relatedTable.columns) {
          String? referencedTable;
          
          // Check if column has an explicit foreign key to this table
          if (column.foreignTable != null) {
            final cleanForeignTable = column.foreignTable!.startsWith('public.') 
                ? column.foreignTable!.substring(7) 
                : column.foreignTable!;
            
            if (cleanForeignTable == table.name) {
              referencedTable = relatedTable.name;
              _logger.info('Found relationship: ${table.name} has ${relatedTable.name} through FK ${column.name}');
            }
          }
          // Try to guess from column name (e.g., user_id -> users)
          else if (column.name.endsWith('_id')) {
            final possibleTable = _guessTableNameFromColumn(column.name);
            final cleanPossibleTable = possibleTable.startsWith('public.') 
                ? possibleTable.substring(7) 
                : possibleTable;
                
            if (cleanPossibleTable == table.name) {
              referencedTable = relatedTable.name;
            }
          }
          
          if (referencedTable != null) {
            // Generate the method to get child records
            final relatedModelClassName = config.getModelClassName(referencedTable);
            final cleanColumnName = column.name.endsWith('_id') 
                ? column.name.substring(0, column.name.length - 3) 
                : column.name;
            
            // Determine if this is likely a one-to-many or many-to-many relationship
            final isJunctionTable = _isLikelyJunctionTable(relatedTable);
            
            if (isJunctionTable) {
              // For junction tables, generate methods to get records through the junction
              // First, find the "other" foreign key column in the junction table
              final otherForeignKeyColumns = relatedTable.columns
                  .where((c) => c.name.endsWith('_id') && c.name != column.name)
                  .toList();
              
              if (otherForeignKeyColumns.isNotEmpty) {
                for (final otherColumn in otherForeignKeyColumns) {
                  String? otherTableName;
                  
                  // Get the table the other column references
                  if (otherColumn.foreignTable != null) {
                    otherTableName = otherColumn.foreignTable!.startsWith('public.') 
                        ? otherColumn.foreignTable!.substring(7) 
                        : otherColumn.foreignTable!;
                  } else {
                    otherTableName = _guessTableNameFromColumn(otherColumn.name);
                  }
                  
                  if (_isKnownTable(otherTableName, allTables)) {
                    final otherModelClassName = config.getModelClassName(otherTableName);
                    final cleanOtherColumnName = otherColumn.name.endsWith('_id') 
                        ? otherColumn.name.substring(0, otherColumn.name.length - 3) 
                        : otherColumn.name;
                    
                    // Correctly handle pluralization for method names
                    final methodSuffix = cleanOtherColumnName.endsWith('s') ? 
                      StringUtils.toClassName(cleanOtherColumnName) : 
                      StringUtils.toClassName(StringUtils.pluralize(cleanOtherColumnName));
                    
                    // Check for duplicate methods
                    final getMethodName = "get$methodSuffix";
                    final hasMethodName = "has${StringUtils.toClassName(cleanOtherColumnName)}";
                    final addMethodName = "add${StringUtils.toClassName(cleanOtherColumnName)}";
                    final removeMethodName = "remove${StringUtils.toClassName(cleanOtherColumnName)}";
                    
                    if (methodNames.contains(getMethodName)) {
                      _logger.info('Skipping duplicate method: $getMethodName');
                      continue;
                    }
                    
                    methodNames.add(getMethodName);
                    methodNames.add(hasMethodName);
                    methodNames.add(addMethodName);
                    methodNames.add(removeMethodName);
                    
                    // Generate method to get items through the junction table
                    methods.add('''
  /// Get all ${StringUtils.pluralize(otherTableName)} associated with this ${table.name}
  /// 
  /// This is a many-to-many relationship through the ${relatedTable.name} junction table.
  /// It will return all ${StringUtils.pluralize(otherTableName)} linked to the given ${table.name}Id.
  /// 
  /// Example:
  /// ```dart
  /// // Get all games that a user is part of
  /// final games = await usersRepository.getGames(userId);
  /// ```
  Future<List<${otherModelClassName}>> get$methodSuffix(String ${StringUtils.toCamelCase(table.name)}Id) async {
    // First get junction records
    final junctionResult = await client
        .from('${relatedTable.name}')
        .select('${otherColumn.name}')
        .eq('${column.name}', ${StringUtils.toCamelCase(table.name)}Id);
    
    final junctionData = junctionResult as List<dynamic>;
    if (junctionData.isEmpty) {
      return [];
    }
    
    // Extract the IDs
    final ids = junctionData
        .map((item) => (item as Map<String, dynamic>)['${otherColumn.name}'] as String?)
        .where((id) => id != null)
        .map((id) => id!)
        .toList();
    
    if (ids.isEmpty) {
      return [];
    }
    
    // Now get the actual records
    final result = await client
        .from('${otherTableName}')
        .select()
        .inFilter('id', ids);
    
    final resultData = result as List<dynamic>;
    
    return resultData
        .map((item) => ${otherModelClassName}.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Shorthand method to check if a ${StringUtils.toVariableName(otherTableName)} is associated with this ${table.name}
  /// through the ${relatedTable.name} junction table.
  /// 
  /// Example:
  /// ```dart
  /// // Check if a user is part of a specific game
  /// final isPartOfGame = await usersRepository.has${StringUtils.toClassName(cleanOtherColumnName)}(userId, gameId);
  /// ```
  Future<bool> has${StringUtils.toClassName(cleanOtherColumnName)}(
    String ${StringUtils.toCamelCase(table.name)}Id, 
    String ${StringUtils.toCamelCase(cleanOtherColumnName)}Id
  ) async {
    final result = await client
        .from('${relatedTable.name}')
        .select()
        .eq('${column.name}', ${StringUtils.toCamelCase(table.name)}Id)
        .eq('${otherColumn.name}', ${StringUtils.toCamelCase(cleanOtherColumnName)}Id)
        .maybeSingle();
    
    return result != null;
  }
  
  /// Add a relationship between this ${table.name} and a ${cleanOtherColumnName}
  /// using the ${relatedTable.name} junction table.
  /// 
  /// Example:
  /// ```dart
  /// // Add a user to a game
  /// await usersRepository.add${StringUtils.toClassName(cleanOtherColumnName)}(userId, gameId);
  /// ```
  Future<void> add${StringUtils.toClassName(cleanOtherColumnName)}(
    String ${StringUtils.toCamelCase(table.name)}Id, 
    String ${StringUtils.toCamelCase(cleanOtherColumnName)}Id
  ) async {
    // Check if relationship already exists
    final exists = await has${StringUtils.toClassName(cleanOtherColumnName)}(${StringUtils.toCamelCase(table.name)}Id, ${StringUtils.toCamelCase(cleanOtherColumnName)}Id);
    if (exists) return;
    
    // Create the relationship
    await client
        .from('${relatedTable.name}')
        .insert({
          '${column.name}': ${StringUtils.toCamelCase(table.name)}Id,
          '${otherColumn.name}': ${StringUtils.toCamelCase(cleanOtherColumnName)}Id,
        });
  }
  
  /// Remove a relationship between this ${table.name} and a ${cleanOtherColumnName}
  /// using the ${relatedTable.name} junction table.
  /// 
  /// Example:
  /// ```dart
  /// // Remove a user from a game
  /// await usersRepository.remove${StringUtils.toClassName(cleanOtherColumnName)}(userId, gameId);
  /// ```
  Future<void> remove${StringUtils.toClassName(cleanOtherColumnName)}(
    String ${StringUtils.toCamelCase(table.name)}Id, 
    String ${StringUtils.toCamelCase(cleanOtherColumnName)}Id
  ) async {
    await client
        .from('${relatedTable.name}')
        .delete()
        .eq('${column.name}', ${StringUtils.toCamelCase(table.name)}Id)
        .eq('${otherColumn.name}', ${StringUtils.toCamelCase(cleanOtherColumnName)}Id);
  }''');
                  }
                }
              }
            } else {
              // Standard one-to-many relationship
              final methodSuffix = referencedTable.endsWith('s') ? 
                StringUtils.toClassName(referencedTable) : 
                StringUtils.toClassName(StringUtils.pluralize(referencedTable));
              
              // Check for duplicate methods
              final getMethodName = "get$methodSuffix";
              final findMethodName = "find$methodSuffix";
              final countMethodName = "count$methodSuffix";
              
              if (methodNames.contains(getMethodName)) {
                _logger.info('Skipping duplicate one-to-many method: $getMethodName');
                continue;
              }
              
              methodNames.add(getMethodName);
              methodNames.add(findMethodName);
              methodNames.add(countMethodName);
              
              methods.add('''
  /// Get all ${StringUtils.pluralize(referencedTable)} associated with this ${table.name}
  /// 
  /// This is a one-to-many relationship where a ${table.name} has many ${StringUtils.pluralize(referencedTable)}.
  /// It will return all ${StringUtils.pluralize(referencedTable)} linked to the given ${table.name}Id via
  /// the ${column.name} foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.get${methodSuffix}(roomId);
  /// ```
  Future<List<${relatedModelClassName}>> get${methodSuffix}(String ${StringUtils.toCamelCase(table.name)}Id) async {
    final result = await client
        .from('${referencedTable}')
        .select()
        .eq('${column.name}', ${StringUtils.toCamelCase(table.name)}Id);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ${relatedModelClassName}.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all ${StringUtils.pluralize(referencedTable)} associated with this ${table.name} with pagination and sorting
  /// 
  /// This is an enhanced version of get${methodSuffix} that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.find${methodSuffix}(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<${relatedModelClassName}>> find${methodSuffix}(
    String ${StringUtils.toCamelCase(table.name)}Id, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('${referencedTable}').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('${column.name}', ${StringUtils.toCamelCase(table.name)}Id);
    
    // Apply additional filters if provided
    if (additionalFilters != null) {
      additionalFilters.forEach((key, value) {
        if (value != null) {
          queryBuilder = queryBuilder.eq(key, value);
        }
      });
    }
    
    // Apply ordering if provided
    if (orderBy != null) {
      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);
    }
    
    // Apply limit if provided
    if (limit != null) {
      queryBuilder = queryBuilder.limit(limit);
    }
    
    // Apply pagination range if provided
    if (offset != null) {
      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);
    }
    
    // Execute the query
    final response = await queryBuilder;
    
    // Convert the response to model instances
    return (response as List<dynamic>).map((json) => ${relatedModelClassName}.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of ${StringUtils.pluralize(referencedTable)} associated with this ${table.name}
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.count${methodSuffix}(roomId);
  /// ```
  Future<int> count${methodSuffix}(String ${StringUtils.toCamelCase(table.name)}Id) async {
    final result = await client
        .from('${referencedTable}')
        .select()
        .eq('${column.name}', ${StringUtils.toCamelCase(table.name)}Id)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }''');
            }
          }
        }
      }
    }
    
    return methods.join('\n\n');
  }
  
  /// Determines if a table is likely a junction/pivot table based on its structure
  bool _isLikelyJunctionTable(TableInfo table) {
    // A junction table typically has at least two foreign key columns
    // and a very small number of additional columns (often just id, created_at)
    final foreignKeyColumns = table.columns.where((column) => 
      column.foreignTable != null || column.name.endsWith('_id')).toList();
    
    // Junction tables typically have 2+ foreign keys and few non-key columns (often just id, timestamps)
    return foreignKeyColumns.length >= 2 && 
           foreignKeyColumns.length >= table.columns.length - 3;
  }

  String _generateBarrelFile(List<TableInfo> tables) {
    final exports = tables.map((table) => "export '${table.name}_repository.dart';").join('\n');
    
    return '''// Generated barrel file for repositories
// Do not modify by hand

export 'base_repository.dart';
$exports
''';
  }
}