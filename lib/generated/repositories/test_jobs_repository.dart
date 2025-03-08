import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/test_jobs_model.dart';
import 'base_repository.dart';

/// Repository for the test_jobs table
class TestJobsRepository extends BaseRepository<TestJobsModel> {
  const TestJobsRepository(SupabaseClient client) : super(client, 'test_jobs');

  @override
  TestJobsModel fromJson(Map<String, dynamic> json) => TestJobsModel.fromJson(json);

  /// Find a record by its primary key
  Future<TestJobsModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
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
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
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
  Future<void> delete(String id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

}
