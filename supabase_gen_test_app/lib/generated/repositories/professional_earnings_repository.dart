import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_earnings_model.dart';
import '../models/professional_profiles_model.dart';
import '../models/jobs_model.dart';
import '../models/service_categories_model.dart';
import 'base_repository.dart';

/// Repository for the professional_earnings table
class ProfessionalEarningsRepository extends BaseRepository<ProfessionalEarningsModel> {
  const ProfessionalEarningsRepository(SupabaseClient client) : super(client, 'professional_earnings');

  @override
  ProfessionalEarningsModel fromJson(Map<String, dynamic> json) => ProfessionalEarningsModel.fromJson(json);

  /// Find a record by its primary key
  Future<ProfessionalEarningsModel?> find(int id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ProfessionalEarningsModel>> findAll({
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
  Future<ProfessionalEarningsModel> insert(ProfessionalEarningsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ProfessionalEarningsModel?> update(ProfessionalEarningsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ProfessionalEarningsModel> upsert(ProfessionalEarningsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(int id) async {
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

  /// Find related jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String jobId) async {
    final queryBuilder = client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    final response = await queryBuilder;
    return (response as List).map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Find related service_categories records
  /// based on the service_category_id foreign key
  Future<List<ServiceCategoriesModel>> findByServiceCategoryId(String? serviceCategoryId) async {
    final queryBuilder = client
        .from('service_categories')
        .select()
        .eq('category_id', serviceCategoryId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => ServiceCategoriesModel.fromJson(json)).toList();
  }

}
