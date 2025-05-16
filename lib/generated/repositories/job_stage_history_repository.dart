import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/job_stage_history_query_builder.dart';


class JobStageHistoryRepository extends BaseRepository<JobStageHistoryModel> {
  JobStageHistoryRepository(SupabaseClient client) : super(client, 'job_stage_history');
  
  @override
  JobStageHistoryModel fromJson(Map<String, dynamic> json) {
    return JobStageHistoryModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for job_stage_history
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
  JobStageHistoryModelQueryBuilder createQueryBuilder() {
    return JobStageHistoryModelQueryBuilder(client);
  }
  
  /// Get a JobStageHistoryModel by history_id
  /// 
  /// This method looks up a record using a history_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<JobStageHistoryModel?> getByHistoryId(String historyId) async {
    final result = await client
        .from('job_stage_history')
        .select().eq('history_id', historyId)
        .maybeSingle();
    
    if (result == null) return null;
    return JobStageHistoryModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(JobStageHistoryModel model) {
    // Validate check constraints
    // 2200_17725_1_not_null: Database CHECK constraint
    // 2200_17725_2_not_null: Database CHECK constraint
    // 2200_17725_4_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this job_stage_history
  /// 
  /// This retrieves the parent job record for this job_stage_history.
  /// It represents a foreign key relationship from job_stage_history.job_id to jobs.id
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
  
  /// Check if the job record exists for this job_stage_history
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
