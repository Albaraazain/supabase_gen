
/// Generated model class for table finding_photos
class FindingPhotosModel {
  /// Primary key field
  /// Non-nullable field
  final String findingPhotoId;
  /// Unique field
  /// Non-nullable field
  final String findingId;
  /// Unique field
  /// Non-nullable field
  final String photoId;
  final bool? isPrimary;
  final DateTime? createdAt;

  FindingPhotosModel({this.findingPhotoId = "", required this.findingId, required this.photoId, this.isPrimary, this.createdAt})
      : assert(() { assert(findingPhotoId != null, "finding_photo_id constraint violation"); assert(findingId != null, "finding_id constraint violation"); assert(photoId != null, "photo_id constraint violation"); return true; }());

  factory FindingPhotosModel.fromJson(Map<String, dynamic> json) {
    return FindingPhotosModel(
      findingPhotoId: json['finding_photo_id'] ?? '',
      findingId: json['finding_id'] ?? '',
      photoId: json['photo_id'] ?? '',
      isPrimary: json['is_primary'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'finding_photo_id': findingPhotoId,
      'finding_id': findingId,
      'photo_id': photoId,
      'is_primary': isPrimary,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FindingPhotosModel && other.findingPhotoId == findingPhotoId && other.findingId == findingId && other.photoId == photoId && other.isPrimary == isPrimary && other.createdAt == createdAt;
  }

  @override
  int get hashCode => findingPhotoId.hashCode ^ findingId.hashCode ^ photoId.hashCode ^ isPrimary.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'FindingPhotosModel(findingPhotoId: $findingPhotoId, findingId: $findingId, photoId: $photoId, isPrimary: $isPrimary, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => findingPhotoId;
}


