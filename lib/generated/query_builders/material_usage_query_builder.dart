import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/material_usage_model.dart';

/// A type-safe query builder for MaterialUsageModel
class MaterialUsageModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  MaterialUsageModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('material_usage').select();
  }
  
  /// Set the fields to select
  MaterialUsageModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('material_usage').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  MaterialUsageModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  MaterialUsageModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by usage_id
  MaterialUsageModelQueryBuilder whereUsageId(String value) {
    _queryBuilder = _queryBuilder.eq('usage_id', value);
    return this;
  }
  
  /// Filter by usage_id with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereUsageIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('usage_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  MaterialUsageModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by material_name
  MaterialUsageModelQueryBuilder whereMaterialName(String value) {
    _queryBuilder = _queryBuilder.eq('material_name', value);
    return this;
  }
  
  /// Filter by material_name with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereMaterialNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('material_name', values);
    return this;
  }
  
  

  /// Filter by quantity
  MaterialUsageModelQueryBuilder whereQuantity(double value) {
    _queryBuilder = _queryBuilder.eq('quantity', value);
    return this;
  }
  
  /// Filter by quantity with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereQuantityIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quantity', values);
    return this;
  }
  
    /// Filter quantity greater than
  MaterialUsageModelQueryBuilder whereQuantityGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('quantity', value);
    return this;
  }
  
  /// Filter quantity greater than or equal
  MaterialUsageModelQueryBuilder whereQuantityGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('quantity', value);
    return this;
  }
  
  /// Filter quantity less than
  MaterialUsageModelQueryBuilder whereQuantityLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('quantity', value);
    return this;
  }
  
  /// Filter quantity less than or equal
  MaterialUsageModelQueryBuilder whereQuantityLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('quantity', value);
    return this;
  }
  
  /// Filter quantity between two values
  MaterialUsageModelQueryBuilder whereQuantityBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('quantity', min).lte('quantity', max);
    return this;
  }

  /// Filter by unit
  MaterialUsageModelQueryBuilder whereUnit(String? value) {
    _queryBuilder = _queryBuilder.eq('unit', value);
    return this;
  }
  
  /// Filter by unit with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereUnitIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('unit', values);
    return this;
  }
  
  

  /// Filter by unit_cost
  MaterialUsageModelQueryBuilder whereUnitCost(double? value) {
    _queryBuilder = _queryBuilder.eq('unit_cost', value);
    return this;
  }
  
  /// Filter by unit_cost with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereUnitCostIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('unit_cost', values);
    return this;
  }
  
    /// Filter unit_cost greater than
  MaterialUsageModelQueryBuilder whereUnitCostGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('unit_cost', value);
    return this;
  }
  
  /// Filter unit_cost greater than or equal
  MaterialUsageModelQueryBuilder whereUnitCostGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('unit_cost', value);
    return this;
  }
  
  /// Filter unit_cost less than
  MaterialUsageModelQueryBuilder whereUnitCostLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('unit_cost', value);
    return this;
  }
  
  /// Filter unit_cost less than or equal
  MaterialUsageModelQueryBuilder whereUnitCostLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('unit_cost', value);
    return this;
  }
  
  /// Filter unit_cost between two values
  MaterialUsageModelQueryBuilder whereUnitCostBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('unit_cost', min).lte('unit_cost', max);
    return this;
  }

  /// Filter by total_cost
  MaterialUsageModelQueryBuilder whereTotalCost(double? value) {
    _queryBuilder = _queryBuilder.eq('total_cost', value);
    return this;
  }
  
  /// Filter by total_cost with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereTotalCostIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_cost', values);
    return this;
  }
  
    /// Filter total_cost greater than
  MaterialUsageModelQueryBuilder whereTotalCostGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('total_cost', value);
    return this;
  }
  
  /// Filter total_cost greater than or equal
  MaterialUsageModelQueryBuilder whereTotalCostGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('total_cost', value);
    return this;
  }
  
  /// Filter total_cost less than
  MaterialUsageModelQueryBuilder whereTotalCostLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('total_cost', value);
    return this;
  }
  
  /// Filter total_cost less than or equal
  MaterialUsageModelQueryBuilder whereTotalCostLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('total_cost', value);
    return this;
  }
  
  /// Filter total_cost between two values
  MaterialUsageModelQueryBuilder whereTotalCostBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('total_cost', min).lte('total_cost', max);
    return this;
  }

  /// Filter by used_at
  MaterialUsageModelQueryBuilder whereUsedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('used_at', value);
    return this;
  }
  
  /// Filter by used_at with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereUsedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('used_at', values);
    return this;
  }
  
    /// Filter used_at greater than
  MaterialUsageModelQueryBuilder whereUsedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('used_at', value);
    return this;
  }
  
  /// Filter used_at greater than or equal
  MaterialUsageModelQueryBuilder whereUsedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('used_at', value);
    return this;
  }
  
  /// Filter used_at less than
  MaterialUsageModelQueryBuilder whereUsedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('used_at', value);
    return this;
  }
  
  /// Filter used_at less than or equal
  MaterialUsageModelQueryBuilder whereUsedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('used_at', value);
    return this;
  }
  
  /// Filter used_at between two values
  MaterialUsageModelQueryBuilder whereUsedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('used_at', min).lte('used_at', max);
    return this;
  }

  /// Filter by recorded_by
  MaterialUsageModelQueryBuilder whereRecordedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('recorded_by', value);
    return this;
  }
  
  /// Filter by recorded_by with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereRecordedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('recorded_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  MaterialUsageModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  MaterialUsageModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  MaterialUsageModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  MaterialUsageModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  MaterialUsageModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  MaterialUsageModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  MaterialUsageModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  MaterialUsageModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  MaterialUsageModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  MaterialUsageModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  MaterialUsageModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  MaterialUsageModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  MaterialUsageModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by usage_id in ascending order
  MaterialUsageModelQueryBuilder orderByUsageIdAsc() {
    _queryBuilder = _queryBuilder.order('usage_id', ascending: true);
    return this;
  }
  
  /// Order by usage_id in descending order
  MaterialUsageModelQueryBuilder orderByUsageIdDesc() {
    _queryBuilder = _queryBuilder.order('usage_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  MaterialUsageModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  MaterialUsageModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by material_name in ascending order
  MaterialUsageModelQueryBuilder orderByMaterialNameAsc() {
    _queryBuilder = _queryBuilder.order('material_name', ascending: true);
    return this;
  }
  
  /// Order by material_name in descending order
  MaterialUsageModelQueryBuilder orderByMaterialNameDesc() {
    _queryBuilder = _queryBuilder.order('material_name', ascending: false);
    return this;
  }

  /// Order by quantity in ascending order
  MaterialUsageModelQueryBuilder orderByQuantityAsc() {
    _queryBuilder = _queryBuilder.order('quantity', ascending: true);
    return this;
  }
  
  /// Order by quantity in descending order
  MaterialUsageModelQueryBuilder orderByQuantityDesc() {
    _queryBuilder = _queryBuilder.order('quantity', ascending: false);
    return this;
  }

  /// Order by unit in ascending order
  MaterialUsageModelQueryBuilder orderByUnitAsc() {
    _queryBuilder = _queryBuilder.order('unit', ascending: true);
    return this;
  }
  
  /// Order by unit in descending order
  MaterialUsageModelQueryBuilder orderByUnitDesc() {
    _queryBuilder = _queryBuilder.order('unit', ascending: false);
    return this;
  }

  /// Order by unit_cost in ascending order
  MaterialUsageModelQueryBuilder orderByUnitCostAsc() {
    _queryBuilder = _queryBuilder.order('unit_cost', ascending: true);
    return this;
  }
  
  /// Order by unit_cost in descending order
  MaterialUsageModelQueryBuilder orderByUnitCostDesc() {
    _queryBuilder = _queryBuilder.order('unit_cost', ascending: false);
    return this;
  }

  /// Order by total_cost in ascending order
  MaterialUsageModelQueryBuilder orderByTotalCostAsc() {
    _queryBuilder = _queryBuilder.order('total_cost', ascending: true);
    return this;
  }
  
  /// Order by total_cost in descending order
  MaterialUsageModelQueryBuilder orderByTotalCostDesc() {
    _queryBuilder = _queryBuilder.order('total_cost', ascending: false);
    return this;
  }

  /// Order by used_at in ascending order
  MaterialUsageModelQueryBuilder orderByUsedAtAsc() {
    _queryBuilder = _queryBuilder.order('used_at', ascending: true);
    return this;
  }
  
  /// Order by used_at in descending order
  MaterialUsageModelQueryBuilder orderByUsedAtDesc() {
    _queryBuilder = _queryBuilder.order('used_at', ascending: false);
    return this;
  }

  /// Order by recorded_by in ascending order
  MaterialUsageModelQueryBuilder orderByRecordedByAsc() {
    _queryBuilder = _queryBuilder.order('recorded_by', ascending: true);
    return this;
  }
  
  /// Order by recorded_by in descending order
  MaterialUsageModelQueryBuilder orderByRecordedByDesc() {
    _queryBuilder = _queryBuilder.order('recorded_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  MaterialUsageModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  MaterialUsageModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  MaterialUsageModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  MaterialUsageModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of MaterialUsageModel
  Future<List<MaterialUsageModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => MaterialUsageModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<MaterialUsageModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return MaterialUsageModel.fromJson(response.first as Map<String, dynamic>);
      }
      
      return null;
    } catch (e) {
      print('Error retrieving single result: $e');
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
      print('Error counting records: $e');
      return 0;
    }
  }
}
