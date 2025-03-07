import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/refresh_tokens_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Store of tokens used to refresh JWT tokens once they expire.
class RefreshTokensRepository extends BaseRepository {
  const RefreshTokensRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'refresh_tokens';

  /// Find a record by its primary key
  Future<RefreshTokensModel?> find(int id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return RefreshTokensModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<RefreshTokensModel>> findAll({
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
    return response.map((json) => RefreshTokensModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<RefreshTokensModel> insert(RefreshTokensModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return RefreshTokensModel.fromJson(response);
  }

  /// Update an existing record
  Future<RefreshTokensModel?> update(RefreshTokensModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return RefreshTokensModel.fromJson(response);
  }

  /// Insert or update a record
  Future<RefreshTokensModel> upsert(RefreshTokensModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return RefreshTokensModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related auth.sessions records
  /// based on the session_id foreign key
  Future<List<SessionsModel>> findBySessionId(String? sessionId) async {
    final response = await client
        .from('sessions')
        .select()
        .eq('id', sessionId);

    return response.map((json) => SessionsModel.fromJson(json)).toList();
  }

}
