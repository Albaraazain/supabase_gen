import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/messages_model.dart';

/// A type-safe query builder for MessagesModel
class MessagesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  MessagesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('messages').select();
  }
  
  /// Set the fields to select
  MessagesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('messages').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  MessagesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  MessagesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  MessagesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  MessagesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by trip_id
  MessagesModelQueryBuilder whereTripId(String value) {
    _queryBuilder = _queryBuilder.eq('trip_id', value);
    return this;
  }
  
  /// Filter by trip_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('trip_id', values);
    return this;
  }
  
  

  /// Filter by sender_id
  MessagesModelQueryBuilder whereSenderId(String value) {
    _queryBuilder = _queryBuilder.eq('sender_id', value);
    return this;
  }
  
  /// Filter by sender_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereSenderIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('sender_id', values);
    return this;
  }
  
  

  /// Filter by recipient_id
  MessagesModelQueryBuilder whereRecipientId(String value) {
    _queryBuilder = _queryBuilder.eq('recipient_id', value);
    return this;
  }
  
  /// Filter by recipient_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereRecipientIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('recipient_id', values);
    return this;
  }
  
  

  /// Filter by booking_id
  MessagesModelQueryBuilder whereBookingId(String? value) {
    _queryBuilder = _queryBuilder.eq('booking_id', value);
    return this;
  }
  
  /// Filter by booking_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereBookingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('booking_id', values);
    return this;
  }
  
  

  /// Filter by message_type
  MessagesModelQueryBuilder whereMessageType(String? value) {
    _queryBuilder = _queryBuilder.eq('message_type', value);
    return this;
  }
  
  /// Filter by message_type with multiple values (IN operator)
  MessagesModelQueryBuilder whereMessageTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('message_type', values);
    return this;
  }
  
  

  /// Filter by content
  MessagesModelQueryBuilder whereContent(String value) {
    _queryBuilder = _queryBuilder.eq('content', value);
    return this;
  }
  
  /// Filter by content with multiple values (IN operator)
  MessagesModelQueryBuilder whereContentIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('content', values);
    return this;
  }
  
  

  /// Filter by metadata
  MessagesModelQueryBuilder whereMetadata(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('metadata', value);
    return this;
  }
  
  /// Filter by metadata with multiple values (IN operator)
  MessagesModelQueryBuilder whereMetadataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('metadata', values);
    return this;
  }
  
  

  /// Filter by is_read
  MessagesModelQueryBuilder whereIsRead(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_read', value);
    return this;
  }
  
  /// Filter by is_read with multiple values (IN operator)
  MessagesModelQueryBuilder whereIsReadIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_read', values);
    return this;
  }
  
  

  /// Filter by read_at
  MessagesModelQueryBuilder whereReadAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('read_at', value);
    return this;
  }
  
  /// Filter by read_at with multiple values (IN operator)
  MessagesModelQueryBuilder whereReadAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('read_at', values);
    return this;
  }
  
    /// Filter read_at greater than
  MessagesModelQueryBuilder whereReadAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('read_at', value);
    return this;
  }
  
  /// Filter read_at greater than or equal
  MessagesModelQueryBuilder whereReadAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('read_at', value);
    return this;
  }
  
  /// Filter read_at less than
  MessagesModelQueryBuilder whereReadAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('read_at', value);
    return this;
  }
  
  /// Filter read_at less than or equal
  MessagesModelQueryBuilder whereReadAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('read_at', value);
    return this;
  }
  
  /// Filter read_at between two values
  MessagesModelQueryBuilder whereReadAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('read_at', min).lte('read_at', max);
    return this;
  }

  /// Filter by created_at
  MessagesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  MessagesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  MessagesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  MessagesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  MessagesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  MessagesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  MessagesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  MessagesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  MessagesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by trip_id in ascending order
  MessagesModelQueryBuilder orderByTripIdAsc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: true);
    return this;
  }
  
  /// Order by trip_id in descending order
  MessagesModelQueryBuilder orderByTripIdDesc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: false);
    return this;
  }

  /// Order by sender_id in ascending order
  MessagesModelQueryBuilder orderBySenderIdAsc() {
    _queryBuilder = _queryBuilder.order('sender_id', ascending: true);
    return this;
  }
  
  /// Order by sender_id in descending order
  MessagesModelQueryBuilder orderBySenderIdDesc() {
    _queryBuilder = _queryBuilder.order('sender_id', ascending: false);
    return this;
  }

  /// Order by recipient_id in ascending order
  MessagesModelQueryBuilder orderByRecipientIdAsc() {
    _queryBuilder = _queryBuilder.order('recipient_id', ascending: true);
    return this;
  }
  
  /// Order by recipient_id in descending order
  MessagesModelQueryBuilder orderByRecipientIdDesc() {
    _queryBuilder = _queryBuilder.order('recipient_id', ascending: false);
    return this;
  }

  /// Order by booking_id in ascending order
  MessagesModelQueryBuilder orderByBookingIdAsc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: true);
    return this;
  }
  
  /// Order by booking_id in descending order
  MessagesModelQueryBuilder orderByBookingIdDesc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: false);
    return this;
  }

  /// Order by message_type in ascending order
  MessagesModelQueryBuilder orderByMessageTypeAsc() {
    _queryBuilder = _queryBuilder.order('message_type', ascending: true);
    return this;
  }
  
  /// Order by message_type in descending order
  MessagesModelQueryBuilder orderByMessageTypeDesc() {
    _queryBuilder = _queryBuilder.order('message_type', ascending: false);
    return this;
  }

  /// Order by content in ascending order
  MessagesModelQueryBuilder orderByContentAsc() {
    _queryBuilder = _queryBuilder.order('content', ascending: true);
    return this;
  }
  
  /// Order by content in descending order
  MessagesModelQueryBuilder orderByContentDesc() {
    _queryBuilder = _queryBuilder.order('content', ascending: false);
    return this;
  }

  /// Order by metadata in ascending order
  MessagesModelQueryBuilder orderByMetadataAsc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: true);
    return this;
  }
  
  /// Order by metadata in descending order
  MessagesModelQueryBuilder orderByMetadataDesc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: false);
    return this;
  }

  /// Order by is_read in ascending order
  MessagesModelQueryBuilder orderByIsReadAsc() {
    _queryBuilder = _queryBuilder.order('is_read', ascending: true);
    return this;
  }
  
  /// Order by is_read in descending order
  MessagesModelQueryBuilder orderByIsReadDesc() {
    _queryBuilder = _queryBuilder.order('is_read', ascending: false);
    return this;
  }

  /// Order by read_at in ascending order
  MessagesModelQueryBuilder orderByReadAtAsc() {
    _queryBuilder = _queryBuilder.order('read_at', ascending: true);
    return this;
  }
  
  /// Order by read_at in descending order
  MessagesModelQueryBuilder orderByReadAtDesc() {
    _queryBuilder = _queryBuilder.order('read_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  MessagesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  MessagesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of MessagesModel
  Future<List<MessagesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => MessagesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<MessagesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return MessagesModel.fromJson(response.first as Map<String, dynamic>);
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
