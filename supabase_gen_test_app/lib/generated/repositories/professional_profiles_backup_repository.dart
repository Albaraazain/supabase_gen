import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_profiles_backup_model.dart';
import 'base_repository.dart';

/// Repository for the professional_profiles_backup table
class ProfessionalProfilesBackupRepository extends BaseRepository<ProfessionalProfilesBackupModel> {
  const ProfessionalProfilesBackupRepository(SupabaseClient client) : super(client, 'professional_profiles_backup');

  @override
  ProfessionalProfilesBackupModel fromJson(Map<String, dynamic> json) => ProfessionalProfilesBackupModel.fromJson(json);

  /// Get all records from this table with pagination and sorting
  Future<List<ProfessionalProfilesBackupModel>> findAll({
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
  Future<ProfessionalProfilesBackupModel> insert(ProfessionalProfilesBackupModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalProfilesBackupModel> upsert(ProfessionalProfilesBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

}
