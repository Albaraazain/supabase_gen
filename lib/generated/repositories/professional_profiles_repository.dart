import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_profiles_model.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the professional_profiles table
class ProfessionalProfilesRepository extends BaseRepository<ProfessionalProfilesModel> {
  const ProfessionalProfilesRepository(SupabaseClient client) : super(client, 'professional_profiles');

  @override
  ProfessionalProfilesModel fromJson(Map<String, dynamic> json) => ProfessionalProfilesModel.fromJson(json);

  /// Find a record by its primary key
  Future<ProfessionalProfilesModel?> find(String professionalId) async {
    final response = await query.select()
        .eq('professional_id', professionalId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ProfessionalProfilesModel>> findAll({
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
  Future<ProfessionalProfilesModel> insert(ProfessionalProfilesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalProfilesModel?> update(ProfessionalProfilesModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('professional_id', model.professionalId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalProfilesModel> upsert(ProfessionalProfilesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String professionalId) async {
    final queryBuilder = query.delete()
        .eq('professional_id', professionalId)
        ;
    await queryBuilder;
  }

  /// Find related users records
  /// based on the user_id foreign key
  Future<List<UsersModel>> findByUserId(String userId) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', userId);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
  }

}
