import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_categories_model.dart';

/// A type-safe query builder for ProfessionalCategoriesModel
class ProfessionalCategoriesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfessionalCategoriesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('professional_categories').select();
  }
  
  /// Set the fields to select
  ProfessionalCategoriesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('professional_categories').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfessionalCategoriesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfessionalCategoriesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  ProfessionalCategoriesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ProfessionalCategoriesModelQueryBuilder whereProfessionalId(String? value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by category_id
  ProfessionalCategoriesModelQueryBuilder whereCategoryId(String? value) {
    _queryBuilder = _queryBuilder.eq('category_id', value);
    return this;
  }
  
  /// Filter by category_id with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereCategoryIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('category_id', values);
    return this;
  }
  
  

  /// Filter by price_adjustment
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustment(double? value) {
    _queryBuilder = _queryBuilder.eq('price_adjustment', value);
    return this;
  }
  
  /// Filter by price_adjustment with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustmentIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_adjustment', values);
    return this;
  }
  
    /// Filter price_adjustment greater than
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustmentGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment greater than or equal
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustmentGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment less than
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustmentLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment less than or equal
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustmentLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price_adjustment', value);
    return this;
  }
  
  /// Filter price_adjustment between two values
  ProfessionalCategoriesModelQueryBuilder wherePriceAdjustmentBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price_adjustment', min).lte('price_adjustment', max);
    return this;
  }

  /// Filter by price_rate
  ProfessionalCategoriesModelQueryBuilder wherePriceRate(double? value) {
    _queryBuilder = _queryBuilder.eq('price_rate', value);
    return this;
  }
  
  /// Filter by price_rate with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder wherePriceRateIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_rate', values);
    return this;
  }
  
    /// Filter price_rate greater than
  ProfessionalCategoriesModelQueryBuilder wherePriceRateGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price_rate', value);
    return this;
  }
  
  /// Filter price_rate greater than or equal
  ProfessionalCategoriesModelQueryBuilder wherePriceRateGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price_rate', value);
    return this;
  }
  
  /// Filter price_rate less than
  ProfessionalCategoriesModelQueryBuilder wherePriceRateLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price_rate', value);
    return this;
  }
  
  /// Filter price_rate less than or equal
  ProfessionalCategoriesModelQueryBuilder wherePriceRateLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price_rate', value);
    return this;
  }
  
  /// Filter price_rate between two values
  ProfessionalCategoriesModelQueryBuilder wherePriceRateBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price_rate', min).lte('price_rate', max);
    return this;
  }

  /// Filter by is_active
  ProfessionalCategoriesModelQueryBuilder whereIsActive(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_active', value);
    return this;
  }
  
  /// Filter by is_active with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereIsActiveIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_active', values);
    return this;
  }
  
  

  /// Filter by is_available
  ProfessionalCategoriesModelQueryBuilder whereIsAvailable(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_available', value);
    return this;
  }
  
  /// Filter by is_available with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereIsAvailableIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_available', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfessionalCategoriesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfessionalCategoriesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfessionalCategoriesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfessionalCategoriesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfessionalCategoriesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfessionalCategoriesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfessionalCategoriesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  ProfessionalCategoriesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ProfessionalCategoriesModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by category_id in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByCategoryIdAsc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: true);
    return this;
  }
  
  /// Order by category_id in descending order
  ProfessionalCategoriesModelQueryBuilder orderByCategoryIdDesc() {
    _queryBuilder = _queryBuilder.order('category_id', ascending: false);
    return this;
  }

  /// Order by price_adjustment in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByPriceAdjustmentAsc() {
    _queryBuilder = _queryBuilder.order('price_adjustment', ascending: true);
    return this;
  }
  
  /// Order by price_adjustment in descending order
  ProfessionalCategoriesModelQueryBuilder orderByPriceAdjustmentDesc() {
    _queryBuilder = _queryBuilder.order('price_adjustment', ascending: false);
    return this;
  }

  /// Order by price_rate in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByPriceRateAsc() {
    _queryBuilder = _queryBuilder.order('price_rate', ascending: true);
    return this;
  }
  
  /// Order by price_rate in descending order
  ProfessionalCategoriesModelQueryBuilder orderByPriceRateDesc() {
    _queryBuilder = _queryBuilder.order('price_rate', ascending: false);
    return this;
  }

  /// Order by is_active in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByIsActiveAsc() {
    _queryBuilder = _queryBuilder.order('is_active', ascending: true);
    return this;
  }
  
  /// Order by is_active in descending order
  ProfessionalCategoriesModelQueryBuilder orderByIsActiveDesc() {
    _queryBuilder = _queryBuilder.order('is_active', ascending: false);
    return this;
  }

  /// Order by is_available in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByIsAvailableAsc() {
    _queryBuilder = _queryBuilder.order('is_available', ascending: true);
    return this;
  }
  
  /// Order by is_available in descending order
  ProfessionalCategoriesModelQueryBuilder orderByIsAvailableDesc() {
    _queryBuilder = _queryBuilder.order('is_available', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfessionalCategoriesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfessionalCategoriesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfessionalCategoriesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfessionalCategoriesModel
  Future<List<ProfessionalCategoriesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfessionalCategoriesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfessionalCategoriesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfessionalCategoriesModel.fromJson(response.first as Map<String, dynamic>);
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
