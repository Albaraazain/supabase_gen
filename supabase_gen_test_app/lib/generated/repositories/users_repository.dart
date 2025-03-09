import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the users table
class UsersRepository extends BaseRepository<UsersModel> {
  const UsersRepository(SupabaseClient client) : super(client, 'users');

  @override
  UsersModel fromJson(Map<String, dynamic> json) => UsersModel.fromJson(json);

  /// Find a record by its primary key
  Future<UsersModel?> find(String userId, String userId2) async {
    final response = await query.select()
        .eq('user_id', userId)
        .eq('user_id', userId2)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<UsersModel>> findAll({
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
  Future<UsersModel> insert(UsersModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<UsersModel?> update(UsersModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('user_id', model.userId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<UsersModel> upsert(UsersModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String userId, String userId2) async {
    final queryBuilder = query.delete()
        .eq('user_id', userId)
        .eq('user_id', userId2)
        ;
    await queryBuilder;
  }

}
