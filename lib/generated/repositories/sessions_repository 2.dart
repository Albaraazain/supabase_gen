import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/sessions_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Stores session data associated to a user.
class SessionsRepository extends BaseRepository {
  const SessionsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'sessions';

  /// Find a record by its primary key
  Future<SessionsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SessionsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SessionsModel>> findAll({
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
    return response.map((json) => SessionsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SessionsModel> insert(SessionsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SessionsModel.fromJson(response);
  }

  /// Update an existing record
  Future<SessionsModel?> update(SessionsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SessionsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SessionsModel> upsert(SessionsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SessionsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related auth.users records
  /// based on the user_id foreign key
  Future<List<UsersModel>> findByUserId(String userId) async {
    final response = await client
        .from('users')
        .select()
        .eq('id', userId);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

}
