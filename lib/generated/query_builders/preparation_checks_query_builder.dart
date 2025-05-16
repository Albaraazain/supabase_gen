import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/preparation_checks_model.dart';

/// A type-safe query builder for PreparationChecksModel
class PreparationChecksModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  PreparationChecksModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('preparation_checks').select();
  }
  
  /// Set the fields to select
  PreparationChecksModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('preparation_checks').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  PreparationChecksModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  PreparationChecksModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by check_id
  PreparationChecksModelQueryBuilder whereCheckId(String value) {
    _queryBuilder = _queryBuilder.eq('check_id', value);
    return this;
  }
  
  /// Filter by check_id with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereCheckIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('check_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  PreparationChecksModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by check_name
  PreparationChecksModelQueryBuilder whereCheckName(String value) {
    _queryBuilder = _queryBuilder.eq('check_name', value);
    return this;
  }
  
  /// Filter by check_name with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereCheckNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('check_name', values);
    return this;
  }
  
  

  /// Filter by status
  PreparationChecksModelQueryBuilder whereStatus(String value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by notes
  PreparationChecksModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by performed_by
  PreparationChecksModelQueryBuilder wherePerformedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('performed_by', value);
    return this;
  }
  
  /// Filter by performed_by with multiple values (IN operator)
  PreparationChecksModelQueryBuilder wherePerformedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('performed_by', values);
    return this;
  }
  
  

  /// Filter by performed_at
  PreparationChecksModelQueryBuilder wherePerformedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('performed_at', value);
    return this;
  }
  
  /// Filter by performed_at with multiple values (IN operator)
  PreparationChecksModelQueryBuilder wherePerformedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('performed_at', values);
    return this;
  }
  
    /// Filter performed_at greater than
  PreparationChecksModelQueryBuilder wherePerformedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('performed_at', value);
    return this;
  }
  
  /// Filter performed_at greater than or equal
  PreparationChecksModelQueryBuilder wherePerformedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('performed_at', value);
    return this;
  }
  
  /// Filter performed_at less than
  PreparationChecksModelQueryBuilder wherePerformedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('performed_at', value);
    return this;
  }
  
  /// Filter performed_at less than or equal
  PreparationChecksModelQueryBuilder wherePerformedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('performed_at', value);
    return this;
  }
  
  /// Filter performed_at between two values
  PreparationChecksModelQueryBuilder wherePerformedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('performed_at', min).lte('performed_at', max);
    return this;
  }

  /// Filter by created_at
  PreparationChecksModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  PreparationChecksModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  PreparationChecksModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  PreparationChecksModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  PreparationChecksModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  PreparationChecksModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  PreparationChecksModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  PreparationChecksModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  PreparationChecksModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  PreparationChecksModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  PreparationChecksModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  PreparationChecksModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  PreparationChecksModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by check_id in ascending order
  PreparationChecksModelQueryBuilder orderByCheckIdAsc() {
    _queryBuilder = _queryBuilder.order('check_id', ascending: true);
    return this;
  }
  
  /// Order by check_id in descending order
  PreparationChecksModelQueryBuilder orderByCheckIdDesc() {
    _queryBuilder = _queryBuilder.order('check_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  PreparationChecksModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  PreparationChecksModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by check_name in ascending order
  PreparationChecksModelQueryBuilder orderByCheckNameAsc() {
    _queryBuilder = _queryBuilder.order('check_name', ascending: true);
    return this;
  }
  
  /// Order by check_name in descending order
  PreparationChecksModelQueryBuilder orderByCheckNameDesc() {
    _queryBuilder = _queryBuilder.order('check_name', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  PreparationChecksModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  PreparationChecksModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  PreparationChecksModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  PreparationChecksModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by performed_by in ascending order
  PreparationChecksModelQueryBuilder orderByPerformedByAsc() {
    _queryBuilder = _queryBuilder.order('performed_by', ascending: true);
    return this;
  }
  
  /// Order by performed_by in descending order
  PreparationChecksModelQueryBuilder orderByPerformedByDesc() {
    _queryBuilder = _queryBuilder.order('performed_by', ascending: false);
    return this;
  }

  /// Order by performed_at in ascending order
  PreparationChecksModelQueryBuilder orderByPerformedAtAsc() {
    _queryBuilder = _queryBuilder.order('performed_at', ascending: true);
    return this;
  }
  
  /// Order by performed_at in descending order
  PreparationChecksModelQueryBuilder orderByPerformedAtDesc() {
    _queryBuilder = _queryBuilder.order('performed_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  PreparationChecksModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  PreparationChecksModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  PreparationChecksModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  PreparationChecksModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of PreparationChecksModel
  Future<List<PreparationChecksModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => PreparationChecksModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<PreparationChecksModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return PreparationChecksModel.fromJson(response.first as Map<String, dynamic>);
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
