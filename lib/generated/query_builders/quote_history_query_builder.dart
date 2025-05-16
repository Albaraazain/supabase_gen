import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quote_history_model.dart';

/// A type-safe query builder for QuoteHistoryModel
class QuoteHistoryModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  QuoteHistoryModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('quote_history').select();
  }
  
  /// Set the fields to select
  QuoteHistoryModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('quote_history').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  QuoteHistoryModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  QuoteHistoryModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by history_id
  QuoteHistoryModelQueryBuilder whereHistoryId(String value) {
    _queryBuilder = _queryBuilder.eq('history_id', value);
    return this;
  }
  
  /// Filter by history_id with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereHistoryIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('history_id', values);
    return this;
  }
  
  

  /// Filter by quote_id
  QuoteHistoryModelQueryBuilder whereQuoteId(String value) {
    _queryBuilder = _queryBuilder.eq('quote_id', value);
    return this;
  }
  
  /// Filter by quote_id with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereQuoteIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quote_id', values);
    return this;
  }
  
  

  /// Filter by action
  QuoteHistoryModelQueryBuilder whereAction(String value) {
    _queryBuilder = _queryBuilder.eq('action', value);
    return this;
  }
  
  /// Filter by action with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereActionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('action', values);
    return this;
  }
  
  

  /// Filter by action_by
  QuoteHistoryModelQueryBuilder whereActionBy(String? value) {
    _queryBuilder = _queryBuilder.eq('action_by', value);
    return this;
  }
  
  /// Filter by action_by with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereActionByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('action_by', values);
    return this;
  }
  
  

  /// Filter by action_at
  QuoteHistoryModelQueryBuilder whereActionAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('action_at', value);
    return this;
  }
  
  /// Filter by action_at with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereActionAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('action_at', values);
    return this;
  }
  
    /// Filter action_at greater than
  QuoteHistoryModelQueryBuilder whereActionAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('action_at', value);
    return this;
  }
  
  /// Filter action_at greater than or equal
  QuoteHistoryModelQueryBuilder whereActionAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('action_at', value);
    return this;
  }
  
  /// Filter action_at less than
  QuoteHistoryModelQueryBuilder whereActionAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('action_at', value);
    return this;
  }
  
  /// Filter action_at less than or equal
  QuoteHistoryModelQueryBuilder whereActionAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('action_at', value);
    return this;
  }
  
  /// Filter action_at between two values
  QuoteHistoryModelQueryBuilder whereActionAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('action_at', min).lte('action_at', max);
    return this;
  }

  /// Filter by notes
  QuoteHistoryModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by metadata
  QuoteHistoryModelQueryBuilder whereMetadata(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('metadata', value);
    return this;
  }
  
  /// Filter by metadata with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereMetadataIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('metadata', values);
    return this;
  }
  
  

  /// Filter by created_at
  QuoteHistoryModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  QuoteHistoryModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  QuoteHistoryModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  QuoteHistoryModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  QuoteHistoryModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  QuoteHistoryModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  QuoteHistoryModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by history_id in ascending order
  QuoteHistoryModelQueryBuilder orderByHistoryIdAsc() {
    _queryBuilder = _queryBuilder.order('history_id', ascending: true);
    return this;
  }
  
  /// Order by history_id in descending order
  QuoteHistoryModelQueryBuilder orderByHistoryIdDesc() {
    _queryBuilder = _queryBuilder.order('history_id', ascending: false);
    return this;
  }

  /// Order by quote_id in ascending order
  QuoteHistoryModelQueryBuilder orderByQuoteIdAsc() {
    _queryBuilder = _queryBuilder.order('quote_id', ascending: true);
    return this;
  }
  
  /// Order by quote_id in descending order
  QuoteHistoryModelQueryBuilder orderByQuoteIdDesc() {
    _queryBuilder = _queryBuilder.order('quote_id', ascending: false);
    return this;
  }

  /// Order by action in ascending order
  QuoteHistoryModelQueryBuilder orderByActionAsc() {
    _queryBuilder = _queryBuilder.order('action', ascending: true);
    return this;
  }
  
  /// Order by action in descending order
  QuoteHistoryModelQueryBuilder orderByActionDesc() {
    _queryBuilder = _queryBuilder.order('action', ascending: false);
    return this;
  }

  /// Order by action_by in ascending order
  QuoteHistoryModelQueryBuilder orderByActionByAsc() {
    _queryBuilder = _queryBuilder.order('action_by', ascending: true);
    return this;
  }
  
  /// Order by action_by in descending order
  QuoteHistoryModelQueryBuilder orderByActionByDesc() {
    _queryBuilder = _queryBuilder.order('action_by', ascending: false);
    return this;
  }

  /// Order by action_at in ascending order
  QuoteHistoryModelQueryBuilder orderByActionAtAsc() {
    _queryBuilder = _queryBuilder.order('action_at', ascending: true);
    return this;
  }
  
  /// Order by action_at in descending order
  QuoteHistoryModelQueryBuilder orderByActionAtDesc() {
    _queryBuilder = _queryBuilder.order('action_at', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  QuoteHistoryModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  QuoteHistoryModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by metadata in ascending order
  QuoteHistoryModelQueryBuilder orderByMetadataAsc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: true);
    return this;
  }
  
  /// Order by metadata in descending order
  QuoteHistoryModelQueryBuilder orderByMetadataDesc() {
    _queryBuilder = _queryBuilder.order('metadata', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  QuoteHistoryModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  QuoteHistoryModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of QuoteHistoryModel
  Future<List<QuoteHistoryModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => QuoteHistoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<QuoteHistoryModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return QuoteHistoryModel.fromJson(response.first as Map<String, dynamic>);
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
