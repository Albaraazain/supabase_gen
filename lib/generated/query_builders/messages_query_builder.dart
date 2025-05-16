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
  
  /// Filter by message_id
  MessagesModelQueryBuilder whereMessageId(String value) {
    _queryBuilder = _queryBuilder.eq('message_id', value);
    return this;
  }
  
  /// Filter by message_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereMessageIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('message_id', values);
    return this;
  }
  
  

  /// Filter by conversation_id
  MessagesModelQueryBuilder whereConversationId(String value) {
    _queryBuilder = _queryBuilder.eq('conversation_id', value);
    return this;
  }
  
  /// Filter by conversation_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereConversationIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('conversation_id', values);
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
  
  

  /// Filter by receiver_id
  MessagesModelQueryBuilder whereReceiverId(String value) {
    _queryBuilder = _queryBuilder.eq('receiver_id', value);
    return this;
  }
  
  /// Filter by receiver_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereReceiverIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('receiver_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  MessagesModelQueryBuilder whereJobId(String? value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  MessagesModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
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

  /// Filter by updated_at
  MessagesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  MessagesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  MessagesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  MessagesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  MessagesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  MessagesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  MessagesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by message_id in ascending order
  MessagesModelQueryBuilder orderByMessageIdAsc() {
    _queryBuilder = _queryBuilder.order('message_id', ascending: true);
    return this;
  }
  
  /// Order by message_id in descending order
  MessagesModelQueryBuilder orderByMessageIdDesc() {
    _queryBuilder = _queryBuilder.order('message_id', ascending: false);
    return this;
  }

  /// Order by conversation_id in ascending order
  MessagesModelQueryBuilder orderByConversationIdAsc() {
    _queryBuilder = _queryBuilder.order('conversation_id', ascending: true);
    return this;
  }
  
  /// Order by conversation_id in descending order
  MessagesModelQueryBuilder orderByConversationIdDesc() {
    _queryBuilder = _queryBuilder.order('conversation_id', ascending: false);
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

  /// Order by receiver_id in ascending order
  MessagesModelQueryBuilder orderByReceiverIdAsc() {
    _queryBuilder = _queryBuilder.order('receiver_id', ascending: true);
    return this;
  }
  
  /// Order by receiver_id in descending order
  MessagesModelQueryBuilder orderByReceiverIdDesc() {
    _queryBuilder = _queryBuilder.order('receiver_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  MessagesModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  MessagesModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
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

  /// Order by updated_at in ascending order
  MessagesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  MessagesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
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
