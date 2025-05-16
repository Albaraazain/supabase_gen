import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/services_model.dart';

/// A type-safe query builder for ServicesModel
class ServicesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ServicesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('services').select();
  }
  
  /// Set the fields to select
  ServicesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('services').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ServicesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ServicesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by service_id
  ServicesModelQueryBuilder whereServiceId(String value) {
    _queryBuilder = _queryBuilder.eq('service_id', value);
    return this;
  }
  
  /// Filter by service_id with multiple values (IN operator)
  ServicesModelQueryBuilder whereServiceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_id', values);
    return this;
  }
  
  

  /// Filter by category_id
  ServicesModelQueryBuilder whereCategoryId(String? value) {
    _queryBuilder = _queryBuilder.eq('category_id', value);
    return this;
  }
  
  /// Filter by category_id with multiple values (IN operator)
  ServicesModelQueryBuilder whereCategoryIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('category_id', values);
    return this;
  }
  
  

  /// Filter by name
  ServicesModelQueryBuilder whereName(String value) {
    _queryBuilder = _queryBuilder.eq('name', value);
    return this;
  }
  
  /// Filter by name with multiple values (IN operator)
  ServicesModelQueryBuilder whereNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('name', values);
    return this;
  }
  
  

  /// Filter by description
  ServicesModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  ServicesModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by base_price
  ServicesModelQueryBuilder whereBasePrice(double? value) {
    _queryBuilder = _queryBuilder.eq('base_price', value);
    return this;
  }
  
  /// Filter by base_price with multiple values (IN operator)
  ServicesModelQueryBuilder whereBasePriceIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('base_price', values);
    return this;
  }
  
    /// Filter base_price greater than
  ServicesModelQueryBuilder whereBasePriceGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('base_price', value);
    return this;
  }
  
  /// Filter base_price greater than or equal
  ServicesModelQueryBuilder whereBasePriceGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('base_price', value);
    return this;
  }
  
  /// Filter base_price less than
  ServicesModelQueryBuilder whereBasePriceLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('base_price', value);
    return this;
  }
  
  /// Filter base_price less than or equal
  ServicesModelQueryBuilder whereBasePriceLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('base_price', value);
    return this;
  }
  
  /// Filter base_price between two values
  ServicesModelQueryBuilder whereBasePriceBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('base_price', min).lte('base_price', max);
    return this;
  }

  /// Filter by price_unit
  ServicesModelQueryBuilder wherePriceUnit(String? value) {
    _queryBuilder = _queryBuilder.eq('price_unit', value);
    return this;
  }
  
  /// Filter by price_unit with multiple values (IN operator)
  ServicesModelQueryBuilder wherePriceUnitIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_unit', values);
    return this;
  }
  
  

  /// Filter by estimated_duration
  ServicesModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  ServicesModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  ServicesModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  ServicesModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  ServicesModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  ServicesModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  ServicesModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }

  /// Filter by created_at
  ServicesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ServicesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ServicesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ServicesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ServicesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ServicesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ServicesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ServicesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ServicesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ServicesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ServicesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ServicesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ServicesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ServicesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by service_id in ascending order
  ServicesModelQueryBuilder orderByServiceIdAsc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: true);
    return this;
  }
  
  /// Order by service_id in descending order
  ServicesModelQueryBuilder orderByServiceIdDesc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: false);
    return this;
  }

  /// Order by category_id in ascending order
  ServicesModelQueryBuilder orderByCategoryIdAsc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: true);
    return this;
  }
  
  /// Order by category_id in descending order
  ServicesModelQueryBuilder orderByCategoryIdDesc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: false);
    return this;
  }

  /// Order by name in ascending order
  ServicesModelQueryBuilder orderByNameAsc() {
    _queryBuilder = _queryBuilder.order('name', ascending: true);
    return this;
  }
  
  /// Order by name in descending order
  ServicesModelQueryBuilder orderByNameDesc() {
    _queryBuilder = _queryBuilder.order('name', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  ServicesModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  ServicesModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by base_price in ascending order
  ServicesModelQueryBuilder orderByBasePriceAsc() {
    _queryBuilder = _queryBuilder.order('base_price', ascending: true);
    return this;
  }
  
  /// Order by base_price in descending order
  ServicesModelQueryBuilder orderByBasePriceDesc() {
    _queryBuilder = _queryBuilder.order('base_price', ascending: false);
    return this;
  }

  /// Order by price_unit in ascending order
  ServicesModelQueryBuilder orderByPriceUnitAsc() {
    _queryBuilder = _queryBuilder.order('price_unit', ascending: true);
    return this;
  }
  
  /// Order by price_unit in descending order
  ServicesModelQueryBuilder orderByPriceUnitDesc() {
    _queryBuilder = _queryBuilder.order('price_unit', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  ServicesModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  ServicesModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ServicesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ServicesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ServicesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ServicesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ServicesModel
  Future<List<ServicesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ServicesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ServicesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ServicesModel.fromJson(response.first as Map<String, dynamic>);
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
