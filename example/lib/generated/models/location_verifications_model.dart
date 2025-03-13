
class LocationVerificationsModel {
  final double? accuracyMeters;
  final DateTime? createdAt;
  final String jobId;
  final double latitude;
  final double longitude;
  final String userId;
  final String? verificationId;
  final String verificationType;
  final DateTime? verifiedAt;

  LocationVerificationsModel({
    this.accuracyMeters,
    this.createdAt,
    required this.jobId,
    required this.latitude,
    required this.longitude,
    required this.userId,
    this.verificationId,
    required this.verificationType,
    this.verifiedAt,
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

  factory LocationVerificationsModel.fromJson(Map<String, dynamic> json) {
    return LocationVerificationsModel(
      accuracyMeters: json['accuracy_meters'] != null ? _toDouble(json['accuracy_meters']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      jobId: json['job_id'] ?? '',
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      userId: json['user_id'] ?? '',
      verificationId: json['verification_id'],
      verificationType: json['verification_type'] ?? '',
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accuracyMeters != null) {
      json['accuracy_meters'] = accuracyMeters;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    json['job_id'] = jobId;
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    json['user_id'] = userId;
    if (verificationId != null) {
      json['verification_id'] = verificationId;
    }
    json['verification_type'] = verificationType;
    if (verifiedAt != null) {
      json['verified_at'] = verifiedAt!.toIso8601String();
    }
    return json;
  }

  LocationVerificationsModel copyWith({
    double? accuracyMeters,
    DateTime? createdAt,
    String? jobId,
    double? latitude,
    double? longitude,
    String? userId,
    String? verificationId,
    String? verificationType,
    DateTime? verifiedAt,
  }) {
    return LocationVerificationsModel(
      accuracyMeters: accuracyMeters ?? this.accuracyMeters,
      createdAt: createdAt ?? this.createdAt,
      jobId: jobId ?? this.jobId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      userId: userId ?? this.userId,
      verificationId: verificationId ?? this.verificationId,
      verificationType: verificationType ?? this.verificationType,
      verifiedAt: verifiedAt ?? this.verifiedAt,
    );
  }
}
