import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/error_logs_model.dart';

/// A type-safe query builder for ErrorLogsModel
class ErrorLogsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ErrorLogsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('error_logs').select();
  }
  
  /// Set the fields to select
  ErrorLogsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('error_logs').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ErrorLogsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ErrorLogsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by log_id
  ErrorLogsModelQueryBuilder whereLogId(String value) {
    _queryBuilder = _queryBuilder.eq('log_id', value);
    return this;
  }
  
  /// Filter by log_id with multiple values (IN operator)
  ErrorLogsModelQueryBuilder whereLogIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('log_id', values);
    return this;
  }
  
  

  /// Filter by error_message
  ErrorLogsModelQueryBuilder whereErrorMessage(String value) {
    _queryBuilder = _queryBuilder.eq('error_message', value);
    return this;
  }
  
  /// Filter by error_message with multiple values (IN operator)
  ErrorLogsModelQueryBuilder whereErrorMessageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('error_message', values);
    return this;
  }
  
  

  /// Filter by error_details
  ErrorLogsModelQueryBuilder whereErrorDetails(String? value) {
    _queryBuilder = _queryBuilder.eq('error_details', value);
    return this;
  }
  
  /// Filter by error_details with multiple values (IN operator)
  ErrorLogsModelQueryBuilder whereErrorDetailsIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('error_details', values);
    return this;
  }
  
  

  /// Filter by source
  ErrorLogsModelQueryBuilder whereSource(String? value) {
    _queryBuilder = _queryBuilder.eq('source', value);
    return this;
  }
  
  /// Filter by source with multiple values (IN operator)
  ErrorLogsModelQueryBuilder whereSourceIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('source', values);
    return this;
  }
  
  

  /// Filter by user_id
  ErrorLogsModelQueryBuilder whereUserId(String? value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  ErrorLogsModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by created_at
  ErrorLogsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ErrorLogsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ErrorLogsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ErrorLogsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ErrorLogsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ErrorLogsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ErrorLogsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by log_id in ascending order
  ErrorLogsModelQueryBuilder orderByLogIdAsc() {
    _queryBuilder = _queryBuilder.order('log_id', ascending: true);
    return this;
  }
  
  /// Order by log_id in descending order
  ErrorLogsModelQueryBuilder orderByLogIdDesc() {
    _queryBuilder = _queryBuilder.order('log_id', ascending: false);
    return this;
  }

  /// Order by error_message in ascending order
  ErrorLogsModelQueryBuilder orderByErrorMessageAsc() {
    _queryBuilder = _queryBuilder.order('error_message', ascending: true);
    return this;
  }
  
  /// Order by error_message in descending order
  ErrorLogsModelQueryBuilder orderByErrorMessageDesc() {
    _queryBuilder = _queryBuilder.order('error_message', ascending: false);
    return this;
  }

  /// Order by error_details in ascending order
  ErrorLogsModelQueryBuilder orderByErrorDetailsAsc() {
    _queryBuilder = _queryBuilder.order('error_details', ascending: true);
    return this;
  }
  
  /// Order by error_details in descending order
  ErrorLogsModelQueryBuilder orderByErrorDetailsDesc() {
    _queryBuilder = _queryBuilder.order('error_details', ascending: false);
    return this;
  }

  /// Order by source in ascending order
  ErrorLogsModelQueryBuilder orderBySourceAsc() {
    _queryBuilder = _queryBuilder.order('source', ascending: true);
    return this;
  }
  
  /// Order by source in descending order
  ErrorLogsModelQueryBuilder orderBySourceDesc() {
    _queryBuilder = _queryBuilder.order('source', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  ErrorLogsModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  ErrorLogsModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ErrorLogsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ErrorLogsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ErrorLogsModel
  Future<List<ErrorLogsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ErrorLogsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ErrorLogsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ErrorLogsModel.fromJson(response.first as Map<String, dynamic>);
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
