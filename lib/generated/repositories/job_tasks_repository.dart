import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_tasks_model.dart';
import '../models/jobs_model.dart';
import '../models/quote_line_items_model.dart';
import 'base_repository.dart';

/// Repository for the job_tasks table
class JobTasksRepository extends BaseRepository {
  const JobTasksRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'job_tasks';

  /// Find a record by its primary key
  Future<JobTasksModel?> find(String taskId) async {
    final response = await query
        .select()
        .eq('task_id', taskId)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return JobTasksModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<JobTasksModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (limit != null) {
      query = query.limit(limit) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1) as PostgrestFilterBuilder<PostgrestList>;
    }

    final response = await query;
    return response.map((json) => JobTasksModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<JobTasksModel> insert(JobTasksModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return JobTasksModel.fromJson(response);
  }

  /// Update an existing record
  Future<JobTasksModel?> update(JobTasksModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('task_id', model.taskId)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return JobTasksModel.fromJson(response);
  }

  /// Insert or update a record
  Future<JobTasksModel> upsert(JobTasksModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return JobTasksModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String taskId) async {
    final deleteQuery = query.delete()
        .eq('task_id', taskId)
    ;
    await deleteQuery;
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId as Object);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Find related public.quote_line_items records
  /// based on the quote_line_item_id foreign key
  Future<List<QuoteLineItemsModel>> findByQuoteLineItemId(String? quoteLineItemId) async {
    final response = await client
        .from('quote_line_items')
        .select()
        .eq('line_item_id', quoteLineItemId as Object);

    return response.map((json) => QuoteLineItemsModel.fromJson(json)).toList();
  }

}
