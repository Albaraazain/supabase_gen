import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_profiles_backup_model.dart';
import 'base_repository.dart';

/// Repository for the professional_profiles_backup table
class ProfessionalProfilesBackupRepository extends BaseRepository {
  const ProfessionalProfilesBackupRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_profiles_backup';

  /// Get all records from this table
  Future<List<ProfessionalProfilesBackupModel>> findAll({
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
    return response.map((json) => ProfessionalProfilesBackupModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalProfilesBackupModel> insert(ProfessionalProfilesBackupModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalProfilesBackupModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalProfilesBackupModel> upsert(ProfessionalProfilesBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalProfilesBackupModel.fromJson(response);
  }

}
