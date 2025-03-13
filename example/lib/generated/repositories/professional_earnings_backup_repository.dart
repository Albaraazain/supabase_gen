import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_earnings_backup_model.dart';
import 'base_repository.dart';

/// Repository for the professional_earnings_backup table
class ProfessionalEarningsBackupRepository extends BaseRepository<ProfessionalEarningsBackupModel> {
  const ProfessionalEarningsBackupRepository(SupabaseClient client) : super(client, 'professional_earnings_backup');

  @override
  ProfessionalEarningsBackupModel fromJson(Map<String, dynamic> json) => ProfessionalEarningsBackupModel.fromJson(json);

  /// Get all records from this table with pagination and sorting
  Future<List<ProfessionalEarningsBackupModel>> findAll({
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
  Future<ProfessionalEarningsBackupModel> insert(ProfessionalEarningsBackupModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalEarningsBackupModel> upsert(ProfessionalEarningsBackupModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

}
