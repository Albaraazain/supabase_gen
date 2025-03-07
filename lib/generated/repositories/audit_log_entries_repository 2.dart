import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/audit_log_entries_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Audit trail for user actions.
class AuditLogEntriesRepository extends BaseRepository {
  const AuditLogEntriesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'audit_log_entries';

  /// Find a record by its primary key
  Future<AuditLogEntriesModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return AuditLogEntriesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<AuditLogEntriesModel>> findAll({
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
    return response.map((json) => AuditLogEntriesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<AuditLogEntriesModel> insert(AuditLogEntriesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return AuditLogEntriesModel.fromJson(response);
  }

  /// Update an existing record
  Future<AuditLogEntriesModel?> update(AuditLogEntriesModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return AuditLogEntriesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<AuditLogEntriesModel> upsert(AuditLogEntriesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return AuditLogEntriesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
