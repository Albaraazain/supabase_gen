import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/material_usage_query_builder.dart';


class MaterialUsageRepository extends BaseRepository<MaterialUsageModel> {
  MaterialUsageRepository(SupabaseClient client) : super(client, 'material_usage', primaryKeyColumn: 'usage_id');
  
  @override
  MaterialUsageModel fromJson(Map<String, dynamic> json) {
    return MaterialUsageModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(MaterialUsageModel model) {
    return model.usageId;
  }
  
  /// Create a type-safe query builder for material_usage
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
  MaterialUsageModelQueryBuilder createQueryBuilder() {
    return MaterialUsageModelQueryBuilder(client);
  }
  
  /// Get a MaterialUsageModel by usage_id
  /// 
  /// This method looks up a record using a usage_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<MaterialUsageModel?> getByUsageId(String usageId) async {
    final result = await client
        .from('material_usage')
        .select().eq('usage_id', usageId)
        .maybeSingle();
    
    if (result == null) return null;
    return MaterialUsageModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(MaterialUsageModel model) {
    // Validate check constraints
    // 2200_17793_1_not_null: Database CHECK constraint
    // 2200_17793_2_not_null: Database CHECK constraint
    // 2200_17793_3_not_null: Database CHECK constraint
    // 2200_17793_4_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this material_usage
  /// 
  /// This retrieves the parent job record for this material_usage.
  /// It represents a foreign key relationship from material_usage.job_id to jobs.id
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
  
  /// Check if the job record exists for this material_usage
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
