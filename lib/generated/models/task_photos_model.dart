
/// Generated model class for table task_photos
class TaskPhotosModel {
  /// Primary key field
  /// Non-nullable field
  final String taskPhotoId;
  /// Unique field
  /// Non-nullable field
  final String taskId;
  /// Unique field
  /// Non-nullable field
  final String photoId;
  final bool? isPrimary;
  final DateTime? createdAt;

  TaskPhotosModel({this.taskPhotoId = "", required this.taskId, required this.photoId, this.isPrimary, this.createdAt})
      : assert(() { assert(taskPhotoId != null, "task_photo_id constraint violation"); assert(taskId != null, "task_id constraint violation"); assert(photoId != null, "photo_id constraint violation"); return true; }());

  factory TaskPhotosModel.fromJson(Map<String, dynamic> json) {
    return TaskPhotosModel(
      taskPhotoId: json['task_photo_id'] ?? '',
      taskId: json['task_id'] ?? '',
      photoId: json['photo_id'] ?? '',
      isPrimary: json['is_primary'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_photo_id': taskPhotoId,
      'task_id': taskId,
      'photo_id': photoId,
      'is_primary': isPrimary,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskPhotosModel && other.taskPhotoId == taskPhotoId && other.taskId == taskId && other.photoId == photoId && other.isPrimary == isPrimary && other.createdAt == createdAt;
  }

  @override
  int get hashCode => taskPhotoId.hashCode ^ taskId.hashCode ^ photoId.hashCode ^ isPrimary.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'TaskPhotosModel(taskPhotoId: $taskPhotoId, taskId: $taskId, photoId: $photoId, isPrimary: $isPrimary, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => taskPhotoId;
}


