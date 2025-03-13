
class SitePhotosModel {
  final DateTime? createdAt;
  final String? description;
  final String jobId;
  final String? photoId;
  final String? photoType;
  final String photoUrl;
  final DateTime? takenAt;
  final String? uploadedBy;

  SitePhotosModel({
    this.createdAt,
    this.description,
    required this.jobId,
    this.photoId,
    this.photoType,
    required this.photoUrl,
    this.takenAt,
    this.uploadedBy,
  });

  factory SitePhotosModel.fromJson(Map<String, dynamic> json) {
    return SitePhotosModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'],
      jobId: json['job_id'] ?? '',
      photoId: json['photo_id'],
      photoType: json['photo_type'],
      photoUrl: json['photo_url'] ?? '',
      takenAt: json['taken_at'] != null ? DateTime.parse(json['taken_at'].toString()) : null,
      uploadedBy: json['uploaded_by'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (description != null) {
      json['description'] = description;
    }
    json['job_id'] = jobId;
    if (photoId != null) {
      json['photo_id'] = photoId;
    }
    if (photoType != null) {
      json['photo_type'] = photoType;
    }
    json['photo_url'] = photoUrl;
    if (takenAt != null) {
      json['taken_at'] = takenAt!.toIso8601String();
    }
    if (uploadedBy != null) {
      json['uploaded_by'] = uploadedBy;
    }
    return json;
  }

  SitePhotosModel copyWith({
    DateTime? createdAt,
    String? description,
    String? jobId,
    String? photoId,
    String? photoType,
    String? photoUrl,
    DateTime? takenAt,
    String? uploadedBy,
  }) {
    return SitePhotosModel(
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      jobId: jobId ?? this.jobId,
      photoId: photoId ?? this.photoId,
      photoType: photoType ?? this.photoType,
      photoUrl: photoUrl ?? this.photoUrl,
      takenAt: takenAt ?? this.takenAt,
      uploadedBy: uploadedBy ?? this.uploadedBy,
    );
  }
}
