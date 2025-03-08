import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/diagnosis_findings_model.dart';
import '../models/jobs_model.dart';
import 'base_repository.dart';

/// Repository for the diagnosis_findings table
class DiagnosisFindingsRepository extends BaseRepository<DiagnosisFindingsModel> {
  const DiagnosisFindingsRepository(SupabaseClient client) : super(client, 'diagnosis_findings');

  @override
  DiagnosisFindingsModel fromJson(Map<String, dynamic> json) => DiagnosisFindingsModel.fromJson(json);

  /// Find a record by its primary key
  Future<DiagnosisFindingsModel?> find(String findingId) async {
    final response = await query.select()
        .eq('finding_id', findingId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<DiagnosisFindingsModel>> findAll({
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
  Future<DiagnosisFindingsModel> insert(DiagnosisFindingsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<DiagnosisFindingsModel?> update(DiagnosisFindingsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('finding_id', model.findingId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<DiagnosisFindingsModel> upsert(DiagnosisFindingsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String findingId) async {
    final queryBuilder = query.delete()
        .eq('finding_id', findingId)
        ;
    await queryBuilder;
  }

  /// Find related jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String jobId) async {
    final queryBuilder = client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    final response = await queryBuilder;
    return (response as List).map((json) => JobsModel.fromJson(json)).toList();
  }

}
