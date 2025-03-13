import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/pause_periods_model.dart';
import '../models/work_sessions_model.dart';
import 'base_repository.dart';

/// Repository for the pause_periods table
class PausePeriodsRepository extends BaseRepository<PausePeriodsModel> {
  const PausePeriodsRepository(SupabaseClient client) : super(client, 'pause_periods');

  @override
  PausePeriodsModel fromJson(Map<String, dynamic> json) => PausePeriodsModel.fromJson(json);

  /// Find a record by its primary key
  Future<PausePeriodsModel?> find(String pauseId) async {
    final response = await query.select()
        .eq('pause_id', pauseId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<PausePeriodsModel>> findAll({
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
  Future<PausePeriodsModel> insert(PausePeriodsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<PausePeriodsModel?> update(PausePeriodsModel model) async {
    if (model.pauseId == null) {
      throw ArgumentError("Primary key pause_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('pause_id', model.pauseId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<PausePeriodsModel> upsert(PausePeriodsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String pauseId) async {
    final queryBuilder = query.delete()
        .eq('pause_id', pauseId)
        ;
    await queryBuilder;
  }

  /// Find related work_sessions records
  /// based on the session_id foreign key
  Future<List<WorkSessionsModel>> findBySessionId(String sessionId) async {
    final queryBuilder = client
        .from('work_sessions')
        .select()
        .eq('session_id', sessionId);

    final response = await queryBuilder;
    return (response as List).map((json) => WorkSessionsModel.fromJson(json)).toList();
  }

}
