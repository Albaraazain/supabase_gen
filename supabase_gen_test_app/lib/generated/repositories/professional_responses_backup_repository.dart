import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_responses_backup_model.dart';
import 'base_repository.dart';

/// Repository for the professional_responses_backup table
class ProfessionalResponsesBackupRepository extends BaseRepository {
  const ProfessionalResponsesBackupRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_responses_backup';

  /// Get all records from this table
  Future<List<ProfessionalResponsesBackupModel>> findAll({
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
    return response.map((json) => ProfessionalResponsesBackupModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalResponsesBackupModel> insert(ProfessionalResponsesBackupModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalResponsesBackupModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalResponsesBackupModel> upsert(ProfessionalResponsesBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalResponsesBackupModel.fromJson(response);
  }

}
