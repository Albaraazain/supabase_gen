import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_stage_history_model.dart';
import '../models/jobs_model.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the job_stage_history table
class JobStageHistoryRepository extends BaseRepository {
  const JobStageHistoryRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'job_stage_history';

  /// Find a record by its primary key
  Future<JobStageHistoryModel?> find(String historyId) async {
    final response = await query
        .select()
        .eq('history_id', historyId)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return JobStageHistoryModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<JobStageHistoryModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (limit != null) {
      query = query.limit(limit) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1) as PostgrestFilterBuilder<PostgrestList>;
    }

    final response = await query;
    return response.map((json) => JobStageHistoryModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<JobStageHistoryModel> insert(JobStageHistoryModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return JobStageHistoryModel.fromJson(response);
  }

  /// Update an existing record
  Future<JobStageHistoryModel?> update(JobStageHistoryModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('history_id', model.historyId)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return JobStageHistoryModel.fromJson(response);
  }

  /// Insert or update a record
  Future<JobStageHistoryModel> upsert(JobStageHistoryModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return JobStageHistoryModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String historyId) async {
    final deleteQuery = query.delete()
        .eq('history_id', historyId)
    ;
    await deleteQuery;
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId as Object);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Find related public.users records
  /// based on the created_by foreign key
  Future<List<UsersModel>> findByCreatedBy(String createdBy) async {
    final response = await client
        .from('users')
        .select()
        .eq('user_id', createdBy as Object);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

}
