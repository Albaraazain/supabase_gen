import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/location_map_settings_query_builder.dart';


class LocationMapSettingsRepository extends BaseRepository<LocationMapSettingsModel> {
  LocationMapSettingsRepository(SupabaseClient client) : super(client, 'location_map_settings', primaryKeyColumn: 'setting_id');
  
  @override
  LocationMapSettingsModel fromJson(Map<String, dynamic> json) {
    return LocationMapSettingsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(LocationMapSettingsModel model) {
    return model.settingId;
  }
  
  /// Create a type-safe query builder for location_map_settings
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
  LocationMapSettingsModelQueryBuilder createQueryBuilder() {
    return LocationMapSettingsModelQueryBuilder(client);
  }
  
  /// Get a LocationMapSettingsModel by setting_id
  /// 
  /// This method looks up a record using a setting_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<LocationMapSettingsModel?> getBySettingId(String settingId) async {
    final result = await client
        .from('location_map_settings')
        .select().eq('setting_id', settingId)
        .maybeSingle();
    
    if (result == null) return null;
    return LocationMapSettingsModel.fromJson(result);
  }

  /// Get a LocationMapSettingsModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<LocationMapSettingsModel?> getByJobId(String jobId) async {
    final result = await client
        .from('location_map_settings')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return LocationMapSettingsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(LocationMapSettingsModel model) {
    // Validate check constraints
    // 2200_17757_1_not_null: Database CHECK constraint
    // 2200_17757_2_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this location_map_settings
  /// 
  /// This retrieves the parent job record for this location_map_settings.
  /// It represents a foreign key relationship from location_map_settings.job_id to jobs.id
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
  
  /// Check if the job record exists for this location_map_settings
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
