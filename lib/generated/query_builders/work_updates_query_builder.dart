import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/work_updates_model.dart';

/// A type-safe query builder for WorkUpdatesModel
class WorkUpdatesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  WorkUpdatesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('work_updates').select();
  }
  
  /// Set the fields to select
  WorkUpdatesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('work_updates').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  WorkUpdatesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  WorkUpdatesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by update_id
  WorkUpdatesModelQueryBuilder whereUpdateId(String value) {
    _queryBuilder = _queryBuilder.eq('update_id', value);
    return this;
  }
  
  /// Filter by update_id with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereUpdateIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('update_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  WorkUpdatesModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by message
  WorkUpdatesModelQueryBuilder whereMessage(String value) {
    _queryBuilder = _queryBuilder.eq('message', value);
    return this;
  }
  
  /// Filter by message with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereMessageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('message', values);
    return this;
  }
  
  

  /// Filter by update_type
  WorkUpdatesModelQueryBuilder whereUpdateType(String value) {
    _queryBuilder = _queryBuilder.eq('update_type', value);
    return this;
  }
  
  /// Filter by update_type with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereUpdateTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('update_type', values);
    return this;
  }
  
  

  /// Filter by priority
  WorkUpdatesModelQueryBuilder wherePriority(String? value) {
    _queryBuilder = _queryBuilder.eq('priority', value);
    return this;
  }
  
  /// Filter by priority with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder wherePriorityIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('priority', values);
    return this;
  }
  
  

  /// Filter by requires_attention
  WorkUpdatesModelQueryBuilder whereRequiresAttention(bool? value) {
    _queryBuilder = _queryBuilder.eq('requires_attention', value);
    return this;
  }
  
  /// Filter by requires_attention with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereRequiresAttentionIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('requires_attention', values);
    return this;
  }
  
  

  /// Filter by created_by
  WorkUpdatesModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  WorkUpdatesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  WorkUpdatesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  WorkUpdatesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  WorkUpdatesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  WorkUpdatesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  WorkUpdatesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  WorkUpdatesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by update_id in ascending order
  WorkUpdatesModelQueryBuilder orderByUpdateIdAsc() {
    _queryBuilder = _queryBuilder.order('update_id', ascending: true);
    return this;
  }
  
  /// Order by update_id in descending order
  WorkUpdatesModelQueryBuilder orderByUpdateIdDesc() {
    _queryBuilder = _queryBuilder.order('update_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  WorkUpdatesModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  WorkUpdatesModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by message in ascending order
  WorkUpdatesModelQueryBuilder orderByMessageAsc() {
    _queryBuilder = _queryBuilder.order('message', ascending: true);
    return this;
  }
  
  /// Order by message in descending order
  WorkUpdatesModelQueryBuilder orderByMessageDesc() {
    _queryBuilder = _queryBuilder.order('message', ascending: false);
    return this;
  }

  /// Order by update_type in ascending order
  WorkUpdatesModelQueryBuilder orderByUpdateTypeAsc() {
    _queryBuilder = _queryBuilder.order('update_type', ascending: true);
    return this;
  }
  
  /// Order by update_type in descending order
  WorkUpdatesModelQueryBuilder orderByUpdateTypeDesc() {
    _queryBuilder = _queryBuilder.order('update_type', ascending: false);
    return this;
  }

  /// Order by priority in ascending order
  WorkUpdatesModelQueryBuilder orderByPriorityAsc() {
    _queryBuilder = _queryBuilder.order('priority', ascending: true);
    return this;
  }
  
  /// Order by priority in descending order
  WorkUpdatesModelQueryBuilder orderByPriorityDesc() {
    _queryBuilder = _queryBuilder.order('priority', ascending: false);
    return this;
  }

  /// Order by requires_attention in ascending order
  WorkUpdatesModelQueryBuilder orderByRequiresAttentionAsc() {
    _queryBuilder = _queryBuilder.order('requires_attention', ascending: true);
    return this;
  }
  
  /// Order by requires_attention in descending order
  WorkUpdatesModelQueryBuilder orderByRequiresAttentionDesc() {
    _queryBuilder = _queryBuilder.order('requires_attention', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  WorkUpdatesModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  WorkUpdatesModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  WorkUpdatesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  WorkUpdatesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of WorkUpdatesModel
  Future<List<WorkUpdatesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => WorkUpdatesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<WorkUpdatesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return WorkUpdatesModel.fromJson(response.first as Map<String, dynamic>);
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
