import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/error_logs_model.dart';
import 'base_repository.dart';

/// Repository for the error_logs table
class ErrorLogsRepository extends BaseRepository {
  const ErrorLogsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'error_logs';

  /// Find a record by its primary key
  Future<ErrorLogsModel?> find(int id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ErrorLogsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ErrorLogsModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await query;
    return response.map((json) => ErrorLogsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ErrorLogsModel> insert(ErrorLogsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ErrorLogsModel.fromJson(response);
  }

  /// Update an existing record
  Future<ErrorLogsModel?> update(ErrorLogsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ErrorLogsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ErrorLogsModel> upsert(ErrorLogsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ErrorLogsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
