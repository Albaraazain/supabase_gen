import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/mfa_amr_claims_model.dart';
import 'base_repository.dart';

/// Repository for auth: stores authenticator method reference claims for multi factor authentication
class MfaAmrClaimsRepository extends BaseRepository {
  const MfaAmrClaimsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'mfa_amr_claims';

  /// Find a record by its primary key
  Future<MfaAmrClaimsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return MfaAmrClaimsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<MfaAmrClaimsModel>> findAll({
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
    return response.map((json) => MfaAmrClaimsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<MfaAmrClaimsModel> insert(MfaAmrClaimsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return MfaAmrClaimsModel.fromJson(response);
  }

  /// Update an existing record
  Future<MfaAmrClaimsModel?> update(MfaAmrClaimsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return MfaAmrClaimsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<MfaAmrClaimsModel> upsert(MfaAmrClaimsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return MfaAmrClaimsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related auth.sessions records
  /// based on the session_id foreign key
  Future<List<SessionsModel>> findBySessionId(String sessionId) async {
    final response = await client
        .from('sessions')
        .select()
        .eq('id', sessionId);

    return response.map((json) => SessionsModel.fromJson(json)).toList();
  }

}
