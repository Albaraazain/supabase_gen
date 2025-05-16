import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/site_photos_query_builder.dart';


class SitePhotosRepository extends BaseRepository<SitePhotosModel> {
  SitePhotosRepository(SupabaseClient client) : super(client, 'site_photos');
  
  @override
  SitePhotosModel fromJson(Map<String, dynamic> json) {
    return SitePhotosModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for site_photos
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
  SitePhotosModelQueryBuilder createQueryBuilder() {
    return SitePhotosModelQueryBuilder(client);
  }
  
  /// Get a SitePhotosModel by photo_id
  /// 
  /// This method looks up a record using a photo_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<SitePhotosModel?> getByPhotoId(String photoId) async {
    final result = await client
        .from('site_photos')
        .select().eq('photo_id', photoId)
        .maybeSingle();
    
    if (result == null) return null;
    return SitePhotosModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(SitePhotosModel model) {
    // Validate check constraints
    // 2200_17965_1_not_null: Database CHECK constraint
    // 2200_17965_2_not_null: Database CHECK constraint
    // 2200_17965_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this site_photos
  /// 
  /// This retrieves the parent job record for this site_photos.
  /// It represents a foreign key relationship from site_photos.job_id to jobs.id
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
  
  /// Check if the job record exists for this site_photos
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
