import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service_categories_model.dart';

/// A type-safe query builder for ServiceCategoriesModel
class ServiceCategoriesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ServiceCategoriesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('service_categories').select();
  }
  
  /// Set the fields to select
  ServiceCategoriesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('service_categories').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ServiceCategoriesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ServiceCategoriesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by category_id
  ServiceCategoriesModelQueryBuilder whereCategoryId(String value) {
    _queryBuilder = _queryBuilder.eq('category_id', value);
    return this;
  }
  
  /// Filter by category_id with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereCategoryIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('category_id', values);
    return this;
  }
  
  

  /// Filter by name
  ServiceCategoriesModelQueryBuilder whereName(String value) {
    _queryBuilder = _queryBuilder.eq('name', value);
    return this;
  }
  
  /// Filter by name with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('name', values);
    return this;
  }
  
  

  /// Filter by description
  ServiceCategoriesModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by icon_url
  ServiceCategoriesModelQueryBuilder whereIconUrl(String? value) {
    _queryBuilder = _queryBuilder.eq('icon_url', value);
    return this;
  }
  
  /// Filter by icon_url with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereIconUrlIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('icon_url', values);
    return this;
  }
  
  

  /// Filter by created_at
  ServiceCategoriesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ServiceCategoriesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ServiceCategoriesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ServiceCategoriesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ServiceCategoriesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ServiceCategoriesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ServiceCategoriesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ServiceCategoriesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ServiceCategoriesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ServiceCategoriesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ServiceCategoriesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ServiceCategoriesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by base_price
  ServiceCategoriesModelQueryBuilder whereBasePrice(double? value) {
    _queryBuilder = _queryBuilder.eq('base_price', value);
    return this;
  }
  
  /// Filter by base_price with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereBasePriceIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('base_price', values);
    return this;
  }
  
    /// Filter base_price greater than
  ServiceCategoriesModelQueryBuilder whereBasePriceGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('base_price', value);
    return this;
  }
  
  /// Filter base_price greater than or equal
  ServiceCategoriesModelQueryBuilder whereBasePriceGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('base_price', value);
    return this;
  }
  
  /// Filter base_price less than
  ServiceCategoriesModelQueryBuilder whereBasePriceLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('base_price', value);
    return this;
  }
  
  /// Filter base_price less than or equal
  ServiceCategoriesModelQueryBuilder whereBasePriceLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('base_price', value);
    return this;
  }
  
  /// Filter base_price between two values
  ServiceCategoriesModelQueryBuilder whereBasePriceBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('base_price', min).lte('base_price', max);
    return this;
  }

  /// Filter by price_unit
  ServiceCategoriesModelQueryBuilder wherePriceUnit(String? value) {
    _queryBuilder = _queryBuilder.eq('price_unit', value);
    return this;
  }
  
  /// Filter by price_unit with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder wherePriceUnitIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_unit', values);
    return this;
  }
  
  

  /// Filter by estimated_duration
  ServiceCategoriesModelQueryBuilder whereEstimatedDuration(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration', value);
    return this;
  }
  
  /// Filter by estimated_duration with multiple values (IN operator)
  ServiceCategoriesModelQueryBuilder whereEstimatedDurationIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration', values);
    return this;
  }
  
    /// Filter estimated_duration greater than
  ServiceCategoriesModelQueryBuilder whereEstimatedDurationGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration greater than or equal
  ServiceCategoriesModelQueryBuilder whereEstimatedDurationGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than
  ServiceCategoriesModelQueryBuilder whereEstimatedDurationLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration less than or equal
  ServiceCategoriesModelQueryBuilder whereEstimatedDurationLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration', value);
    return this;
  }
  
  /// Filter estimated_duration between two values
  ServiceCategoriesModelQueryBuilder whereEstimatedDurationBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration', min).lte('estimated_duration', max);
    return this;
  }
  
  /// Order by category_id in ascending order
  ServiceCategoriesModelQueryBuilder orderByCategoryIdAsc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: true);
    return this;
  }
  
  /// Order by category_id in descending order
  ServiceCategoriesModelQueryBuilder orderByCategoryIdDesc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: false);
    return this;
  }

  /// Order by name in ascending order
  ServiceCategoriesModelQueryBuilder orderByNameAsc() {
    _queryBuilder = _queryBuilder.order('name', ascending: true);
    return this;
  }
  
  /// Order by name in descending order
  ServiceCategoriesModelQueryBuilder orderByNameDesc() {
    _queryBuilder = _queryBuilder.order('name', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  ServiceCategoriesModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  ServiceCategoriesModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by icon_url in ascending order
  ServiceCategoriesModelQueryBuilder orderByIconUrlAsc() {
    _queryBuilder = _queryBuilder.order('icon_url', ascending: true);
    return this;
  }
  
  /// Order by icon_url in descending order
  ServiceCategoriesModelQueryBuilder orderByIconUrlDesc() {
    _queryBuilder = _queryBuilder.order('icon_url', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ServiceCategoriesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ServiceCategoriesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ServiceCategoriesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ServiceCategoriesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by base_price in ascending order
  ServiceCategoriesModelQueryBuilder orderByBasePriceAsc() {
    _queryBuilder = _queryBuilder.order('base_price', ascending: true);
    return this;
  }
  
  /// Order by base_price in descending order
  ServiceCategoriesModelQueryBuilder orderByBasePriceDesc() {
    _queryBuilder = _queryBuilder.order('base_price', ascending: false);
    return this;
  }

  /// Order by price_unit in ascending order
  ServiceCategoriesModelQueryBuilder orderByPriceUnitAsc() {
    _queryBuilder = _queryBuilder.order('price_unit', ascending: true);
    return this;
  }
  
  /// Order by price_unit in descending order
  ServiceCategoriesModelQueryBuilder orderByPriceUnitDesc() {
    _queryBuilder = _queryBuilder.order('price_unit', ascending: false);
    return this;
  }

  /// Order by estimated_duration in ascending order
  ServiceCategoriesModelQueryBuilder orderByEstimatedDurationAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration in descending order
  ServiceCategoriesModelQueryBuilder orderByEstimatedDurationDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ServiceCategoriesModel
  Future<List<ServiceCategoriesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ServiceCategoriesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ServiceCategoriesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ServiceCategoriesModel.fromJson(response.first as Map<String, dynamic>);
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
