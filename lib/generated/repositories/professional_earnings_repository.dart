import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_earnings_model.dart';
import 'base_repository.dart';

/// Repository for the professional_earnings table
class ProfessionalEarningsRepository extends BaseRepository {
  const ProfessionalEarningsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'professional_earnings';

  /// Find a record by its primary key
  Future<ProfessionalEarningsModel?> find(int id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalEarningsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ProfessionalEarningsModel>> findAll({
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
    return response.map((json) => ProfessionalEarningsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ProfessionalEarningsModel> insert(ProfessionalEarningsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ProfessionalEarningsModel.fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalEarningsModel?> update(ProfessionalEarningsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ProfessionalEarningsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalEarningsModel> upsert(ProfessionalEarningsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ProfessionalEarningsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int id) async {
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

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Find related public.service_categories records
  /// based on the service_category_id foreign key
  Future<List<ServiceCategoriesModel>> findByServiceCategoryId(String? serviceCategoryId) async {
    final response = await client
        .from('service_categories')
        .select()
        .eq('category_id', serviceCategoryId);

    return response.map((json) => ServiceCategoriesModel.fromJson(json)).toList();
  }

}
