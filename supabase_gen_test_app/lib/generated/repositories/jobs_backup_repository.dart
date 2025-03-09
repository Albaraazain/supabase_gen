import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/jobs_backup_model.dart';
import 'base_repository.dart';

/// Repository for the jobs_backup table
class JobsBackupRepository extends BaseRepository<JobsBackupModel> {
  const JobsBackupRepository(SupabaseClient client) : super(client, 'jobs_backup');

  @override
  JobsBackupModel fromJson(Map<String, dynamic> json) => JobsBackupModel.fromJson(json);

  /// Get all records from this table with pagination and sorting
  Future<List<JobsBackupModel>> findAll({
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
  Future<JobsBackupModel> insert(JobsBackupModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Insert or update a record
  Future<JobsBackupModel> upsert(JobsBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

}
