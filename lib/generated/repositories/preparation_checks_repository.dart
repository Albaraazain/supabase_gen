import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/preparation_checks_query_builder.dart';


class PreparationChecksRepository extends BaseRepository<PreparationChecksModel> {
  PreparationChecksRepository(SupabaseClient client) : super(client, 'preparation_checks', primaryKeyColumn: 'check_id');
  
  @override
  PreparationChecksModel fromJson(Map<String, dynamic> json) {
    return PreparationChecksModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(PreparationChecksModel model) {
    return model.checkId;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_preparation_checks_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_preparation_checks_updated_at()
  ///   Signature: update_preparation_checks_updated_at() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for update_preparation_checks_updated_at>
  
  /// Create a type-safe query builder for preparation_checks
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
  PreparationChecksModelQueryBuilder createQueryBuilder() {
    return PreparationChecksModelQueryBuilder(client);
  }
  
  /// Get a PreparationChecksModel by check_id
  /// 
  /// This method looks up a record using a check_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<PreparationChecksModel?> getByCheckId(String checkId) async {
    final result = await client
        .from('preparation_checks')
        .select().eq('check_id', checkId)
        .maybeSingle();
    
    if (result == null) return null;
    return PreparationChecksModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(PreparationChecksModel model) {
    // Validate check constraints
    // 2200_17828_1_not_null: Database CHECK constraint
    // 2200_17828_2_not_null: Database CHECK constraint
    // 2200_17828_3_not_null: Database CHECK constraint
    // 2200_17828_4_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this preparation_checks
  /// 
  /// This retrieves the parent job record for this preparation_checks.
  /// It represents a foreign key relationship from preparation_checks.job_id to jobs.id
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
  
  /// Check if the job record exists for this preparation_checks
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
