import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/log_events_a4ea69fd_eff2_4bfd_8ba5_99fdfbca7499_model.dart';
import 'base_repository.dart';

/// Repository for the log_events_a4ea69fd_eff2_4bfd_8ba5_99fdfbca7499 table
class LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Repository extends BaseRepository<LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model> {
  const LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Repository(SupabaseClient client) : super(client, 'log_events_a4ea69fd_eff2_4bfd_8ba5_99fdfbca7499');

  @override
  LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model fromJson(Map<String, dynamic> json) => LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model.fromJson(json);

  /// Find a record by its primary key
  Future<LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model>> findAll({
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
  Future<LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model> insert(LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model?> update(LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model> upsert(LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model model) async {
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
