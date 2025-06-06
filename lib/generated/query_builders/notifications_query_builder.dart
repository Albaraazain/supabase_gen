import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/notifications_model.dart';

/// A type-safe query builder for NotificationsModel
class NotificationsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  NotificationsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('notifications').select();
  }
  
  /// Set the fields to select
  NotificationsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('notifications').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  NotificationsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  NotificationsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  NotificationsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  NotificationsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by user_id
  NotificationsModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  NotificationsModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by type
  NotificationsModelQueryBuilder whereType(String value) {
    _queryBuilder = _queryBuilder.eq('type', value);
    return this;
  }
  
  /// Filter by type with multiple values (IN operator)
  NotificationsModelQueryBuilder whereTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('type', values);
    return this;
  }
  
  

  /// Filter by title
  NotificationsModelQueryBuilder whereTitle(String value) {
    _queryBuilder = _queryBuilder.eq('title', value);
    return this;
  }
  
  /// Filter by title with multiple values (IN operator)
  NotificationsModelQueryBuilder whereTitleIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('title', values);
    return this;
  }
  
  

  /// Filter by body
  NotificationsModelQueryBuilder whereBody(String value) {
    _queryBuilder = _queryBuilder.eq('body', value);
    return this;
  }
  
  /// Filter by body with multiple values (IN operator)
  NotificationsModelQueryBuilder whereBodyIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('body', values);
    return this;
  }
  
  

  /// Filter by data
  NotificationsModelQueryBuilder whereData(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('data', value);
    return this;
  }
  
  /// Filter by data with multiple values (IN operator)
  NotificationsModelQueryBuilder whereDataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('data', values);
    return this;
  }
  
  

  /// Filter by trip_id
  NotificationsModelQueryBuilder whereTripId(String? value) {
    _queryBuilder = _queryBuilder.eq('trip_id', value);
    return this;
  }
  
  /// Filter by trip_id with multiple values (IN operator)
  NotificationsModelQueryBuilder whereTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('trip_id', values);
    return this;
  }
  
  

  /// Filter by booking_id
  NotificationsModelQueryBuilder whereBookingId(String? value) {
    _queryBuilder = _queryBuilder.eq('booking_id', value);
    return this;
  }
  
  /// Filter by booking_id with multiple values (IN operator)
  NotificationsModelQueryBuilder whereBookingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('booking_id', values);
    return this;
  }
  
  

  /// Filter by is_read
  NotificationsModelQueryBuilder whereIsRead(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_read', value);
    return this;
  }
  
  /// Filter by is_read with multiple values (IN operator)
  NotificationsModelQueryBuilder whereIsReadIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_read', values);
    return this;
  }
  
  

  /// Filter by read_at
  NotificationsModelQueryBuilder whereReadAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('read_at', value);
    return this;
  }
  
  /// Filter by read_at with multiple values (IN operator)
  NotificationsModelQueryBuilder whereReadAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('read_at', values);
    return this;
  }
  
    /// Filter read_at greater than
  NotificationsModelQueryBuilder whereReadAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('read_at', value);
    return this;
  }
  
  /// Filter read_at greater than or equal
  NotificationsModelQueryBuilder whereReadAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('read_at', value);
    return this;
  }
  
  /// Filter read_at less than
  NotificationsModelQueryBuilder whereReadAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('read_at', value);
    return this;
  }
  
  /// Filter read_at less than or equal
  NotificationsModelQueryBuilder whereReadAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('read_at', value);
    return this;
  }
  
  /// Filter read_at between two values
  NotificationsModelQueryBuilder whereReadAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('read_at', min).lte('read_at', max);
    return this;
  }

  /// Filter by created_at
  NotificationsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  NotificationsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  NotificationsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  NotificationsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  NotificationsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  NotificationsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  NotificationsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  NotificationsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  NotificationsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  NotificationsModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  NotificationsModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by type in ascending order
  NotificationsModelQueryBuilder orderByTypeAsc() {
    _queryBuilder = _queryBuilder.order('type', ascending: true);
    return this;
  }
  
  /// Order by type in descending order
  NotificationsModelQueryBuilder orderByTypeDesc() {
    _queryBuilder = _queryBuilder.order('type', ascending: false);
    return this;
  }

  /// Order by title in ascending order
  NotificationsModelQueryBuilder orderByTitleAsc() {
    _queryBuilder = _queryBuilder.order('title', ascending: true);
    return this;
  }
  
  /// Order by title in descending order
  NotificationsModelQueryBuilder orderByTitleDesc() {
    _queryBuilder = _queryBuilder.order('title', ascending: false);
    return this;
  }

  /// Order by body in ascending order
  NotificationsModelQueryBuilder orderByBodyAsc() {
    _queryBuilder = _queryBuilder.order('body', ascending: true);
    return this;
  }
  
  /// Order by body in descending order
  NotificationsModelQueryBuilder orderByBodyDesc() {
    _queryBuilder = _queryBuilder.order('body', ascending: false);
    return this;
  }

  /// Order by data in ascending order
  NotificationsModelQueryBuilder orderByDataAsc() {
    _queryBuilder = _queryBuilder.order('data', ascending: true);
    return this;
  }
  
  /// Order by data in descending order
  NotificationsModelQueryBuilder orderByDataDesc() {
    _queryBuilder = _queryBuilder.order('data', ascending: false);
    return this;
  }

  /// Order by trip_id in ascending order
  NotificationsModelQueryBuilder orderByTripIdAsc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: true);
    return this;
  }
  
  /// Order by trip_id in descending order
  NotificationsModelQueryBuilder orderByTripIdDesc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: false);
    return this;
  }

  /// Order by booking_id in ascending order
  NotificationsModelQueryBuilder orderByBookingIdAsc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: true);
    return this;
  }
  
  /// Order by booking_id in descending order
  NotificationsModelQueryBuilder orderByBookingIdDesc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: false);
    return this;
  }

  /// Order by is_read in ascending order
  NotificationsModelQueryBuilder orderByIsReadAsc() {
    _queryBuilder = _queryBuilder.order('is_read', ascending: true);
    return this;
  }
  
  /// Order by is_read in descending order
  NotificationsModelQueryBuilder orderByIsReadDesc() {
    _queryBuilder = _queryBuilder.order('is_read', ascending: false);
    return this;
  }

  /// Order by read_at in ascending order
  NotificationsModelQueryBuilder orderByReadAtAsc() {
    _queryBuilder = _queryBuilder.order('read_at', ascending: true);
    return this;
  }
  
  /// Order by read_at in descending order
  NotificationsModelQueryBuilder orderByReadAtDesc() {
    _queryBuilder = _queryBuilder.order('read_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  NotificationsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  NotificationsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of NotificationsModel
  Future<List<NotificationsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => NotificationsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<NotificationsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return NotificationsModel.fromJson(response.first as Map<String, dynamic>);
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
