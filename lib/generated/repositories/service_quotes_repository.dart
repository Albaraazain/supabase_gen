import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service_quotes_model.dart';
import 'base_repository.dart';

/// Repository for the service_quotes table
class ServiceQuotesRepository extends BaseRepository {
  const ServiceQuotesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'service_quotes';

  /// Find a record by its primary key
  Future<ServiceQuotesModel?> find(String quoteId) async {
    final response = await query
        .eq('quote_id', quoteId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ServiceQuotesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ServiceQuotesModel>> findAll({
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
    return response.map((json) => ServiceQuotesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ServiceQuotesModel> insert(ServiceQuotesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ServiceQuotesModel.fromJson(response);
  }

  /// Update an existing record
  Future<ServiceQuotesModel?> update(ServiceQuotesModel model) async {
    final response = await query
        .eq('quote_id', model.quoteId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ServiceQuotesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ServiceQuotesModel> upsert(ServiceQuotesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ServiceQuotesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String quoteId) async {
    await query
        .eq('quote_id', quoteId)
        .delete();
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

}
