import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/working_phase_query_builder.dart';


class WorkingPhaseRepository extends BaseRepository<WorkingPhaseModel> {
  WorkingPhaseRepository(SupabaseClient client) : super(client, 'working_phase', primaryKeyColumn: 'job_id');
  
  @override
  WorkingPhaseModel fromJson(Map<String, dynamic> json) {
    return WorkingPhaseModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(WorkingPhaseModel model) {
    return model.jobId;
  }
  
  /// Create a type-safe query builder for working_phase
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
  WorkingPhaseModelQueryBuilder createQueryBuilder() {
    return WorkingPhaseModelQueryBuilder(client);
  }
  
  /// Get a WorkingPhaseModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<WorkingPhaseModel?> getByJobId(String jobId) async {
    final result = await client
        .from('working_phase')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return WorkingPhaseModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(WorkingPhaseModel model) {
    // Validate check constraints
    // 2200_18040_1_not_null: Database CHECK constraint
    // 2200_18040_2_not_null: Database CHECK constraint
    // working_phase_completion_percentage_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this working_phase
  /// 
  /// This retrieves the parent job record for this working_phase.
  /// It represents a foreign key relationship from working_phase.job_id to jobs.id
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
  
  /// Check if the job record exists for this working_phase
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
