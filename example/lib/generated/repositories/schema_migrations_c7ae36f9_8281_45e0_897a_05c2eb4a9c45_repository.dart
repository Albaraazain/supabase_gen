import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_c7ae36f9_8281_45e0_897a_05c2eb4a9c45_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_c7ae36f9_8281_45e0_897a_05c2eb4a9c45 table
class SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Repository extends BaseRepository<SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model> {
  const SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Repository(SupabaseClient client) : super(client, 'schema_migrations_c7ae36f9_8281_45e0_897a_05c2eb4a9c45');

  @override
  SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model fromJson(Map<String, dynamic> json) => SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model>> findAll({
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
  Future<SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model> insert(SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model?> update(SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model> upsert(SchemaMigrationsC7ae36f9828145e0897a05c2eb4a9c45Model model) async {
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
