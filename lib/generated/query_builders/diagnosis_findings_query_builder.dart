import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/diagnosis_findings_model.dart';

/// A type-safe query builder for DiagnosisFindingsModel
class DiagnosisFindingsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  DiagnosisFindingsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('diagnosis_findings').select();
  }
  
  /// Set the fields to select
  DiagnosisFindingsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('diagnosis_findings').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  DiagnosisFindingsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  DiagnosisFindingsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by finding_id
  DiagnosisFindingsModelQueryBuilder whereFindingId(String value) {
    _queryBuilder = _queryBuilder.eq('finding_id', value);
    return this;
  }
  
  /// Filter by finding_id with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereFindingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('finding_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  DiagnosisFindingsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by description
  DiagnosisFindingsModelQueryBuilder whereDescription(String value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by severity
  DiagnosisFindingsModelQueryBuilder whereSeverity(String? value) {
    _queryBuilder = _queryBuilder.eq('severity', value);
    return this;
  }
  
  /// Filter by severity with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereSeverityIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('severity', values);
    return this;
  }
  
  

  /// Filter by recommended_action
  DiagnosisFindingsModelQueryBuilder whereRecommendedAction(String? value) {
    _queryBuilder = _queryBuilder.eq('recommended_action', value);
    return this;
  }
  
  /// Filter by recommended_action with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereRecommendedActionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('recommended_action', values);
    return this;
  }
  
  

  /// Filter by recorded_by
  DiagnosisFindingsModelQueryBuilder whereRecordedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('recorded_by', value);
    return this;
  }
  
  /// Filter by recorded_by with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereRecordedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('recorded_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  DiagnosisFindingsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  DiagnosisFindingsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  DiagnosisFindingsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  DiagnosisFindingsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  DiagnosisFindingsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  DiagnosisFindingsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  DiagnosisFindingsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  DiagnosisFindingsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  DiagnosisFindingsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  DiagnosisFindingsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  DiagnosisFindingsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  DiagnosisFindingsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by title
  DiagnosisFindingsModelQueryBuilder whereTitle(String value) {
    _queryBuilder = _queryBuilder.eq('title', value);
    return this;
  }
  
  /// Filter by title with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereTitleIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('title', values);
    return this;
  }
  
  

  /// Filter by icon_type
  DiagnosisFindingsModelQueryBuilder whereIconType(String? value) {
    _queryBuilder = _queryBuilder.eq('icon_type', value);
    return this;
  }
  
  /// Filter by icon_type with multiple values (IN operator)
  DiagnosisFindingsModelQueryBuilder whereIconTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('icon_type', values);
    return this;
  }
  
  
  
  /// Order by finding_id in ascending order
  DiagnosisFindingsModelQueryBuilder orderByFindingIdAsc() {
    _queryBuilder = _queryBuilder.order('finding_id', ascending: true);
    return this;
  }
  
  /// Order by finding_id in descending order
  DiagnosisFindingsModelQueryBuilder orderByFindingIdDesc() {
    _queryBuilder = _queryBuilder.order('finding_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  DiagnosisFindingsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  DiagnosisFindingsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  DiagnosisFindingsModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  DiagnosisFindingsModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by severity in ascending order
  DiagnosisFindingsModelQueryBuilder orderBySeverityAsc() {
    _queryBuilder = _queryBuilder.order('severity', ascending: true);
    return this;
  }
  
  /// Order by severity in descending order
  DiagnosisFindingsModelQueryBuilder orderBySeverityDesc() {
    _queryBuilder = _queryBuilder.order('severity', ascending: false);
    return this;
  }

  /// Order by recommended_action in ascending order
  DiagnosisFindingsModelQueryBuilder orderByRecommendedActionAsc() {
    _queryBuilder = _queryBuilder.order('recommended_action', ascending: true);
    return this;
  }
  
  /// Order by recommended_action in descending order
  DiagnosisFindingsModelQueryBuilder orderByRecommendedActionDesc() {
    _queryBuilder = _queryBuilder.order('recommended_action', ascending: false);
    return this;
  }

  /// Order by recorded_by in ascending order
  DiagnosisFindingsModelQueryBuilder orderByRecordedByAsc() {
    _queryBuilder = _queryBuilder.order('recorded_by', ascending: true);
    return this;
  }
  
  /// Order by recorded_by in descending order
  DiagnosisFindingsModelQueryBuilder orderByRecordedByDesc() {
    _queryBuilder = _queryBuilder.order('recorded_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  DiagnosisFindingsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  DiagnosisFindingsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  DiagnosisFindingsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  DiagnosisFindingsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by title in ascending order
  DiagnosisFindingsModelQueryBuilder orderByTitleAsc() {
    _queryBuilder = _queryBuilder.order('title', ascending: true);
    return this;
  }
  
  /// Order by title in descending order
  DiagnosisFindingsModelQueryBuilder orderByTitleDesc() {
    _queryBuilder = _queryBuilder.order('title', ascending: false);
    return this;
  }

  /// Order by icon_type in ascending order
  DiagnosisFindingsModelQueryBuilder orderByIconTypeAsc() {
    _queryBuilder = _queryBuilder.order('icon_type', ascending: true);
    return this;
  }
  
  /// Order by icon_type in descending order
  DiagnosisFindingsModelQueryBuilder orderByIconTypeDesc() {
    _queryBuilder = _queryBuilder.order('icon_type', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of DiagnosisFindingsModel
  Future<List<DiagnosisFindingsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => DiagnosisFindingsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<DiagnosisFindingsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return DiagnosisFindingsModel.fromJson(response.first as Map<String, dynamic>);
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
