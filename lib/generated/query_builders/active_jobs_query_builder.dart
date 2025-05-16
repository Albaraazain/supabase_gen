import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/active_jobs_model.dart';

/// A type-safe query builder for ActiveJobsModel
class ActiveJobsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ActiveJobsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('active_jobs').select();
  }
  
  /// Set the fields to select
  ActiveJobsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('active_jobs').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ActiveJobsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ActiveJobsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  ActiveJobsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by homeowner_id
  ActiveJobsModelQueryBuilder whereHomeownerId(String value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ActiveJobsModelQueryBuilder whereProfessionalId(String? value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by service_id
  ActiveJobsModelQueryBuilder whereServiceId(String value) {
    _queryBuilder = _queryBuilder.eq('service_id', value);
    return this;
  }
  
  /// Filter by service_id with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereServiceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_id', values);
    return this;
  }
  
  

  /// Filter by current_stage
  ActiveJobsModelQueryBuilder whereCurrentStage(String value) {
    _queryBuilder = _queryBuilder.eq('current_stage', value);
    return this;
  }
  
  /// Filter by current_stage with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereCurrentStageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_stage', values);
    return this;
  }
  
  

  /// Filter by created_at
  ActiveJobsModelQueryBuilder whereCreatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ActiveJobsModelQueryBuilder whereCreatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ActiveJobsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ActiveJobsModelQueryBuilder whereCreatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ActiveJobsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ActiveJobsModelQueryBuilder whereCreatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ActiveJobsModelQueryBuilder whereUpdatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ActiveJobsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ActiveJobsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ActiveJobsModelQueryBuilder whereUpdatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ActiveJobsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ActiveJobsModelQueryBuilder whereUpdatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by metadata
  ActiveJobsModelQueryBuilder whereMetadata(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('metadata', value);
    return this;
  }
  
  /// Filter by metadata with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereMetadataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('metadata', values);
    return this;
  }
  
  

  /// Filter by stage_updated_at
  ActiveJobsModelQueryBuilder whereStageUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('stage_updated_at', value);
    return this;
  }
  
  /// Filter by stage_updated_at with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereStageUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_updated_at', values);
    return this;
  }
  
    /// Filter stage_updated_at greater than
  ActiveJobsModelQueryBuilder whereStageUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at greater than or equal
  ActiveJobsModelQueryBuilder whereStageUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at less than
  ActiveJobsModelQueryBuilder whereStageUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at less than or equal
  ActiveJobsModelQueryBuilder whereStageUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at between two values
  ActiveJobsModelQueryBuilder whereStageUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('stage_updated_at', min).lte('stage_updated_at', max);
    return this;
  }

  /// Filter by scheduled_time
  ActiveJobsModelQueryBuilder whereScheduledTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('scheduled_time', value);
    return this;
  }
  
  /// Filter by scheduled_time with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereScheduledTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('scheduled_time', values);
    return this;
  }
  
    /// Filter scheduled_time greater than
  ActiveJobsModelQueryBuilder whereScheduledTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time greater than or equal
  ActiveJobsModelQueryBuilder whereScheduledTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than
  ActiveJobsModelQueryBuilder whereScheduledTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than or equal
  ActiveJobsModelQueryBuilder whereScheduledTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time between two values
  ActiveJobsModelQueryBuilder whereScheduledTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', min).lte('scheduled_time', max);
    return this;
  }

  /// Filter by estimated_duration
  ActiveJobsModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  ActiveJobsModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  ActiveJobsModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  ActiveJobsModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  ActiveJobsModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  ActiveJobsModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }

  /// Filter by stage_notes
  ActiveJobsModelQueryBuilder whereStageNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('stage_notes', value);
    return this;
  }
  
  /// Filter by stage_notes with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereStageNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_notes', values);
    return this;
  }
  
  

  /// Filter by stage_metadata
  ActiveJobsModelQueryBuilder whereStageMetadata(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('stage_metadata', value);
    return this;
  }
  
  /// Filter by stage_metadata with multiple values (IN operator)
  ActiveJobsModelQueryBuilder whereStageMetadataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_metadata', values);
    return this;
  }
  
  
  
  /// Order by job_id in ascending order
  ActiveJobsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  ActiveJobsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by homeowner_id in ascending order
  ActiveJobsModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  ActiveJobsModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ActiveJobsModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ActiveJobsModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by service_id in ascending order
  ActiveJobsModelQueryBuilder orderByServiceIdAsc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: true);
    return this;
  }
  
  /// Order by service_id in descending order
  ActiveJobsModelQueryBuilder orderByServiceIdDesc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: false);
    return this;
  }

  /// Order by current_stage in ascending order
  ActiveJobsModelQueryBuilder orderByCurrentStageAsc() {
    _queryBuilder = _queryBuilder.order('current_stage', ascending: true);
    return this;
  }
  
  /// Order by current_stage in descending order
  ActiveJobsModelQueryBuilder orderByCurrentStageDesc() {
    _queryBuilder = _queryBuilder.order('current_stage', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ActiveJobsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ActiveJobsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ActiveJobsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ActiveJobsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by metadata in ascending order
  ActiveJobsModelQueryBuilder orderByMetadataAsc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: true);
    return this;
  }
  
  /// Order by metadata in descending order
  ActiveJobsModelQueryBuilder orderByMetadataDesc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: false);
    return this;
  }

  /// Order by stage_updated_at in ascending order
  ActiveJobsModelQueryBuilder orderByStageUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('stage_updated_at', ascending: true);
    return this;
  }
  
  /// Order by stage_updated_at in descending order
  ActiveJobsModelQueryBuilder orderByStageUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('stage_updated_at', ascending: false);
    return this;
  }

  /// Order by scheduled_time in ascending order
  ActiveJobsModelQueryBuilder orderByScheduledTimeAsc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: true);
    return this;
  }
  
  /// Order by scheduled_time in descending order
  ActiveJobsModelQueryBuilder orderByScheduledTimeDesc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  ActiveJobsModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  ActiveJobsModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }

  /// Order by stage_notes in ascending order
  ActiveJobsModelQueryBuilder orderByStageNotesAsc() {
    _queryBuilder = _queryBuilder.order('stage_notes', ascending: true);
    return this;
  }
  
  /// Order by stage_notes in descending order
  ActiveJobsModelQueryBuilder orderByStageNotesDesc() {
    _queryBuilder = _queryBuilder.order('stage_notes', ascending: false);
    return this;
  }

  /// Order by stage_metadata in ascending order
  ActiveJobsModelQueryBuilder orderByStageMetadataAsc() {
    _queryBuilder = _queryBuilder.order('stage_metadata', ascending: true);
    return this;
  }
  
  /// Order by stage_metadata in descending order
  ActiveJobsModelQueryBuilder orderByStageMetadataDesc() {
    _queryBuilder = _queryBuilder.order('stage_metadata', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ActiveJobsModel
  Future<List<ActiveJobsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ActiveJobsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ActiveJobsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ActiveJobsModel.fromJson(response.first as Map<String, dynamic>);
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
