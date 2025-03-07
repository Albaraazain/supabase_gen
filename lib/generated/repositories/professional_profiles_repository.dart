import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_profiles_model.dart';
import 'base_repository.dart';

/// Repository for the professional_profiles table
class ProfessionalProfilesRepository extends BaseRepository {
  const ProfessionalProfilesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_profiles';

  /// Find a record by its primary key
  Future<ProfessionalProfilesModel?> find(String professionalId) async {
    final response = await query
        .eq('professional_id', professionalId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalProfilesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ProfessionalProfilesModel>> findAll({
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
    return response.map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalProfilesModel> insert(ProfessionalProfilesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalProfilesModel.fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalProfilesModel?> update(ProfessionalProfilesModel model) async {
    final response = await query
        .eq('professional_id', model.professionalId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalProfilesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalProfilesModel> upsert(ProfessionalProfilesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalProfilesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String professionalId) async {
    await query
        .eq('professional_id', professionalId)
        .delete();
  }

  /// Find related public.users records
  /// based on the user_id foreign key
  Future<List<UsersModel>> findByUserId(String userId) async {
    final response = await client
        .from('users')
        .select()
        .eq('user_id', userId);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

}
