import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_services_model.dart';
import 'base_repository.dart';

/// Repository for the professional_services table
class ProfessionalServicesRepository extends BaseRepository {
  const ProfessionalServicesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_services';

  /// Find a record by its primary key
  Future<ProfessionalServicesModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalServicesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ProfessionalServicesModel>> findAll({
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
    return response.map((json) => ProfessionalServicesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalServicesModel> insert(ProfessionalServicesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalServicesModel.fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalServicesModel?> update(ProfessionalServicesModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalServicesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalServicesModel> upsert(ProfessionalServicesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalServicesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related public.professional_profiles records
  /// based on the professional_id foreign key
  Future<List<ProfessionalProfilesModel>> findByProfessionalId(String professionalId) async {
    final response = await client
        .from('professional_profiles')
        .select()
        .eq('professional_id', professionalId);

    return response.map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

  /// Find related public.services records
  /// based on the service_id foreign key
  Future<List<ServicesModel>> findByServiceId(String serviceId) async {
    final response = await client
        .from('services')
        .select()
        .eq('service_id', serviceId);

    return response.map((json) => ServicesModel.fromJson(json)).toList();
  }

}
