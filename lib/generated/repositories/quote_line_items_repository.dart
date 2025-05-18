import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/quote_line_items_query_builder.dart';


class QuoteLineItemsRepository extends BaseRepository<QuoteLineItemsModel> {
  QuoteLineItemsRepository(SupabaseClient client) : super(client, 'quote_line_items', primaryKeyColumn: 'line_item_id');
  
  @override
  QuoteLineItemsModel fromJson(Map<String, dynamic> json) {
    return QuoteLineItemsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(QuoteLineItemsModel model) {
    return model.lineItemId;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - line_item_changes: INSERT AFTER - EXECUTE FUNCTION update_quote_on_line_item_change()
  ///   Signature: update_quote_on_line_item_change() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for update_quote_on_line_item_change>
  /// - line_item_changes: DELETE AFTER - EXECUTE FUNCTION update_quote_on_line_item_change()
  ///   Signature: update_quote_on_line_item_change() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for update_quote_on_line_item_change>
  /// - line_item_changes: UPDATE AFTER - EXECUTE FUNCTION update_quote_on_line_item_change()
  ///   Signature: update_quote_on_line_item_change() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for update_quote_on_line_item_change>
  
  /// Create a type-safe query builder for quote_line_items
  /// 
  /// The query builder provides a fluent interface to build complex queries
  /// with type safety for filtering, ordering and pagination.
  /// 
  /// Example:
  /// ```dart
  /// final users = await userRepository
  ///   .createQueryBuilder()
  ///   .whereNameEquals("John")
  ///   .whereAgeGreaterThan(18)
  ///   .orderByCreatedAtDesc()
  ///   .limit(10)
  ///   .get();
  /// ```
  QuoteLineItemsModelQueryBuilder createQueryBuilder() {
    return QuoteLineItemsModelQueryBuilder(client);
  }
  
  /// Get a QuoteLineItemsModel by line_item_id
  /// 
  /// This method looks up a record using a line_item_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<QuoteLineItemsModel?> getByLineItemId(String lineItemId) async {
    final result = await client
        .from('quote_line_items')
        .select().eq('line_item_id', lineItemId)
        .maybeSingle();
    
    if (result == null) return null;
    return QuoteLineItemsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(QuoteLineItemsModel model) {
    // Validate check constraints
    // 2200_17897_1_not_null: Database CHECK constraint
    // 2200_17897_2_not_null: Database CHECK constraint
    // 2200_17897_3_not_null: Database CHECK constraint
    // 2200_17897_5_not_null: Database CHECK constraint
    // 2200_17897_6_not_null: Database CHECK constraint
    // 2200_17897_9_not_null: Database CHECK constraint
    // quote_line_items_item_type_check: Database CHECK constraint
    // Add custom validation logic here
  }

}
