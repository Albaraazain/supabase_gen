import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/diagnosis_findings_model.dart';
import 'base_repository.dart';

/// Repository for the diagnosis_findings table
class DiagnosisFindingsRepository extends BaseRepository {
  const DiagnosisFindingsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'diagnosis_findings';

  /// Find a record by its primary key
  Future<DiagnosisFindingsModel?> find(String findingId) async {
    final response = await query
        .eq('finding_id', findingId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return DiagnosisFindingsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<DiagnosisFindingsModel>> findAll({
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
    return response.map((json) => DiagnosisFindingsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<DiagnosisFindingsModel> insert(DiagnosisFindingsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return DiagnosisFindingsModel.fromJson(response);
  }

  /// Update an existing record
  Future<DiagnosisFindingsModel?> update(DiagnosisFindingsModel model) async {
    final response = await query
        .eq('finding_id', model.findingId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return DiagnosisFindingsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<DiagnosisFindingsModel> upsert(DiagnosisFindingsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return DiagnosisFindingsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String findingId) async {
    await query
        .eq('finding_id', findingId)
        .delete();
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

}
