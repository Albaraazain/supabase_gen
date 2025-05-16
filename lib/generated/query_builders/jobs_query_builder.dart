import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/jobs_model.dart';

/// A type-safe query builder for JobsModel
class JobsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  JobsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('jobs').select();
  }
  
  /// Set the fields to select
  JobsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('jobs').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  JobsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  JobsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  JobsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  JobsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by broadcast_id
  JobsModelQueryBuilder whereBroadcastId(String? value) {
    _queryBuilder = _queryBuilder.eq('broadcast_id', value);
    return this;
  }
  
  /// Filter by broadcast_id with multiple values (IN operator)
  JobsModelQueryBuilder whereBroadcastIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('broadcast_id', values);
    return this;
  }
  
  

  /// Filter by homeowner_id
  JobsModelQueryBuilder whereHomeownerId(String value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  JobsModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  JobsModelQueryBuilder whereProfessionalId(String value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  JobsModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by service_id
  JobsModelQueryBuilder whereServiceId(String value) {
    _queryBuilder = _queryBuilder.eq('service_id', value);
    return this;
  }
  
  /// Filter by service_id with multiple values (IN operator)
  JobsModelQueryBuilder whereServiceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_id', values);
    return this;
  }
  
  

  /// Filter by stage_updated_at
  JobsModelQueryBuilder whereStageUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('stage_updated_at', value);
    return this;
  }
  
  /// Filter by stage_updated_at with multiple values (IN operator)
  JobsModelQueryBuilder whereStageUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_updated_at', values);
    return this;
  }
  
    /// Filter stage_updated_at greater than
  JobsModelQueryBuilder whereStageUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at greater than or equal
  JobsModelQueryBuilder whereStageUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at less than
  JobsModelQueryBuilder whereStageUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at less than or equal
  JobsModelQueryBuilder whereStageUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at between two values
  JobsModelQueryBuilder whereStageUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('stage_updated_at', min).lte('stage_updated_at', max);
    return this;
  }

  /// Filter by scheduled_time
  JobsModelQueryBuilder whereScheduledTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('scheduled_time', value);
    return this;
  }
  
  /// Filter by scheduled_time with multiple values (IN operator)
  JobsModelQueryBuilder whereScheduledTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('scheduled_time', values);
    return this;
  }
  
    /// Filter scheduled_time greater than
  JobsModelQueryBuilder whereScheduledTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time greater than or equal
  JobsModelQueryBuilder whereScheduledTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than
  JobsModelQueryBuilder whereScheduledTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than or equal
  JobsModelQueryBuilder whereScheduledTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time between two values
  JobsModelQueryBuilder whereScheduledTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', min).lte('scheduled_time', max);
    return this;
  }

  /// Filter by estimated_duration
  JobsModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  JobsModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  JobsModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  JobsModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  JobsModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  JobsModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  JobsModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }

  /// Filter by current_stage
  JobsModelQueryBuilder whereCurrentStage(String value) {
    _queryBuilder = _queryBuilder.eq('current_stage', value);
    return this;
  }
  
  /// Filter by current_stage with multiple values (IN operator)
  JobsModelQueryBuilder whereCurrentStageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_stage', values);
    return this;
  }
  
  

  /// Filter by work_started_at
  JobsModelQueryBuilder whereWorkStartedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('work_started_at', value);
    return this;
  }
  
  /// Filter by work_started_at with multiple values (IN operator)
  JobsModelQueryBuilder whereWorkStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('work_started_at', values);
    return this;
  }
  
    /// Filter work_started_at greater than
  JobsModelQueryBuilder whereWorkStartedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at greater than or equal
  JobsModelQueryBuilder whereWorkStartedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at less than
  JobsModelQueryBuilder whereWorkStartedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at less than or equal
  JobsModelQueryBuilder whereWorkStartedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('work_started_at', value);
    return this;
  }
  
  /// Filter work_started_at between two values
  JobsModelQueryBuilder whereWorkStartedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('work_started_at', min).lte('work_started_at', max);
    return this;
  }

  /// Filter by work_paused_at
  JobsModelQueryBuilder whereWorkPausedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('work_paused_at', value);
    return this;
  }
  
  /// Filter by work_paused_at with multiple values (IN operator)
  JobsModelQueryBuilder whereWorkPausedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('work_paused_at', values);
    return this;
  }
  
    /// Filter work_paused_at greater than
  JobsModelQueryBuilder whereWorkPausedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at greater than or equal
  JobsModelQueryBuilder whereWorkPausedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at less than
  JobsModelQueryBuilder whereWorkPausedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at less than or equal
  JobsModelQueryBuilder whereWorkPausedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('work_paused_at', value);
    return this;
  }
  
  /// Filter work_paused_at between two values
  JobsModelQueryBuilder whereWorkPausedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('work_paused_at', min).lte('work_paused_at', max);
    return this;
  }

  /// Filter by total_pause_duration
  JobsModelQueryBuilder whereTotalPauseDuration(String? value) {
    _queryBuilder = _queryBuilder.eq('total_pause_duration', value);
    return this;
  }
  
  /// Filter by total_pause_duration with multiple values (IN operator)
  JobsModelQueryBuilder whereTotalPauseDurationIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_pause_duration', values);
    return this;
  }
  
  

  /// Filter by created_at
  JobsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  JobsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  JobsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  JobsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  JobsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  JobsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  JobsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  JobsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  JobsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  JobsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  JobsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  JobsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  JobsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  JobsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by last_updated_by
  JobsModelQueryBuilder whereLastUpdatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('last_updated_by', value);
    return this;
  }
  
  /// Filter by last_updated_by with multiple values (IN operator)
  JobsModelQueryBuilder whereLastUpdatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('last_updated_by', values);
    return this;
  }
  
  

  /// Filter by current_session_id
  JobsModelQueryBuilder whereCurrentSessionId(String? value) {
    _queryBuilder = _queryBuilder.eq('current_session_id', value);
    return this;
  }
  
  /// Filter by current_session_id with multiple values (IN operator)
  JobsModelQueryBuilder whereCurrentSessionIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_session_id', values);
    return this;
  }
  
  
  
  /// Order by job_id in ascending order
  JobsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  JobsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by broadcast_id in ascending order
  JobsModelQueryBuilder orderByBroadcastIdAsc() {
    _queryBuilder = _queryBuilder.order('broadcast_id', ascending: true);
    return this;
  }
  
  /// Order by broadcast_id in descending order
  JobsModelQueryBuilder orderByBroadcastIdDesc() {
    _queryBuilder = _queryBuilder.order('broadcast_id', ascending: false);
    return this;
  }

  /// Order by homeowner_id in ascending order
  JobsModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  JobsModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  JobsModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  JobsModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by service_id in ascending order
  JobsModelQueryBuilder orderByServiceIdAsc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: true);
    return this;
  }
  
  /// Order by service_id in descending order
  JobsModelQueryBuilder orderByServiceIdDesc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: false);
    return this;
  }

  /// Order by stage_updated_at in ascending order
  JobsModelQueryBuilder orderByStageUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('stage_updated_at', ascending: true);
    return this;
  }
  
  /// Order by stage_updated_at in descending order
  JobsModelQueryBuilder orderByStageUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('stage_updated_at', ascending: false);
    return this;
  }

  /// Order by scheduled_time in ascending order
  JobsModelQueryBuilder orderByScheduledTimeAsc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: true);
    return this;
  }
  
  /// Order by scheduled_time in descending order
  JobsModelQueryBuilder orderByScheduledTimeDesc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  JobsModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  JobsModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }

  /// Order by current_stage in ascending order
  JobsModelQueryBuilder orderByCurrentStageAsc() {
    _queryBuilder = _queryBuilder.order('current_stage', ascending: true);
    return this;
  }
  
  /// Order by current_stage in descending order
  JobsModelQueryBuilder orderByCurrentStageDesc() {
    _queryBuilder = _queryBuilder.order('current_stage', ascending: false);
    return this;
  }

  /// Order by work_started_at in ascending order
  JobsModelQueryBuilder orderByWorkStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('work_started_at', ascending: true);
    return this;
  }
  
  /// Order by work_started_at in descending order
  JobsModelQueryBuilder orderByWorkStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('work_started_at', ascending: false);
    return this;
  }

  /// Order by work_paused_at in ascending order
  JobsModelQueryBuilder orderByWorkPausedAtAsc() {
    _queryBuilder = _queryBuilder.order('work_paused_at', ascending: true);
    return this;
  }
  
  /// Order by work_paused_at in descending order
  JobsModelQueryBuilder orderByWorkPausedAtDesc() {
    _queryBuilder = _queryBuilder.order('work_paused_at', ascending: false);
    return this;
  }

  /// Order by total_pause_duration in ascending order
  JobsModelQueryBuilder orderByTotalPauseDurationAsc() {
    _queryBuilder = _queryBuilder.order('total_pause_duration', ascending: true);
    return this;
  }
  
  /// Order by total_pause_duration in descending order
  JobsModelQueryBuilder orderByTotalPauseDurationDesc() {
    _queryBuilder = _queryBuilder.order('total_pause_duration', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  JobsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  JobsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  JobsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  JobsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by last_updated_by in ascending order
  JobsModelQueryBuilder orderByLastUpdatedByAsc() {
    _queryBuilder = _queryBuilder.order('last_updated_by', ascending: true);
    return this;
  }
  
  /// Order by last_updated_by in descending order
  JobsModelQueryBuilder orderByLastUpdatedByDesc() {
    _queryBuilder = _queryBuilder.order('last_updated_by', ascending: false);
    return this;
  }

  /// Order by current_session_id in ascending order
  JobsModelQueryBuilder orderByCurrentSessionIdAsc() {
    _queryBuilder = _queryBuilder.order('current_session_id', ascending: true);
    return this;
  }
  
  /// Order by current_session_id in descending order
  JobsModelQueryBuilder orderByCurrentSessionIdDesc() {
    _queryBuilder = _queryBuilder.order('current_session_id', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of JobsModel
  Future<List<JobsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => JobsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<JobsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return JobsModel.fromJson(response.first as Map<String, dynamic>);
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
