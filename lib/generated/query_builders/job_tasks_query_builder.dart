import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_tasks_model.dart';

/// A type-safe query builder for JobTasksModel
class JobTasksModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  JobTasksModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('job_tasks').select();
  }
  
  /// Set the fields to select
  JobTasksModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('job_tasks').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  JobTasksModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  JobTasksModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by task_id
  JobTasksModelQueryBuilder whereTaskId(String value) {
    _queryBuilder = _queryBuilder.eq('task_id', value);
    return this;
  }
  
  /// Filter by task_id with multiple values (IN operator)
  JobTasksModelQueryBuilder whereTaskIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('task_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  JobTasksModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  JobTasksModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by title
  JobTasksModelQueryBuilder whereTitle(String value) {
    _queryBuilder = _queryBuilder.eq('title', value);
    return this;
  }
  
  /// Filter by title with multiple values (IN operator)
  JobTasksModelQueryBuilder whereTitleIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('title', values);
    return this;
  }
  
  

  /// Filter by description
  JobTasksModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  JobTasksModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by status
  JobTasksModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  JobTasksModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by completed_at
  JobTasksModelQueryBuilder whereCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('completed_at', value);
    return this;
  }
  
  /// Filter by completed_at with multiple values (IN operator)
  JobTasksModelQueryBuilder whereCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completed_at', values);
    return this;
  }
  
    /// Filter completed_at greater than
  JobTasksModelQueryBuilder whereCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at greater than or equal
  JobTasksModelQueryBuilder whereCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than
  JobTasksModelQueryBuilder whereCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than or equal
  JobTasksModelQueryBuilder whereCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at between two values
  JobTasksModelQueryBuilder whereCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('completed_at', min).lte('completed_at', max);
    return this;
  }

  /// Filter by created_at
  JobTasksModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  JobTasksModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  JobTasksModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  JobTasksModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  JobTasksModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  JobTasksModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  JobTasksModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  JobTasksModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  JobTasksModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  JobTasksModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  JobTasksModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  JobTasksModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  JobTasksModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  JobTasksModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by created_by
  JobTasksModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  JobTasksModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  
  
  /// Order by task_id in ascending order
  JobTasksModelQueryBuilder orderByTaskIdAsc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: true);
    return this;
  }
  
  /// Order by task_id in descending order
  JobTasksModelQueryBuilder orderByTaskIdDesc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  JobTasksModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  JobTasksModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by title in ascending order
  JobTasksModelQueryBuilder orderByTitleAsc() {
    _queryBuilder = _queryBuilder.order('title', ascending: true);
    return this;
  }
  
  /// Order by title in descending order
  JobTasksModelQueryBuilder orderByTitleDesc() {
    _queryBuilder = _queryBuilder.order('title', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  JobTasksModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  JobTasksModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  JobTasksModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  JobTasksModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by completed_at in ascending order
  JobTasksModelQueryBuilder orderByCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: true);
    return this;
  }
  
  /// Order by completed_at in descending order
  JobTasksModelQueryBuilder orderByCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  JobTasksModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  JobTasksModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  JobTasksModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  JobTasksModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  JobTasksModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  JobTasksModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of JobTasksModel
  Future<List<JobTasksModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => JobTasksModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<JobTasksModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return JobTasksModel.fromJson(response.first as Map<String, dynamic>);
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
