import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/finding_photos_query_builder.dart';


class FindingPhotosRepository extends BaseRepository<FindingPhotosModel> {
  FindingPhotosRepository(SupabaseClient client) : super(client, 'finding_photos');
  
  @override
  FindingPhotosModel fromJson(Map<String, dynamic> json) {
    return FindingPhotosModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for finding_photos
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
  FindingPhotosModelQueryBuilder createQueryBuilder() {
    return FindingPhotosModelQueryBuilder(client);
  }
  
  /// Get a FindingPhotosModel by finding_photo_id
  /// 
  /// This method looks up a record using a finding_photo_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<FindingPhotosModel?> getByFindingPhotoId(String findingPhotoId) async {
    final result = await client
        .from('finding_photos')
        .select().eq('finding_photo_id', findingPhotoId)
        .maybeSingle();
    
    if (result == null) return null;
    return FindingPhotosModel.fromJson(result);
  }

  /// Get a FindingPhotosModel by finding_id
  /// 
  /// This method looks up a record using a finding_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<FindingPhotosModel?> getByFindingId(String findingId) async {
    final result = await client
        .from('finding_photos')
        .select().eq('finding_id', findingId)
        .maybeSingle();
    
    if (result == null) return null;
    return FindingPhotosModel.fromJson(result);
  }

  /// Get a FindingPhotosModel by photo_id
  /// 
  /// This method looks up a record using a photo_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<FindingPhotosModel?> getByPhotoId(String photoId) async {
    final result = await client
        .from('finding_photos')
        .select().eq('photo_id', photoId)
        .maybeSingle();
    
    if (result == null) return null;
    return FindingPhotosModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(FindingPhotosModel model) {
    // Validate check constraints
    // 2200_17693_1_not_null: Database CHECK constraint
    // 2200_17693_2_not_null: Database CHECK constraint
    // 2200_17693_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the finding_photo record associated with this finding_photos
  /// 
  /// This retrieves the parent finding_photo record for this finding_photos.
  /// It represents a foreign key relationship from finding_photos.finding_photo_id to finding_photos.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<FindingPhotosModel?> getFindingPhoto(String findingPhotoId) async {
    final result = await client
        .from('finding_photos')
        .select()
        .eq('id', findingPhotoId)
        .maybeSingle();
    
    if (result == null) return null;
    return FindingPhotosModel.fromJson(result);
  }
  
  /// Check if the finding_photo record exists for this finding_photos
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.finding_photoExists(message.userId);
  /// ```
  Future<bool> finding_photoExists(String findingPhotoId) async {
    final result = await client
        .from('finding_photos')
        .select('id')
        .eq('id', findingPhotoId)
        .maybeSingle();
    
    return result != null;
  }
}
