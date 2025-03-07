import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/mfa_challenges_model.dart';
import 'base_repository.dart';

/// Repository for auth: stores metadata about challenge requests made
class MfaChallengesRepository extends BaseRepository {
  const MfaChallengesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'mfa_challenges';

  /// Find a record by its primary key
  Future<MfaChallengesModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return MfaChallengesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<MfaChallengesModel>> findAll({
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
    return response.map((json) => MfaChallengesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<MfaChallengesModel> insert(MfaChallengesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return MfaChallengesModel.fromJson(response);
  }

  /// Update an existing record
  Future<MfaChallengesModel?> update(MfaChallengesModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return MfaChallengesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<MfaChallengesModel> upsert(MfaChallengesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return MfaChallengesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related auth.mfa_factors records
  /// based on the factor_id foreign key
  Future<List<MfaFactorsModel>> findByFactorId(String factorId) async {
    final response = await client
        .from('mfa_factors')
        .select()
        .eq('id', factorId);

    return response.map((json) => MfaFactorsModel.fromJson(json)).toList();
  }

}
