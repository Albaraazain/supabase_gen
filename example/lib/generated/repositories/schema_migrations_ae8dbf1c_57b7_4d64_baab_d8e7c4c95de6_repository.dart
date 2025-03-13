import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_ae8dbf1c_57b7_4d64_baab_d8e7c4c95de6_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_ae8dbf1c_57b7_4d64_baab_d8e7c4c95de6 table
class SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Repository extends BaseRepository<SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model> {
  const SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Repository(SupabaseClient client) : super(client, 'schema_migrations_ae8dbf1c_57b7_4d64_baab_d8e7c4c95de6');

  @override
  SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model fromJson(Map<String, dynamic> json) => SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model>> findAll({
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
  Future<SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model> insert(SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model?> update(SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model> upsert(SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model model) async {
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
