import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/error_logs_model.dart';
import 'base_repository.dart';

/// Repository for the error_logs table
class ErrorLogsRepository extends BaseRepository<ErrorLogsModel> {
  const ErrorLogsRepository(SupabaseClient client) : super(client, 'error_logs');

  @override
  ErrorLogsModel fromJson(Map<String, dynamic> json) => ErrorLogsModel.fromJson(json);

  /// Find a record by its primary key
  Future<ErrorLogsModel?> find(int id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ErrorLogsModel>> findAll({
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
  Future<ErrorLogsModel> insert(ErrorLogsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ErrorLogsModel?> update(ErrorLogsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ErrorLogsModel> upsert(ErrorLogsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

}
