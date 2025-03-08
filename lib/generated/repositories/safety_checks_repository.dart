import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/safety_checks_model.dart';
import '../models/jobs_model.dart';
import 'base_repository.dart';

/// Repository for the safety_checks table
class SafetyChecksRepository extends BaseRepository<SafetyChecksModel> {
  const SafetyChecksRepository(SupabaseClient client) : super(client, 'safety_checks');

  @override
  SafetyChecksModel fromJson(Map<String, dynamic> json) => SafetyChecksModel.fromJson(json);

  /// Find a record by its primary key
  Future<SafetyChecksModel?> find(String checkId) async {
    final response = await query.select()
        .eq('check_id', checkId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SafetyChecksModel>> findAll({
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
  Future<SafetyChecksModel> insert(SafetyChecksModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SafetyChecksModel?> update(SafetyChecksModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('check_id', model.checkId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SafetyChecksModel> upsert(SafetyChecksModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String checkId) async {
    final queryBuilder = query.delete()
        .eq('check_id', checkId)
        ;
    await queryBuilder;
  }

  /// Find related jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final queryBuilder = client
        .from('jobs')
        .select()
        .eq('job_id', jobId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => JobsModel.fromJson(json)).toList();
  }

}
