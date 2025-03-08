import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_responses_model.dart';
import '../models/job_broadcasts_model.dart';
import '../models/professional_profiles_model.dart';
import 'base_repository.dart';

/// Repository for the professional_responses table
class ProfessionalResponsesRepository extends BaseRepository<ProfessionalResponsesModel> {
  const ProfessionalResponsesRepository(SupabaseClient client) : super(client, 'professional_responses');

  @override
  ProfessionalResponsesModel fromJson(Map<String, dynamic> json) => ProfessionalResponsesModel.fromJson(json);

  /// Find a record by its primary key
  Future<ProfessionalResponsesModel?> find(String responseId) async {
    final response = await query.select()
        .eq('response_id', responseId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ProfessionalResponsesModel>> findAll({
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
  Future<ProfessionalResponsesModel> insert(ProfessionalResponsesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalResponsesModel?> update(ProfessionalResponsesModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('response_id', model.responseId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalResponsesModel> upsert(ProfessionalResponsesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String responseId) async {
    final queryBuilder = query.delete()
        .eq('response_id', responseId)
        ;
    await queryBuilder;
  }

  /// Find related job_broadcasts records
  /// based on the broadcast_id foreign key
  Future<List<JobBroadcastsModel>> findByBroadcastId(String broadcastId) async {
    final queryBuilder = client
        .from('job_broadcasts')
        .select()
        .eq('broadcast_id', broadcastId);

    final response = await queryBuilder;
    return (response as List).map((json) => JobBroadcastsModel.fromJson(json)).toList();
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

}
