import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/location_verifications_query_builder.dart';


class LocationVerificationsRepository extends BaseRepository<LocationVerificationsModel> {
  LocationVerificationsRepository(SupabaseClient client) : super(client, 'location_verifications', primaryKeyColumn: 'verification_id');
  
  @override
  LocationVerificationsModel fromJson(Map<String, dynamic> json) {
    return LocationVerificationsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(LocationVerificationsModel model) {
    return model.verificationId;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - location_verification_status_change: UPDATE AFTER - EXECUTE FUNCTION track_verification_status_change()
  ///   Signature: track_verification_status_change() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for track_verification_status_change>
  
  /// Create a type-safe query builder for location_verifications
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
  LocationVerificationsModelQueryBuilder createQueryBuilder() {
    return LocationVerificationsModelQueryBuilder(client);
  }
  
  /// Get a LocationVerificationsModel by verification_id
  /// 
  /// This method looks up a record using a verification_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<LocationVerificationsModel?> getByVerificationId(String verificationId) async {
    final result = await client
        .from('location_verifications')
        .select().eq('verification_id', verificationId)
        .maybeSingle();
    
    if (result == null) return null;
    return LocationVerificationsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(LocationVerificationsModel model) {
    // Validate check constraints
    // 2200_17780_17_not_null: Database CHECK constraint
    // 2200_17780_1_not_null: Database CHECK constraint
    // 2200_17780_2_not_null: Database CHECK constraint
    // 2200_17780_3_not_null: Database CHECK constraint
    // 2200_17780_4_not_null: Database CHECK constraint
    // 2200_17780_5_not_null: Database CHECK constraint
    // 2200_17780_8_not_null: Database CHECK constraint
    // location_verifications_type_check: Database CHECK constraint
    // location_verifications_verification_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this location_verifications
  /// 
  /// This retrieves the parent job record for this location_verifications.
  /// It represents a foreign key relationship from location_verifications.job_id to jobs.id
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
  
  /// Check if the job record exists for this location_verifications
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
