import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/hooks_model.dart';
import 'base_repository.dart';

/// Repository for Supabase Functions Hooks: Audit trail for triggered hooks.
class HooksRepository extends BaseRepository {
  const HooksRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'hooks';

  /// Find a record by its primary key
  Future<HooksModel?> find(int id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return HooksModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<HooksModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await query;
    return response.map((json) => HooksModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<HooksModel> insert(HooksModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return HooksModel.fromJson(response);
  }

  /// Update an existing record
  Future<HooksModel?> update(HooksModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return HooksModel.fromJson(response);
  }

  /// Insert or update a record
  Future<HooksModel> upsert(HooksModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return HooksModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
