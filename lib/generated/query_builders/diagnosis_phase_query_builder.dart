import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/diagnosis_phase_model.dart';

/// A type-safe query builder for DiagnosisPhaseModel
class DiagnosisPhaseModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  DiagnosisPhaseModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('diagnosis_phase').select();
  }
  
  /// Set the fields to select
  DiagnosisPhaseModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('diagnosis_phase').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  DiagnosisPhaseModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  DiagnosisPhaseModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  DiagnosisPhaseModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  DiagnosisPhaseModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by diagnosis_started_at
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('diagnosis_started_at', value);
    return this;
  }
  
  /// Filter by diagnosis_started_at with multiple values (IN operator)
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('diagnosis_started_at', values);
    return this;
  }
  
    /// Filter diagnosis_started_at greater than
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('diagnosis_started_at', value);
    return this;
  }
  
  /// Filter diagnosis_started_at greater than or equal
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('diagnosis_started_at', value);
    return this;
  }
  
  /// Filter diagnosis_started_at less than
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('diagnosis_started_at', value);
    return this;
  }
  
  /// Filter diagnosis_started_at less than or equal
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('diagnosis_started_at', value);
    return this;
  }
  
  /// Filter diagnosis_started_at between two values
  DiagnosisPhaseModelQueryBuilder whereDiagnosisStartedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('diagnosis_started_at', min).lte('diagnosis_started_at', max);
    return this;
  }

  /// Filter by diagnosis_ended_at
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('diagnosis_ended_at', value);
    return this;
  }
  
  /// Filter by diagnosis_ended_at with multiple values (IN operator)
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('diagnosis_ended_at', values);
    return this;
  }
  
    /// Filter diagnosis_ended_at greater than
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('diagnosis_ended_at', value);
    return this;
  }
  
  /// Filter diagnosis_ended_at greater than or equal
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('diagnosis_ended_at', value);
    return this;
  }
  
  /// Filter diagnosis_ended_at less than
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('diagnosis_ended_at', value);
    return this;
  }
  
  /// Filter diagnosis_ended_at less than or equal
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('diagnosis_ended_at', value);
    return this;
  }
  
  /// Filter diagnosis_ended_at between two values
  DiagnosisPhaseModelQueryBuilder whereDiagnosisEndedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('diagnosis_ended_at', min).lte('diagnosis_ended_at', max);
    return this;
  }

  /// Filter by findings_summary
  DiagnosisPhaseModelQueryBuilder whereFindingsSummary(String? value) {
    _queryBuilder = _queryBuilder.eq('findings_summary', value);
    return this;
  }
  
  /// Filter by findings_summary with multiple values (IN operator)
  DiagnosisPhaseModelQueryBuilder whereFindingsSummaryIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('findings_summary', values);
    return this;
  }
  
  

  /// Filter by recommended_actions
  DiagnosisPhaseModelQueryBuilder whereRecommendedActions(String? value) {
    _queryBuilder = _queryBuilder.eq('recommended_actions', value);
    return this;
  }
  
  /// Filter by recommended_actions with multiple values (IN operator)
  DiagnosisPhaseModelQueryBuilder whereRecommendedActionsIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('recommended_actions', values);
    return this;
  }
  
  
  
  /// Order by job_id in ascending order
  DiagnosisPhaseModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  DiagnosisPhaseModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by diagnosis_started_at in ascending order
  DiagnosisPhaseModelQueryBuilder orderByDiagnosisStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('diagnosis_started_at', ascending: true);
    return this;
  }
  
  /// Order by diagnosis_started_at in descending order
  DiagnosisPhaseModelQueryBuilder orderByDiagnosisStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('diagnosis_started_at', ascending: false);
    return this;
  }

  /// Order by diagnosis_ended_at in ascending order
  DiagnosisPhaseModelQueryBuilder orderByDiagnosisEndedAtAsc() {
    _queryBuilder = _queryBuilder.order('diagnosis_ended_at', ascending: true);
    return this;
  }
  
  /// Order by diagnosis_ended_at in descending order
  DiagnosisPhaseModelQueryBuilder orderByDiagnosisEndedAtDesc() {
    _queryBuilder = _queryBuilder.order('diagnosis_ended_at', ascending: false);
    return this;
  }

  /// Order by findings_summary in ascending order
  DiagnosisPhaseModelQueryBuilder orderByFindingsSummaryAsc() {
    _queryBuilder = _queryBuilder.order('findings_summary', ascending: true);
    return this;
  }
  
  /// Order by findings_summary in descending order
  DiagnosisPhaseModelQueryBuilder orderByFindingsSummaryDesc() {
    _queryBuilder = _queryBuilder.order('findings_summary', ascending: false);
    return this;
  }

  /// Order by recommended_actions in ascending order
  DiagnosisPhaseModelQueryBuilder orderByRecommendedActionsAsc() {
    _queryBuilder = _queryBuilder.order('recommended_actions', ascending: true);
    return this;
  }
  
  /// Order by recommended_actions in descending order
  DiagnosisPhaseModelQueryBuilder orderByRecommendedActionsDesc() {
    _queryBuilder = _queryBuilder.order('recommended_actions', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of DiagnosisPhaseModel
  Future<List<DiagnosisPhaseModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => DiagnosisPhaseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<DiagnosisPhaseModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return DiagnosisPhaseModel.fromJson(response.first as Map<String, dynamic>);
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
