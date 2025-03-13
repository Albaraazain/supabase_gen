import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/log_events_aea4b3e7_58bc_40db_9055_1a6d8c9ad761_model.dart';
import 'base_repository.dart';

/// Repository for the log_events_aea4b3e7_58bc_40db_9055_1a6d8c9ad761 table
class LogEventsAea4b3e758bc40db90551a6d8c9ad761Repository extends BaseRepository<LogEventsAea4b3e758bc40db90551a6d8c9ad761Model> {
  const LogEventsAea4b3e758bc40db90551a6d8c9ad761Repository(SupabaseClient client) : super(client, 'log_events_aea4b3e7_58bc_40db_9055_1a6d8c9ad761');

  @override
  LogEventsAea4b3e758bc40db90551a6d8c9ad761Model fromJson(Map<String, dynamic> json) => LogEventsAea4b3e758bc40db90551a6d8c9ad761Model.fromJson(json);

  /// Find a record by its primary key
  Future<LogEventsAea4b3e758bc40db90551a6d8c9ad761Model?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LogEventsAea4b3e758bc40db90551a6d8c9ad761Model>> findAll({
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
  Future<LogEventsAea4b3e758bc40db90551a6d8c9ad761Model> insert(LogEventsAea4b3e758bc40db90551a6d8c9ad761Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LogEventsAea4b3e758bc40db90551a6d8c9ad761Model?> update(LogEventsAea4b3e758bc40db90551a6d8c9ad761Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LogEventsAea4b3e758bc40db90551a6d8c9ad761Model> upsert(LogEventsAea4b3e758bc40db90551a6d8c9ad761Model model) async {
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
