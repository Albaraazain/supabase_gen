import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/work_sessions_model.dart';
import '../models/jobs_model.dart';
import '../models/professional_profiles_model.dart';
import 'base_repository.dart';

/// Repository for the work_sessions table
class WorkSessionsRepository extends BaseRepository<WorkSessionsModel> {
  const WorkSessionsRepository(SupabaseClient client) : super(client, 'work_sessions');

  @override
  WorkSessionsModel fromJson(Map<String, dynamic> json) => WorkSessionsModel.fromJson(json);

  /// Find a record by its primary key
  Future<WorkSessionsModel?> find(String sessionId) async {
    final response = await query.select()
        .eq('session_id', sessionId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<WorkSessionsModel>> findAll({
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
  Future<WorkSessionsModel> insert(WorkSessionsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<WorkSessionsModel?> update(WorkSessionsModel model) async {
    if (model.sessionId == null) {
      throw ArgumentError("Primary key session_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('session_id', model.sessionId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<WorkSessionsModel> upsert(WorkSessionsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String sessionId) async {
    final queryBuilder = query.delete()
        .eq('session_id', sessionId)
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

  /// Find related professional_profiles records
  /// based on the professional_id foreign key
  Future<List<ProfessionalProfilesModel>> findByProfessionalId(String professionalId) async {
    final queryBuilder = client
        .from('professional_profiles')
        .select()
        .eq('professional_id', professionalId);

    final response = await queryBuilder;
    return (response as List).map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

}
