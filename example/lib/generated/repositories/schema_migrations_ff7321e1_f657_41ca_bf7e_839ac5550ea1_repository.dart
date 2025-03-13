import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/schema_migrations_ff7321e1_f657_41ca_bf7e_839ac5550ea1_model.dart';
import 'base_repository.dart';

/// Repository for the schema_migrations_ff7321e1_f657_41ca_bf7e_839ac5550ea1 table
class SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Repository extends BaseRepository<SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model> {
  const SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Repository(SupabaseClient client) : super(client, 'schema_migrations_ff7321e1_f657_41ca_bf7e_839ac5550ea1');

  @override
  SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model fromJson(Map<String, dynamic> json) => SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model.fromJson(json);

  /// Find a record by its primary key
  Future<SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model?> find(int version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model>> findAll({
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
  Future<SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model> insert(SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model?> update(SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model> upsert(SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model model) async {
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
