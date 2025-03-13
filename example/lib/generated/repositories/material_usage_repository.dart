import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/material_usage_model.dart';
import '../models/jobs_model.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the material_usage table
class MaterialUsageRepository extends BaseRepository<MaterialUsageModel> {
  const MaterialUsageRepository(SupabaseClient client) : super(client, 'material_usage');

  @override
  MaterialUsageModel fromJson(Map<String, dynamic> json) => MaterialUsageModel.fromJson(json);

  /// Find a record by its primary key
  Future<MaterialUsageModel?> find(String usageId) async {
    final response = await query.select()
        .eq('usage_id', usageId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<MaterialUsageModel>> findAll({
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
  Future<MaterialUsageModel> insert(MaterialUsageModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<MaterialUsageModel?> update(MaterialUsageModel model) async {
    if (model.usageId == null) {
      throw ArgumentError("Primary key usage_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('usage_id', model.usageId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<MaterialUsageModel> upsert(MaterialUsageModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String usageId) async {
    final queryBuilder = query.delete()
        .eq('usage_id', usageId)
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
  /// based on the recorded_by foreign key
  Future<List<UsersModel>> findByRecordedBy(String? recordedBy) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', recordedBy as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
  }

}
