import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_d7a90df3_91f4_41ea_9923_59436ce2fa27_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_d7a90df3_91f4_41ea_9923_59436ce2fa27 table
class SchemaMigrationsD7a90df391f441ea992359436ce2fa27Repository extends BaseRepository<SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model> {
  const SchemaMigrationsD7a90df391f441ea992359436ce2fa27Repository(SupabaseClient client) : super(client, 'schema_migrations_d7a90df3_91f4_41ea_9923_59436ce2fa27');

  @override
  SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model fromJson(Map<String, dynamic> json) => SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model>> findAll({
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
  Future<SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model> insert(SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model?> update(SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model> upsert(SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int version) async {
    final queryBuilder = query.delete()
        .eq('version', version)
        ;
    await queryBuilder;
  }

}
