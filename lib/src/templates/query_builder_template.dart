// lib/src/templates/query_builder_template.dart

import '../schema/constraint_metadata.dart';
import '../schema/table_info.dart';
import '../utils/string_utils.dart';

/// Template for generating type-safe query builders
class QueryBuilderTemplate {
  /// Generate a type-safe query builder class for a table
  static String generateQueryBuilder(
    TableInfo table,
    String modelClassName,
    TableConstraintMetadata constraints
  ) {
    final className = '${modelClassName}QueryBuilder';
    final tableName = table.name;
    
    // Get all unique column names to generate filter methods
    final columnNames = table.columns.map((c) => c.name).toList();
    
    // Generate filter methods
    final filterMethods = columnNames.map((columnName) {
      // Variable name can be used for method parameter naming if needed
      // final variableName = StringUtils.toVariableName(columnName);
      final methodName = StringUtils.toPascalCase(columnName);
      final column = table.columns.firstWhere((c) => c.name == columnName);
      final dartType = _getDartTypeForColumn(column);
      
      return '''
  /// Filter by $columnName
  $className where$methodName($dartType value) {
    _queryBuilder = _queryBuilder.eq('$columnName', value);
    return this;
  }
  
  /// Filter by $columnName with multiple values (IN operator)
  $className where${methodName}In(List<${dartType.replaceAll('?', '')}> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('$columnName', values);
    return this;
  }
  
  ${_generateRangeFilterMethods(columnName, methodName, dartType, className)}''';
    }).join('\n\n');
    
    // Generate ordering methods
    final orderingMethods = columnNames.map((columnName) {
      final methodName = StringUtils.toPascalCase(columnName);
      
      return '''
  /// Order by $columnName in ascending order
  $className orderBy${methodName}Asc() {
    _queryBuilder = _queryBuilder.order('$columnName', ascending: true);
    return this;
  }
  
  /// Order by $columnName in descending order
  $className orderBy${methodName}Desc() {
    _queryBuilder = _queryBuilder.order('$columnName', ascending: false);
    return this;
  }''';
    }).join('\n\n');
    
    return '''
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/${tableName}_model.dart';

/// A type-safe query builder for $modelClassName
class $className {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  $className(this._client) {
    _queryBuilder = _client.from('$tableName').select();
  }
  
  /// Set the fields to select
  $className select(String fields) {
    _queryBuilder = _client.from('$tableName').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  $className limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  $className range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
$filterMethods
  
$orderingMethods
  
  /// Execute the query and return the results as a list of $modelClassName
  Future<List<$modelClassName>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => $modelClassName.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: \$e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<$modelClassName?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return $modelClassName.fromJson(response.first as Map<String, dynamic>);
      }
      
      return null;
    } catch (e) {
      print('Error retrieving single result: \$e');
      return null;
    }
  }
  
  /// Execute the query and return the count
  Future<int> count() async {
    try {
      // Use count() method directly according to Supabase Flutter 2.9.0 API
      final response = await _queryBuilder.count();
      
      // For Supabase Flutter 2.9.0+, count() returns a response with count property
      if (response.count != null) {
        return response.count ?? 0;
      }
      
      // Fallback for older versions or when count is not available
      return 0;
    } catch (e) {
      print('Error counting records: \$e');
      return 0;
    }
  }
}
''';
  }
  
  /// Generate range filter methods (gt, gte, lt, lte) for numeric and date columns
  static String _generateRangeFilterMethods(String columnName, String methodName, String dartType, String builderClassName) {
    // Get the base type without any nullable suffix
    final baseType = dartType.replaceAll('?', '');
    
    if (baseType != 'int' && baseType != 'double' && baseType != 'DateTime') {
      return '';
    }
    
    return '''
  /// Filter $columnName greater than
  $builderClassName where${methodName}GreaterThan($dartType value) {
    _queryBuilder = _queryBuilder.gt('$columnName', value);
    return this;
  }
  
  /// Filter $columnName greater than or equal
  $builderClassName where${methodName}GreaterThanOrEqual($dartType value) {
    _queryBuilder = _queryBuilder.gte('$columnName', value);
    return this;
  }
  
  /// Filter $columnName less than
  $builderClassName where${methodName}LessThan($dartType value) {
    _queryBuilder = _queryBuilder.lt('$columnName', value);
    return this;
  }
  
  /// Filter $columnName less than or equal
  $builderClassName where${methodName}LessThanOrEqual($dartType value) {
    _queryBuilder = _queryBuilder.lte('$columnName', value);
    return this;
  }
  
  /// Filter $columnName between two values
  $builderClassName where${methodName}Between($dartType min, $dartType max) {
    _queryBuilder = _queryBuilder.gte('$columnName', min).lte('$columnName', max);
    return this;
  }''';
  }
  
  /// Get the Dart type for a column
  static String _getDartTypeForColumn(ColumnInfo column) {
    final type = column.type.toLowerCase();
    final isNullable = column.isNullable;
    final nullSuffix = isNullable ? '?' : '';
    
    if (type.contains('int') || type.startsWith('serial')) {
      return 'int$nullSuffix';
    } else if (type == 'numeric' || type == 'decimal' || type == 'float' || type == 'double precision') {
      return 'double$nullSuffix';
    } else if (type == 'boolean') {
      return 'bool$nullSuffix';
    } else if (type.contains('timestamp') || type.contains('date')) {
      return 'DateTime$nullSuffix';
    } else if (type == 'jsonb' || type == 'json') {
      return 'Map<String, dynamic>$nullSuffix';
    } else if (type.startsWith('_') || type.contains('[]')) {
      return 'List<dynamic>$nullSuffix';
    } else {
      return 'String$nullSuffix';
    }
  }
}