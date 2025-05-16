import '../utils/geo_json.dart';

/// Generated model class for table location_verification_attempts
class LocationVerificationAttemptsModel {
  /// Primary key field
  /// Non-nullable field
  final String attemptId;
  /// Non-nullable field
  final String verificationId;
  /// Non-nullable field
  final double latitude;
  /// Non-nullable field
  final double longitude;
  final double? accuracyMeters;
  final DateTime? attemptedAt;
  /// Non-nullable field
  final bool success;
  final String? failureReason;
  final DateTime? createdAt;

  LocationVerificationAttemptsModel({this.attemptId = "", required this.verificationId, required this.latitude, required this.longitude, this.accuracyMeters, this.attemptedAt, this.success = false, this.failureReason, this.createdAt})
      : assert(() { assert(attemptId != null, "attempt_id constraint violation"); assert(verificationId != null, "verification_id constraint violation"); assert(latitude != null, "latitude constraint violation"); assert(longitude != null, "longitude constraint violation"); assert(success != null, "success constraint violation"); return true; }());

  factory LocationVerificationAttemptsModel.fromJson(Map<String, dynamic> json) {
    return LocationVerificationAttemptsModel(
      attemptId: json['attempt_id'] ?? '',
      verificationId: json['verification_id'] ?? '',
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      accuracyMeters: json['accuracy_meters'] != null ? _toDouble(json['accuracy_meters']) : null,
      attemptedAt: json['attempted_at'] != null ? DateTime.parse(json['attempted_at'].toString()) : null,
      success: json['success'] ?? false,
      failureReason: json['failure_reason'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'attempt_id': attemptId,
      'verification_id': verificationId,
      'latitude': latitude,
      'longitude': longitude,
      'accuracy_meters': accuracyMeters,
      'attempted_at': attemptedAt?.toIso8601String(),
      'success': success,
      'failure_reason': failureReason,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationVerificationAttemptsModel && other.attemptId == attemptId && other.verificationId == verificationId && other.latitude == latitude && other.longitude == longitude && other.accuracyMeters == accuracyMeters && other.attemptedAt == attemptedAt && other.success == success && other.failureReason == failureReason && other.createdAt == createdAt;
  }

  @override
  int get hashCode => attemptId.hashCode ^ verificationId.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ accuracyMeters.hashCode ^ attemptedAt.hashCode ^ success.hashCode ^ failureReason.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'LocationVerificationAttemptsModel(attemptId: $attemptId, verificationId: $verificationId, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, attemptedAt: $attemptedAt, success: $success, failureReason: $failureReason, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => attemptId;
}

  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
