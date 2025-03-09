import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/jobs_model.dart';
import '../models/job_broadcasts_model.dart';
import '../models/users_model.dart';
import '../models/professional_profiles_model.dart';
import '../models/services_model.dart';
import 'base_repository.dart';

/// Repository for the jobs table
class JobsRepository extends BaseRepository<JobsModel> {
  const JobsRepository(SupabaseClient client) : super(client, 'jobs');

  @override
  JobsModel fromJson(Map<String, dynamic> json) => JobsModel.fromJson(json);

  /// Find a record by its primary key
  Future<JobsModel?> find(String jobId) async {
    final response = await query.select()
        .eq('job_id', jobId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<JobsModel>> findAll({
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
  Future<JobsModel> insert(JobsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<JobsModel?> update(JobsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('job_id', model.jobId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<JobsModel> upsert(JobsModel model) async {
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

  /// Find related job_broadcasts records
  /// based on the broadcast_id foreign key
  Future<List<JobBroadcastsModel>> findByBroadcastId(String? broadcastId) async {
    final queryBuilder = client
        .from('job_broadcasts')
        .select()
        .eq('broadcast_id', broadcastId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => JobBroadcastsModel.fromJson(json)).toList();
  }

  /// Find related users records
  /// based on the homeowner_id foreign key
  Future<List<UsersModel>> findByHomeownerId(String homeownerId) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', homeownerId);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
  }

  /// Find related professional_profiles records
  /// based on the professional_id foreign key
  Future<List<ProfessionalProfilesModel>> findByProfessionalId(String professionalId) async {
    final queryBuilder = client
        .from('professional_profiles')
        .select()
        .eq('professional_id', professionalId);

    final response = await queryBuilder;
    return (response as List).map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

  /// Find related services records
  /// based on the service_id foreign key
  Future<List<ServicesModel>> findByServiceId(String serviceId) async {
    final queryBuilder = client
        .from('services')
        .select()
        .eq('service_id', serviceId);

    final response = await queryBuilder;
    return (response as List).map((json) => ServicesModel.fromJson(json)).toList();
  }

  /// Find related users records
  /// based on the last_updated_by foreign key
  Future<List<UsersModel>> findByLastUpdatedBy(String? lastUpdatedBy) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', lastUpdatedBy as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
  }

}
