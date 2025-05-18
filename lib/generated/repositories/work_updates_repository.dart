import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/work_updates_query_builder.dart';


class WorkUpdatesRepository extends BaseRepository<WorkUpdatesModel> {
  WorkUpdatesRepository(SupabaseClient client) : super(client, 'work_updates', primaryKeyColumn: 'update_id');
  
  @override
  WorkUpdatesModel fromJson(Map<String, dynamic> json) {
    return WorkUpdatesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(WorkUpdatesModel model) {
    return model.updateId;
  }
  
  /// Create a type-safe query builder for work_updates
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
  WorkUpdatesModelQueryBuilder createQueryBuilder() {
    return WorkUpdatesModelQueryBuilder(client);
  }
  
  /// Get a WorkUpdatesModel by update_id
  /// 
  /// This method looks up a record using a update_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<WorkUpdatesModel?> getByUpdateId(String updateId) async {
    final result = await client
        .from('work_updates')
        .select().eq('update_id', updateId)
        .maybeSingle();
    
    if (result == null) return null;
    return WorkUpdatesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(WorkUpdatesModel model) {
    // Validate check constraints
    // 2200_18029_1_not_null: Database CHECK constraint
    // 2200_18029_2_not_null: Database CHECK constraint
    // 2200_18029_3_not_null: Database CHECK constraint
    // 2200_18029_4_not_null: Database CHECK constraint
    // work_updates_priority_check: Database CHECK constraint
    // work_updates_update_type_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this work_updates
  /// 
  /// This retrieves the parent job record for this work_updates.
  /// It represents a foreign key relationship from work_updates.job_id to jobs.id
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
  
  /// Check if the job record exists for this work_updates
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
