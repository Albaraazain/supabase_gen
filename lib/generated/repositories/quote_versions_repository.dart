import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quote_versions_model.dart';
import '../models/quotes_model.dart';
import 'base_repository.dart';

/// Repository for the quote_versions table
class QuoteVersionsRepository extends BaseRepository<QuoteVersionsModel> {
  const QuoteVersionsRepository(SupabaseClient client) : super(client, 'quote_versions');

  @override
  QuoteVersionsModel fromJson(Map<String, dynamic> json) => QuoteVersionsModel.fromJson(json);

  @override
  Future<List<QuoteVersionsModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
  }) async {
    return super.findAll(
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      ascending: ascending,
      filters: filters,
    );
  }

  /// Find a record by its primary key
  Future<QuoteVersionsModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<QuoteVersionsModel> insert(QuoteVersionsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<QuoteVersionsModel?> update(QuoteVersionsModel model) async {
    if (model.id == null) {
      throw ArgumentError("Primary key id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<QuoteVersionsModel> upsert(QuoteVersionsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

  /// Find related quotes records
  /// based on the quote_id foreign key
  Future<List<QuotesModel>> findByQuoteId(String quoteId) async {
    final queryBuilder = client
        .from('quotes')
        .select()
        .eq('id', quoteId);

    final response = await queryBuilder;
    return (response as List).map((json) => QuotesModel.fromJson(json)).toList();
  }

  /// Find quote_versions records by quote_id
  /// with support for pagination, sorting, and additional filters
  Future<List<QuoteVersionsModel>> findByQuoteIdField(
    String quoteId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    var filters = <String, dynamic>{
      'quote_id': quoteId,
    };

    if (additionalFilters != null) {
      filters.addAll(additionalFilters);
    }

    return findAll(
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      ascending: ascending,
      filters: filters,
    );
  }

}
