import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pause_periods_model.dart';

/// A type-safe query builder for PausePeriodsModel
class PausePeriodsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  PausePeriodsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('pause_periods').select();
  }
  
  /// Set the fields to select
  PausePeriodsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('pause_periods').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  PausePeriodsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  PausePeriodsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by pause_id
  PausePeriodsModelQueryBuilder wherePauseId(String value) {
    _queryBuilder = _queryBuilder.eq('pause_id', value);
    return this;
  }
  
  /// Filter by pause_id with multiple values (IN operator)
  PausePeriodsModelQueryBuilder wherePauseIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pause_id', values);
    return this;
  }
  
  

  /// Filter by session_id
  PausePeriodsModelQueryBuilder whereSessionId(String value) {
    _queryBuilder = _queryBuilder.eq('session_id', value);
    return this;
  }
  
  /// Filter by session_id with multiple values (IN operator)
  PausePeriodsModelQueryBuilder whereSessionIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('session_id', values);
    return this;
  }
  
  

  /// Filter by start_time
  PausePeriodsModelQueryBuilder whereStartTime(DateTime value) {
    _queryBuilder = _queryBuilder.eq('start_time', value);
    return this;
  }
  
  /// Filter by start_time with multiple values (IN operator)
  PausePeriodsModelQueryBuilder whereStartTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('start_time', values);
    return this;
  }
  
    /// Filter start_time greater than
  PausePeriodsModelQueryBuilder whereStartTimeGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('start_time', value);
    return this;
  }
  
  /// Filter start_time greater than or equal
  PausePeriodsModelQueryBuilder whereStartTimeGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('start_time', value);
    return this;
  }
  
  /// Filter start_time less than
  PausePeriodsModelQueryBuilder whereStartTimeLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('start_time', value);
    return this;
  }
  
  /// Filter start_time less than or equal
  PausePeriodsModelQueryBuilder whereStartTimeLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('start_time', value);
    return this;
  }
  
  /// Filter start_time between two values
  PausePeriodsModelQueryBuilder whereStartTimeBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('start_time', min).lte('start_time', max);
    return this;
  }

  /// Filter by end_time
  PausePeriodsModelQueryBuilder whereEndTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('end_time', value);
    return this;
  }
  
  /// Filter by end_time with multiple values (IN operator)
  PausePeriodsModelQueryBuilder whereEndTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('end_time', values);
    return this;
  }
  
    /// Filter end_time greater than
  PausePeriodsModelQueryBuilder whereEndTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('end_time', value);
    return this;
  }
  
  /// Filter end_time greater than or equal
  PausePeriodsModelQueryBuilder whereEndTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('end_time', value);
    return this;
  }
  
  /// Filter end_time less than
  PausePeriodsModelQueryBuilder whereEndTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('end_time', value);
    return this;
  }
  
  /// Filter end_time less than or equal
  PausePeriodsModelQueryBuilder whereEndTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('end_time', value);
    return this;
  }
  
  /// Filter end_time between two values
  PausePeriodsModelQueryBuilder whereEndTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('end_time', min).lte('end_time', max);
    return this;
  }

  /// Filter by reason
  PausePeriodsModelQueryBuilder whereReason(String value) {
    _queryBuilder = _queryBuilder.eq('reason', value);
    return this;
  }
  
  /// Filter by reason with multiple values (IN operator)
  PausePeriodsModelQueryBuilder whereReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('reason', values);
    return this;
  }
  
  

  /// Filter by created_at
  PausePeriodsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  PausePeriodsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  PausePeriodsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  PausePeriodsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  PausePeriodsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  PausePeriodsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  PausePeriodsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  PausePeriodsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  PausePeriodsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  PausePeriodsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  PausePeriodsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  PausePeriodsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  PausePeriodsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  PausePeriodsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by pause_id in ascending order
  PausePeriodsModelQueryBuilder orderByPauseIdAsc() {
    _queryBuilder = _queryBuilder.order('pause_id', ascending: true);
    return this;
  }
  
  /// Order by pause_id in descending order
  PausePeriodsModelQueryBuilder orderByPauseIdDesc() {
    _queryBuilder = _queryBuilder.order('pause_id', ascending: false);
    return this;
  }

  /// Order by session_id in ascending order
  PausePeriodsModelQueryBuilder orderBySessionIdAsc() {
    _queryBuilder = _queryBuilder.order('session_id', ascending: true);
    return this;
  }
  
  /// Order by session_id in descending order
  PausePeriodsModelQueryBuilder orderBySessionIdDesc() {
    _queryBuilder = _queryBuilder.order('session_id', ascending: false);
    return this;
  }

  /// Order by start_time in ascending order
  PausePeriodsModelQueryBuilder orderByStartTimeAsc() {
    _queryBuilder = _queryBuilder.order('start_time', ascending: true);
    return this;
  }
  
  /// Order by start_time in descending order
  PausePeriodsModelQueryBuilder orderByStartTimeDesc() {
    _queryBuilder = _queryBuilder.order('start_time', ascending: false);
    return this;
  }

  /// Order by end_time in ascending order
  PausePeriodsModelQueryBuilder orderByEndTimeAsc() {
    _queryBuilder = _queryBuilder.order('end_time', ascending: true);
    return this;
  }
  
  /// Order by end_time in descending order
  PausePeriodsModelQueryBuilder orderByEndTimeDesc() {
    _queryBuilder = _queryBuilder.order('end_time', ascending: false);
    return this;
  }

  /// Order by reason in ascending order
  PausePeriodsModelQueryBuilder orderByReasonAsc() {
    _queryBuilder = _queryBuilder.order('reason', ascending: true);
    return this;
  }
  
  /// Order by reason in descending order
  PausePeriodsModelQueryBuilder orderByReasonDesc() {
    _queryBuilder = _queryBuilder.order('reason', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  PausePeriodsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  PausePeriodsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  PausePeriodsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  PausePeriodsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of PausePeriodsModel
  Future<List<PausePeriodsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => PausePeriodsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<PausePeriodsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return PausePeriodsModel.fromJson(response.first as Map<String, dynamic>);
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
