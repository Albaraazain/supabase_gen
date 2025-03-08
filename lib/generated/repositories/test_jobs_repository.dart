import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/test_jobs_model.dart';
import 'base_repository.dart';

/// Repository for the test_jobs table
class TestJobsRepository extends BaseRepository {
  const TestJobsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'test_jobs';

  /// Find a record by its primary key
  Future<TestJobsModel?> find(String id) async {
    final response = await query
        .select()
        .eq('id', id)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return TestJobsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<TestJobsModel>> findAll({
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
    return response.map((json) => TestJobsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<TestJobsModel> insert(TestJobsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return TestJobsModel.fromJson(response);
  }

  /// Update an existing record
  Future<TestJobsModel?> update(TestJobsModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('id', model.id)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return TestJobsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<TestJobsModel> upsert(TestJobsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return TestJobsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    final deleteQuery = query.delete()
        .eq('id', id)
    ;
    await deleteQuery;
  }

}
