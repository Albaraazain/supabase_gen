import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/migrations_model.dart';
import 'base_repository.dart';

/// Repository for the migrations table
class MigrationsRepository extends BaseRepository<MigrationsModel> {
  const MigrationsRepository(SupabaseClient client) : super(client, 'migrations');

  @override
  MigrationsModel fromJson(Map<String, dynamic> json) => MigrationsModel.fromJson(json);

  /// Find a record by its primary key
  Future<MigrationsModel?> find(String version) async {
    final response = await query.select()
        .eq('version', version)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<MigrationsModel>> findAll({
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
  Future<MigrationsModel> insert(MigrationsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<MigrationsModel?> update(MigrationsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('version', model.version)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<MigrationsModel> upsert(MigrationsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String version) async {
    final queryBuilder = query.delete()
        .eq('version', version)
        ;
    await queryBuilder;
  }

}
