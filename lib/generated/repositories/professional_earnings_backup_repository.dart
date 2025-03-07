import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_earnings_backup_model.dart';
import 'base_repository.dart';

/// Repository for the professional_earnings_backup table
class ProfessionalEarningsBackupRepository extends BaseRepository {
  const ProfessionalEarningsBackupRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_earnings_backup';

  /// Get all records from this table
  Future<List<ProfessionalEarningsBackupModel>> findAll({
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
    return response.map((json) => ProfessionalEarningsBackupModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalEarningsBackupModel> insert(ProfessionalEarningsBackupModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalEarningsBackupModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalEarningsBackupModel> upsert(ProfessionalEarningsBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalEarningsBackupModel.fromJson(response);
  }

}
