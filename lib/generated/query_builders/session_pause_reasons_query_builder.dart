import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/session_pause_reasons_model.dart';

/// A type-safe query builder for SessionPauseReasonsModel
class SessionPauseReasonsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  SessionPauseReasonsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('session_pause_reasons').select();
  }
  
  /// Set the fields to select
  SessionPauseReasonsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('session_pause_reasons').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  SessionPauseReasonsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  SessionPauseReasonsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by pause_id
  SessionPauseReasonsModelQueryBuilder wherePauseId(String value) {
    _queryBuilder = _queryBuilder.eq('pause_id', value);
    return this;
  }
  
  /// Filter by pause_id with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder wherePauseIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pause_id', values);
    return this;
  }
  
  

  /// Filter by session_id
  SessionPauseReasonsModelQueryBuilder whereSessionId(String value) {
    _queryBuilder = _queryBuilder.eq('session_id', value);
    return this;
  }
  
  /// Filter by session_id with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereSessionIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('session_id', values);
    return this;
  }
  
  

  /// Filter by reason
  SessionPauseReasonsModelQueryBuilder whereReason(String value) {
    _queryBuilder = _queryBuilder.eq('reason', value);
    return this;
  }
  
  /// Filter by reason with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('reason', values);
    return this;
  }
  
  

  /// Filter by details
  SessionPauseReasonsModelQueryBuilder whereDetails(String? value) {
    _queryBuilder = _queryBuilder.eq('details', value);
    return this;
  }
  
  /// Filter by details with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereDetailsIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('details', values);
    return this;
  }
  
  

  /// Filter by started_at
  SessionPauseReasonsModelQueryBuilder whereStartedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('started_at', value);
    return this;
  }
  
  /// Filter by started_at with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('started_at', values);
    return this;
  }
  
    /// Filter started_at greater than
  SessionPauseReasonsModelQueryBuilder whereStartedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('started_at', value);
    return this;
  }
  
  /// Filter started_at greater than or equal
  SessionPauseReasonsModelQueryBuilder whereStartedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('started_at', value);
    return this;
  }
  
  /// Filter started_at less than
  SessionPauseReasonsModelQueryBuilder whereStartedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('started_at', value);
    return this;
  }
  
  /// Filter started_at less than or equal
  SessionPauseReasonsModelQueryBuilder whereStartedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('started_at', value);
    return this;
  }
  
  /// Filter started_at between two values
  SessionPauseReasonsModelQueryBuilder whereStartedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('started_at', min).lte('started_at', max);
    return this;
  }

  /// Filter by ended_at
  SessionPauseReasonsModelQueryBuilder whereEndedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('ended_at', value);
    return this;
  }
  
  /// Filter by ended_at with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereEndedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('ended_at', values);
    return this;
  }
  
    /// Filter ended_at greater than
  SessionPauseReasonsModelQueryBuilder whereEndedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('ended_at', value);
    return this;
  }
  
  /// Filter ended_at greater than or equal
  SessionPauseReasonsModelQueryBuilder whereEndedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('ended_at', value);
    return this;
  }
  
  /// Filter ended_at less than
  SessionPauseReasonsModelQueryBuilder whereEndedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('ended_at', value);
    return this;
  }
  
  /// Filter ended_at less than or equal
  SessionPauseReasonsModelQueryBuilder whereEndedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('ended_at', value);
    return this;
  }
  
  /// Filter ended_at between two values
  SessionPauseReasonsModelQueryBuilder whereEndedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('ended_at', min).lte('ended_at', max);
    return this;
  }

  /// Filter by created_by
  SessionPauseReasonsModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  SessionPauseReasonsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  SessionPauseReasonsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  SessionPauseReasonsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  SessionPauseReasonsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  SessionPauseReasonsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  SessionPauseReasonsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  SessionPauseReasonsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by pause_id in ascending order
  SessionPauseReasonsModelQueryBuilder orderByPauseIdAsc() {
    _queryBuilder = _queryBuilder.order('pause_id', ascending: true);
    return this;
  }
  
  /// Order by pause_id in descending order
  SessionPauseReasonsModelQueryBuilder orderByPauseIdDesc() {
    _queryBuilder = _queryBuilder.order('pause_id', ascending: false);
    return this;
  }

  /// Order by session_id in ascending order
  SessionPauseReasonsModelQueryBuilder orderBySessionIdAsc() {
    _queryBuilder = _queryBuilder.order('session_id', ascending: true);
    return this;
  }
  
  /// Order by session_id in descending order
  SessionPauseReasonsModelQueryBuilder orderBySessionIdDesc() {
    _queryBuilder = _queryBuilder.order('session_id', ascending: false);
    return this;
  }

  /// Order by reason in ascending order
  SessionPauseReasonsModelQueryBuilder orderByReasonAsc() {
    _queryBuilder = _queryBuilder.order('reason', ascending: true);
    return this;
  }
  
  /// Order by reason in descending order
  SessionPauseReasonsModelQueryBuilder orderByReasonDesc() {
    _queryBuilder = _queryBuilder.order('reason', ascending: false);
    return this;
  }

  /// Order by details in ascending order
  SessionPauseReasonsModelQueryBuilder orderByDetailsAsc() {
    _queryBuilder = _queryBuilder.order('details', ascending: true);
    return this;
  }
  
  /// Order by details in descending order
  SessionPauseReasonsModelQueryBuilder orderByDetailsDesc() {
    _queryBuilder = _queryBuilder.order('details', ascending: false);
    return this;
  }

  /// Order by started_at in ascending order
  SessionPauseReasonsModelQueryBuilder orderByStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: true);
    return this;
  }
  
  /// Order by started_at in descending order
  SessionPauseReasonsModelQueryBuilder orderByStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: false);
    return this;
  }

  /// Order by ended_at in ascending order
  SessionPauseReasonsModelQueryBuilder orderByEndedAtAsc() {
    _queryBuilder = _queryBuilder.order('ended_at', ascending: true);
    return this;
  }
  
  /// Order by ended_at in descending order
  SessionPauseReasonsModelQueryBuilder orderByEndedAtDesc() {
    _queryBuilder = _queryBuilder.order('ended_at', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  SessionPauseReasonsModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  SessionPauseReasonsModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  SessionPauseReasonsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  SessionPauseReasonsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of SessionPauseReasonsModel
  Future<List<SessionPauseReasonsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => SessionPauseReasonsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<SessionPauseReasonsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return SessionPauseReasonsModel.fromJson(response.first as Map<String, dynamic>);
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
