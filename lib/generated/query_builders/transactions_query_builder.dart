import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/transactions_model.dart';

/// A type-safe query builder for TransactionsModel
class TransactionsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  TransactionsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('transactions').select();
  }
  
  /// Set the fields to select
  TransactionsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('transactions').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  TransactionsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  TransactionsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  TransactionsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  TransactionsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by booking_id
  TransactionsModelQueryBuilder whereBookingId(String? value) {
    _queryBuilder = _queryBuilder.eq('booking_id', value);
    return this;
  }
  
  /// Filter by booking_id with multiple values (IN operator)
  TransactionsModelQueryBuilder whereBookingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('booking_id', values);
    return this;
  }
  
  

  /// Filter by payer_id
  TransactionsModelQueryBuilder wherePayerId(String value) {
    _queryBuilder = _queryBuilder.eq('payer_id', value);
    return this;
  }
  
  /// Filter by payer_id with multiple values (IN operator)
  TransactionsModelQueryBuilder wherePayerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payer_id', values);
    return this;
  }
  
  

  /// Filter by payee_id
  TransactionsModelQueryBuilder wherePayeeId(String value) {
    _queryBuilder = _queryBuilder.eq('payee_id', value);
    return this;
  }
  
  /// Filter by payee_id with multiple values (IN operator)
  TransactionsModelQueryBuilder wherePayeeIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payee_id', values);
    return this;
  }
  
  

  /// Filter by amount
  TransactionsModelQueryBuilder whereAmount(double value) {
    _queryBuilder = _queryBuilder.eq('amount', value);
    return this;
  }
  
  /// Filter by amount with multiple values (IN operator)
  TransactionsModelQueryBuilder whereAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('amount', values);
    return this;
  }
  
    /// Filter amount greater than
  TransactionsModelQueryBuilder whereAmountGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('amount', value);
    return this;
  }
  
  /// Filter amount greater than or equal
  TransactionsModelQueryBuilder whereAmountGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('amount', value);
    return this;
  }
  
  /// Filter amount less than
  TransactionsModelQueryBuilder whereAmountLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('amount', value);
    return this;
  }
  
  /// Filter amount less than or equal
  TransactionsModelQueryBuilder whereAmountLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('amount', value);
    return this;
  }
  
  /// Filter amount between two values
  TransactionsModelQueryBuilder whereAmountBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('amount', min).lte('amount', max);
    return this;
  }

  /// Filter by currency
  TransactionsModelQueryBuilder whereCurrency(String? value) {
    _queryBuilder = _queryBuilder.eq('currency', value);
    return this;
  }
  
  /// Filter by currency with multiple values (IN operator)
  TransactionsModelQueryBuilder whereCurrencyIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('currency', values);
    return this;
  }
  
  

  /// Filter by transaction_type
  TransactionsModelQueryBuilder whereTransactionType(String? value) {
    _queryBuilder = _queryBuilder.eq('transaction_type', value);
    return this;
  }
  
  /// Filter by transaction_type with multiple values (IN operator)
  TransactionsModelQueryBuilder whereTransactionTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('transaction_type', values);
    return this;
  }
  
  

  /// Filter by payment_method
  TransactionsModelQueryBuilder wherePaymentMethod(String? value) {
    _queryBuilder = _queryBuilder.eq('payment_method', value);
    return this;
  }
  
  /// Filter by payment_method with multiple values (IN operator)
  TransactionsModelQueryBuilder wherePaymentMethodIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payment_method', values);
    return this;
  }
  
  

  /// Filter by status
  TransactionsModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  TransactionsModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by external_payment_id
  TransactionsModelQueryBuilder whereExternalPaymentId(String? value) {
    _queryBuilder = _queryBuilder.eq('external_payment_id', value);
    return this;
  }
  
  /// Filter by external_payment_id with multiple values (IN operator)
  TransactionsModelQueryBuilder whereExternalPaymentIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('external_payment_id', values);
    return this;
  }
  
  

  /// Filter by fee_amount
  TransactionsModelQueryBuilder whereFeeAmount(double? value) {
    _queryBuilder = _queryBuilder.eq('fee_amount', value);
    return this;
  }
  
  /// Filter by fee_amount with multiple values (IN operator)
  TransactionsModelQueryBuilder whereFeeAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('fee_amount', values);
    return this;
  }
  
    /// Filter fee_amount greater than
  TransactionsModelQueryBuilder whereFeeAmountGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('fee_amount', value);
    return this;
  }
  
  /// Filter fee_amount greater than or equal
  TransactionsModelQueryBuilder whereFeeAmountGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('fee_amount', value);
    return this;
  }
  
  /// Filter fee_amount less than
  TransactionsModelQueryBuilder whereFeeAmountLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('fee_amount', value);
    return this;
  }
  
  /// Filter fee_amount less than or equal
  TransactionsModelQueryBuilder whereFeeAmountLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('fee_amount', value);
    return this;
  }
  
  /// Filter fee_amount between two values
  TransactionsModelQueryBuilder whereFeeAmountBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('fee_amount', min).lte('fee_amount', max);
    return this;
  }

  /// Filter by created_at
  TransactionsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  TransactionsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  TransactionsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  TransactionsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  TransactionsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  TransactionsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  TransactionsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by completed_at
  TransactionsModelQueryBuilder whereCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('completed_at', value);
    return this;
  }
  
  /// Filter by completed_at with multiple values (IN operator)
  TransactionsModelQueryBuilder whereCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completed_at', values);
    return this;
  }
  
    /// Filter completed_at greater than
  TransactionsModelQueryBuilder whereCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at greater than or equal
  TransactionsModelQueryBuilder whereCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than
  TransactionsModelQueryBuilder whereCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than or equal
  TransactionsModelQueryBuilder whereCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at between two values
  TransactionsModelQueryBuilder whereCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('completed_at', min).lte('completed_at', max);
    return this;
  }

  /// Filter by instant_ride_request_id
  TransactionsModelQueryBuilder whereInstantRideRequestId(String? value) {
    _queryBuilder = _queryBuilder.eq('instant_ride_request_id', value);
    return this;
  }
  
  /// Filter by instant_ride_request_id with multiple values (IN operator)
  TransactionsModelQueryBuilder whereInstantRideRequestIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('instant_ride_request_id', values);
    return this;
  }
  
  
  
  /// Order by id in ascending order
  TransactionsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  TransactionsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by booking_id in ascending order
  TransactionsModelQueryBuilder orderByBookingIdAsc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: true);
    return this;
  }
  
  /// Order by booking_id in descending order
  TransactionsModelQueryBuilder orderByBookingIdDesc() {
    _queryBuilder = _queryBuilder.order('booking_id', ascending: false);
    return this;
  }

  /// Order by payer_id in ascending order
  TransactionsModelQueryBuilder orderByPayerIdAsc() {
    _queryBuilder = _queryBuilder.order('payer_id', ascending: true);
    return this;
  }
  
  /// Order by payer_id in descending order
  TransactionsModelQueryBuilder orderByPayerIdDesc() {
    _queryBuilder = _queryBuilder.order('payer_id', ascending: false);
    return this;
  }

  /// Order by payee_id in ascending order
  TransactionsModelQueryBuilder orderByPayeeIdAsc() {
    _queryBuilder = _queryBuilder.order('payee_id', ascending: true);
    return this;
  }
  
  /// Order by payee_id in descending order
  TransactionsModelQueryBuilder orderByPayeeIdDesc() {
    _queryBuilder = _queryBuilder.order('payee_id', ascending: false);
    return this;
  }

  /// Order by amount in ascending order
  TransactionsModelQueryBuilder orderByAmountAsc() {
    _queryBuilder = _queryBuilder.order('amount', ascending: true);
    return this;
  }
  
  /// Order by amount in descending order
  TransactionsModelQueryBuilder orderByAmountDesc() {
    _queryBuilder = _queryBuilder.order('amount', ascending: false);
    return this;
  }

  /// Order by currency in ascending order
  TransactionsModelQueryBuilder orderByCurrencyAsc() {
    _queryBuilder = _queryBuilder.order('currency', ascending: true);
    return this;
  }
  
  /// Order by currency in descending order
  TransactionsModelQueryBuilder orderByCurrencyDesc() {
    _queryBuilder = _queryBuilder.order('currency', ascending: false);
    return this;
  }

  /// Order by transaction_type in ascending order
  TransactionsModelQueryBuilder orderByTransactionTypeAsc() {
    _queryBuilder = _queryBuilder.order('transaction_type', ascending: true);
    return this;
  }
  
  /// Order by transaction_type in descending order
  TransactionsModelQueryBuilder orderByTransactionTypeDesc() {
    _queryBuilder = _queryBuilder.order('transaction_type', ascending: false);
    return this;
  }

  /// Order by payment_method in ascending order
  TransactionsModelQueryBuilder orderByPaymentMethodAsc() {
    _queryBuilder = _queryBuilder.order('payment_method', ascending: true);
    return this;
  }
  
  /// Order by payment_method in descending order
  TransactionsModelQueryBuilder orderByPaymentMethodDesc() {
    _queryBuilder = _queryBuilder.order('payment_method', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  TransactionsModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  TransactionsModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by external_payment_id in ascending order
  TransactionsModelQueryBuilder orderByExternalPaymentIdAsc() {
    _queryBuilder = _queryBuilder.order('external_payment_id', ascending: true);
    return this;
  }
  
  /// Order by external_payment_id in descending order
  TransactionsModelQueryBuilder orderByExternalPaymentIdDesc() {
    _queryBuilder = _queryBuilder.order('external_payment_id', ascending: false);
    return this;
  }

  /// Order by fee_amount in ascending order
  TransactionsModelQueryBuilder orderByFeeAmountAsc() {
    _queryBuilder = _queryBuilder.order('fee_amount', ascending: true);
    return this;
  }
  
  /// Order by fee_amount in descending order
  TransactionsModelQueryBuilder orderByFeeAmountDesc() {
    _queryBuilder = _queryBuilder.order('fee_amount', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  TransactionsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  TransactionsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by completed_at in ascending order
  TransactionsModelQueryBuilder orderByCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: true);
    return this;
  }
  
  /// Order by completed_at in descending order
  TransactionsModelQueryBuilder orderByCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: false);
    return this;
  }

  /// Order by instant_ride_request_id in ascending order
  TransactionsModelQueryBuilder orderByInstantRideRequestIdAsc() {
    _queryBuilder = _queryBuilder.order('instant_ride_request_id', ascending: true);
    return this;
  }
  
  /// Order by instant_ride_request_id in descending order
  TransactionsModelQueryBuilder orderByInstantRideRequestIdDesc() {
    _queryBuilder = _queryBuilder.order('instant_ride_request_id', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of TransactionsModel
  Future<List<TransactionsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => TransactionsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<TransactionsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return TransactionsModel.fromJson(response.first as Map<String, dynamic>);
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
