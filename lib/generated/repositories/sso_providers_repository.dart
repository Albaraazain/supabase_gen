import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/sso_providers_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Manages SSO identity provider information; see saml_providers for SAML.
class SsoProvidersRepository extends BaseRepository {
  const SsoProvidersRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'sso_providers';

  /// Find a record by its primary key
  Future<SsoProvidersModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SsoProvidersModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SsoProvidersModel>> findAll({
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
    return response.map((json) => SsoProvidersModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SsoProvidersModel> insert(SsoProvidersModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SsoProvidersModel.fromJson(response);
  }

  /// Update an existing record
  Future<SsoProvidersModel?> update(SsoProvidersModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SsoProvidersModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SsoProvidersModel> upsert(SsoProvidersModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SsoProvidersModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
