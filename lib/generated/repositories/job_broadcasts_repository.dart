import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_broadcasts_model.dart';
import 'base_repository.dart';

/// Repository for the job_broadcasts table
class JobBroadcastsRepository extends BaseRepository {
  const JobBroadcastsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'job_broadcasts';

  /// Find a record by its primary key
  Future<JobBroadcastsModel?> find(String broadcastId) async {
    final response = await query
        .eq('broadcast_id', broadcastId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return JobBroadcastsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<JobBroadcastsModel>> findAll({
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
    return response.map((json) => JobBroadcastsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<JobBroadcastsModel> insert(JobBroadcastsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return JobBroadcastsModel.fromJson(response);
  }

  /// Update an existing record
  Future<JobBroadcastsModel?> update(JobBroadcastsModel model) async {
    final response = await query
        .eq('broadcast_id', model.broadcastId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return JobBroadcastsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<JobBroadcastsModel> upsert(JobBroadcastsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return JobBroadcastsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String broadcastId) async {
    await query
        .eq('broadcast_id', broadcastId)
        .delete();
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

  /// Find related public.services records
  /// based on the service_id foreign key
  Future<List<ServicesModel>> findByServiceId(String serviceId) async {
    final response = await client
        .from('services')
        .select()
        .eq('service_id', serviceId);

    return response.map((json) => ServicesModel.fromJson(json)).toList();
  }

}
