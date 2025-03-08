import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/jobs_backup_model.dart';
import 'base_repository.dart';

/// Repository for the jobs_backup table
class JobsBackupRepository extends BaseRepository {
  const JobsBackupRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'jobs_backup';

  /// Get all records from this table
  Future<List<JobsBackupModel>> findAll({
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
    return response.map((json) => JobsBackupModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<JobsBackupModel> insert(JobsBackupModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return JobsBackupModel.fromJson(response);
  }

  /// Insert or update a record
  Future<JobsBackupModel> upsert(JobsBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return JobsBackupModel.fromJson(response);
  }

}
