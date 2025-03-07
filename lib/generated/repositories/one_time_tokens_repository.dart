import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/one_time_tokens_model.dart';
import 'base_repository.dart';

/// Repository for the one_time_tokens table
class OneTimeTokensRepository extends BaseRepository {
  const OneTimeTokensRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'one_time_tokens';

  /// Find a record by its primary key
  Future<OneTimeTokensModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return OneTimeTokensModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<OneTimeTokensModel>> findAll({
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
    return response.map((json) => OneTimeTokensModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<OneTimeTokensModel> insert(OneTimeTokensModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return OneTimeTokensModel.fromJson(response);
  }

  /// Update an existing record
  Future<OneTimeTokensModel?> update(OneTimeTokensModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return OneTimeTokensModel.fromJson(response);
  }

  /// Insert or update a record
  Future<OneTimeTokensModel> upsert(OneTimeTokensModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return OneTimeTokensModel.fromJson(response);
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
