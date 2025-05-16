import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_earnings_model.dart';

/// A type-safe query builder for ProfessionalEarningsModel
class ProfessionalEarningsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfessionalEarningsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('professional_earnings').select();
  }
  
  /// Set the fields to select
  ProfessionalEarningsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('professional_earnings').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfessionalEarningsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfessionalEarningsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by earning_id
  ProfessionalEarningsModelQueryBuilder whereEarningId(String value) {
    _queryBuilder = _queryBuilder.eq('earning_id', value);
    return this;
  }
  
  /// Filter by earning_id with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereEarningIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('earning_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ProfessionalEarningsModelQueryBuilder whereProfessionalId(String value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  ProfessionalEarningsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by amount
  ProfessionalEarningsModelQueryBuilder whereAmount(double value) {
    _queryBuilder = _queryBuilder.eq('amount', value);
    return this;
  }
  
  /// Filter by amount with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('amount', values);
    return this;
  }
  
    /// Filter amount greater than
  ProfessionalEarningsModelQueryBuilder whereAmountGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('amount', value);
    return this;
  }
  
  /// Filter amount greater than or equal
  ProfessionalEarningsModelQueryBuilder whereAmountGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('amount', value);
    return this;
  }
  
  /// Filter amount less than
  ProfessionalEarningsModelQueryBuilder whereAmountLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('amount', value);
    return this;
  }
  
  /// Filter amount less than or equal
  ProfessionalEarningsModelQueryBuilder whereAmountLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('amount', value);
    return this;
  }
  
  /// Filter amount between two values
  ProfessionalEarningsModelQueryBuilder whereAmountBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('amount', min).lte('amount', max);
    return this;
  }

  /// Filter by earnings_date
  ProfessionalEarningsModelQueryBuilder whereEarningsDate(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('earnings_date', value);
    return this;
  }
  
  /// Filter by earnings_date with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereEarningsDateIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('earnings_date', values);
    return this;
  }
  
    /// Filter earnings_date greater than
  ProfessionalEarningsModelQueryBuilder whereEarningsDateGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('earnings_date', value);
    return this;
  }
  
  /// Filter earnings_date greater than or equal
  ProfessionalEarningsModelQueryBuilder whereEarningsDateGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('earnings_date', value);
    return this;
  }
  
  /// Filter earnings_date less than
  ProfessionalEarningsModelQueryBuilder whereEarningsDateLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('earnings_date', value);
    return this;
  }
  
  /// Filter earnings_date less than or equal
  ProfessionalEarningsModelQueryBuilder whereEarningsDateLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('earnings_date', value);
    return this;
  }
  
  /// Filter earnings_date between two values
  ProfessionalEarningsModelQueryBuilder whereEarningsDateBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('earnings_date', min).lte('earnings_date', max);
    return this;
  }

  /// Filter by status
  ProfessionalEarningsModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by payout_date
  ProfessionalEarningsModelQueryBuilder wherePayoutDate(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('payout_date', value);
    return this;
  }
  
  /// Filter by payout_date with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder wherePayoutDateIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payout_date', values);
    return this;
  }
  
    /// Filter payout_date greater than
  ProfessionalEarningsModelQueryBuilder wherePayoutDateGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('payout_date', value);
    return this;
  }
  
  /// Filter payout_date greater than or equal
  ProfessionalEarningsModelQueryBuilder wherePayoutDateGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('payout_date', value);
    return this;
  }
  
  /// Filter payout_date less than
  ProfessionalEarningsModelQueryBuilder wherePayoutDateLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('payout_date', value);
    return this;
  }
  
  /// Filter payout_date less than or equal
  ProfessionalEarningsModelQueryBuilder wherePayoutDateLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('payout_date', value);
    return this;
  }
  
  /// Filter payout_date between two values
  ProfessionalEarningsModelQueryBuilder wherePayoutDateBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('payout_date', min).lte('payout_date', max);
    return this;
  }

  /// Filter by transaction_id
  ProfessionalEarningsModelQueryBuilder whereTransactionId(String? value) {
    _queryBuilder = _queryBuilder.eq('transaction_id', value);
    return this;
  }
  
  /// Filter by transaction_id with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereTransactionIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('transaction_id', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfessionalEarningsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfessionalEarningsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfessionalEarningsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfessionalEarningsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfessionalEarningsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfessionalEarningsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfessionalEarningsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfessionalEarningsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfessionalEarningsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfessionalEarningsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfessionalEarningsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfessionalEarningsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfessionalEarningsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by earning_id in ascending order
  ProfessionalEarningsModelQueryBuilder orderByEarningIdAsc() {
    _queryBuilder = _queryBuilder.order('earning_id', ascending: true);
    return this;
  }
  
  /// Order by earning_id in descending order
  ProfessionalEarningsModelQueryBuilder orderByEarningIdDesc() {
    _queryBuilder = _queryBuilder.order('earning_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ProfessionalEarningsModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ProfessionalEarningsModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  ProfessionalEarningsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  ProfessionalEarningsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by amount in ascending order
  ProfessionalEarningsModelQueryBuilder orderByAmountAsc() {
    _queryBuilder = _queryBuilder.order('amount', ascending: true);
    return this;
  }
  
  /// Order by amount in descending order
  ProfessionalEarningsModelQueryBuilder orderByAmountDesc() {
    _queryBuilder = _queryBuilder.order('amount', ascending: false);
    return this;
  }

  /// Order by earnings_date in ascending order
  ProfessionalEarningsModelQueryBuilder orderByEarningsDateAsc() {
    _queryBuilder = _queryBuilder.order('earnings_date', ascending: true);
    return this;
  }
  
  /// Order by earnings_date in descending order
  ProfessionalEarningsModelQueryBuilder orderByEarningsDateDesc() {
    _queryBuilder = _queryBuilder.order('earnings_date', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  ProfessionalEarningsModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  ProfessionalEarningsModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by payout_date in ascending order
  ProfessionalEarningsModelQueryBuilder orderByPayoutDateAsc() {
    _queryBuilder = _queryBuilder.order('payout_date', ascending: true);
    return this;
  }
  
  /// Order by payout_date in descending order
  ProfessionalEarningsModelQueryBuilder orderByPayoutDateDesc() {
    _queryBuilder = _queryBuilder.order('payout_date', ascending: false);
    return this;
  }

  /// Order by transaction_id in ascending order
  ProfessionalEarningsModelQueryBuilder orderByTransactionIdAsc() {
    _queryBuilder = _queryBuilder.order('transaction_id', ascending: true);
    return this;
  }
  
  /// Order by transaction_id in descending order
  ProfessionalEarningsModelQueryBuilder orderByTransactionIdDesc() {
    _queryBuilder = _queryBuilder.order('transaction_id', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfessionalEarningsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfessionalEarningsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfessionalEarningsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfessionalEarningsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfessionalEarningsModel
  Future<List<ProfessionalEarningsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfessionalEarningsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfessionalEarningsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfessionalEarningsModel.fromJson(response.first as Map<String, dynamic>);
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
