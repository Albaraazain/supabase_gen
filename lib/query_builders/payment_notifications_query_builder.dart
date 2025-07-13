import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/payment_notifications_model.dart';

/// A type-safe query builder for PaymentNotificationsModel
class PaymentNotificationsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  PaymentNotificationsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('payment_notifications').select();
  }
  
  /// Set the fields to select
  PaymentNotificationsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('payment_notifications').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  PaymentNotificationsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  PaymentNotificationsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  PaymentNotificationsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  PaymentNotificationsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by created_at
  PaymentNotificationsModelQueryBuilder whereCreatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  PaymentNotificationsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  PaymentNotificationsModelQueryBuilder whereCreatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  PaymentNotificationsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  PaymentNotificationsModelQueryBuilder whereCreatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  PaymentNotificationsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  PaymentNotificationsModelQueryBuilder whereCreatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by payment_id
  PaymentNotificationsModelQueryBuilder wherePaymentId(String value) {
    _queryBuilder = _queryBuilder.eq('payment_id', value);
    return this;
  }
  
  /// Filter by payment_id with multiple values (IN operator)
  PaymentNotificationsModelQueryBuilder wherePaymentIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payment_id', values);
    return this;
  }
  
  

  /// Filter by notification_id
  PaymentNotificationsModelQueryBuilder whereNotificationId(String value) {
    _queryBuilder = _queryBuilder.eq('notification_id', value);
    return this;
  }
  
  /// Filter by notification_id with multiple values (IN operator)
  PaymentNotificationsModelQueryBuilder whereNotificationIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notification_id', values);
    return this;
  }
  
  
  
  /// Order by id in ascending order
  PaymentNotificationsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  PaymentNotificationsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  PaymentNotificationsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  PaymentNotificationsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by payment_id in ascending order
  PaymentNotificationsModelQueryBuilder orderByPaymentIdAsc() {
    _queryBuilder = _queryBuilder.order('payment_id', ascending: true);
    return this;
  }
  
  /// Order by payment_id in descending order
  PaymentNotificationsModelQueryBuilder orderByPaymentIdDesc() {
    _queryBuilder = _queryBuilder.order('payment_id', ascending: false);
    return this;
  }

  /// Order by notification_id in ascending order
  PaymentNotificationsModelQueryBuilder orderByNotificationIdAsc() {
    _queryBuilder = _queryBuilder.order('notification_id', ascending: true);
    return this;
  }
  
  /// Order by notification_id in descending order
  PaymentNotificationsModelQueryBuilder orderByNotificationIdDesc() {
    _queryBuilder = _queryBuilder.order('notification_id', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of PaymentNotificationsModel
  Future<List<PaymentNotificationsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => PaymentNotificationsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<PaymentNotificationsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return PaymentNotificationsModel.fromJson(response.first as Map<String, dynamic>);
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
