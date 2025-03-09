
class SitePhotosModel {
  final String photoId;
  final String? jobId;
  final String photoUrl;
  final String? photoType;
  final String? description;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SitePhotosModel({
    required this.photoId,
    this.jobId,
    required this.photoUrl,
    this.photoType,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory SitePhotosModel.fromJson(Map<String, dynamic> json) {
    return SitePhotosModel(
      photoId: json['photo_id'] ?? '',
      jobId: json['job_id'],
      photoUrl: json['photo_url'] ?? '',
      photoType: json['photo_type'],
      description: json['description'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'photo_id': photoId,
      'job_id': jobId,
      'photo_url': photoUrl,
      'photo_type': photoType,
      'description': description,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  SitePhotosModel copyWith({
    String? photoId,
    String? jobId,
    String? photoUrl,
    String? photoType,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SitePhotosModel(
      photoId: photoId ?? this.photoId,
      jobId: jobId ?? this.jobId,
      photoUrl: photoUrl ?? this.photoUrl,
      photoType: photoType ?? this.photoType,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
