import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/log_events_d7a90df3_91f4_41ea_9923_59436ce2fa27_model.dart';
import 'base_repository.dart';

/// Repository for the log_events_d7a90df3_91f4_41ea_9923_59436ce2fa27 table
class LogEventsD7a90df391f441ea992359436ce2fa27Repository extends BaseRepository<LogEventsD7a90df391f441ea992359436ce2fa27Model> {
  const LogEventsD7a90df391f441ea992359436ce2fa27Repository(SupabaseClient client) : super(client, 'log_events_d7a90df3_91f4_41ea_9923_59436ce2fa27');

  @override
  LogEventsD7a90df391f441ea992359436ce2fa27Model fromJson(Map<String, dynamic> json) => LogEventsD7a90df391f441ea992359436ce2fa27Model.fromJson(json);

  /// Find a record by its primary key
  Future<LogEventsD7a90df391f441ea992359436ce2fa27Model?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LogEventsD7a90df391f441ea992359436ce2fa27Model>> findAll({
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
  Future<LogEventsD7a90df391f441ea992359436ce2fa27Model> insert(LogEventsD7a90df391f441ea992359436ce2fa27Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LogEventsD7a90df391f441ea992359436ce2fa27Model?> update(LogEventsD7a90df391f441ea992359436ce2fa27Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LogEventsD7a90df391f441ea992359436ce2fa27Model> upsert(LogEventsD7a90df391f441ea992359436ce2fa27Model model) async {
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
