import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quote_line_items_model.dart';
import '../models/service_quotes_model.dart';
import 'base_repository.dart';

/// Repository for the quote_line_items table
class QuoteLineItemsRepository extends BaseRepository {
  const QuoteLineItemsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'quote_line_items';

  /// Find a record by its primary key
  Future<QuoteLineItemsModel?> find(String lineItemId) async {
    final response = await query
        .select()
        .eq('line_item_id', lineItemId)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return QuoteLineItemsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<QuoteLineItemsModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (limit != null) {
      query = query.limit(limit) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1) as PostgrestFilterBuilder<PostgrestList>;
    }

    final response = await query;
    return response.map((json) => QuoteLineItemsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<QuoteLineItemsModel> insert(QuoteLineItemsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return QuoteLineItemsModel.fromJson(response);
  }

  /// Update an existing record
  Future<QuoteLineItemsModel?> update(QuoteLineItemsModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('line_item_id', model.lineItemId)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return QuoteLineItemsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<QuoteLineItemsModel> upsert(QuoteLineItemsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return QuoteLineItemsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String lineItemId) async {
    final deleteQuery = query.delete()
        .eq('line_item_id', lineItemId)
    ;
    await deleteQuery;
  }

  /// Find related service_quotes records
  /// based on the quote_id foreign key
  Future<List<ServiceQuotesModel>> findByQuoteId(String quoteId) async {
    final response = await client
        .from('service_quotes')
        .select()
        .eq('quote_id', quoteId as Object);

    return response.map((json) => ServiceQuotesModel.fromJson(json)).toList();
  }

}
