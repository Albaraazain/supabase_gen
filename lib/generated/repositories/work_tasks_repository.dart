import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/work_tasks_query_builder.dart';


class WorkTasksRepository extends BaseRepository<WorkTasksModel> {
  WorkTasksRepository(SupabaseClient client) : super(client, 'work_tasks', primaryKeyColumn: 'task_id');
  
  @override
  WorkTasksModel fromJson(Map<String, dynamic> json) {
    return WorkTasksModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(WorkTasksModel model) {
    return model.taskId;
  }
  
  /// Create a type-safe query builder for work_tasks
  /// 
  /// The query builder provides a fluent interface to build complex queries
  /// with type safety for filtering, ordering and pagination.
  /// 
  /// Example:
  /// ```dart
  /// final users = await userRepository
  ///   .createQueryBuilder()
  ///   .whereNameEquals("John")
  ///   .whereAgeGreaterThan(18)
  ///   .orderByCreatedAtDesc()
  ///   .limit(10)
  ///   .get();
  /// ```
  WorkTasksModelQueryBuilder createQueryBuilder() {
    return WorkTasksModelQueryBuilder(client);
  }
  
  /// Get a WorkTasksModel by task_id
  /// 
  /// This method looks up a record using a task_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<WorkTasksModel?> getByTaskId(String taskId) async {
    final result = await client
        .from('work_tasks')
        .select().eq('task_id', taskId)
        .maybeSingle();
    
    if (result == null) return null;
    return WorkTasksModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(WorkTasksModel model) {
    // Validate check constraints
    // 2200_17979_1_not_null: Database CHECK constraint
    // 2200_17979_2_not_null: Database CHECK constraint
    // 2200_17979_3_not_null: Database CHECK constraint
    // 2200_17979_5_not_null: Database CHECK constraint
    // work_tasks_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this work_tasks
  /// 
  /// This retrieves the parent job record for this work_tasks.
  /// It represents a foreign key relationship from work_tasks.job_id to jobs.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<JobsModel?> getJob(String jobId) async {
    final result = await client
        .from('jobs')
        .select()
        .eq('id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return JobsModel.fromJson(result);
  }
  
  /// Check if the job record exists for this work_tasks
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.jobExists(message.userId);
  /// ```
  Future<bool> jobExists(String jobId) async {
    final result = await client
        .from('jobs')
        .select('id')
        .eq('id', jobId)
        .maybeSingle();
    
    return result != null;
  }
}
