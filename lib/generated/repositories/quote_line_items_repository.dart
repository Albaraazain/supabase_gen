import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quote_line_items_model.dart';
import '../models/service_quotes_model.dart';
import 'base_repository.dart';

/// Repository for the quote_line_items table
class QuoteLineItemsRepository extends BaseRepository<QuoteLineItemsModel> {
  const QuoteLineItemsRepository(SupabaseClient client) : super(client, 'quote_line_items');

  @override
  QuoteLineItemsModel fromJson(Map<String, dynamic> json) => QuoteLineItemsModel.fromJson(json);

  /// Find a record by its primary key
  Future<QuoteLineItemsModel?> find(String lineItemId) async {
    final response = await query.select()
        .eq('line_item_id', lineItemId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<QuoteLineItemsModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    dynamic queryBuilder = query.select();

    if (orderBy != null) {
      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      queryBuilder = queryBuilder.limit(limit);
    }

    if (offset != null) {
      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await queryBuilder;
    return (response as List).map((json) => fromJson(json)).toList();
  }

  /// Insert a new record
  Future<QuoteLineItemsModel> insert(QuoteLineItemsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<QuoteLineItemsModel?> update(QuoteLineItemsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('line_item_id', model.lineItemId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<QuoteLineItemsModel> upsert(QuoteLineItemsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String lineItemId) async {
    final queryBuilder = query.delete()
        .eq('line_item_id', lineItemId)
        ;
    await queryBuilder;
  }

  /// Find related service_quotes records
  /// based on the quote_id foreign key
  Future<List<ServiceQuotesModel>> findByQuoteId(String quoteId) async {
    final queryBuilder = client
        .from('service_quotes')
        .select()
        .eq('quote_id', quoteId);

    final response = await queryBuilder;
    return (response as List).map((json) => ServiceQuotesModel.fromJson(json)).toList();
  }

}
