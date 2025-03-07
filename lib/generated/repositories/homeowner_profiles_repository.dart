import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/homeowner_profiles_model.dart';
import 'base_repository.dart';

/// Repository for the homeowner_profiles table
class HomeownerProfilesRepository extends BaseRepository {
  const HomeownerProfilesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'homeowner_profiles';

  /// Find a record by its primary key
  Future<HomeownerProfilesModel?> find(String homeownerId) async {
    final response = await query
        .eq('homeowner_id', homeownerId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return HomeownerProfilesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<HomeownerProfilesModel>> findAll({
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
    return response.map((json) => HomeownerProfilesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<HomeownerProfilesModel> insert(HomeownerProfilesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return HomeownerProfilesModel.fromJson(response);
  }

  /// Update an existing record
  Future<HomeownerProfilesModel?> update(HomeownerProfilesModel model) async {
    final response = await query
        .eq('homeowner_id', model.homeownerId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return HomeownerProfilesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<HomeownerProfilesModel> upsert(HomeownerProfilesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return HomeownerProfilesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String homeownerId) async {
    await query
        .eq('homeowner_id', homeownerId)
        .delete();
  }

  /// Find related public.users records
  /// based on the user_id foreign key
  Future<List<UsersModel>> findByUserId(String userId) async {
    final response = await client
        .from('users')
        .select()
        .eq('user_id', userId);

    return response.map((json) => UsersModel.fromJson(json)).toList();
  }

}
