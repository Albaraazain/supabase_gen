import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_tasks_model.dart';
import '../models/jobs_model.dart';
import '../models/quote_line_items_model.dart';
import 'base_repository.dart';

/// Repository for the job_tasks table
class JobTasksRepository extends BaseRepository<JobTasksModel> {
  const JobTasksRepository(SupabaseClient client) : super(client, 'job_tasks');

  @override
  JobTasksModel fromJson(Map<String, dynamic> json) => JobTasksModel.fromJson(json);

  /// Find a record by its primary key
  Future<JobTasksModel?> find(String taskId) async {
    final response = await query.select()
        .eq('task_id', taskId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<JobTasksModel>> findAll({
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
  Future<JobTasksModel> insert(JobTasksModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<JobTasksModel?> update(JobTasksModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('task_id', model.taskId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<JobTasksModel> upsert(JobTasksModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String taskId) async {
    final queryBuilder = query.delete()
        .eq('task_id', taskId)
        ;
    await queryBuilder;
  }

  /// Find related jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final queryBuilder = client
        .from('jobs')
        .select()
        .eq('job_id', jobId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => JobsModel.fromJson(json)).toList();
  }

  /// Find related quote_line_items records
  /// based on the quote_line_item_id foreign key
  Future<List<QuoteLineItemsModel>> findByQuoteLineItemId(String? quoteLineItemId) async {
    final queryBuilder = client
        .from('quote_line_items')
        .select()
        .eq('line_item_id', quoteLineItemId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => QuoteLineItemsModel.fromJson(json)).toList();
  }

}
