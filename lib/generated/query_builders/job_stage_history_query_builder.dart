import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_stage_history_model.dart';

/// A type-safe query builder for JobStageHistoryModel
class JobStageHistoryModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  JobStageHistoryModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('job_stage_history').select();
  }
  
  /// Set the fields to select
  JobStageHistoryModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('job_stage_history').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  JobStageHistoryModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  JobStageHistoryModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by history_id
  JobStageHistoryModelQueryBuilder whereHistoryId(String value) {
    _queryBuilder = _queryBuilder.eq('history_id', value);
    return this;
  }
  
  /// Filter by history_id with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereHistoryIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('history_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  JobStageHistoryModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by from_stage
  JobStageHistoryModelQueryBuilder whereFromStage(String? value) {
    _queryBuilder = _queryBuilder.eq('from_stage', value);
    return this;
  }
  
  /// Filter by from_stage with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereFromStageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('from_stage', values);
    return this;
  }
  
  

  /// Filter by to_stage
  JobStageHistoryModelQueryBuilder whereToStage(String value) {
    _queryBuilder = _queryBuilder.eq('to_stage', value);
    return this;
  }
  
  /// Filter by to_stage with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereToStageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('to_stage', values);
    return this;
  }
  
  

  /// Filter by changed_by
  JobStageHistoryModelQueryBuilder whereChangedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('changed_by', value);
    return this;
  }
  
  /// Filter by changed_by with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereChangedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('changed_by', values);
    return this;
  }
  
  

  /// Filter by notes
  JobStageHistoryModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by created_at
  JobStageHistoryModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  JobStageHistoryModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  JobStageHistoryModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  JobStageHistoryModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  JobStageHistoryModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  JobStageHistoryModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  JobStageHistoryModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by history_id in ascending order
  JobStageHistoryModelQueryBuilder orderByHistoryIdAsc() {
    _queryBuilder = _queryBuilder.order('history_id', ascending: true);
    return this;
  }
  
  /// Order by history_id in descending order
  JobStageHistoryModelQueryBuilder orderByHistoryIdDesc() {
    _queryBuilder = _queryBuilder.order('history_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  JobStageHistoryModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  JobStageHistoryModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by from_stage in ascending order
  JobStageHistoryModelQueryBuilder orderByFromStageAsc() {
    _queryBuilder = _queryBuilder.order('from_stage', ascending: true);
    return this;
  }
  
  /// Order by from_stage in descending order
  JobStageHistoryModelQueryBuilder orderByFromStageDesc() {
    _queryBuilder = _queryBuilder.order('from_stage', ascending: false);
    return this;
  }

  /// Order by to_stage in ascending order
  JobStageHistoryModelQueryBuilder orderByToStageAsc() {
    _queryBuilder = _queryBuilder.order('to_stage', ascending: true);
    return this;
  }
  
  /// Order by to_stage in descending order
  JobStageHistoryModelQueryBuilder orderByToStageDesc() {
    _queryBuilder = _queryBuilder.order('to_stage', ascending: false);
    return this;
  }

  /// Order by changed_by in ascending order
  JobStageHistoryModelQueryBuilder orderByChangedByAsc() {
    _queryBuilder = _queryBuilder.order('changed_by', ascending: true);
    return this;
  }
  
  /// Order by changed_by in descending order
  JobStageHistoryModelQueryBuilder orderByChangedByDesc() {
    _queryBuilder = _queryBuilder.order('changed_by', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  JobStageHistoryModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  JobStageHistoryModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  JobStageHistoryModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  JobStageHistoryModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of JobStageHistoryModel
  Future<List<JobStageHistoryModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => JobStageHistoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<JobStageHistoryModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return JobStageHistoryModel.fromJson(response.first as Map<String, dynamic>);
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
