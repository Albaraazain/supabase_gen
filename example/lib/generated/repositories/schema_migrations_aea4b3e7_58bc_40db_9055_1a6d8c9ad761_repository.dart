import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_aea4b3e7_58bc_40db_9055_1a6d8c9ad761_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_aea4b3e7_58bc_40db_9055_1a6d8c9ad761 table
class SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Repository extends BaseRepository<SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model> {
  const SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Repository(SupabaseClient client) : super(client, 'schema_migrations_aea4b3e7_58bc_40db_9055_1a6d8c9ad761');

  @override
  SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model fromJson(Map<String, dynamic> json) => SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model>> findAll({
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
  Future<SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model> insert(SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model?> update(SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model> upsert(SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model model) async {
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
