import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/job_broadcasts_query_builder.dart';


class JobBroadcastsRepository extends BaseRepository<JobBroadcastsModel> {
  JobBroadcastsRepository(SupabaseClient client) : super(client, 'job_broadcasts');
  
  @override
  JobBroadcastsModel fromJson(Map<String, dynamic> json) {
    return JobBroadcastsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for job_broadcasts
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
  JobBroadcastsModelQueryBuilder createQueryBuilder() {
    return JobBroadcastsModelQueryBuilder(client);
  }
  
  /// Get a JobBroadcastsModel by broadcast_id
  /// 
  /// This method looks up a record using a broadcast_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<JobBroadcastsModel?> getByBroadcastId(String broadcastId) async {
    final result = await client
        .from('job_broadcasts')
        .select().eq('broadcast_id', broadcastId)
        .maybeSingle();
    
    if (result == null) return null;
    return JobBroadcastsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(JobBroadcastsModel model) {
    // Validate check constraints
    // 2200_17715_1_not_null: Database CHECK constraint
    // 2200_17715_4_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the service record associated with this job_broadcasts
  /// 
  /// This retrieves the parent service record for this job_broadcasts.
  /// It represents a foreign key relationship from job_broadcasts.service_id to services.id
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
  
  /// Check if the service record exists for this job_broadcasts
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
