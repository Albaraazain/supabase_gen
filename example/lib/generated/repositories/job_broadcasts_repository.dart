import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_broadcasts_model.dart';
import '../models/homeowner_profiles_model.dart';
import '../models/services_model.dart';
import 'base_repository.dart';

/// Repository for the job_broadcasts table
class JobBroadcastsRepository extends BaseRepository<JobBroadcastsModel> {
  const JobBroadcastsRepository(SupabaseClient client) : super(client, 'job_broadcasts');

  @override
  JobBroadcastsModel fromJson(Map<String, dynamic> json) => JobBroadcastsModel.fromJson(json);

  /// Find a record by its primary key
  Future<JobBroadcastsModel?> find(String broadcastId) async {
    final response = await query.select()
        .eq('broadcast_id', broadcastId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<JobBroadcastsModel>> findAll({
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
  Future<JobBroadcastsModel> insert(JobBroadcastsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<JobBroadcastsModel?> update(JobBroadcastsModel model) async {
    if (model.broadcastId == null) {
      throw ArgumentError("Primary key broadcast_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('broadcast_id', model.broadcastId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<JobBroadcastsModel> upsert(JobBroadcastsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String broadcastId) async {
    final queryBuilder = query.delete()
        .eq('broadcast_id', broadcastId)
        ;
    await queryBuilder;
  }

  /// Find related homeowner_profiles records
  /// based on the homeowner_id foreign key
  Future<List<HomeownerProfilesModel>> findByHomeownerId(String? homeownerId) async {
    final queryBuilder = client
        .from('homeowner_profiles')
        .select()
        .eq('homeowner_id', homeownerId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => HomeownerProfilesModel.fromJson(json)).toList();
  }

  /// Find related services records
  /// based on the service_id foreign key
  Future<List<ServicesModel>> findByServiceId(String? serviceId) async {
    final queryBuilder = client
        .from('services')
        .select()
        .eq('service_id', serviceId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => ServicesModel.fromJson(json)).toList();
  }

}
