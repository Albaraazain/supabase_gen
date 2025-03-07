import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/location_verifications_model.dart';
import 'base_repository.dart';

/// Repository for the location_verifications table
class LocationVerificationsRepository extends BaseRepository {
  const LocationVerificationsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'location_verifications';

  /// Find a record by its primary key
  Future<LocationVerificationsModel?> find(String verificationId) async {
    final response = await query
        .eq('verification_id', verificationId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return LocationVerificationsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<LocationVerificationsModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await query;
    return response.map((json) => LocationVerificationsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<LocationVerificationsModel> insert(LocationVerificationsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return LocationVerificationsModel.fromJson(response);
  }

  /// Update an existing record
  Future<LocationVerificationsModel?> update(LocationVerificationsModel model) async {
    final response = await query
        .eq('verification_id', model.verificationId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return LocationVerificationsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<LocationVerificationsModel> upsert(LocationVerificationsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return LocationVerificationsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String verificationId) async {
    await query
        .eq('verification_id', verificationId)
        .delete();
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

}
