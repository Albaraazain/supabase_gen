import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/migrations_model.dart';
import 'base_repository.dart';

/// Repository for the migrations table
class MigrationsRepository extends BaseRepository {
  const MigrationsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'migrations';

  /// Find a record by its primary key
  Future<MigrationsModel?> find(String version, String version) async {
    final response = await query
        .eq('version', version)
        .eq('version', version)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return MigrationsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<MigrationsModel>> findAll({
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
    return response.map((json) => MigrationsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<MigrationsModel> insert(MigrationsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return MigrationsModel.fromJson(response);
  }

  /// Update an existing record
  Future<MigrationsModel?> update(MigrationsModel model) async {
    final response = await query
        .eq('version', model.version)
        .eq('version', model.version)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return MigrationsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<MigrationsModel> upsert(MigrationsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return MigrationsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String version, String version) async {
    await query
        .eq('version', version)
        .eq('version', version)
        .delete();
  }

}
