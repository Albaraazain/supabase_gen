import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service_quotes_model.dart';

/// A type-safe query builder for ServiceQuotesModel
class ServiceQuotesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ServiceQuotesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('service_quotes').select();
  }
  
  /// Set the fields to select
  ServiceQuotesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('service_quotes').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ServiceQuotesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ServiceQuotesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by quote_id
  ServiceQuotesModelQueryBuilder whereQuoteId(String value) {
    _queryBuilder = _queryBuilder.eq('quote_id', value);
    return this;
  }
  
  /// Filter by quote_id with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereQuoteIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quote_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  ServiceQuotesModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by total_amount
  ServiceQuotesModelQueryBuilder whereTotalAmount(double value) {
    _queryBuilder = _queryBuilder.eq('total_amount', value);
    return this;
  }
  
  /// Filter by total_amount with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereTotalAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_amount', values);
    return this;
  }
  
    /// Filter total_amount greater than
  ServiceQuotesModelQueryBuilder whereTotalAmountGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('total_amount', value);
    return this;
  }
  
  /// Filter total_amount greater than or equal
  ServiceQuotesModelQueryBuilder whereTotalAmountGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('total_amount', value);
    return this;
  }
  
  /// Filter total_amount less than
  ServiceQuotesModelQueryBuilder whereTotalAmountLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('total_amount', value);
    return this;
  }
  
  /// Filter total_amount less than or equal
  ServiceQuotesModelQueryBuilder whereTotalAmountLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('total_amount', value);
    return this;
  }
  
  /// Filter total_amount between two values
  ServiceQuotesModelQueryBuilder whereTotalAmountBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('total_amount', min).lte('total_amount', max);
    return this;
  }

  /// Filter by status
  ServiceQuotesModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by valid_until
  ServiceQuotesModelQueryBuilder whereValidUntil(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('valid_until', value);
    return this;
  }
  
  /// Filter by valid_until with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereValidUntilIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('valid_until', values);
    return this;
  }
  
    /// Filter valid_until greater than
  ServiceQuotesModelQueryBuilder whereValidUntilGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('valid_until', value);
    return this;
  }
  
  /// Filter valid_until greater than or equal
  ServiceQuotesModelQueryBuilder whereValidUntilGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('valid_until', value);
    return this;
  }
  
  /// Filter valid_until less than
  ServiceQuotesModelQueryBuilder whereValidUntilLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('valid_until', value);
    return this;
  }
  
  /// Filter valid_until less than or equal
  ServiceQuotesModelQueryBuilder whereValidUntilLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('valid_until', value);
    return this;
  }
  
  /// Filter valid_until between two values
  ServiceQuotesModelQueryBuilder whereValidUntilBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('valid_until', min).lte('valid_until', max);
    return this;
  }

  /// Filter by notes
  ServiceQuotesModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by created_at
  ServiceQuotesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ServiceQuotesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ServiceQuotesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ServiceQuotesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ServiceQuotesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ServiceQuotesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ServiceQuotesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ServiceQuotesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ServiceQuotesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ServiceQuotesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ServiceQuotesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ServiceQuotesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by created_by
  ServiceQuotesModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  

  /// Filter by accepted_at
  ServiceQuotesModelQueryBuilder whereAcceptedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('accepted_at', value);
    return this;
  }
  
  /// Filter by accepted_at with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereAcceptedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accepted_at', values);
    return this;
  }
  
    /// Filter accepted_at greater than
  ServiceQuotesModelQueryBuilder whereAcceptedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at greater than or equal
  ServiceQuotesModelQueryBuilder whereAcceptedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at less than
  ServiceQuotesModelQueryBuilder whereAcceptedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at less than or equal
  ServiceQuotesModelQueryBuilder whereAcceptedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at between two values
  ServiceQuotesModelQueryBuilder whereAcceptedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('accepted_at', min).lte('accepted_at', max);
    return this;
  }

  /// Filter by accepted_by
  ServiceQuotesModelQueryBuilder whereAcceptedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('accepted_by', value);
    return this;
  }
  
  /// Filter by accepted_by with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereAcceptedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accepted_by', values);
    return this;
  }
  
  

  /// Filter by rejection_reason
  ServiceQuotesModelQueryBuilder whereRejectionReason(String? value) {
    _queryBuilder = _queryBuilder.eq('rejection_reason', value);
    return this;
  }
  
  /// Filter by rejection_reason with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereRejectionReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('rejection_reason', values);
    return this;
  }
  
  

  /// Filter by rejection_notes
  ServiceQuotesModelQueryBuilder whereRejectionNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('rejection_notes', value);
    return this;
  }
  
  /// Filter by rejection_notes with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereRejectionNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('rejection_notes', values);
    return this;
  }
  
  

  /// Filter by tax_rate
  ServiceQuotesModelQueryBuilder whereTaxRate(double value) {
    _queryBuilder = _queryBuilder.eq('tax_rate', value);
    return this;
  }
  
  /// Filter by tax_rate with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereTaxRateIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('tax_rate', values);
    return this;
  }
  
    /// Filter tax_rate greater than
  ServiceQuotesModelQueryBuilder whereTaxRateGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('tax_rate', value);
    return this;
  }
  
  /// Filter tax_rate greater than or equal
  ServiceQuotesModelQueryBuilder whereTaxRateGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('tax_rate', value);
    return this;
  }
  
  /// Filter tax_rate less than
  ServiceQuotesModelQueryBuilder whereTaxRateLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('tax_rate', value);
    return this;
  }
  
  /// Filter tax_rate less than or equal
  ServiceQuotesModelQueryBuilder whereTaxRateLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('tax_rate', value);
    return this;
  }
  
  /// Filter tax_rate between two values
  ServiceQuotesModelQueryBuilder whereTaxRateBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('tax_rate', min).lte('tax_rate', max);
    return this;
  }

  /// Filter by tax_amount
  ServiceQuotesModelQueryBuilder whereTaxAmount(double value) {
    _queryBuilder = _queryBuilder.eq('tax_amount', value);
    return this;
  }
  
  /// Filter by tax_amount with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereTaxAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('tax_amount', values);
    return this;
  }
  
    /// Filter tax_amount greater than
  ServiceQuotesModelQueryBuilder whereTaxAmountGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('tax_amount', value);
    return this;
  }
  
  /// Filter tax_amount greater than or equal
  ServiceQuotesModelQueryBuilder whereTaxAmountGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('tax_amount', value);
    return this;
  }
  
  /// Filter tax_amount less than
  ServiceQuotesModelQueryBuilder whereTaxAmountLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('tax_amount', value);
    return this;
  }
  
  /// Filter tax_amount less than or equal
  ServiceQuotesModelQueryBuilder whereTaxAmountLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('tax_amount', value);
    return this;
  }
  
  /// Filter tax_amount between two values
  ServiceQuotesModelQueryBuilder whereTaxAmountBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('tax_amount', min).lte('tax_amount', max);
    return this;
  }

  /// Filter by subtotal
  ServiceQuotesModelQueryBuilder whereSubtotal(double value) {
    _queryBuilder = _queryBuilder.eq('subtotal', value);
    return this;
  }
  
  /// Filter by subtotal with multiple values (IN operator)
  ServiceQuotesModelQueryBuilder whereSubtotalIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('subtotal', values);
    return this;
  }
  
    /// Filter subtotal greater than
  ServiceQuotesModelQueryBuilder whereSubtotalGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('subtotal', value);
    return this;
  }
  
  /// Filter subtotal greater than or equal
  ServiceQuotesModelQueryBuilder whereSubtotalGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('subtotal', value);
    return this;
  }
  
  /// Filter subtotal less than
  ServiceQuotesModelQueryBuilder whereSubtotalLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('subtotal', value);
    return this;
  }
  
  /// Filter subtotal less than or equal
  ServiceQuotesModelQueryBuilder whereSubtotalLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('subtotal', value);
    return this;
  }
  
  /// Filter subtotal between two values
  ServiceQuotesModelQueryBuilder whereSubtotalBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('subtotal', min).lte('subtotal', max);
    return this;
  }
  
  /// Order by quote_id in ascending order
  ServiceQuotesModelQueryBuilder orderByQuoteIdAsc() {
    _queryBuilder = _queryBuilder.order('quote_id', ascending: true);
    return this;
  }
  
  /// Order by quote_id in descending order
  ServiceQuotesModelQueryBuilder orderByQuoteIdDesc() {
    _queryBuilder = _queryBuilder.order('quote_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  ServiceQuotesModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  ServiceQuotesModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by total_amount in ascending order
  ServiceQuotesModelQueryBuilder orderByTotalAmountAsc() {
    _queryBuilder = _queryBuilder.order('total_amount', ascending: true);
    return this;
  }
  
  /// Order by total_amount in descending order
  ServiceQuotesModelQueryBuilder orderByTotalAmountDesc() {
    _queryBuilder = _queryBuilder.order('total_amount', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  ServiceQuotesModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  ServiceQuotesModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by valid_until in ascending order
  ServiceQuotesModelQueryBuilder orderByValidUntilAsc() {
    _queryBuilder = _queryBuilder.order('valid_until', ascending: true);
    return this;
  }
  
  /// Order by valid_until in descending order
  ServiceQuotesModelQueryBuilder orderByValidUntilDesc() {
    _queryBuilder = _queryBuilder.order('valid_until', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  ServiceQuotesModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  ServiceQuotesModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ServiceQuotesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ServiceQuotesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ServiceQuotesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ServiceQuotesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  ServiceQuotesModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  ServiceQuotesModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }

  /// Order by accepted_at in ascending order
  ServiceQuotesModelQueryBuilder orderByAcceptedAtAsc() {
    _queryBuilder = _queryBuilder.order('accepted_at', ascending: true);
    return this;
  }
  
  /// Order by accepted_at in descending order
  ServiceQuotesModelQueryBuilder orderByAcceptedAtDesc() {
    _queryBuilder = _queryBuilder.order('accepted_at', ascending: false);
    return this;
  }

  /// Order by accepted_by in ascending order
  ServiceQuotesModelQueryBuilder orderByAcceptedByAsc() {
    _queryBuilder = _queryBuilder.order('accepted_by', ascending: true);
    return this;
  }
  
  /// Order by accepted_by in descending order
  ServiceQuotesModelQueryBuilder orderByAcceptedByDesc() {
    _queryBuilder = _queryBuilder.order('accepted_by', ascending: false);
    return this;
  }

  /// Order by rejection_reason in ascending order
  ServiceQuotesModelQueryBuilder orderByRejectionReasonAsc() {
    _queryBuilder = _queryBuilder.order('rejection_reason', ascending: true);
    return this;
  }
  
  /// Order by rejection_reason in descending order
  ServiceQuotesModelQueryBuilder orderByRejectionReasonDesc() {
    _queryBuilder = _queryBuilder.order('rejection_reason', ascending: false);
    return this;
  }

  /// Order by rejection_notes in ascending order
  ServiceQuotesModelQueryBuilder orderByRejectionNotesAsc() {
    _queryBuilder = _queryBuilder.order('rejection_notes', ascending: true);
    return this;
  }
  
  /// Order by rejection_notes in descending order
  ServiceQuotesModelQueryBuilder orderByRejectionNotesDesc() {
    _queryBuilder = _queryBuilder.order('rejection_notes', ascending: false);
    return this;
  }

  /// Order by tax_rate in ascending order
  ServiceQuotesModelQueryBuilder orderByTaxRateAsc() {
    _queryBuilder = _queryBuilder.order('tax_rate', ascending: true);
    return this;
  }
  
  /// Order by tax_rate in descending order
  ServiceQuotesModelQueryBuilder orderByTaxRateDesc() {
    _queryBuilder = _queryBuilder.order('tax_rate', ascending: false);
    return this;
  }

  /// Order by tax_amount in ascending order
  ServiceQuotesModelQueryBuilder orderByTaxAmountAsc() {
    _queryBuilder = _queryBuilder.order('tax_amount', ascending: true);
    return this;
  }
  
  /// Order by tax_amount in descending order
  ServiceQuotesModelQueryBuilder orderByTaxAmountDesc() {
    _queryBuilder = _queryBuilder.order('tax_amount', ascending: false);
    return this;
  }

  /// Order by subtotal in ascending order
  ServiceQuotesModelQueryBuilder orderBySubtotalAsc() {
    _queryBuilder = _queryBuilder.order('subtotal', ascending: true);
    return this;
  }
  
  /// Order by subtotal in descending order
  ServiceQuotesModelQueryBuilder orderBySubtotalDesc() {
    _queryBuilder = _queryBuilder.order('subtotal', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ServiceQuotesModel
  Future<List<ServiceQuotesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ServiceQuotesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ServiceQuotesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ServiceQuotesModel.fromJson(response.first as Map<String, dynamic>);
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
