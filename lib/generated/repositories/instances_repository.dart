import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/instances_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Manages users across multiple sites.
class InstancesRepository extends BaseRepository {
  const InstancesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'instances';

  /// Find a record by its primary key
  Future<InstancesModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return InstancesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<InstancesModel>> findAll({
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
    return response.map((json) => InstancesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<InstancesModel> insert(InstancesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return InstancesModel.fromJson(response);
  }

  /// Update an existing record
  Future<InstancesModel?> update(InstancesModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return InstancesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<InstancesModel> upsert(InstancesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return InstancesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
