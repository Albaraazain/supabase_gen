import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/working_phase_model.dart';

/// A type-safe query builder for WorkingPhaseModel
class WorkingPhaseModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  WorkingPhaseModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('working_phase').select();
  }
  
  /// Set the fields to select
  WorkingPhaseModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('working_phase').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  WorkingPhaseModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  WorkingPhaseModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  WorkingPhaseModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  WorkingPhaseModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by work_started_at
  WorkingPhaseModelQueryBuilder whereWorkStartedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('work_started_at', value);
    return this;
  }
  
  /// Filter by work_started_at with multiple values (IN operator)
  WorkingPhaseModelQueryBuilder whereWorkStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('work_started_at', values);
    return this;
  }
  
    /// Filter work_started_at greater than
  WorkingPhaseModelQueryBuilder whereWorkStartedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at greater than or equal
  WorkingPhaseModelQueryBuilder whereWorkStartedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at less than
  WorkingPhaseModelQueryBuilder whereWorkStartedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at less than or equal
  WorkingPhaseModelQueryBuilder whereWorkStartedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at between two values
  WorkingPhaseModelQueryBuilder whereWorkStartedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('work_started_at', min).lte('work_started_at', max);
    return this;
  }

  /// Filter by work_paused_at
  WorkingPhaseModelQueryBuilder whereWorkPausedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('work_paused_at', value);
    return this;
  }
  
  /// Filter by work_paused_at with multiple values (IN operator)
  WorkingPhaseModelQueryBuilder whereWorkPausedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('work_paused_at', values);
    return this;
  }
  
    /// Filter work_paused_at greater than
  WorkingPhaseModelQueryBuilder whereWorkPausedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at greater than or equal
  WorkingPhaseModelQueryBuilder whereWorkPausedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at less than
  WorkingPhaseModelQueryBuilder whereWorkPausedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at less than or equal
  WorkingPhaseModelQueryBuilder whereWorkPausedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at between two values
  WorkingPhaseModelQueryBuilder whereWorkPausedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('work_paused_at', min).lte('work_paused_at', max);
    return this;
  }

  /// Filter by total_pause_duration
  WorkingPhaseModelQueryBuilder whereTotalPauseDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('total_pause_duration', value);
    return this;
  }
  
  /// Filter by total_pause_duration with multiple values (IN operator)
  WorkingPhaseModelQueryBuilder whereTotalPauseDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_pause_duration', values);
    return this;
  }
  
    /// Filter total_pause_duration greater than
  WorkingPhaseModelQueryBuilder whereTotalPauseDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('total_pause_duration', value);
    return this;
  }
  
  /// Filter total_pause_duration greater than or equal
  WorkingPhaseModelQueryBuilder whereTotalPauseDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('total_pause_duration', value);
    return this;
  }
  
  /// Filter total_pause_duration less than
  WorkingPhaseModelQueryBuilder whereTotalPauseDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('total_pause_duration', value);
    return this;
  }
  
  /// Filter total_pause_duration less than or equal
  WorkingPhaseModelQueryBuilder whereTotalPauseDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('total_pause_duration', value);
    return this;
  }
  
  /// Filter total_pause_duration between two values
  WorkingPhaseModelQueryBuilder whereTotalPauseDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('total_pause_duration', min).lte('total_pause_duration', max);
    return this;
  }

  /// Filter by current_session_id
  WorkingPhaseModelQueryBuilder whereCurrentSessionId(String? value) {
    _queryBuilder = _queryBuilder.eq('current_session_id', value);
    return this;
  }
  
  /// Filter by current_session_id with multiple values (IN operator)
  WorkingPhaseModelQueryBuilder whereCurrentSessionIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_session_id', values);
    return this;
  }
  
  

  /// Filter by completion_percentage
  WorkingPhaseModelQueryBuilder whereCompletionPercentage(double? value) {
    _queryBuilder = _queryBuilder.eq('completion_percentage', value);
    return this;
  }
  
  /// Filter by completion_percentage with multiple values (IN operator)
  WorkingPhaseModelQueryBuilder whereCompletionPercentageIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completion_percentage', values);
    return this;
  }
  
    /// Filter completion_percentage greater than
  WorkingPhaseModelQueryBuilder whereCompletionPercentageGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage greater than or equal
  WorkingPhaseModelQueryBuilder whereCompletionPercentageGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage less than
  WorkingPhaseModelQueryBuilder whereCompletionPercentageLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage less than or equal
  WorkingPhaseModelQueryBuilder whereCompletionPercentageLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage between two values
  WorkingPhaseModelQueryBuilder whereCompletionPercentageBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('completion_percentage', min).lte('completion_percentage', max);
    return this;
  }
  
  /// Order by job_id in ascending order
  WorkingPhaseModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  WorkingPhaseModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by work_started_at in ascending order
  WorkingPhaseModelQueryBuilder orderByWorkStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('work_started_at', ascending: true);
    return this;
  }
  
  /// Order by work_started_at in descending order
  WorkingPhaseModelQueryBuilder orderByWorkStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('work_started_at', ascending: false);
    return this;
  }

  /// Order by work_paused_at in ascending order
  WorkingPhaseModelQueryBuilder orderByWorkPausedAtAsc() {
    _queryBuilder = _queryBuilder.order('work_paused_at', ascending: true);
    return this;
  }
  
  /// Order by work_paused_at in descending order
  WorkingPhaseModelQueryBuilder orderByWorkPausedAtDesc() {
    _queryBuilder = _queryBuilder.order('work_paused_at', ascending: false);
    return this;
  }

  /// Order by total_pause_duration in ascending order
  WorkingPhaseModelQueryBuilder orderByTotalPauseDurationAsc() {
    _queryBuilder = _queryBuilder.order('total_pause_duration', ascending: true);
    return this;
  }
  
  /// Order by total_pause_duration in descending order
  WorkingPhaseModelQueryBuilder orderByTotalPauseDurationDesc() {
    _queryBuilder = _queryBuilder.order('total_pause_duration', ascending: false);
    return this;
  }

  /// Order by current_session_id in ascending order
  WorkingPhaseModelQueryBuilder orderByCurrentSessionIdAsc() {
    _queryBuilder = _queryBuilder.order('current_session_id', ascending: true);
    return this;
  }
  
  /// Order by current_session_id in descending order
  WorkingPhaseModelQueryBuilder orderByCurrentSessionIdDesc() {
    _queryBuilder = _queryBuilder.order('current_session_id', ascending: false);
    return this;
  }

  /// Order by completion_percentage in ascending order
  WorkingPhaseModelQueryBuilder orderByCompletionPercentageAsc() {
    _queryBuilder = _queryBuilder.order('completion_percentage', ascending: true);
    return this;
  }
  
  /// Order by completion_percentage in descending order
  WorkingPhaseModelQueryBuilder orderByCompletionPercentageDesc() {
    _queryBuilder = _queryBuilder.order('completion_percentage', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of WorkingPhaseModel
  Future<List<WorkingPhaseModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => WorkingPhaseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<WorkingPhaseModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return WorkingPhaseModel.fromJson(response.first as Map<String, dynamic>);
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
