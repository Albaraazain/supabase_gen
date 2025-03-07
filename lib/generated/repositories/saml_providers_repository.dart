import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/saml_providers_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Manages SAML Identity Provider connections.
class SamlProvidersRepository extends BaseRepository {
  const SamlProvidersRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'saml_providers';

  /// Find a record by its primary key
  Future<SamlProvidersModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SamlProvidersModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SamlProvidersModel>> findAll({
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
    return response.map((json) => SamlProvidersModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SamlProvidersModel> insert(SamlProvidersModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SamlProvidersModel.fromJson(response);
  }

  /// Update an existing record
  Future<SamlProvidersModel?> update(SamlProvidersModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SamlProvidersModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SamlProvidersModel> upsert(SamlProvidersModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SamlProvidersModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related auth.sso_providers records
  /// based on the sso_provider_id foreign key
  Future<List<SsoProvidersModel>> findBySsoProviderId(String ssoProviderId) async {
    final response = await client
        .from('sso_providers')
        .select()
        .eq('id', ssoProviderId);

    return response.map((json) => SsoProvidersModel.fromJson(json)).toList();
  }

}
