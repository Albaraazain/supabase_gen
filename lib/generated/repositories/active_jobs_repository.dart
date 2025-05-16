import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/active_jobs_query_builder.dart';


class ActiveJobsRepository extends BaseRepository<ActiveJobsModel> {
  ActiveJobsRepository(SupabaseClient client) : super(client, 'active_jobs');
  
  @override
  ActiveJobsModel fromJson(Map<String, dynamic> json) {
    return ActiveJobsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for active_jobs
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
  ActiveJobsModelQueryBuilder createQueryBuilder() {
    return ActiveJobsModelQueryBuilder(client);
  }
  
  /// Get a ActiveJobsModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ActiveJobsModel?> getByJobId(String jobId) async {
    final result = await client
        .from('active_jobs')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return ActiveJobsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ActiveJobsModel model) {
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
  /// Get the job record associated with this active_jobs
  /// 
  /// This retrieves the parent job record for this active_jobs.
  /// It represents a foreign key relationship from active_jobs.job_id to jobs.id
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
  
  /// Check if the job record exists for this active_jobs
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

  /// Get the service record associated with this active_jobs
  /// 
  /// This retrieves the parent service record for this active_jobs.
  /// It represents a foreign key relationship from active_jobs.service_id to services.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ServicesModel?> getService(String serviceId) async {
    final result = await client
        .from('services')
        .select()
        .eq('id', serviceId)
        .maybeSingle();
    
    if (result == null) return null;
    return ServicesModel.fromJson(result);
  }
  
  /// Check if the service record exists for this active_jobs
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.serviceExists(message.userId);
  /// ```
  Future<bool> serviceExists(String serviceId) async {
    final result = await client
        .from('services')
        .select('id')
        .eq('id', serviceId)
        .maybeSingle();
    
    return result != null;
  }
}
