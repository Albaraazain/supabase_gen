import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/professional_earnings_query_builder.dart';


class ProfessionalEarningsRepository extends BaseRepository<ProfessionalEarningsModel> {
  ProfessionalEarningsRepository(SupabaseClient client) : super(client, 'professional_earnings', primaryKeyColumn: 'earning_id');
  
  @override
  ProfessionalEarningsModel fromJson(Map<String, dynamic> json) {
    return ProfessionalEarningsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ProfessionalEarningsModel model) {
    return model.earningId;
  }
  
  /// Create a type-safe query builder for professional_earnings
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
  ProfessionalEarningsModelQueryBuilder createQueryBuilder() {
    return ProfessionalEarningsModelQueryBuilder(client);
  }
  
  /// Get a ProfessionalEarningsModel by earning_id
  /// 
  /// This method looks up a record using a earning_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalEarningsModel?> getByEarningId(String earningId) async {
    final result = await client
        .from('professional_earnings')
        .select().eq('earning_id', earningId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalEarningsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfessionalEarningsModel model) {
    // Validate check constraints
    // 2200_17837_1_not_null: Database CHECK constraint
    // 2200_17837_2_not_null: Database CHECK constraint
    // 2200_17837_3_not_null: Database CHECK constraint
    // 2200_17837_4_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this professional_earnings
  /// 
  /// This retrieves the parent job record for this professional_earnings.
  /// It represents a foreign key relationship from professional_earnings.job_id to jobs.id
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
  
  /// Check if the job record exists for this professional_earnings
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
