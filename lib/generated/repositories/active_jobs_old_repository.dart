import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/active_jobs_old_query_builder.dart';


class ActiveJobsOldRepository extends BaseRepository<ActiveJobsOldModel> {
  ActiveJobsOldRepository(SupabaseClient client) : super(client, 'active_jobs_old', primaryKeyColumn: 'job_id');
  
  @override
  ActiveJobsOldModel fromJson(Map<String, dynamic> json) {
    return ActiveJobsOldModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ActiveJobsOldModel model) {
    return model.jobId;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - active_job_stage_change: UPDATE BEFORE - EXECUTE FUNCTION handle_stage_transition()
  ///   Signature: handle_stage_transition() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for handle_stage_transition>
  /// - set_stage_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_stage_updated_at()
  ///   Signature: update_stage_updated_at() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for update_stage_updated_at>
  
  /// Create a type-safe query builder for active_jobs_old
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
  ActiveJobsOldModelQueryBuilder createQueryBuilder() {
    return ActiveJobsOldModelQueryBuilder(client);
  }
  
  /// Get a ActiveJobsOldModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ActiveJobsOldModel?> getByJobId(String jobId) async {
    final result = await client
        .from('active_jobs_old')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return ActiveJobsOldModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ActiveJobsOldModel model) {
    // Validate check constraints
    // 2200_17645_1_not_null: Database CHECK constraint
    // 2200_17645_2_not_null: Database CHECK constraint
    // 2200_17645_4_not_null: Database CHECK constraint
    // 2200_17645_5_not_null: Database CHECK constraint
    // 2200_17645_6_not_null: Database CHECK constraint
    // 2200_17645_7_not_null: Database CHECK constraint
    // active_jobs_current_stage_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this active_jobs_old
  /// 
  /// This retrieves the parent job record for this active_jobs_old.
  /// It represents a foreign key relationship from active_jobs_old.job_id to jobs.id
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
  
  /// Check if the job record exists for this active_jobs_old
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
