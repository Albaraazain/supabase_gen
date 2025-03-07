import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/sso_domains_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Manages SSO email address domain mapping to an SSO Identity Provider.
class SsoDomainsRepository extends BaseRepository {
  const SsoDomainsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'sso_domains';

  /// Find a record by its primary key
  Future<SsoDomainsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SsoDomainsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SsoDomainsModel>> findAll({
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
    return response.map((json) => SsoDomainsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SsoDomainsModel> insert(SsoDomainsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SsoDomainsModel.fromJson(response);
  }

  /// Update an existing record
  Future<SsoDomainsModel?> update(SsoDomainsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SsoDomainsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SsoDomainsModel> upsert(SsoDomainsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SsoDomainsModel.fromJson(response);
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
