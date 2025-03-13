import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_a4ea69fd_eff2_4bfd_8ba5_99fdfbca7499_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_a4ea69fd_eff2_4bfd_8ba5_99fdfbca7499 table
class SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Repository extends BaseRepository<SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model> {
  const SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Repository(SupabaseClient client) : super(client, 'schema_migrations_a4ea69fd_eff2_4bfd_8ba5_99fdfbca7499');

  @override
  SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model fromJson(Map<String, dynamic> json) => SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model>> findAll({
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
  Future<SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model> insert(SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model?> update(SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model> upsert(SchemaMigrationsA4ea69fdEff24bfd8ba599fdfbca7499Model model) async {
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
