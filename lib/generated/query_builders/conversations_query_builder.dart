import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/conversations_model.dart';

/// A type-safe query builder for ConversationsModel
class ConversationsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ConversationsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('conversations').select();
  }
  
  /// Set the fields to select
  ConversationsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('conversations').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ConversationsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ConversationsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by conversation_id
  ConversationsModelQueryBuilder whereConversationId(String value) {
    _queryBuilder = _queryBuilder.eq('conversation_id', value);
    return this;
  }
  
  /// Filter by conversation_id with multiple values (IN operator)
  ConversationsModelQueryBuilder whereConversationIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('conversation_id', values);
    return this;
  }
  
  

  /// Filter by homeowner_id
  ConversationsModelQueryBuilder whereHomeownerId(String value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  ConversationsModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ConversationsModelQueryBuilder whereProfessionalId(String value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ConversationsModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  ConversationsModelQueryBuilder whereJobId(String? value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  ConversationsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by last_message_at
  ConversationsModelQueryBuilder whereLastMessageAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('last_message_at', value);
    return this;
  }
  
  /// Filter by last_message_at with multiple values (IN operator)
  ConversationsModelQueryBuilder whereLastMessageAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('last_message_at', values);
    return this;
  }
  
    /// Filter last_message_at greater than
  ConversationsModelQueryBuilder whereLastMessageAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('last_message_at', value);
    return this;
  }
  
  /// Filter last_message_at greater than or equal
  ConversationsModelQueryBuilder whereLastMessageAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('last_message_at', value);
    return this;
  }
  
  /// Filter last_message_at less than
  ConversationsModelQueryBuilder whereLastMessageAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('last_message_at', value);
    return this;
  }
  
  /// Filter last_message_at less than or equal
  ConversationsModelQueryBuilder whereLastMessageAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('last_message_at', value);
    return this;
  }
  
  /// Filter last_message_at between two values
  ConversationsModelQueryBuilder whereLastMessageAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('last_message_at', min).lte('last_message_at', max);
    return this;
  }

  /// Filter by created_at
  ConversationsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ConversationsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ConversationsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ConversationsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ConversationsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ConversationsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ConversationsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ConversationsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ConversationsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ConversationsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ConversationsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ConversationsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ConversationsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ConversationsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by conversation_id in ascending order
  ConversationsModelQueryBuilder orderByConversationIdAsc() {
    _queryBuilder = _queryBuilder.order('conversation_id', ascending: true);
    return this;
  }
  
  /// Order by conversation_id in descending order
  ConversationsModelQueryBuilder orderByConversationIdDesc() {
    _queryBuilder = _queryBuilder.order('conversation_id', ascending: false);
    return this;
  }

  /// Order by homeowner_id in ascending order
  ConversationsModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  ConversationsModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ConversationsModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ConversationsModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  ConversationsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  ConversationsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by last_message_at in ascending order
  ConversationsModelQueryBuilder orderByLastMessageAtAsc() {
    _queryBuilder = _queryBuilder.order('last_message_at', ascending: true);
    return this;
  }
  
  /// Order by last_message_at in descending order
  ConversationsModelQueryBuilder orderByLastMessageAtDesc() {
    _queryBuilder = _queryBuilder.order('last_message_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ConversationsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ConversationsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ConversationsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ConversationsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ConversationsModel
  Future<List<ConversationsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ConversationsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ConversationsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ConversationsModel.fromJson(response.first as Map<String, dynamic>);
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
