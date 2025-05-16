import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/payment_methods_model.dart';

/// A type-safe query builder for PaymentMethodsModel
class PaymentMethodsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  PaymentMethodsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('payment_methods').select();
  }
  
  /// Set the fields to select
  PaymentMethodsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('payment_methods').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  PaymentMethodsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  PaymentMethodsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  PaymentMethodsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by user_id
  PaymentMethodsModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by payment_type
  PaymentMethodsModelQueryBuilder wherePaymentType(String value) {
    _queryBuilder = _queryBuilder.eq('payment_type', value);
    return this;
  }
  
  /// Filter by payment_type with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder wherePaymentTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payment_type', values);
    return this;
  }
  
  

  /// Filter by card_last_four
  PaymentMethodsModelQueryBuilder whereCardLastFour(String? value) {
    _queryBuilder = _queryBuilder.eq('card_last_four', value);
    return this;
  }
  
  /// Filter by card_last_four with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereCardLastFourIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('card_last_four', values);
    return this;
  }
  
  

  /// Filter by card_brand
  PaymentMethodsModelQueryBuilder whereCardBrand(String? value) {
    _queryBuilder = _queryBuilder.eq('card_brand', value);
    return this;
  }
  
  /// Filter by card_brand with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereCardBrandIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('card_brand', values);
    return this;
  }
  
  

  /// Filter by card_expiry_month
  PaymentMethodsModelQueryBuilder whereCardExpiryMonth(int? value) {
    _queryBuilder = _queryBuilder.eq('card_expiry_month', value);
    return this;
  }
  
  /// Filter by card_expiry_month with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereCardExpiryMonthIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('card_expiry_month', values);
    return this;
  }
  
    /// Filter card_expiry_month greater than
  PaymentMethodsModelQueryBuilder whereCardExpiryMonthGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('card_expiry_month', value);
    return this;
  }
  
  /// Filter card_expiry_month greater than or equal
  PaymentMethodsModelQueryBuilder whereCardExpiryMonthGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('card_expiry_month', value);
    return this;
  }
  
  /// Filter card_expiry_month less than
  PaymentMethodsModelQueryBuilder whereCardExpiryMonthLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('card_expiry_month', value);
    return this;
  }
  
  /// Filter card_expiry_month less than or equal
  PaymentMethodsModelQueryBuilder whereCardExpiryMonthLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('card_expiry_month', value);
    return this;
  }
  
  /// Filter card_expiry_month between two values
  PaymentMethodsModelQueryBuilder whereCardExpiryMonthBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('card_expiry_month', min).lte('card_expiry_month', max);
    return this;
  }

  /// Filter by card_expiry_year
  PaymentMethodsModelQueryBuilder whereCardExpiryYear(int? value) {
    _queryBuilder = _queryBuilder.eq('card_expiry_year', value);
    return this;
  }
  
  /// Filter by card_expiry_year with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereCardExpiryYearIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('card_expiry_year', values);
    return this;
  }
  
    /// Filter card_expiry_year greater than
  PaymentMethodsModelQueryBuilder whereCardExpiryYearGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('card_expiry_year', value);
    return this;
  }
  
  /// Filter card_expiry_year greater than or equal
  PaymentMethodsModelQueryBuilder whereCardExpiryYearGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('card_expiry_year', value);
    return this;
  }
  
  /// Filter card_expiry_year less than
  PaymentMethodsModelQueryBuilder whereCardExpiryYearLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('card_expiry_year', value);
    return this;
  }
  
  /// Filter card_expiry_year less than or equal
  PaymentMethodsModelQueryBuilder whereCardExpiryYearLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('card_expiry_year', value);
    return this;
  }
  
  /// Filter card_expiry_year between two values
  PaymentMethodsModelQueryBuilder whereCardExpiryYearBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('card_expiry_year', min).lte('card_expiry_year', max);
    return this;
  }

  /// Filter by bank_name
  PaymentMethodsModelQueryBuilder whereBankName(String? value) {
    _queryBuilder = _queryBuilder.eq('bank_name', value);
    return this;
  }
  
  /// Filter by bank_name with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereBankNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('bank_name', values);
    return this;
  }
  
  

  /// Filter by bank_account_last_four
  PaymentMethodsModelQueryBuilder whereBankAccountLastFour(String? value) {
    _queryBuilder = _queryBuilder.eq('bank_account_last_four', value);
    return this;
  }
  
  /// Filter by bank_account_last_four with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereBankAccountLastFourIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('bank_account_last_four', values);
    return this;
  }
  
  

  /// Filter by is_default
  PaymentMethodsModelQueryBuilder whereIsDefault(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_default', value);
    return this;
  }
  
  /// Filter by is_default with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereIsDefaultIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_default', values);
    return this;
  }
  
  

  /// Filter by created_at
  PaymentMethodsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  PaymentMethodsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  PaymentMethodsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  PaymentMethodsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  PaymentMethodsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  PaymentMethodsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  PaymentMethodsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  PaymentMethodsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  PaymentMethodsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  PaymentMethodsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  PaymentMethodsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  PaymentMethodsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  PaymentMethodsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  PaymentMethodsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  PaymentMethodsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  PaymentMethodsModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  PaymentMethodsModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by payment_type in ascending order
  PaymentMethodsModelQueryBuilder orderByPaymentTypeAsc() {
    _queryBuilder = _queryBuilder.order('payment_type', ascending: true);
    return this;
  }
  
  /// Order by payment_type in descending order
  PaymentMethodsModelQueryBuilder orderByPaymentTypeDesc() {
    _queryBuilder = _queryBuilder.order('payment_type', ascending: false);
    return this;
  }

  /// Order by card_last_four in ascending order
  PaymentMethodsModelQueryBuilder orderByCardLastFourAsc() {
    _queryBuilder = _queryBuilder.order('card_last_four', ascending: true);
    return this;
  }
  
  /// Order by card_last_four in descending order
  PaymentMethodsModelQueryBuilder orderByCardLastFourDesc() {
    _queryBuilder = _queryBuilder.order('card_last_four', ascending: false);
    return this;
  }

  /// Order by card_brand in ascending order
  PaymentMethodsModelQueryBuilder orderByCardBrandAsc() {
    _queryBuilder = _queryBuilder.order('card_brand', ascending: true);
    return this;
  }
  
  /// Order by card_brand in descending order
  PaymentMethodsModelQueryBuilder orderByCardBrandDesc() {
    _queryBuilder = _queryBuilder.order('card_brand', ascending: false);
    return this;
  }

  /// Order by card_expiry_month in ascending order
  PaymentMethodsModelQueryBuilder orderByCardExpiryMonthAsc() {
    _queryBuilder = _queryBuilder.order('card_expiry_month', ascending: true);
    return this;
  }
  
  /// Order by card_expiry_month in descending order
  PaymentMethodsModelQueryBuilder orderByCardExpiryMonthDesc() {
    _queryBuilder = _queryBuilder.order('card_expiry_month', ascending: false);
    return this;
  }

  /// Order by card_expiry_year in ascending order
  PaymentMethodsModelQueryBuilder orderByCardExpiryYearAsc() {
    _queryBuilder = _queryBuilder.order('card_expiry_year', ascending: true);
    return this;
  }
  
  /// Order by card_expiry_year in descending order
  PaymentMethodsModelQueryBuilder orderByCardExpiryYearDesc() {
    _queryBuilder = _queryBuilder.order('card_expiry_year', ascending: false);
    return this;
  }

  /// Order by bank_name in ascending order
  PaymentMethodsModelQueryBuilder orderByBankNameAsc() {
    _queryBuilder = _queryBuilder.order('bank_name', ascending: true);
    return this;
  }
  
  /// Order by bank_name in descending order
  PaymentMethodsModelQueryBuilder orderByBankNameDesc() {
    _queryBuilder = _queryBuilder.order('bank_name', ascending: false);
    return this;
  }

  /// Order by bank_account_last_four in ascending order
  PaymentMethodsModelQueryBuilder orderByBankAccountLastFourAsc() {
    _queryBuilder = _queryBuilder.order('bank_account_last_four', ascending: true);
    return this;
  }
  
  /// Order by bank_account_last_four in descending order
  PaymentMethodsModelQueryBuilder orderByBankAccountLastFourDesc() {
    _queryBuilder = _queryBuilder.order('bank_account_last_four', ascending: false);
    return this;
  }

  /// Order by is_default in ascending order
  PaymentMethodsModelQueryBuilder orderByIsDefaultAsc() {
    _queryBuilder = _queryBuilder.order('is_default', ascending: true);
    return this;
  }
  
  /// Order by is_default in descending order
  PaymentMethodsModelQueryBuilder orderByIsDefaultDesc() {
    _queryBuilder = _queryBuilder.order('is_default', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  PaymentMethodsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  PaymentMethodsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  PaymentMethodsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  PaymentMethodsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of PaymentMethodsModel
  Future<List<PaymentMethodsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => PaymentMethodsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<PaymentMethodsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return PaymentMethodsModel.fromJson(response.first as Map<String, dynamic>);
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
