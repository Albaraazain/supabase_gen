import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_services_model.dart';
import '../models/professional_profiles_model.dart';
import '../models/services_model.dart';
import 'base_repository.dart';

/// Repository for the professional_services table
class ProfessionalServicesRepository extends BaseRepository<ProfessionalServicesModel> {
  const ProfessionalServicesRepository(SupabaseClient client) : super(client, 'professional_services');

  @override
  ProfessionalServicesModel fromJson(Map<String, dynamic> json) => ProfessionalServicesModel.fromJson(json);

  /// Find a record by its primary key
  Future<ProfessionalServicesModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ProfessionalServicesModel>> findAll({
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
  Future<ProfessionalServicesModel> insert(ProfessionalServicesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalServicesModel?> update(ProfessionalServicesModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalServicesModel> upsert(ProfessionalServicesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

  /// Find related professional_profiles records
  /// based on the professional_id foreign key
  Future<List<ProfessionalProfilesModel>> findByProfessionalId(String professionalId) async {
    final queryBuilder = client
        .from('professional_profiles')
        .select()
        .eq('professional_id', professionalId);

    final response = await queryBuilder;
    return (response as List).map((json) => ProfessionalProfilesModel.fromJson(json)).toList();
  }

  /// Find related services records
  /// based on the service_id foreign key
  Future<List<ServicesModel>> findByServiceId(String serviceId) async {
    final queryBuilder = client
        .from('services')
        .select()
        .eq('service_id', serviceId);

    final response = await queryBuilder;
    return (response as List).map((json) => ServicesModel.fromJson(json)).toList();
  }

}
