import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_responses_model.dart';

/// A type-safe query builder for ProfessionalResponsesModel
class ProfessionalResponsesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfessionalResponsesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('professional_responses').select();
  }
  
  /// Set the fields to select
  ProfessionalResponsesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('professional_responses').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfessionalResponsesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfessionalResponsesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by response_id
  ProfessionalResponsesModelQueryBuilder whereResponseId(String value) {
    _queryBuilder = _queryBuilder.eq('response_id', value);
    return this;
  }
  
  /// Filter by response_id with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereResponseIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('response_id', values);
    return this;
  }
  
  

  /// Filter by broadcast_id
  ProfessionalResponsesModelQueryBuilder whereBroadcastId(String? value) {
    _queryBuilder = _queryBuilder.eq('broadcast_id', value);
    return this;
  }
  
  /// Filter by broadcast_id with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereBroadcastIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('broadcast_id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ProfessionalResponsesModelQueryBuilder whereProfessionalId(String? value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by price
  ProfessionalResponsesModelQueryBuilder wherePrice(double? value) {
    _queryBuilder = _queryBuilder.eq('price', value);
    return this;
  }
  
  /// Filter by price with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder wherePriceIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price', values);
    return this;
  }
  
    /// Filter price greater than
  ProfessionalResponsesModelQueryBuilder wherePriceGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price', value);
    return this;
  }
  
  /// Filter price greater than or equal
  ProfessionalResponsesModelQueryBuilder wherePriceGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price', value);
    return this;
  }
  
  /// Filter price less than
  ProfessionalResponsesModelQueryBuilder wherePriceLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price', value);
    return this;
  }
  
  /// Filter price less than or equal
  ProfessionalResponsesModelQueryBuilder wherePriceLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price', value);
    return this;
  }
  
  /// Filter price between two values
  ProfessionalResponsesModelQueryBuilder wherePriceBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price', min).lte('price', max);
    return this;
  }

  /// Filter by arrival_window_start
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStart(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('arrival_window_start', value);
    return this;
  }
  
  /// Filter by arrival_window_start with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStartIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('arrival_window_start', values);
    return this;
  }
  
    /// Filter arrival_window_start greater than
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStartGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('arrival_window_start', value);
    return this;
  }
  
  /// Filter arrival_window_start greater than or equal
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStartGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('arrival_window_start', value);
    return this;
  }
  
  /// Filter arrival_window_start less than
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStartLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('arrival_window_start', value);
    return this;
  }
  
  /// Filter arrival_window_start less than or equal
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStartLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('arrival_window_start', value);
    return this;
  }
  
  /// Filter arrival_window_start between two values
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowStartBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('arrival_window_start', min).lte('arrival_window_start', max);
    return this;
  }

  /// Filter by arrival_window_end
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEnd(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('arrival_window_end', value);
    return this;
  }
  
  /// Filter by arrival_window_end with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEndIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('arrival_window_end', values);
    return this;
  }
  
    /// Filter arrival_window_end greater than
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEndGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('arrival_window_end', value);
    return this;
  }
  
  /// Filter arrival_window_end greater than or equal
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEndGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('arrival_window_end', value);
    return this;
  }
  
  /// Filter arrival_window_end less than
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEndLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('arrival_window_end', value);
    return this;
  }
  
  /// Filter arrival_window_end less than or equal
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEndLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('arrival_window_end', value);
    return this;
  }
  
  /// Filter arrival_window_end between two values
  ProfessionalResponsesModelQueryBuilder whereArrivalWindowEndBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('arrival_window_end', min).lte('arrival_window_end', max);
    return this;
  }

  /// Filter by estimated_duration
  ProfessionalResponsesModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  ProfessionalResponsesModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  ProfessionalResponsesModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  ProfessionalResponsesModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  ProfessionalResponsesModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  ProfessionalResponsesModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }

  /// Filter by notes
  ProfessionalResponsesModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by status
  ProfessionalResponsesModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfessionalResponsesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfessionalResponsesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfessionalResponsesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfessionalResponsesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfessionalResponsesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfessionalResponsesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfessionalResponsesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfessionalResponsesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfessionalResponsesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfessionalResponsesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfessionalResponsesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfessionalResponsesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfessionalResponsesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by response_id in ascending order
  ProfessionalResponsesModelQueryBuilder orderByResponseIdAsc() {
    _queryBuilder = _queryBuilder.order('response_id', ascending: true);
    return this;
  }
  
  /// Order by response_id in descending order
  ProfessionalResponsesModelQueryBuilder orderByResponseIdDesc() {
    _queryBuilder = _queryBuilder.order('response_id', ascending: false);
    return this;
  }

  /// Order by broadcast_id in ascending order
  ProfessionalResponsesModelQueryBuilder orderByBroadcastIdAsc() {
    _queryBuilder = _queryBuilder.order('broadcast_id', ascending: true);
    return this;
  }
  
  /// Order by broadcast_id in descending order
  ProfessionalResponsesModelQueryBuilder orderByBroadcastIdDesc() {
    _queryBuilder = _queryBuilder.order('broadcast_id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ProfessionalResponsesModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ProfessionalResponsesModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by price in ascending order
  ProfessionalResponsesModelQueryBuilder orderByPriceAsc() {
    _queryBuilder = _queryBuilder.order('price', ascending: true);
    return this;
  }
  
  /// Order by price in descending order
  ProfessionalResponsesModelQueryBuilder orderByPriceDesc() {
    _queryBuilder = _queryBuilder.order('price', ascending: false);
    return this;
  }

  /// Order by arrival_window_start in ascending order
  ProfessionalResponsesModelQueryBuilder orderByArrivalWindowStartAsc() {
    _queryBuilder = _queryBuilder.order('arrival_window_start', ascending: true);
    return this;
  }
  
  /// Order by arrival_window_start in descending order
  ProfessionalResponsesModelQueryBuilder orderByArrivalWindowStartDesc() {
    _queryBuilder = _queryBuilder.order('arrival_window_start', ascending: false);
    return this;
  }

  /// Order by arrival_window_end in ascending order
  ProfessionalResponsesModelQueryBuilder orderByArrivalWindowEndAsc() {
    _queryBuilder = _queryBuilder.order('arrival_window_end', ascending: true);
    return this;
  }
  
  /// Order by arrival_window_end in descending order
  ProfessionalResponsesModelQueryBuilder orderByArrivalWindowEndDesc() {
    _queryBuilder = _queryBuilder.order('arrival_window_end', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  ProfessionalResponsesModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  ProfessionalResponsesModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  ProfessionalResponsesModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  ProfessionalResponsesModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  ProfessionalResponsesModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  ProfessionalResponsesModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfessionalResponsesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfessionalResponsesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfessionalResponsesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfessionalResponsesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfessionalResponsesModel
  Future<List<ProfessionalResponsesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfessionalResponsesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfessionalResponsesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfessionalResponsesModel.fromJson(response.first as Map<String, dynamic>);
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
