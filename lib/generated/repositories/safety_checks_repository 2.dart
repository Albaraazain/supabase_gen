import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/safety_checks_model.dart';
import 'base_repository.dart';

/// Repository for the safety_checks table
class SafetyChecksRepository extends BaseRepository {
  const SafetyChecksRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'safety_checks';

  /// Find a record by its primary key
  Future<SafetyChecksModel?> find(String checkId) async {
    final response = await query
        .eq('check_id', checkId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SafetyChecksModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SafetyChecksModel>> findAll({
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
    return response.map((json) => SafetyChecksModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SafetyChecksModel> insert(SafetyChecksModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SafetyChecksModel.fromJson(response);
  }

  /// Update an existing record
  Future<SafetyChecksModel?> update(SafetyChecksModel model) async {
    final response = await query
        .eq('check_id', model.checkId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SafetyChecksModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SafetyChecksModel> upsert(SafetyChecksModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SafetyChecksModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String checkId) async {
    await query
        .eq('check_id', checkId)
        .delete();
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

}
