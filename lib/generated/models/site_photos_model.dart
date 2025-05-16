
/// Generated model class for table site_photos
class SitePhotosModel {
  /// Primary key field
  /// Non-nullable field
  final String photoId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String photoUrl;
  final String? description;
  final String? photoType;
  final DateTime? takenAt;
  final String? uploadedBy;
  final DateTime? createdAt;

  SitePhotosModel({this.photoId = "", required this.jobId, required this.photoUrl, this.description, this.photoType, this.takenAt, this.uploadedBy, this.createdAt})
      : assert(() { assert(photoId != null, "photo_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(photoUrl != null, "photo_url constraint violation"); return true; }());

  factory SitePhotosModel.fromJson(Map<String, dynamic> json) {
    return SitePhotosModel(
      photoId: json['photo_id'] ?? '',
      jobId: json['job_id'] ?? '',
      photoUrl: json['photo_url'] ?? '',
      description: json['description'],
      photoType: json['photo_type'],
      takenAt: json['taken_at'] != null ? DateTime.parse(json['taken_at'].toString()) : null,
      uploadedBy: json['uploaded_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo_id': photoId,
      'job_id': jobId,
      'photo_url': photoUrl,
      'description': description,
      'photo_type': photoType,
      'taken_at': takenAt?.toIso8601String(),
      'uploaded_by': uploadedBy,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SitePhotosModel && other.photoId == photoId && other.jobId == jobId && other.photoUrl == photoUrl && other.description == description && other.photoType == photoType && other.takenAt == takenAt && other.uploadedBy == uploadedBy && other.createdAt == createdAt;
  }

  @override
  int get hashCode => photoId.hashCode ^ jobId.hashCode ^ photoUrl.hashCode ^ description.hashCode ^ photoType.hashCode ^ takenAt.hashCode ^ uploadedBy.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'SitePhotosModel(photoId: $photoId, jobId: $jobId, photoUrl: $photoUrl, description: $description, photoType: $photoType, takenAt: $takenAt, uploadedBy: $uploadedBy, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => photoId;
}


