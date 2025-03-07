import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Manages updates to the auth system.
class SchemaMigrationsRepository extends BaseRepository {
  const SchemaMigrationsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'schema_migrations';

  /// Find a record by its primary key
  Future<SchemaMigrationsModel?> find(int version, int version, int version) async {
    final response = await query
        .eq('version', version)
        .eq('version', version)
        .eq('version', version)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SchemaMigrationsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SchemaMigrationsModel>> findAll({
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
    return response.map((json) => SchemaMigrationsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SchemaMigrationsModel> insert(SchemaMigrationsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SchemaMigrationsModel.fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsModel?> update(SchemaMigrationsModel model) async {
    final response = await query
        .eq('version', model.version)
        .eq('version', model.version)
        .eq('version', model.version)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SchemaMigrationsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsModel> upsert(SchemaMigrationsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SchemaMigrationsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int version, int version, int version) async {
    await query
        .eq('version', version)
        .eq('version', version)
        .eq('version', version)
        .delete();
  }

}
