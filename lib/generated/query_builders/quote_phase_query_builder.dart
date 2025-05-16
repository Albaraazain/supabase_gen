import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quote_phase_model.dart';

/// A type-safe query builder for QuotePhaseModel
class QuotePhaseModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  QuotePhaseModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('quote_phase').select();
  }
  
  /// Set the fields to select
  QuotePhaseModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('quote_phase').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  QuotePhaseModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  QuotePhaseModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  QuotePhaseModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  QuotePhaseModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by quote_created_at
  QuotePhaseModelQueryBuilder whereQuoteCreatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('quote_created_at', value);
    return this;
  }
  
  /// Filter by quote_created_at with multiple values (IN operator)
  QuotePhaseModelQueryBuilder whereQuoteCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quote_created_at', values);
    return this;
  }
  
    /// Filter quote_created_at greater than
  QuotePhaseModelQueryBuilder whereQuoteCreatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('quote_created_at', value);
    return this;
  }
  
  /// Filter quote_created_at greater than or equal
  QuotePhaseModelQueryBuilder whereQuoteCreatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('quote_created_at', value);
    return this;
  }
  
  /// Filter quote_created_at less than
  QuotePhaseModelQueryBuilder whereQuoteCreatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('quote_created_at', value);
    return this;
  }
  
  /// Filter quote_created_at less than or equal
  QuotePhaseModelQueryBuilder whereQuoteCreatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('quote_created_at', value);
    return this;
  }
  
  /// Filter quote_created_at between two values
  QuotePhaseModelQueryBuilder whereQuoteCreatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('quote_created_at', min).lte('quote_created_at', max);
    return this;
  }

  /// Filter by quote_submitted_at
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('quote_submitted_at', value);
    return this;
  }
  
  /// Filter by quote_submitted_at with multiple values (IN operator)
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quote_submitted_at', values);
    return this;
  }
  
    /// Filter quote_submitted_at greater than
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('quote_submitted_at', value);
    return this;
  }
  
  /// Filter quote_submitted_at greater than or equal
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('quote_submitted_at', value);
    return this;
  }
  
  /// Filter quote_submitted_at less than
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('quote_submitted_at', value);
    return this;
  }
  
  /// Filter quote_submitted_at less than or equal
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('quote_submitted_at', value);
    return this;
  }
  
  /// Filter quote_submitted_at between two values
  QuotePhaseModelQueryBuilder whereQuoteSubmittedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('quote_submitted_at', min).lte('quote_submitted_at', max);
    return this;
  }

  /// Filter by quote_accepted_at
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('quote_accepted_at', value);
    return this;
  }
  
  /// Filter by quote_accepted_at with multiple values (IN operator)
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quote_accepted_at', values);
    return this;
  }
  
    /// Filter quote_accepted_at greater than
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('quote_accepted_at', value);
    return this;
  }
  
  /// Filter quote_accepted_at greater than or equal
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('quote_accepted_at', value);
    return this;
  }
  
  /// Filter quote_accepted_at less than
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('quote_accepted_at', value);
    return this;
  }
  
  /// Filter quote_accepted_at less than or equal
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('quote_accepted_at', value);
    return this;
  }
  
  /// Filter quote_accepted_at between two values
  QuotePhaseModelQueryBuilder whereQuoteAcceptedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('quote_accepted_at', min).lte('quote_accepted_at', max);
    return this;
  }

  /// Filter by total_amount
  QuotePhaseModelQueryBuilder whereTotalAmount(double? value) {
    _queryBuilder = _queryBuilder.eq('total_amount', value);
    return this;
  }
  
  /// Filter by total_amount with multiple values (IN operator)
  QuotePhaseModelQueryBuilder whereTotalAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_amount', values);
    return this;
  }
  
    /// Filter total_amount greater than
  QuotePhaseModelQueryBuilder whereTotalAmountGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('total_amount', value);
    return this;
  }
  
  /// Filter total_amount greater than or equal
  QuotePhaseModelQueryBuilder whereTotalAmountGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('total_amount', value);
    return this;
  }
  
  /// Filter total_amount less than
  QuotePhaseModelQueryBuilder whereTotalAmountLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('total_amount', value);
    return this;
  }
  
  /// Filter total_amount less than or equal
  QuotePhaseModelQueryBuilder whereTotalAmountLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('total_amount', value);
    return this;
  }
  
  /// Filter total_amount between two values
  QuotePhaseModelQueryBuilder whereTotalAmountBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('total_amount', min).lte('total_amount', max);
    return this;
  }

  /// Filter by validity_days
  QuotePhaseModelQueryBuilder whereValidityDays(int? value) {
    _queryBuilder = _queryBuilder.eq('validity_days', value);
    return this;
  }
  
  /// Filter by validity_days with multiple values (IN operator)
  QuotePhaseModelQueryBuilder whereValidityDaysIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('validity_days', values);
    return this;
  }
  
    /// Filter validity_days greater than
  QuotePhaseModelQueryBuilder whereValidityDaysGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('validity_days', value);
    return this;
  }
  
  /// Filter validity_days greater than or equal
  QuotePhaseModelQueryBuilder whereValidityDaysGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('validity_days', value);
    return this;
  }
  
  /// Filter validity_days less than
  QuotePhaseModelQueryBuilder whereValidityDaysLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('validity_days', value);
    return this;
  }
  
  /// Filter validity_days less than or equal
  QuotePhaseModelQueryBuilder whereValidityDaysLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('validity_days', value);
    return this;
  }
  
  /// Filter validity_days between two values
  QuotePhaseModelQueryBuilder whereValidityDaysBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('validity_days', min).lte('validity_days', max);
    return this;
  }
  
  /// Order by job_id in ascending order
  QuotePhaseModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  QuotePhaseModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by quote_created_at in ascending order
  QuotePhaseModelQueryBuilder orderByQuoteCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('quote_created_at', ascending: true);
    return this;
  }
  
  /// Order by quote_created_at in descending order
  QuotePhaseModelQueryBuilder orderByQuoteCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('quote_created_at', ascending: false);
    return this;
  }

  /// Order by quote_submitted_at in ascending order
  QuotePhaseModelQueryBuilder orderByQuoteSubmittedAtAsc() {
    _queryBuilder = _queryBuilder.order('quote_submitted_at', ascending: true);
    return this;
  }
  
  /// Order by quote_submitted_at in descending order
  QuotePhaseModelQueryBuilder orderByQuoteSubmittedAtDesc() {
    _queryBuilder = _queryBuilder.order('quote_submitted_at', ascending: false);
    return this;
  }

  /// Order by quote_accepted_at in ascending order
  QuotePhaseModelQueryBuilder orderByQuoteAcceptedAtAsc() {
    _queryBuilder = _queryBuilder.order('quote_accepted_at', ascending: true);
    return this;
  }
  
  /// Order by quote_accepted_at in descending order
  QuotePhaseModelQueryBuilder orderByQuoteAcceptedAtDesc() {
    _queryBuilder = _queryBuilder.order('quote_accepted_at', ascending: false);
    return this;
  }

  /// Order by total_amount in ascending order
  QuotePhaseModelQueryBuilder orderByTotalAmountAsc() {
    _queryBuilder = _queryBuilder.order('total_amount', ascending: true);
    return this;
  }
  
  /// Order by total_amount in descending order
  QuotePhaseModelQueryBuilder orderByTotalAmountDesc() {
    _queryBuilder = _queryBuilder.order('total_amount', ascending: false);
    return this;
  }

  /// Order by validity_days in ascending order
  QuotePhaseModelQueryBuilder orderByValidityDaysAsc() {
    _queryBuilder = _queryBuilder.order('validity_days', ascending: true);
    return this;
  }
  
  /// Order by validity_days in descending order
  QuotePhaseModelQueryBuilder orderByValidityDaysDesc() {
    _queryBuilder = _queryBuilder.order('validity_days', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of QuotePhaseModel
  Future<List<QuotePhaseModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => QuotePhaseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<QuotePhaseModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return QuotePhaseModel.fromJson(response.first as Map<String, dynamic>);
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
