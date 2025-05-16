import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quote_line_items_model.dart';

/// A type-safe query builder for QuoteLineItemsModel
class QuoteLineItemsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  QuoteLineItemsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('quote_line_items').select();
  }
  
  /// Set the fields to select
  QuoteLineItemsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('quote_line_items').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  QuoteLineItemsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  QuoteLineItemsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by line_item_id
  QuoteLineItemsModelQueryBuilder whereLineItemId(String value) {
    _queryBuilder = _queryBuilder.eq('line_item_id', value);
    return this;
  }
  
  /// Filter by line_item_id with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereLineItemIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('line_item_id', values);
    return this;
  }
  
  

  /// Filter by quote_id
  QuoteLineItemsModelQueryBuilder whereQuoteId(String value) {
    _queryBuilder = _queryBuilder.eq('quote_id', value);
    return this;
  }
  
  /// Filter by quote_id with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereQuoteIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quote_id', values);
    return this;
  }
  
  

  /// Filter by description
  QuoteLineItemsModelQueryBuilder whereDescription(String value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by quantity
  QuoteLineItemsModelQueryBuilder whereQuantity(double? value) {
    _queryBuilder = _queryBuilder.eq('quantity', value);
    return this;
  }
  
  /// Filter by quantity with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereQuantityIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('quantity', values);
    return this;
  }
  
    /// Filter quantity greater than
  QuoteLineItemsModelQueryBuilder whereQuantityGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('quantity', value);
    return this;
  }
  
  /// Filter quantity greater than or equal
  QuoteLineItemsModelQueryBuilder whereQuantityGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('quantity', value);
    return this;
  }
  
  /// Filter quantity less than
  QuoteLineItemsModelQueryBuilder whereQuantityLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('quantity', value);
    return this;
  }
  
  /// Filter quantity less than or equal
  QuoteLineItemsModelQueryBuilder whereQuantityLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('quantity', value);
    return this;
  }
  
  /// Filter quantity between two values
  QuoteLineItemsModelQueryBuilder whereQuantityBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('quantity', min).lte('quantity', max);
    return this;
  }

  /// Filter by unit_price
  QuoteLineItemsModelQueryBuilder whereUnitPrice(double value) {
    _queryBuilder = _queryBuilder.eq('unit_price', value);
    return this;
  }
  
  /// Filter by unit_price with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereUnitPriceIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('unit_price', values);
    return this;
  }
  
    /// Filter unit_price greater than
  QuoteLineItemsModelQueryBuilder whereUnitPriceGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('unit_price', value);
    return this;
  }
  
  /// Filter unit_price greater than or equal
  QuoteLineItemsModelQueryBuilder whereUnitPriceGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('unit_price', value);
    return this;
  }
  
  /// Filter unit_price less than
  QuoteLineItemsModelQueryBuilder whereUnitPriceLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('unit_price', value);
    return this;
  }
  
  /// Filter unit_price less than or equal
  QuoteLineItemsModelQueryBuilder whereUnitPriceLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('unit_price', value);
    return this;
  }
  
  /// Filter unit_price between two values
  QuoteLineItemsModelQueryBuilder whereUnitPriceBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('unit_price', min).lte('unit_price', max);
    return this;
  }

  /// Filter by amount
  QuoteLineItemsModelQueryBuilder whereAmount(double value) {
    _queryBuilder = _queryBuilder.eq('amount', value);
    return this;
  }
  
  /// Filter by amount with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereAmountIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('amount', values);
    return this;
  }
  
    /// Filter amount greater than
  QuoteLineItemsModelQueryBuilder whereAmountGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('amount', value);
    return this;
  }
  
  /// Filter amount greater than or equal
  QuoteLineItemsModelQueryBuilder whereAmountGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('amount', value);
    return this;
  }
  
  /// Filter amount less than
  QuoteLineItemsModelQueryBuilder whereAmountLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('amount', value);
    return this;
  }
  
  /// Filter amount less than or equal
  QuoteLineItemsModelQueryBuilder whereAmountLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('amount', value);
    return this;
  }
  
  /// Filter amount between two values
  QuoteLineItemsModelQueryBuilder whereAmountBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('amount', min).lte('amount', max);
    return this;
  }

  /// Filter by created_at
  QuoteLineItemsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  QuoteLineItemsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  QuoteLineItemsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  QuoteLineItemsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  QuoteLineItemsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  QuoteLineItemsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  QuoteLineItemsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  QuoteLineItemsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  QuoteLineItemsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  QuoteLineItemsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  QuoteLineItemsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  QuoteLineItemsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by item_type
  QuoteLineItemsModelQueryBuilder whereItemType(String value) {
    _queryBuilder = _queryBuilder.eq('item_type', value);
    return this;
  }
  
  /// Filter by item_type with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereItemTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('item_type', values);
    return this;
  }
  
  

  /// Filter by category
  QuoteLineItemsModelQueryBuilder whereCategory(String? value) {
    _queryBuilder = _queryBuilder.eq('category', value);
    return this;
  }
  
  /// Filter by category with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereCategoryIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('category', values);
    return this;
  }
  
  

  /// Filter by notes
  QuoteLineItemsModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by unit_type
  QuoteLineItemsModelQueryBuilder whereUnitType(String? value) {
    _queryBuilder = _queryBuilder.eq('unit_type', value);
    return this;
  }
  
  /// Filter by unit_type with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereUnitTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('unit_type', values);
    return this;
  }
  
  

  /// Filter by reference_id
  QuoteLineItemsModelQueryBuilder whereReferenceId(String? value) {
    _queryBuilder = _queryBuilder.eq('reference_id', value);
    return this;
  }
  
  /// Filter by reference_id with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereReferenceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('reference_id', values);
    return this;
  }
  
  

  /// Filter by display_order
  QuoteLineItemsModelQueryBuilder whereDisplayOrder(int? value) {
    _queryBuilder = _queryBuilder.eq('display_order', value);
    return this;
  }
  
  /// Filter by display_order with multiple values (IN operator)
  QuoteLineItemsModelQueryBuilder whereDisplayOrderIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('display_order', values);
    return this;
  }
  
    /// Filter display_order greater than
  QuoteLineItemsModelQueryBuilder whereDisplayOrderGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('display_order', value);
    return this;
  }
  
  /// Filter display_order greater than or equal
  QuoteLineItemsModelQueryBuilder whereDisplayOrderGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('display_order', value);
    return this;
  }
  
  /// Filter display_order less than
  QuoteLineItemsModelQueryBuilder whereDisplayOrderLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('display_order', value);
    return this;
  }
  
  /// Filter display_order less than or equal
  QuoteLineItemsModelQueryBuilder whereDisplayOrderLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('display_order', value);
    return this;
  }
  
  /// Filter display_order between two values
  QuoteLineItemsModelQueryBuilder whereDisplayOrderBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('display_order', min).lte('display_order', max);
    return this;
  }
  
  /// Order by line_item_id in ascending order
  QuoteLineItemsModelQueryBuilder orderByLineItemIdAsc() {
    _queryBuilder = _queryBuilder.order('line_item_id', ascending: true);
    return this;
  }
  
  /// Order by line_item_id in descending order
  QuoteLineItemsModelQueryBuilder orderByLineItemIdDesc() {
    _queryBuilder = _queryBuilder.order('line_item_id', ascending: false);
    return this;
  }

  /// Order by quote_id in ascending order
  QuoteLineItemsModelQueryBuilder orderByQuoteIdAsc() {
    _queryBuilder = _queryBuilder.order('quote_id', ascending: true);
    return this;
  }
  
  /// Order by quote_id in descending order
  QuoteLineItemsModelQueryBuilder orderByQuoteIdDesc() {
    _queryBuilder = _queryBuilder.order('quote_id', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  QuoteLineItemsModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  QuoteLineItemsModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by quantity in ascending order
  QuoteLineItemsModelQueryBuilder orderByQuantityAsc() {
    _queryBuilder = _queryBuilder.order('quantity', ascending: true);
    return this;
  }
  
  /// Order by quantity in descending order
  QuoteLineItemsModelQueryBuilder orderByQuantityDesc() {
    _queryBuilder = _queryBuilder.order('quantity', ascending: false);
    return this;
  }

  /// Order by unit_price in ascending order
  QuoteLineItemsModelQueryBuilder orderByUnitPriceAsc() {
    _queryBuilder = _queryBuilder.order('unit_price', ascending: true);
    return this;
  }
  
  /// Order by unit_price in descending order
  QuoteLineItemsModelQueryBuilder orderByUnitPriceDesc() {
    _queryBuilder = _queryBuilder.order('unit_price', ascending: false);
    return this;
  }

  /// Order by amount in ascending order
  QuoteLineItemsModelQueryBuilder orderByAmountAsc() {
    _queryBuilder = _queryBuilder.order('amount', ascending: true);
    return this;
  }
  
  /// Order by amount in descending order
  QuoteLineItemsModelQueryBuilder orderByAmountDesc() {
    _queryBuilder = _queryBuilder.order('amount', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  QuoteLineItemsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  QuoteLineItemsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  QuoteLineItemsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  QuoteLineItemsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by item_type in ascending order
  QuoteLineItemsModelQueryBuilder orderByItemTypeAsc() {
    _queryBuilder = _queryBuilder.order('item_type', ascending: true);
    return this;
  }
  
  /// Order by item_type in descending order
  QuoteLineItemsModelQueryBuilder orderByItemTypeDesc() {
    _queryBuilder = _queryBuilder.order('item_type', ascending: false);
    return this;
  }

  /// Order by category in ascending order
  QuoteLineItemsModelQueryBuilder orderByCategoryAsc() {
    _queryBuilder = _queryBuilder.order('category', ascending: true);
    return this;
  }
  
  /// Order by category in descending order
  QuoteLineItemsModelQueryBuilder orderByCategoryDesc() {
    _queryBuilder = _queryBuilder.order('category', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  QuoteLineItemsModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  QuoteLineItemsModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by unit_type in ascending order
  QuoteLineItemsModelQueryBuilder orderByUnitTypeAsc() {
    _queryBuilder = _queryBuilder.order('unit_type', ascending: true);
    return this;
  }
  
  /// Order by unit_type in descending order
  QuoteLineItemsModelQueryBuilder orderByUnitTypeDesc() {
    _queryBuilder = _queryBuilder.order('unit_type', ascending: false);
    return this;
  }

  /// Order by reference_id in ascending order
  QuoteLineItemsModelQueryBuilder orderByReferenceIdAsc() {
    _queryBuilder = _queryBuilder.order('reference_id', ascending: true);
    return this;
  }
  
  /// Order by reference_id in descending order
  QuoteLineItemsModelQueryBuilder orderByReferenceIdDesc() {
    _queryBuilder = _queryBuilder.order('reference_id', ascending: false);
    return this;
  }

  /// Order by display_order in ascending order
  QuoteLineItemsModelQueryBuilder orderByDisplayOrderAsc() {
    _queryBuilder = _queryBuilder.order('display_order', ascending: true);
    return this;
  }
  
  /// Order by display_order in descending order
  QuoteLineItemsModelQueryBuilder orderByDisplayOrderDesc() {
    _queryBuilder = _queryBuilder.order('display_order', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of QuoteLineItemsModel
  Future<List<QuoteLineItemsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => QuoteLineItemsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<QuoteLineItemsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return QuoteLineItemsModel.fromJson(response.first as Map<String, dynamic>);
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
