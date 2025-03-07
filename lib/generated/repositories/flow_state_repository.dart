import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/flow_state_model.dart';
import 'base_repository.dart';

/// Repository for stores metadata for pkce logins
class FlowStateRepository extends BaseRepository {
  const FlowStateRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'flow_state';

  /// Find a record by its primary key
  Future<FlowStateModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return FlowStateModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<FlowStateModel>> findAll({
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
    return response.map((json) => FlowStateModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<FlowStateModel> insert(FlowStateModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return FlowStateModel.fromJson(response);
  }

  /// Update an existing record
  Future<FlowStateModel?> update(FlowStateModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return FlowStateModel.fromJson(response);
  }

  /// Insert or update a record
  Future<FlowStateModel> upsert(FlowStateModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return FlowStateModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
