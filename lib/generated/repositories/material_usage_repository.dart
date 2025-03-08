import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/material_usage_model.dart';
import '../models/jobs_model.dart';
import '../models/quote_line_items_model.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the material_usage table
class MaterialUsageRepository extends BaseRepository {
  const MaterialUsageRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'material_usage';

  /// Find a record by its primary key
  Future<MaterialUsageModel?> find(String usageId) async {
    final response = await query
        .select()
        .eq('usage_id', usageId)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return MaterialUsageModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<MaterialUsageModel>> findAll({
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
    return response.map((json) => MaterialUsageModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<MaterialUsageModel> insert(MaterialUsageModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return MaterialUsageModel.fromJson(response);
  }

  /// Update an existing record
  Future<MaterialUsageModel?> update(MaterialUsageModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('usage_id', model.usageId)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return MaterialUsageModel.fromJson(response);
  }

  /// Insert or update a record
  Future<MaterialUsageModel> upsert(MaterialUsageModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return MaterialUsageModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String usageId) async {
    final deleteQuery = query.delete()
        .eq('usage_id', usageId)
    ;
    await deleteQuery;
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId as Object);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Find related public.quote_line_items records
  /// based on the quote_line_item_id foreign key
  Future<List<QuoteLineItemsModel>> findByQuoteLineItemId(String? quoteLineItemId) async {
    final response = await client
        .from('quote_line_items')
        .select()
        .eq('line_item_id', quoteLineItemId as Object);

    return response.map((json) => QuoteLineItemsModel.fromJson(json)).toList();
  }

  /// Find related public.users records
  /// based on the updated_by foreign key
  Future<List<UsersModel>> findByUpdatedBy(String? updatedBy) async {
    final response = await client
        .from('users')
        .select()
        .eq('user_id', updatedBy as Object);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

}
