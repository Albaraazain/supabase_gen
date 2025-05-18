import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/work_sessions_query_builder.dart';


class WorkSessionsRepository extends BaseRepository<WorkSessionsModel> {
  WorkSessionsRepository(SupabaseClient client) : super(client, 'work_sessions', primaryKeyColumn: 'session_id');
  
  @override
  WorkSessionsModel fromJson(Map<String, dynamic> json) {
    return WorkSessionsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(WorkSessionsModel model) {
    return model.sessionId;
  }
  
  /// Create a type-safe query builder for work_sessions
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
  WorkSessionsModelQueryBuilder createQueryBuilder() {
    return WorkSessionsModelQueryBuilder(client);
  }
  
  /// Get a WorkSessionsModel by session_id
  /// 
  /// This method looks up a record using a session_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<WorkSessionsModel?> getBySessionId(String sessionId) async {
    final result = await client
        .from('work_sessions')
        .select().eq('session_id', sessionId)
        .maybeSingle();
    
    if (result == null) return null;
    return WorkSessionsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(WorkSessionsModel model) {
    // Validate check constraints
    // 2200_18009_1_not_null: Database CHECK constraint
    // 2200_18009_2_not_null: Database CHECK constraint
    // 2200_18009_3_not_null: Database CHECK constraint
    // 2200_18009_4_not_null: Database CHECK constraint
    // work_sessions_completion_percentage_check: Database CHECK constraint
    // work_sessions_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this work_sessions
  /// 
  /// This retrieves the parent job record for this work_sessions.
  /// It represents a foreign key relationship from work_sessions.job_id to jobs.id
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
  
  /// Check if the job record exists for this work_sessions
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
