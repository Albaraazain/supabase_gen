import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/task_photos_query_builder.dart';


class TaskPhotosRepository extends BaseRepository<TaskPhotosModel> {
  TaskPhotosRepository(SupabaseClient client) : super(client, 'task_photos');
  
  @override
  TaskPhotosModel fromJson(Map<String, dynamic> json) {
    return TaskPhotosModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for task_photos
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
  TaskPhotosModelQueryBuilder createQueryBuilder() {
    return TaskPhotosModelQueryBuilder(client);
  }
  
  /// Get a TaskPhotosModel by task_photo_id
  /// 
  /// This method looks up a record using a task_photo_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TaskPhotosModel?> getByTaskPhotoId(String taskPhotoId) async {
    final result = await client
        .from('task_photos')
        .select().eq('task_photo_id', taskPhotoId)
        .maybeSingle();
    
    if (result == null) return null;
    return TaskPhotosModel.fromJson(result);
  }

  /// Get a TaskPhotosModel by task_id
  /// 
  /// This method looks up a record using a task_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TaskPhotosModel?> getByTaskId(String taskId) async {
    final result = await client
        .from('task_photos')
        .select().eq('task_id', taskId)
        .maybeSingle();
    
    if (result == null) return null;
    return TaskPhotosModel.fromJson(result);
  }

  /// Get a TaskPhotosModel by photo_id
  /// 
  /// This method looks up a record using a photo_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TaskPhotosModel?> getByPhotoId(String photoId) async {
    final result = await client
        .from('task_photos')
        .select().eq('photo_id', photoId)
        .maybeSingle();
    
    if (result == null) return null;
    return TaskPhotosModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(TaskPhotosModel model) {
    // Validate check constraints
    // 2200_17973_1_not_null: Database CHECK constraint
    // 2200_17973_2_not_null: Database CHECK constraint
    // 2200_17973_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the task_photo record associated with this task_photos
  /// 
  /// This retrieves the parent task_photo record for this task_photos.
  /// It represents a foreign key relationship from task_photos.task_photo_id to task_photos.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<TaskPhotosModel?> getTaskPhoto(String taskPhotoId) async {
    final result = await client
        .from('task_photos')
        .select()
        .eq('id', taskPhotoId)
        .maybeSingle();
    
    if (result == null) return null;
    return TaskPhotosModel.fromJson(result);
  }
  
  /// Check if the task_photo record exists for this task_photos
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.task_photoExists(message.userId);
  /// ```
  Future<bool> task_photoExists(String taskPhotoId) async {
    final result = await client
        .from('task_photos')
        .select('id')
        .eq('id', taskPhotoId)
        .maybeSingle();
    
    return result != null;
  }
}
