
class LocationVerificationsModel {
  final String verificationId;
  final String? jobId;
  final double? verifiedLat;
  final double? verifiedLng;
  final String? verificationMethod;
  final String? status;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LocationVerificationsModel({
    required this.verificationId,
    this.jobId,
    this.verifiedLat,
    this.verifiedLng,
    this.verificationMethod,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory LocationVerificationsModel.fromJson(Map<String, dynamic> json) {
    return LocationVerificationsModel(
      verificationId: json['verification_id'] ?? '',
      jobId: json['job_id'],
      verifiedLat: json['verified_lat'],
      verifiedLng: json['verified_lng'],
      verificationMethod: json['verification_method'],
      status: json['status'],
      notes: json['notes'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verification_id': verificationId,
      'job_id': jobId,
      'verified_lat': verifiedLat,
      'verified_lng': verifiedLng,
      'verification_method': verificationMethod,
      'status': status,
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  LocationVerificationsModel copyWith({
    String? verificationId,
    String? jobId,
    double? verifiedLat,
    double? verifiedLng,
    String? verificationMethod,
    String? status,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LocationVerificationsModel(
      verificationId: verificationId ?? this.verificationId,
      jobId: jobId ?? this.jobId,
      verifiedLat: verifiedLat ?? this.verifiedLat,
      verifiedLng: verifiedLng ?? this.verifiedLng,
      verificationMethod: verificationMethod ?? this.verificationMethod,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
