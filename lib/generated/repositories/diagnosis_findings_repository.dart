import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/diagnosis_findings_query_builder.dart';


class DiagnosisFindingsRepository extends BaseRepository<DiagnosisFindingsModel> {
  DiagnosisFindingsRepository(SupabaseClient client) : super(client, 'diagnosis_findings', primaryKeyColumn: 'finding_id');
  
  @override
  DiagnosisFindingsModel fromJson(Map<String, dynamic> json) {
    return DiagnosisFindingsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(DiagnosisFindingsModel model) {
    return model.findingId;
  }
  
  /// Create a type-safe query builder for diagnosis_findings
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
  DiagnosisFindingsModelQueryBuilder createQueryBuilder() {
    return DiagnosisFindingsModelQueryBuilder(client);
  }
  
  /// Get a DiagnosisFindingsModel by finding_id
  /// 
  /// This method looks up a record using a finding_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<DiagnosisFindingsModel?> getByFindingId(String findingId) async {
    final result = await client
        .from('diagnosis_findings')
        .select().eq('finding_id', findingId)
        .maybeSingle();
    
    if (result == null) return null;
    return DiagnosisFindingsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(DiagnosisFindingsModel model) {
    // Validate check constraints
    // 2200_17662_1_not_null: Database CHECK constraint
    // 2200_17662_2_not_null: Database CHECK constraint
    // 2200_17662_3_not_null: Database CHECK constraint
    // 2200_17662_9_not_null: Database CHECK constraint
    // diagnosis_findings_severity_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this diagnosis_findings
  /// 
  /// This retrieves the parent job record for this diagnosis_findings.
  /// It represents a foreign key relationship from diagnosis_findings.job_id to jobs.id
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
  
  /// Check if the job record exists for this diagnosis_findings
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
