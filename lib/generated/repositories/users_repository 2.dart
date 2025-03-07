import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the users table
class UsersRepository extends BaseRepository {
  const UsersRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'users';

  /// Find a record by its primary key
  Future<UsersModel?> find(String userId, String userId) async {
    final response = await query
        .eq('user_id', userId)
        .eq('user_id', userId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return UsersModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<UsersModel>> findAll({
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
    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<UsersModel> insert(UsersModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return UsersModel.fromJson(response);
  }

  /// Update an existing record
  Future<UsersModel?> update(UsersModel model) async {
    final response = await query
        .eq('user_id', model.userId)
        .eq('user_id', model.userId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return UsersModel.fromJson(response);
  }

  /// Insert or update a record
  Future<UsersModel> upsert(UsersModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return UsersModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String userId, String userId) async {
    await query
        .eq('user_id', userId)
        .eq('user_id', userId)
        .delete();
  }

}
