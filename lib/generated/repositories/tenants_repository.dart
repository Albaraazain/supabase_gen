import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/tenants_model.dart';
import 'base_repository.dart';

/// Repository for the tenants table
class TenantsRepository extends BaseRepository {
  const TenantsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'tenants';

  /// Get all records from this table
  Future<List<TenantsModel>> findAll({
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
    return response.map((json) => TenantsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<TenantsModel> insert(TenantsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return TenantsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<TenantsModel> upsert(TenantsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return TenantsModel.fromJson(response);
  }

}
