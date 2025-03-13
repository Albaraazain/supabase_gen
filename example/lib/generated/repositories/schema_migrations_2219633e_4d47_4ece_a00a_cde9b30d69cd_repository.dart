import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_2219633e_4d47_4ece_a00a_cde9b30d69cd_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_2219633e_4d47_4ece_a00a_cde9b30d69cd table
class SchemaMigrations2219633e4d474eceA00aCde9b30d69cdRepository extends BaseRepository<SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel> {
  const SchemaMigrations2219633e4d474eceA00aCde9b30d69cdRepository(SupabaseClient client) : super(client, 'schema_migrations_2219633e_4d47_4ece_a00a_cde9b30d69cd');

  @override
  SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel fromJson(Map<String, dynamic> json) => SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel>> findAll({
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
  Future<SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel> insert(SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel?> update(SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel> upsert(SchemaMigrations2219633e4d474eceA00aCde9b30d69cdModel model) async {
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
