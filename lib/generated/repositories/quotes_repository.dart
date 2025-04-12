import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/quotes_model.dart';
import '../models/bills_model.dart';
import 'base_repository.dart';

/// Repository for the quotes table
class QuotesRepository extends BaseRepository<QuotesModel> {
  const QuotesRepository(SupabaseClient client) : super(client, 'quotes');

  @override
  QuotesModel fromJson(Map<String, dynamic> json) => QuotesModel.fromJson(json);

  @override
  Future<List<QuotesModel>> findAll({
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
  Future<QuotesModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<QuotesModel> insert(QuotesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<QuotesModel?> update(QuotesModel model) async {
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
  Future<QuotesModel> upsert(QuotesModel model) async {
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

  /// Find related bills records
  /// based on the bill_id foreign key
  Future<List<BillsModel>> findByBillId(String billId) async {
    final queryBuilder = client
        .from('bills')
        .select()
        .eq('id', billId);

    final response = await queryBuilder;
    return (response as List).map((json) => BillsModel.fromJson(json)).toList();
  }

  /// Find quotes records by bill_id
  /// with support for pagination, sorting, and additional filters
  Future<List<QuotesModel>> findByBillIdField(
    String billId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    var filters = <String, dynamic>{
      'bill_id': billId,
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
