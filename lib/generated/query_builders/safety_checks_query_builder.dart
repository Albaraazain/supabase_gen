import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/safety_checks_model.dart';

/// A type-safe query builder for SafetyChecksModel
class SafetyChecksModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  SafetyChecksModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('safety_checks').select();
  }
  
  /// Set the fields to select
  SafetyChecksModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('safety_checks').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  SafetyChecksModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  SafetyChecksModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by check_id
  SafetyChecksModelQueryBuilder whereCheckId(String value) {
    _queryBuilder = _queryBuilder.eq('check_id', value);
    return this;
  }
  
  /// Filter by check_id with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereCheckIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('check_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  SafetyChecksModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by check_name
  SafetyChecksModelQueryBuilder whereCheckName(String value) {
    _queryBuilder = _queryBuilder.eq('check_name', value);
    return this;
  }
  
  /// Filter by check_name with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereCheckNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('check_name', values);
    return this;
  }
  
  

  /// Filter by status
  SafetyChecksModelQueryBuilder whereStatus(String value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by notes
  SafetyChecksModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by performed_by
  SafetyChecksModelQueryBuilder wherePerformedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('performed_by', value);
    return this;
  }
  
  /// Filter by performed_by with multiple values (IN operator)
  SafetyChecksModelQueryBuilder wherePerformedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('performed_by', values);
    return this;
  }
  
  

  /// Filter by performed_at
  SafetyChecksModelQueryBuilder wherePerformedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('performed_at', value);
    return this;
  }
  
  /// Filter by performed_at with multiple values (IN operator)
  SafetyChecksModelQueryBuilder wherePerformedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('performed_at', values);
    return this;
  }
  
    /// Filter performed_at greater than
  SafetyChecksModelQueryBuilder wherePerformedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('performed_at', value);
    return this;
  }
  
  /// Filter performed_at greater than or equal
  SafetyChecksModelQueryBuilder wherePerformedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('performed_at', value);
    return this;
  }
  
  /// Filter performed_at less than
  SafetyChecksModelQueryBuilder wherePerformedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('performed_at', value);
    return this;
  }
  
  /// Filter performed_at less than or equal
  SafetyChecksModelQueryBuilder wherePerformedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('performed_at', value);
    return this;
  }
  
  /// Filter performed_at between two values
  SafetyChecksModelQueryBuilder wherePerformedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('performed_at', min).lte('performed_at', max);
    return this;
  }

  /// Filter by created_at
  SafetyChecksModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  SafetyChecksModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  SafetyChecksModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  SafetyChecksModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  SafetyChecksModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  SafetyChecksModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  SafetyChecksModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  SafetyChecksModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  SafetyChecksModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  SafetyChecksModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  SafetyChecksModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  SafetyChecksModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  SafetyChecksModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by check_id in ascending order
  SafetyChecksModelQueryBuilder orderByCheckIdAsc() {
    _queryBuilder = _queryBuilder.order('check_id', ascending: true);
    return this;
  }
  
  /// Order by check_id in descending order
  SafetyChecksModelQueryBuilder orderByCheckIdDesc() {
    _queryBuilder = _queryBuilder.order('check_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  SafetyChecksModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  SafetyChecksModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by check_name in ascending order
  SafetyChecksModelQueryBuilder orderByCheckNameAsc() {
    _queryBuilder = _queryBuilder.order('check_name', ascending: true);
    return this;
  }
  
  /// Order by check_name in descending order
  SafetyChecksModelQueryBuilder orderByCheckNameDesc() {
    _queryBuilder = _queryBuilder.order('check_name', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  SafetyChecksModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  SafetyChecksModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  SafetyChecksModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  SafetyChecksModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by performed_by in ascending order
  SafetyChecksModelQueryBuilder orderByPerformedByAsc() {
    _queryBuilder = _queryBuilder.order('performed_by', ascending: true);
    return this;
  }
  
  /// Order by performed_by in descending order
  SafetyChecksModelQueryBuilder orderByPerformedByDesc() {
    _queryBuilder = _queryBuilder.order('performed_by', ascending: false);
    return this;
  }

  /// Order by performed_at in ascending order
  SafetyChecksModelQueryBuilder orderByPerformedAtAsc() {
    _queryBuilder = _queryBuilder.order('performed_at', ascending: true);
    return this;
  }
  
  /// Order by performed_at in descending order
  SafetyChecksModelQueryBuilder orderByPerformedAtDesc() {
    _queryBuilder = _queryBuilder.order('performed_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  SafetyChecksModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  SafetyChecksModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  SafetyChecksModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  SafetyChecksModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of SafetyChecksModel
  Future<List<SafetyChecksModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => SafetyChecksModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<SafetyChecksModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return SafetyChecksModel.fromJson(response.first as Map<String, dynamic>);
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
