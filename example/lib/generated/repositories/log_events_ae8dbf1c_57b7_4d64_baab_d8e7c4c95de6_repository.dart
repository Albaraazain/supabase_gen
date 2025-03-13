import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/log_events_ae8dbf1c_57b7_4d64_baab_d8e7c4c95de6_model.dart';
import 'base_repository.dart';

/// Repository for the log_events_ae8dbf1c_57b7_4d64_baab_d8e7c4c95de6 table
class LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Repository extends BaseRepository<LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model> {
  const LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Repository(SupabaseClient client) : super(client, 'log_events_ae8dbf1c_57b7_4d64_baab_d8e7c4c95de6');

  @override
  LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model fromJson(Map<String, dynamic> json) => LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model.fromJson(json);

  /// Find a record by its primary key
  Future<LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model>> findAll({
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
  Future<LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model> insert(LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model?> update(LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model> upsert(LogEventsAe8dbf1c57b74d64BaabD8e7c4c95de6Model model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

}
