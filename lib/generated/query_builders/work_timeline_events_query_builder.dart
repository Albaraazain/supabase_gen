import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/work_timeline_events_model.dart';

/// A type-safe query builder for WorkTimelineEventsModel
class WorkTimelineEventsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  WorkTimelineEventsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('work_timeline_events').select();
  }
  
  /// Set the fields to select
  WorkTimelineEventsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('work_timeline_events').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  WorkTimelineEventsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  WorkTimelineEventsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by event_id
  WorkTimelineEventsModelQueryBuilder whereEventId(String value) {
    _queryBuilder = _queryBuilder.eq('event_id', value);
    return this;
  }
  
  /// Filter by event_id with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereEventIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('event_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  WorkTimelineEventsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by event_type
  WorkTimelineEventsModelQueryBuilder whereEventType(String value) {
    _queryBuilder = _queryBuilder.eq('event_type', value);
    return this;
  }
  
  /// Filter by event_type with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereEventTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('event_type', values);
    return this;
  }
  
  

  /// Filter by event_data
  WorkTimelineEventsModelQueryBuilder whereEventData(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('event_data', value);
    return this;
  }
  
  /// Filter by event_data with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereEventDataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('event_data', values);
    return this;
  }
  
  

  /// Filter by task_id
  WorkTimelineEventsModelQueryBuilder whereTaskId(String? value) {
    _queryBuilder = _queryBuilder.eq('task_id', value);
    return this;
  }
  
  /// Filter by task_id with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereTaskIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('task_id', values);
    return this;
  }
  
  

  /// Filter by created_by
  WorkTimelineEventsModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  WorkTimelineEventsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  WorkTimelineEventsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  WorkTimelineEventsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  WorkTimelineEventsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  WorkTimelineEventsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  WorkTimelineEventsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  WorkTimelineEventsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by event_id in ascending order
  WorkTimelineEventsModelQueryBuilder orderByEventIdAsc() {
    _queryBuilder = _queryBuilder.order('event_id', ascending: true);
    return this;
  }
  
  /// Order by event_id in descending order
  WorkTimelineEventsModelQueryBuilder orderByEventIdDesc() {
    _queryBuilder = _queryBuilder.order('event_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  WorkTimelineEventsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  WorkTimelineEventsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by event_type in ascending order
  WorkTimelineEventsModelQueryBuilder orderByEventTypeAsc() {
    _queryBuilder = _queryBuilder.order('event_type', ascending: true);
    return this;
  }
  
  /// Order by event_type in descending order
  WorkTimelineEventsModelQueryBuilder orderByEventTypeDesc() {
    _queryBuilder = _queryBuilder.order('event_type', ascending: false);
    return this;
  }

  /// Order by event_data in ascending order
  WorkTimelineEventsModelQueryBuilder orderByEventDataAsc() {
    _queryBuilder = _queryBuilder.order('event_data', ascending: true);
    return this;
  }
  
  /// Order by event_data in descending order
  WorkTimelineEventsModelQueryBuilder orderByEventDataDesc() {
    _queryBuilder = _queryBuilder.order('event_data', ascending: false);
    return this;
  }

  /// Order by task_id in ascending order
  WorkTimelineEventsModelQueryBuilder orderByTaskIdAsc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: true);
    return this;
  }
  
  /// Order by task_id in descending order
  WorkTimelineEventsModelQueryBuilder orderByTaskIdDesc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  WorkTimelineEventsModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  WorkTimelineEventsModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  WorkTimelineEventsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  WorkTimelineEventsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of WorkTimelineEventsModel
  Future<List<WorkTimelineEventsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => WorkTimelineEventsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<WorkTimelineEventsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return WorkTimelineEventsModel.fromJson(response.first as Map<String, dynamic>);
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
