import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_stage_history_model.dart';
import '../models/jobs_model.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the job_stage_history table
class JobStageHistoryRepository extends BaseRepository<JobStageHistoryModel> {
  const JobStageHistoryRepository(SupabaseClient client) : super(client, 'job_stage_history');

  @override
  JobStageHistoryModel fromJson(Map<String, dynamic> json) => JobStageHistoryModel.fromJson(json);

  /// Find a record by its primary key
  Future<JobStageHistoryModel?> find(String historyId) async {
    final response = await query.select()
        .eq('history_id', historyId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<JobStageHistoryModel>> findAll({
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
  Future<JobStageHistoryModel> insert(JobStageHistoryModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<JobStageHistoryModel?> update(JobStageHistoryModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('history_id', model.historyId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<JobStageHistoryModel> upsert(JobStageHistoryModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String historyId) async {
    final queryBuilder = query.delete()
        .eq('history_id', historyId)
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

  /// Find related users records
  /// based on the created_by foreign key
  Future<List<UsersModel>> findByCreatedBy(String createdBy) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', createdBy);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
  }

}
