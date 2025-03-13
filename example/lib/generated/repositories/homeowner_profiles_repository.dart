import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/homeowner_profiles_model.dart';
import '../models/users_model.dart';
import 'base_repository.dart';

/// Repository for the homeowner_profiles table
class HomeownerProfilesRepository extends BaseRepository<HomeownerProfilesModel> {
  const HomeownerProfilesRepository(SupabaseClient client) : super(client, 'homeowner_profiles');

  @override
  HomeownerProfilesModel fromJson(Map<String, dynamic> json) => HomeownerProfilesModel.fromJson(json);

  /// Find a record by its primary key
  Future<HomeownerProfilesModel?> find(String homeownerId) async {
    final response = await query.select()
        .eq('homeowner_id', homeownerId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<HomeownerProfilesModel>> findAll({
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
  Future<HomeownerProfilesModel> insert(HomeownerProfilesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<HomeownerProfilesModel?> update(HomeownerProfilesModel model) async {
    if (model.homeownerId == null) {
      throw ArgumentError("Primary key homeowner_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('homeowner_id', model.homeownerId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<HomeownerProfilesModel> upsert(HomeownerProfilesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String homeownerId) async {
    final queryBuilder = query.delete()
        .eq('homeowner_id', homeownerId)
        ;
    await queryBuilder;
  }

  /// Find related users records
  /// based on the homeowner_id foreign key
  Future<List<UsersModel>> findByHomeownerId(String homeownerId) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', homeownerId);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
  }

}
