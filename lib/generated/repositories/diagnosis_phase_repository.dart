import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/diagnosis_phase_query_builder.dart';


class DiagnosisPhaseRepository extends BaseRepository<DiagnosisPhaseModel> {
  DiagnosisPhaseRepository(SupabaseClient client) : super(client, 'diagnosis_phase');
  
  @override
  DiagnosisPhaseModel fromJson(Map<String, dynamic> json) {
    return DiagnosisPhaseModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for diagnosis_phase
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
  DiagnosisPhaseModelQueryBuilder createQueryBuilder() {
    return DiagnosisPhaseModelQueryBuilder(client);
  }
  
  /// Get a DiagnosisPhaseModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<DiagnosisPhaseModel?> getByJobId(String jobId) async {
    final result = await client
        .from('diagnosis_phase')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return DiagnosisPhaseModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(DiagnosisPhaseModel model) {
    // Validate check constraints
    // 2200_17676_1_not_null: Database CHECK constraint
    // 2200_17676_2_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this diagnosis_phase
  /// 
  /// This retrieves the parent job record for this diagnosis_phase.
  /// It represents a foreign key relationship from diagnosis_phase.job_id to jobs.id
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
  
  /// Check if the job record exists for this diagnosis_phase
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
