import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service_quotes_model.dart';
import '../models/users_model.dart';
import '../models/jobs_model.dart';
import 'base_repository.dart';

/// Repository for the service_quotes table
class ServiceQuotesRepository extends BaseRepository<ServiceQuotesModel> {
  const ServiceQuotesRepository(SupabaseClient client) : super(client, 'service_quotes');

  @override
  ServiceQuotesModel fromJson(Map<String, dynamic> json) => ServiceQuotesModel.fromJson(json);

  /// Find a record by its primary key
  Future<ServiceQuotesModel?> find(String quoteId) async {
    final response = await query.select()
        .eq('quote_id', quoteId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ServiceQuotesModel>> findAll({
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
  Future<ServiceQuotesModel> insert(ServiceQuotesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ServiceQuotesModel?> update(ServiceQuotesModel model) async {
    if (model.quoteId == null) {
      throw ArgumentError("Primary key quote_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('quote_id', model.quoteId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ServiceQuotesModel> upsert(ServiceQuotesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String quoteId) async {
    final queryBuilder = query.delete()
        .eq('quote_id', quoteId)
        ;
    await queryBuilder;
  }

  /// Find related users records
  /// based on the created_by foreign key
  Future<List<UsersModel>> findByCreatedBy(String? createdBy) async {
    final queryBuilder = client
        .from('users')
        .select()
        .eq('user_id', createdBy as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => UsersModel.fromJson(json)).toList();
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

}
