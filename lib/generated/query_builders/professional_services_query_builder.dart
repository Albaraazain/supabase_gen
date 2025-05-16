import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_services_model.dart';

/// A type-safe query builder for ProfessionalServicesModel
class ProfessionalServicesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfessionalServicesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('professional_services').select();
  }
  
  /// Set the fields to select
  ProfessionalServicesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('professional_services').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfessionalServicesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfessionalServicesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  ProfessionalServicesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ProfessionalServicesModelQueryBuilder whereProfessionalId(String? value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by service_id
  ProfessionalServicesModelQueryBuilder whereServiceId(String? value) {
    _queryBuilder = _queryBuilder.eq('service_id', value);
    return this;
  }
  
  /// Filter by service_id with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereServiceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_id', values);
    return this;
  }
  
  

  /// Filter by price_adjustment
  ProfessionalServicesModelQueryBuilder wherePriceAdjustment(double? value) {
    _queryBuilder = _queryBuilder.eq('price_adjustment', value);
    return this;
  }
  
  /// Filter by price_adjustment with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder wherePriceAdjustmentIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_adjustment', values);
    return this;
  }
  
    /// Filter price_adjustment greater than
  ProfessionalServicesModelQueryBuilder wherePriceAdjustmentGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment greater than or equal
  ProfessionalServicesModelQueryBuilder wherePriceAdjustmentGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment less than
  ProfessionalServicesModelQueryBuilder wherePriceAdjustmentLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment less than or equal
  ProfessionalServicesModelQueryBuilder wherePriceAdjustmentLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment between two values
  ProfessionalServicesModelQueryBuilder wherePriceAdjustmentBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price_adjustment', min).lte('price_adjustment', max);
    return this;
  }

  /// Filter by price_rate
  ProfessionalServicesModelQueryBuilder wherePriceRate(double? value) {
    _queryBuilder = _queryBuilder.eq('price_rate', value);
    return this;
  }
  
  /// Filter by price_rate with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder wherePriceRateIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_rate', values);
    return this;
  }
  
    /// Filter price_rate greater than
  ProfessionalServicesModelQueryBuilder wherePriceRateGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price_rate', value);
    return this;
  }
  
  /// Filter price_rate greater than or equal
  ProfessionalServicesModelQueryBuilder wherePriceRateGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price_rate', value);
    return this;
  }
  
  /// Filter price_rate less than
  ProfessionalServicesModelQueryBuilder wherePriceRateLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price_rate', value);
    return this;
  }
  
  /// Filter price_rate less than or equal
  ProfessionalServicesModelQueryBuilder wherePriceRateLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price_rate', value);
    return this;
  }
  
  /// Filter price_rate between two values
  ProfessionalServicesModelQueryBuilder wherePriceRateBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price_rate', min).lte('price_rate', max);
    return this;
  }

  /// Filter by is_active
  ProfessionalServicesModelQueryBuilder whereIsActive(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_active', value);
    return this;
  }
  
  /// Filter by is_active with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereIsActiveIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_active', values);
    return this;
  }
  
  

  /// Filter by is_available
  ProfessionalServicesModelQueryBuilder whereIsAvailable(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_available', value);
    return this;
  }
  
  /// Filter by is_available with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereIsAvailableIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_available', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfessionalServicesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfessionalServicesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfessionalServicesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfessionalServicesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfessionalServicesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfessionalServicesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfessionalServicesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfessionalServicesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfessionalServicesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfessionalServicesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfessionalServicesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfessionalServicesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfessionalServicesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  ProfessionalServicesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  ProfessionalServicesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ProfessionalServicesModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ProfessionalServicesModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by service_id in ascending order
  ProfessionalServicesModelQueryBuilder orderByServiceIdAsc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: true);
    return this;
  }
  
  /// Order by service_id in descending order
  ProfessionalServicesModelQueryBuilder orderByServiceIdDesc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: false);
    return this;
  }

  /// Order by price_adjustment in ascending order
  ProfessionalServicesModelQueryBuilder orderByPriceAdjustmentAsc() {
    _queryBuilder = _queryBuilder.order('price_adjustment', ascending: true);
    return this;
  }
  
  /// Order by price_adjustment in descending order
  ProfessionalServicesModelQueryBuilder orderByPriceAdjustmentDesc() {
    _queryBuilder = _queryBuilder.order('price_adjustment', ascending: false);
    return this;
  }

  /// Order by price_rate in ascending order
  ProfessionalServicesModelQueryBuilder orderByPriceRateAsc() {
    _queryBuilder = _queryBuilder.order('price_rate', ascending: true);
    return this;
  }
  
  /// Order by price_rate in descending order
  ProfessionalServicesModelQueryBuilder orderByPriceRateDesc() {
    _queryBuilder = _queryBuilder.order('price_rate', ascending: false);
    return this;
  }

  /// Order by is_active in ascending order
  ProfessionalServicesModelQueryBuilder orderByIsActiveAsc() {
    _queryBuilder = _queryBuilder.order('is_active', ascending: true);
    return this;
  }
  
  /// Order by is_active in descending order
  ProfessionalServicesModelQueryBuilder orderByIsActiveDesc() {
    _queryBuilder = _queryBuilder.order('is_active', ascending: false);
    return this;
  }

  /// Order by is_available in ascending order
  ProfessionalServicesModelQueryBuilder orderByIsAvailableAsc() {
    _queryBuilder = _queryBuilder.order('is_available', ascending: true);
    return this;
  }
  
  /// Order by is_available in descending order
  ProfessionalServicesModelQueryBuilder orderByIsAvailableDesc() {
    _queryBuilder = _queryBuilder.order('is_available', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfessionalServicesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfessionalServicesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfessionalServicesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfessionalServicesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfessionalServicesModel
  Future<List<ProfessionalServicesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfessionalServicesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfessionalServicesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfessionalServicesModel.fromJson(response.first as Map<String, dynamic>);
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
