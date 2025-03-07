import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/saml_relay_states_model.dart';
import 'base_repository.dart';

/// Repository for Auth: Contains SAML Relay State information for each Service Provider initiated login.
class SamlRelayStatesRepository extends BaseRepository {
  const SamlRelayStatesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'saml_relay_states';

  /// Find a record by its primary key
  Future<SamlRelayStatesModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SamlRelayStatesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SamlRelayStatesModel>> findAll({
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
    return response.map((json) => SamlRelayStatesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SamlRelayStatesModel> insert(SamlRelayStatesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SamlRelayStatesModel.fromJson(response);
  }

  /// Update an existing record
  Future<SamlRelayStatesModel?> update(SamlRelayStatesModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SamlRelayStatesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SamlRelayStatesModel> upsert(SamlRelayStatesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SamlRelayStatesModel.fromJson(response);
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

  /// Find related auth.flow_state records
  /// based on the flow_state_id foreign key
  Future<List<FlowStateModel>> findByFlowStateId(String? flowStateId) async {
    final response = await client
        .from('flow_state')
        .select()
        .eq('id', flowStateId);

    return response.map((json) => FlowStateModel.fromJson(json)).toList();
  }

}
