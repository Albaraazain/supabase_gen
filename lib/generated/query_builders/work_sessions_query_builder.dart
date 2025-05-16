import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/work_sessions_model.dart';

/// A type-safe query builder for WorkSessionsModel
class WorkSessionsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  WorkSessionsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('work_sessions').select();
  }
  
  /// Set the fields to select
  WorkSessionsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('work_sessions').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  WorkSessionsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  WorkSessionsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by session_id
  WorkSessionsModelQueryBuilder whereSessionId(String value) {
    _queryBuilder = _queryBuilder.eq('session_id', value);
    return this;
  }
  
  /// Filter by session_id with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereSessionIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('session_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  WorkSessionsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  WorkSessionsModelQueryBuilder whereProfessionalId(String value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by started_at
  WorkSessionsModelQueryBuilder whereStartedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('started_at', value);
    return this;
  }
  
  /// Filter by started_at with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('started_at', values);
    return this;
  }
  
    /// Filter started_at greater than
  WorkSessionsModelQueryBuilder whereStartedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('started_at', value);
    return this;
  }
  
  /// Filter started_at greater than or equal
  WorkSessionsModelQueryBuilder whereStartedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('started_at', value);
    return this;
  }
  
  /// Filter started_at less than
  WorkSessionsModelQueryBuilder whereStartedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('started_at', value);
    return this;
  }
  
  /// Filter started_at less than or equal
  WorkSessionsModelQueryBuilder whereStartedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('started_at', value);
    return this;
  }
  
  /// Filter started_at between two values
  WorkSessionsModelQueryBuilder whereStartedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('started_at', min).lte('started_at', max);
    return this;
  }

  /// Filter by ended_at
  WorkSessionsModelQueryBuilder whereEndedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('ended_at', value);
    return this;
  }
  
  /// Filter by ended_at with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereEndedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('ended_at', values);
    return this;
  }
  
    /// Filter ended_at greater than
  WorkSessionsModelQueryBuilder whereEndedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('ended_at', value);
    return this;
  }
  
  /// Filter ended_at greater than or equal
  WorkSessionsModelQueryBuilder whereEndedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('ended_at', value);
    return this;
  }
  
  /// Filter ended_at less than
  WorkSessionsModelQueryBuilder whereEndedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('ended_at', value);
    return this;
  }
  
  /// Filter ended_at less than or equal
  WorkSessionsModelQueryBuilder whereEndedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('ended_at', value);
    return this;
  }
  
  /// Filter ended_at between two values
  WorkSessionsModelQueryBuilder whereEndedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('ended_at', min).lte('ended_at', max);
    return this;
  }

  /// Filter by total_duration
  WorkSessionsModelQueryBuilder whereTotalDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('total_duration', value);
    return this;
  }
  
  /// Filter by total_duration with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereTotalDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_duration', values);
    return this;
  }
  
    /// Filter total_duration greater than
  WorkSessionsModelQueryBuilder whereTotalDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('total_duration', value);
    return this;
  }
  
  /// Filter total_duration greater than or equal
  WorkSessionsModelQueryBuilder whereTotalDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('total_duration', value);
    return this;
  }
  
  /// Filter total_duration less than
  WorkSessionsModelQueryBuilder whereTotalDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('total_duration', value);
    return this;
  }
  
  /// Filter total_duration less than or equal
  WorkSessionsModelQueryBuilder whereTotalDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('total_duration', value);
    return this;
  }
  
  /// Filter total_duration between two values
  WorkSessionsModelQueryBuilder whereTotalDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('total_duration', min).lte('total_duration', max);
    return this;
  }

  /// Filter by pause_duration
  WorkSessionsModelQueryBuilder wherePauseDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('pause_duration', value);
    return this;
  }
  
  /// Filter by pause_duration with multiple values (IN operator)
  WorkSessionsModelQueryBuilder wherePauseDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pause_duration', values);
    return this;
  }
  
    /// Filter pause_duration greater than
  WorkSessionsModelQueryBuilder wherePauseDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('pause_duration', value);
    return this;
  }
  
  /// Filter pause_duration greater than or equal
  WorkSessionsModelQueryBuilder wherePauseDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('pause_duration', value);
    return this;
  }
  
  /// Filter pause_duration less than
  WorkSessionsModelQueryBuilder wherePauseDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('pause_duration', value);
    return this;
  }
  
  /// Filter pause_duration less than or equal
  WorkSessionsModelQueryBuilder wherePauseDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('pause_duration', value);
    return this;
  }
  
  /// Filter pause_duration between two values
  WorkSessionsModelQueryBuilder wherePauseDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('pause_duration', min).lte('pause_duration', max);
    return this;
  }

  /// Filter by is_paused
  WorkSessionsModelQueryBuilder whereIsPaused(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_paused', value);
    return this;
  }
  
  /// Filter by is_paused with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereIsPausedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_paused', values);
    return this;
  }
  
  

  /// Filter by pause_start_time
  WorkSessionsModelQueryBuilder wherePauseStartTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('pause_start_time', value);
    return this;
  }
  
  /// Filter by pause_start_time with multiple values (IN operator)
  WorkSessionsModelQueryBuilder wherePauseStartTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pause_start_time', values);
    return this;
  }
  
    /// Filter pause_start_time greater than
  WorkSessionsModelQueryBuilder wherePauseStartTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('pause_start_time', value);
    return this;
  }
  
  /// Filter pause_start_time greater than or equal
  WorkSessionsModelQueryBuilder wherePauseStartTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('pause_start_time', value);
    return this;
  }
  
  /// Filter pause_start_time less than
  WorkSessionsModelQueryBuilder wherePauseStartTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('pause_start_time', value);
    return this;
  }
  
  /// Filter pause_start_time less than or equal
  WorkSessionsModelQueryBuilder wherePauseStartTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('pause_start_time', value);
    return this;
  }
  
  /// Filter pause_start_time between two values
  WorkSessionsModelQueryBuilder wherePauseStartTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('pause_start_time', min).lte('pause_start_time', max);
    return this;
  }

  /// Filter by created_at
  WorkSessionsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  WorkSessionsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  WorkSessionsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  WorkSessionsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  WorkSessionsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  WorkSessionsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  WorkSessionsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  WorkSessionsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  WorkSessionsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  WorkSessionsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  WorkSessionsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  WorkSessionsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by session_notes
  WorkSessionsModelQueryBuilder whereSessionNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('session_notes', value);
    return this;
  }
  
  /// Filter by session_notes with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereSessionNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('session_notes', values);
    return this;
  }
  
  

  /// Filter by weather_conditions
  WorkSessionsModelQueryBuilder whereWeatherConditions(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('weather_conditions', value);
    return this;
  }
  
  /// Filter by weather_conditions with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereWeatherConditionsIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('weather_conditions', values);
    return this;
  }
  
  

  /// Filter by completion_percentage
  WorkSessionsModelQueryBuilder whereCompletionPercentage(double? value) {
    _queryBuilder = _queryBuilder.eq('completion_percentage', value);
    return this;
  }
  
  /// Filter by completion_percentage with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereCompletionPercentageIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completion_percentage', values);
    return this;
  }
  
    /// Filter completion_percentage greater than
  WorkSessionsModelQueryBuilder whereCompletionPercentageGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage greater than or equal
  WorkSessionsModelQueryBuilder whereCompletionPercentageGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage less than
  WorkSessionsModelQueryBuilder whereCompletionPercentageLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage less than or equal
  WorkSessionsModelQueryBuilder whereCompletionPercentageLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('completion_percentage', value);
    return this;
  }
  
  /// Filter completion_percentage between two values
  WorkSessionsModelQueryBuilder whereCompletionPercentageBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('completion_percentage', min).lte('completion_percentage', max);
    return this;
  }

  /// Filter by status
  WorkSessionsModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  WorkSessionsModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  
  
  /// Order by session_id in ascending order
  WorkSessionsModelQueryBuilder orderBySessionIdAsc() {
    _queryBuilder = _queryBuilder.order('session_id', ascending: true);
    return this;
  }
  
  /// Order by session_id in descending order
  WorkSessionsModelQueryBuilder orderBySessionIdDesc() {
    _queryBuilder = _queryBuilder.order('session_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  WorkSessionsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  WorkSessionsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  WorkSessionsModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  WorkSessionsModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by started_at in ascending order
  WorkSessionsModelQueryBuilder orderByStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: true);
    return this;
  }
  
  /// Order by started_at in descending order
  WorkSessionsModelQueryBuilder orderByStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: false);
    return this;
  }

  /// Order by ended_at in ascending order
  WorkSessionsModelQueryBuilder orderByEndedAtAsc() {
    _queryBuilder = _queryBuilder.order('ended_at', ascending: true);
    return this;
  }
  
  /// Order by ended_at in descending order
  WorkSessionsModelQueryBuilder orderByEndedAtDesc() {
    _queryBuilder = _queryBuilder.order('ended_at', ascending: false);
    return this;
  }

  /// Order by total_duration in ascending order
  WorkSessionsModelQueryBuilder orderByTotalDurationAsc() {
    _queryBuilder = _queryBuilder.order('total_duration', ascending: true);
    return this;
  }
  
  /// Order by total_duration in descending order
  WorkSessionsModelQueryBuilder orderByTotalDurationDesc() {
    _queryBuilder = _queryBuilder.order('total_duration', ascending: false);
    return this;
  }

  /// Order by pause_duration in ascending order
  WorkSessionsModelQueryBuilder orderByPauseDurationAsc() {
    _queryBuilder = _queryBuilder.order('pause_duration', ascending: true);
    return this;
  }
  
  /// Order by pause_duration in descending order
  WorkSessionsModelQueryBuilder orderByPauseDurationDesc() {
    _queryBuilder = _queryBuilder.order('pause_duration', ascending: false);
    return this;
  }

  /// Order by is_paused in ascending order
  WorkSessionsModelQueryBuilder orderByIsPausedAsc() {
    _queryBuilder = _queryBuilder.order('is_paused', ascending: true);
    return this;
  }
  
  /// Order by is_paused in descending order
  WorkSessionsModelQueryBuilder orderByIsPausedDesc() {
    _queryBuilder = _queryBuilder.order('is_paused', ascending: false);
    return this;
  }

  /// Order by pause_start_time in ascending order
  WorkSessionsModelQueryBuilder orderByPauseStartTimeAsc() {
    _queryBuilder = _queryBuilder.order('pause_start_time', ascending: true);
    return this;
  }
  
  /// Order by pause_start_time in descending order
  WorkSessionsModelQueryBuilder orderByPauseStartTimeDesc() {
    _queryBuilder = _queryBuilder.order('pause_start_time', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  WorkSessionsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  WorkSessionsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  WorkSessionsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  WorkSessionsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by session_notes in ascending order
  WorkSessionsModelQueryBuilder orderBySessionNotesAsc() {
    _queryBuilder = _queryBuilder.order('session_notes', ascending: true);
    return this;
  }
  
  /// Order by session_notes in descending order
  WorkSessionsModelQueryBuilder orderBySessionNotesDesc() {
    _queryBuilder = _queryBuilder.order('session_notes', ascending: false);
    return this;
  }

  /// Order by weather_conditions in ascending order
  WorkSessionsModelQueryBuilder orderByWeatherConditionsAsc() {
    _queryBuilder = _queryBuilder.order('weather_conditions', ascending: true);
    return this;
  }
  
  /// Order by weather_conditions in descending order
  WorkSessionsModelQueryBuilder orderByWeatherConditionsDesc() {
    _queryBuilder = _queryBuilder.order('weather_conditions', ascending: false);
    return this;
  }

  /// Order by completion_percentage in ascending order
  WorkSessionsModelQueryBuilder orderByCompletionPercentageAsc() {
    _queryBuilder = _queryBuilder.order('completion_percentage', ascending: true);
    return this;
  }
  
  /// Order by completion_percentage in descending order
  WorkSessionsModelQueryBuilder orderByCompletionPercentageDesc() {
    _queryBuilder = _queryBuilder.order('completion_percentage', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  WorkSessionsModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  WorkSessionsModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of WorkSessionsModel
  Future<List<WorkSessionsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => WorkSessionsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<WorkSessionsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return WorkSessionsModel.fromJson(response.first as Map<String, dynamic>);
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
