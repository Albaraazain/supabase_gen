import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_services_backup_model.dart';
import 'base_repository.dart';

/// Repository for the professional_services_backup table
class ProfessionalServicesBackupRepository extends BaseRepository {
  const ProfessionalServicesBackupRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_services_backup';

  /// Get all records from this table
  Future<List<ProfessionalServicesBackupModel>> findAll({
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
    return response.map((json) => ProfessionalServicesBackupModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalServicesBackupModel> insert(ProfessionalServicesBackupModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalServicesBackupModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalServicesBackupModel> upsert(ProfessionalServicesBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalServicesBackupModel.fromJson(response);
  }

}
