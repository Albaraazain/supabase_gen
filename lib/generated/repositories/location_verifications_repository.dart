import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/location_verifications_model.dart';
import '../models/jobs_model.dart';
import 'base_repository.dart';

/// Repository for the location_verifications table
class LocationVerificationsRepository extends BaseRepository<LocationVerificationsModel> {
  const LocationVerificationsRepository(SupabaseClient client) : super(client, 'location_verifications');

  @override
  LocationVerificationsModel fromJson(Map<String, dynamic> json) => LocationVerificationsModel.fromJson(json);

  /// Find a record by its primary key
  Future<LocationVerificationsModel?> find(String verificationId) async {
    final response = await query.select()
        .eq('verification_id', verificationId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LocationVerificationsModel>> findAll({
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
  Future<LocationVerificationsModel> insert(LocationVerificationsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LocationVerificationsModel?> update(LocationVerificationsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('verification_id', model.verificationId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LocationVerificationsModel> upsert(LocationVerificationsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String verificationId) async {
    final queryBuilder = query.delete()
        .eq('verification_id', verificationId)
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
