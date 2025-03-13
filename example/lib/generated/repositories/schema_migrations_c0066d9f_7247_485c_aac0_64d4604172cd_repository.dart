import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_c0066d9f_7247_485c_aac0_64d4604172cd_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_c0066d9f_7247_485c_aac0_64d4604172cd table
class SchemaMigrationsC0066d9f7247485cAac064d4604172cdRepository extends BaseRepository<SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel> {
  const SchemaMigrationsC0066d9f7247485cAac064d4604172cdRepository(SupabaseClient client) : super(client, 'schema_migrations_c0066d9f_7247_485c_aac0_64d4604172cd');

  @override
  SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel fromJson(Map<String, dynamic> json) => SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel>> findAll({
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
  Future<SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel> insert(SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel?> update(SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel> upsert(SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel model) async {
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
