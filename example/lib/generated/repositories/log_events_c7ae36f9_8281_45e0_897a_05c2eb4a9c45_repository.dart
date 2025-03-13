import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/log_events_c7ae36f9_8281_45e0_897a_05c2eb4a9c45_model.dart';
import 'base_repository.dart';

/// Repository for the log_events_c7ae36f9_8281_45e0_897a_05c2eb4a9c45 table
class LogEventsC7ae36f9828145e0897a05c2eb4a9c45Repository extends BaseRepository<LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model> {
  const LogEventsC7ae36f9828145e0897a05c2eb4a9c45Repository(SupabaseClient client) : super(client, 'log_events_c7ae36f9_8281_45e0_897a_05c2eb4a9c45');

  @override
  LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model fromJson(Map<String, dynamic> json) => LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model.fromJson(json);

  /// Find a record by its primary key
  Future<LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model>> findAll({
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
  Future<LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model> insert(LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model?> update(LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model> upsert(LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model model) async {
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
