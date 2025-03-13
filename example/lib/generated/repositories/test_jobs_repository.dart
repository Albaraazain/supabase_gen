import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/test_jobs_model.dart';
import 'base_repository.dart';

/// Repository for the test_jobs table
class TestJobsRepository extends BaseRepository<TestJobsModel> {
  const TestJobsRepository(SupabaseClient client) : super(client, 'test_jobs');

  @override
  TestJobsModel fromJson(Map<String, dynamic> json) => TestJobsModel.fromJson(json);

  /// Find a record by its primary key
  Future<TestJobsModel?> find(String jobId) async {
    final response = await query.select()
        .eq('job_id', jobId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<TestJobsModel>> findAll({
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
  Future<TestJobsModel> insert(TestJobsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<TestJobsModel?> update(TestJobsModel model) async {
    if (model.jobId == null) {
      throw ArgumentError("Primary key job_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('job_id', model.jobId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<TestJobsModel> upsert(TestJobsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String jobId) async {
    final queryBuilder = query.delete()
        .eq('job_id', jobId)
        ;
    await queryBuilder;
  }

}
