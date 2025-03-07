import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/jobs_model.dart';
import 'base_repository.dart';

/// Repository for the jobs table
class JobsRepository extends BaseRepository {
  const JobsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'jobs';

  /// Find a record by its primary key
  Future<JobsModel?> find(String jobId) async {
    final response = await query
        .eq('job_id', jobId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return JobsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<JobsModel>> findAll({
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
    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<JobsModel> insert(JobsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return JobsModel.fromJson(response);
  }

  /// Update an existing record
  Future<JobsModel?> update(JobsModel model) async {
    final response = await query
        .eq('job_id', model.jobId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return JobsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<JobsModel> upsert(JobsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return JobsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String jobId) async {
    await query
        .eq('job_id', jobId)
        .delete();
  }

  /// Find related public.job_broadcasts records
  /// based on the broadcast_id foreign key
  Future<List<JobBroadcastsModel>> findByBroadcastId(String? broadcastId) async {
    final response = await client
        .from('job_broadcasts')
        .select()
        .eq('broadcast_id', broadcastId);

    return response.map((json) => JobBroadcastsModel.fromJson(json)).toList();
  }

  /// Find related public.users records
  /// based on the homeowner_id foreign key
  Future<List<UsersModel>> findByHomeownerId(String homeownerId) async {
    final response = await client
        .from('users')
        .select()
        .eq('user_id', homeownerId);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

  /// Find related public.professional_profiles records
  /// based on the professional_id foreign key
  Future<List<ProfessionalProfilesModel>> findByProfessionalId(String professionalId) async {
    final response = await client
        .from('professional_profiles')
        .select()
        .eq('professional_id', professionalId);

    return response.map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

  /// Find related public.services records
  /// based on the service_id foreign key
  Future<List<ServicesModel>> findByServiceId(String serviceId) async {
    final response = await client
        .from('services')
        .select()
        .eq('service_id', serviceId);

    return response.map((json) => ServicesModel.fromJson(json)).toList();
  }

  /// Find related public.users records
  /// based on the last_updated_by foreign key
  Future<List<UsersModel>> findByLastUpdatedBy(String? lastUpdatedBy) async {
    final response = await client
        .from('users')
        .select()
        .eq('user_id', lastUpdatedBy);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

}
