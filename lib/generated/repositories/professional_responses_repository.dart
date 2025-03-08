import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_responses_model.dart';
import '../models/job_broadcasts_model.dart';
import '../models/professional_profiles_model.dart';
import 'base_repository.dart';

/// Repository for the professional_responses table
class ProfessionalResponsesRepository extends BaseRepository {
  const ProfessionalResponsesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_responses';

  /// Find a record by its primary key
  Future<ProfessionalResponsesModel?> find(String responseId) async {
    final response = await query
        .select()
        .eq('response_id', responseId)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalResponsesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ProfessionalResponsesModel>> findAll({
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
    return response.map((json) => ProfessionalResponsesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalResponsesModel> insert(ProfessionalResponsesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalResponsesModel.fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalResponsesModel?> update(ProfessionalResponsesModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('response_id', model.responseId)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return ProfessionalResponsesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalResponsesModel> upsert(ProfessionalResponsesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalResponsesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String responseId) async {
    final deleteQuery = query.delete()
        .eq('response_id', responseId)
    ;
    await deleteQuery;
  }

  /// Find related public.job_broadcasts records
  /// based on the broadcast_id foreign key
  Future<List<JobBroadcastsModel>> findByBroadcastId(String broadcastId) async {
    final response = await client
        .from('job_broadcasts')
        .select()
        .eq('broadcast_id', broadcastId as Object);

    return response.map((json) => JobBroadcastsModel.fromJson(json)).toList();
  }

  /// Find related public.professional_profiles records
  /// based on the professional_id foreign key
  Future<List<ProfessionalProfilesModel>> findByProfessionalId(String professionalId) async {
    final response = await client
        .from('professional_profiles')
        .select()
        .eq('professional_id', professionalId as Object);

    return response.map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

}
