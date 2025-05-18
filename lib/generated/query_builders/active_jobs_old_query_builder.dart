import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/active_jobs_old_model.dart';

/// A type-safe query builder for ActiveJobsOldModel
class ActiveJobsOldModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ActiveJobsOldModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('active_jobs_old').select();
  }
  
  /// Set the fields to select
  ActiveJobsOldModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('active_jobs_old').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ActiveJobsOldModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ActiveJobsOldModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  ActiveJobsOldModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by homeowner_id
  ActiveJobsOldModelQueryBuilder whereHomeownerId(String value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ActiveJobsOldModelQueryBuilder whereProfessionalId(String? value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by service_id
  ActiveJobsOldModelQueryBuilder whereServiceId(String value) {
    _queryBuilder = _queryBuilder.eq('service_id', value);
    return this;
  }
  
  /// Filter by service_id with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereServiceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_id', values);
    return this;
  }
  
  

  /// Filter by current_stage
  ActiveJobsOldModelQueryBuilder whereCurrentStage(String value) {
    _queryBuilder = _queryBuilder.eq('current_stage', value);
    return this;
  }
  
  /// Filter by current_stage with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereCurrentStageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_stage', values);
    return this;
  }
  
  

  /// Filter by created_at
  ActiveJobsOldModelQueryBuilder whereCreatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ActiveJobsOldModelQueryBuilder whereCreatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ActiveJobsOldModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ActiveJobsOldModelQueryBuilder whereCreatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ActiveJobsOldModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ActiveJobsOldModelQueryBuilder whereCreatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ActiveJobsOldModelQueryBuilder whereUpdatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ActiveJobsOldModelQueryBuilder whereUpdatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ActiveJobsOldModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ActiveJobsOldModelQueryBuilder whereUpdatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ActiveJobsOldModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ActiveJobsOldModelQueryBuilder whereUpdatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by metadata
  ActiveJobsOldModelQueryBuilder whereMetadata(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('metadata', value);
    return this;
  }
  
  /// Filter by metadata with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereMetadataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('metadata', values);
    return this;
  }
  
  

  /// Filter by stage_updated_at
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('stage_updated_at', value);
    return this;
  }
  
  /// Filter by stage_updated_at with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_updated_at', values);
    return this;
  }
  
    /// Filter stage_updated_at greater than
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at greater than or equal
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at less than
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at less than or equal
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('stage_updated_at', value);
    return this;
  }
  
  /// Filter stage_updated_at between two values
  ActiveJobsOldModelQueryBuilder whereStageUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('stage_updated_at', min).lte('stage_updated_at', max);
    return this;
  }

  /// Filter by scheduled_time
  ActiveJobsOldModelQueryBuilder whereScheduledTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('scheduled_time', value);
    return this;
  }
  
  /// Filter by scheduled_time with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereScheduledTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('scheduled_time', values);
    return this;
  }
  
    /// Filter scheduled_time greater than
  ActiveJobsOldModelQueryBuilder whereScheduledTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time greater than or equal
  ActiveJobsOldModelQueryBuilder whereScheduledTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than
  ActiveJobsOldModelQueryBuilder whereScheduledTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than or equal
  ActiveJobsOldModelQueryBuilder whereScheduledTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time between two values
  ActiveJobsOldModelQueryBuilder whereScheduledTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', min).lte('scheduled_time', max);
    return this;
  }

  /// Filter by estimated_duration
  ActiveJobsOldModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  ActiveJobsOldModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  ActiveJobsOldModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  ActiveJobsOldModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  ActiveJobsOldModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  ActiveJobsOldModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }

  /// Filter by stage_notes
  ActiveJobsOldModelQueryBuilder whereStageNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('stage_notes', value);
    return this;
  }
  
  /// Filter by stage_notes with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereStageNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_notes', values);
    return this;
  }
  
  

  /// Filter by stage_metadata
  ActiveJobsOldModelQueryBuilder whereStageMetadata(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('stage_metadata', value);
    return this;
  }
  
  /// Filter by stage_metadata with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereStageMetadataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('stage_metadata', values);
    return this;
  }
  
  

  /// Filter by category_id
  ActiveJobsOldModelQueryBuilder whereCategoryId(String? value) {
    _queryBuilder = _queryBuilder.eq('category_id', value);
    return this;
  }
  
  /// Filter by category_id with multiple values (IN operator)
  ActiveJobsOldModelQueryBuilder whereCategoryIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('category_id', values);
    return this;
  }
  
  
  
  /// Order by job_id in ascending order
  ActiveJobsOldModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  ActiveJobsOldModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by homeowner_id in ascending order
  ActiveJobsOldModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  ActiveJobsOldModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ActiveJobsOldModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ActiveJobsOldModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by service_id in ascending order
  ActiveJobsOldModelQueryBuilder orderByServiceIdAsc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: true);
    return this;
  }
  
  /// Order by service_id in descending order
  ActiveJobsOldModelQueryBuilder orderByServiceIdDesc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: false);
    return this;
  }

  /// Order by current_stage in ascending order
  ActiveJobsOldModelQueryBuilder orderByCurrentStageAsc() {
    _queryBuilder = _queryBuilder.order('current_stage', ascending: true);
    return this;
  }
  
  /// Order by current_stage in descending order
  ActiveJobsOldModelQueryBuilder orderByCurrentStageDesc() {
    _queryBuilder = _queryBuilder.order('current_stage', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ActiveJobsOldModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ActiveJobsOldModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ActiveJobsOldModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ActiveJobsOldModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by metadata in ascending order
  ActiveJobsOldModelQueryBuilder orderByMetadataAsc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: true);
    return this;
  }
  
  /// Order by metadata in descending order
  ActiveJobsOldModelQueryBuilder orderByMetadataDesc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: false);
    return this;
  }

  /// Order by stage_updated_at in ascending order
  ActiveJobsOldModelQueryBuilder orderByStageUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('stage_updated_at', ascending: true);
    return this;
  }
  
  /// Order by stage_updated_at in descending order
  ActiveJobsOldModelQueryBuilder orderByStageUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('stage_updated_at', ascending: false);
    return this;
  }

  /// Order by scheduled_time in ascending order
  ActiveJobsOldModelQueryBuilder orderByScheduledTimeAsc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: true);
    return this;
  }
  
  /// Order by scheduled_time in descending order
  ActiveJobsOldModelQueryBuilder orderByScheduledTimeDesc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  ActiveJobsOldModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  ActiveJobsOldModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }

  /// Order by stage_notes in ascending order
  ActiveJobsOldModelQueryBuilder orderByStageNotesAsc() {
    _queryBuilder = _queryBuilder.order('stage_notes', ascending: true);
    return this;
  }
  
  /// Order by stage_notes in descending order
  ActiveJobsOldModelQueryBuilder orderByStageNotesDesc() {
    _queryBuilder = _queryBuilder.order('stage_notes', ascending: false);
    return this;
  }

  /// Order by stage_metadata in ascending order
  ActiveJobsOldModelQueryBuilder orderByStageMetadataAsc() {
    _queryBuilder = _queryBuilder.order('stage_metadata', ascending: true);
    return this;
  }
  
  /// Order by stage_metadata in descending order
  ActiveJobsOldModelQueryBuilder orderByStageMetadataDesc() {
    _queryBuilder = _queryBuilder.order('stage_metadata', ascending: false);
    return this;
  }

  /// Order by category_id in ascending order
  ActiveJobsOldModelQueryBuilder orderByCategoryIdAsc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: true);
    return this;
  }
  
  /// Order by category_id in descending order
  ActiveJobsOldModelQueryBuilder orderByCategoryIdDesc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ActiveJobsOldModel
  Future<List<ActiveJobsOldModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ActiveJobsOldModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ActiveJobsOldModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ActiveJobsOldModel.fromJson(response.first as Map<String, dynamic>);
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
