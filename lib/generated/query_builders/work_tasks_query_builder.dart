import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/work_tasks_model.dart';

/// A type-safe query builder for WorkTasksModel
class WorkTasksModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  WorkTasksModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('work_tasks').select();
  }
  
  /// Set the fields to select
  WorkTasksModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('work_tasks').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  WorkTasksModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  WorkTasksModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by task_id
  WorkTasksModelQueryBuilder whereTaskId(String value) {
    _queryBuilder = _queryBuilder.eq('task_id', value);
    return this;
  }
  
  /// Filter by task_id with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereTaskIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('task_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  WorkTasksModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by title
  WorkTasksModelQueryBuilder whereTitle(String value) {
    _queryBuilder = _queryBuilder.eq('title', value);
    return this;
  }
  
  /// Filter by title with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereTitleIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('title', values);
    return this;
  }
  
  

  /// Filter by description
  WorkTasksModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by status
  WorkTasksModelQueryBuilder whereStatus(String value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by estimated_duration
  WorkTasksModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  WorkTasksModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  WorkTasksModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  WorkTasksModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  WorkTasksModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  WorkTasksModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }

  /// Filter by actual_duration
  WorkTasksModelQueryBuilder whereActualDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('actual_duration', value);
    return this;
  }
  
  /// Filter by actual_duration with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereActualDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('actual_duration', values);
    return this;
  }
  
    /// Filter actual_duration greater than
  WorkTasksModelQueryBuilder whereActualDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('actual_duration', value);
    return this;
  }
  
  /// Filter actual_duration greater than or equal
  WorkTasksModelQueryBuilder whereActualDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('actual_duration', value);
    return this;
  }
  
  /// Filter actual_duration less than
  WorkTasksModelQueryBuilder whereActualDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('actual_duration', value);
    return this;
  }
  
  /// Filter actual_duration less than or equal
  WorkTasksModelQueryBuilder whereActualDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('actual_duration', value);
    return this;
  }
  
  /// Filter actual_duration between two values
  WorkTasksModelQueryBuilder whereActualDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('actual_duration', min).lte('actual_duration', max);
    return this;
  }

  /// Filter by started_at
  WorkTasksModelQueryBuilder whereStartedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('started_at', value);
    return this;
  }
  
  /// Filter by started_at with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('started_at', values);
    return this;
  }
  
    /// Filter started_at greater than
  WorkTasksModelQueryBuilder whereStartedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('started_at', value);
    return this;
  }
  
  /// Filter started_at greater than or equal
  WorkTasksModelQueryBuilder whereStartedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('started_at', value);
    return this;
  }
  
  /// Filter started_at less than
  WorkTasksModelQueryBuilder whereStartedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('started_at', value);
    return this;
  }
  
  /// Filter started_at less than or equal
  WorkTasksModelQueryBuilder whereStartedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('started_at', value);
    return this;
  }
  
  /// Filter started_at between two values
  WorkTasksModelQueryBuilder whereStartedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('started_at', min).lte('started_at', max);
    return this;
  }

  /// Filter by completed_at
  WorkTasksModelQueryBuilder whereCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('completed_at', value);
    return this;
  }
  
  /// Filter by completed_at with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completed_at', values);
    return this;
  }
  
    /// Filter completed_at greater than
  WorkTasksModelQueryBuilder whereCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at greater than or equal
  WorkTasksModelQueryBuilder whereCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than
  WorkTasksModelQueryBuilder whereCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than or equal
  WorkTasksModelQueryBuilder whereCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at between two values
  WorkTasksModelQueryBuilder whereCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('completed_at', min).lte('completed_at', max);
    return this;
  }

  /// Filter by sequence_number
  WorkTasksModelQueryBuilder whereSequenceNumber(int? value) {
    _queryBuilder = _queryBuilder.eq('sequence_number', value);
    return this;
  }
  
  /// Filter by sequence_number with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereSequenceNumberIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('sequence_number', values);
    return this;
  }
  
    /// Filter sequence_number greater than
  WorkTasksModelQueryBuilder whereSequenceNumberGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('sequence_number', value);
    return this;
  }
  
  /// Filter sequence_number greater than or equal
  WorkTasksModelQueryBuilder whereSequenceNumberGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('sequence_number', value);
    return this;
  }
  
  /// Filter sequence_number less than
  WorkTasksModelQueryBuilder whereSequenceNumberLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('sequence_number', value);
    return this;
  }
  
  /// Filter sequence_number less than or equal
  WorkTasksModelQueryBuilder whereSequenceNumberLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('sequence_number', value);
    return this;
  }
  
  /// Filter sequence_number between two values
  WorkTasksModelQueryBuilder whereSequenceNumberBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('sequence_number', min).lte('sequence_number', max);
    return this;
  }

  /// Filter by created_by
  WorkTasksModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  WorkTasksModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  WorkTasksModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  WorkTasksModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  WorkTasksModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  WorkTasksModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  WorkTasksModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  WorkTasksModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  WorkTasksModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  WorkTasksModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  WorkTasksModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  WorkTasksModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  WorkTasksModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  WorkTasksModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by task_id in ascending order
  WorkTasksModelQueryBuilder orderByTaskIdAsc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: true);
    return this;
  }
  
  /// Order by task_id in descending order
  WorkTasksModelQueryBuilder orderByTaskIdDesc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  WorkTasksModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  WorkTasksModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by title in ascending order
  WorkTasksModelQueryBuilder orderByTitleAsc() {
    _queryBuilder = _queryBuilder.order('title', ascending: true);
    return this;
  }
  
  /// Order by title in descending order
  WorkTasksModelQueryBuilder orderByTitleDesc() {
    _queryBuilder = _queryBuilder.order('title', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  WorkTasksModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  WorkTasksModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  WorkTasksModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  WorkTasksModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  WorkTasksModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  WorkTasksModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }

  /// Order by actual_duration in ascending order
  WorkTasksModelQueryBuilder orderByActualDurationAsc() {
    _queryBuilder = _queryBuilder.order('actual_duration', ascending: true);
    return this;
  }
  
  /// Order by actual_duration in descending order
  WorkTasksModelQueryBuilder orderByActualDurationDesc() {
    _queryBuilder = _queryBuilder.order('actual_duration', ascending: false);
    return this;
  }

  /// Order by started_at in ascending order
  WorkTasksModelQueryBuilder orderByStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: true);
    return this;
  }
  
  /// Order by started_at in descending order
  WorkTasksModelQueryBuilder orderByStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: false);
    return this;
  }

  /// Order by completed_at in ascending order
  WorkTasksModelQueryBuilder orderByCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: true);
    return this;
  }
  
  /// Order by completed_at in descending order
  WorkTasksModelQueryBuilder orderByCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: false);
    return this;
  }

  /// Order by sequence_number in ascending order
  WorkTasksModelQueryBuilder orderBySequenceNumberAsc() {
    _queryBuilder = _queryBuilder.order('sequence_number', ascending: true);
    return this;
  }
  
  /// Order by sequence_number in descending order
  WorkTasksModelQueryBuilder orderBySequenceNumberDesc() {
    _queryBuilder = _queryBuilder.order('sequence_number', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  WorkTasksModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  WorkTasksModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  WorkTasksModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  WorkTasksModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  WorkTasksModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  WorkTasksModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of WorkTasksModel
  Future<List<WorkTasksModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => WorkTasksModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<WorkTasksModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return WorkTasksModel.fromJson(response.first as Map<String, dynamic>);
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
