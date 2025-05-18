import '../utils/geo_json.dart';

/// Generated model class for table location_verifications
/// Database triggers associated with this table:
/// - location_verification_status_change: UPDATE AFTER - EXECUTE FUNCTION track_verification_status_change()
///   Signature: track_verification_status_change() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for track_verification_status_change>
///
class LocationVerificationsModel {
  /// Primary key field
  /// Non-nullable field
  final String verificationId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String userId;
  /// Non-nullable field
  final double latitude;
  /// Non-nullable field
  final double longitude;
  final double? accuracyMeters;
  final DateTime? verifiedAt;
  /// Non-nullable field
  final String verificationType;
  final DateTime? createdAt;
  final String? addressLine1;
  final String? addressLine2;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final bool? addressVerified;
  /// Non-nullable field
  final String verificationStatus;
  final String? failureReason;

  LocationVerificationsModel({this.verificationId = "", required this.jobId, required this.userId, required this.latitude, required this.longitude, this.accuracyMeters, this.verifiedAt, required this.verificationType, this.createdAt, this.addressLine1, this.addressLine2, this.city, this.state, this.postalCode, this.country, this.addressVerified, this.verificationStatus = 'pending', this.failureReason})
      : assert(() { assert(verificationId != null, "verification_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(userId != null, "user_id constraint violation"); assert(latitude != null, "latitude constraint violation"); assert(longitude != null, "longitude constraint violation"); assert(verificationType != null, "verification_type constraint violation"); assert(verificationStatus != null, "verification_status constraint violation"); return true; }());

  factory LocationVerificationsModel.fromJson(Map<String, dynamic> json) {
    return LocationVerificationsModel(
      verificationId: json['verification_id'] ?? '',
      jobId: json['job_id'] ?? '',
      userId: json['user_id'] ?? '',
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      accuracyMeters: json['accuracy_meters'] != null ? _toDouble(json['accuracy_meters']) : null,
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      verificationType: json['verification_type'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      addressLine1: json['address_line1'],
      addressLine2: json['address_line2'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postal_code'],
      country: json['country'],
      addressVerified: json['address_verified'],
      verificationStatus: json['verification_status'] ?? '',
      failureReason: json['failure_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'verification_id': verificationId,
      'job_id': jobId,
      'user_id': userId,
      'latitude': latitude,
      'longitude': longitude,
      'accuracy_meters': accuracyMeters,
      'verified_at': verifiedAt?.toIso8601String(),
      'verification_type': verificationType,
      'created_at': createdAt?.toIso8601String(),
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'country': country,
      'address_verified': addressVerified,
      'verification_status': verificationStatus,
      'failure_reason': failureReason,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationVerificationsModel && other.verificationId == verificationId && other.jobId == jobId && other.userId == userId && other.latitude == latitude && other.longitude == longitude && other.accuracyMeters == accuracyMeters && other.verifiedAt == verifiedAt && other.verificationType == verificationType && other.createdAt == createdAt && other.addressLine1 == addressLine1 && other.addressLine2 == addressLine2 && other.city == city && other.state == state && other.postalCode == postalCode && other.country == country && other.addressVerified == addressVerified && other.verificationStatus == verificationStatus && other.failureReason == failureReason;
  }

  @override
  int get hashCode => verificationId.hashCode ^ jobId.hashCode ^ userId.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ accuracyMeters.hashCode ^ verifiedAt.hashCode ^ verificationType.hashCode ^ createdAt.hashCode ^ addressLine1.hashCode ^ addressLine2.hashCode ^ city.hashCode ^ state.hashCode ^ postalCode.hashCode ^ country.hashCode ^ addressVerified.hashCode ^ verificationStatus.hashCode ^ failureReason.hashCode;

  @override
  String toString() {
    return 'LocationVerificationsModel(verificationId: $verificationId, jobId: $jobId, userId: $userId, latitude: $latitude, longitude: $longitude, accuracyMeters: $accuracyMeters, verifiedAt: $verifiedAt, verificationType: $verificationType, createdAt: $createdAt, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, addressVerified: $addressVerified, verificationStatus: $verificationStatus, failureReason: $failureReason)';
  }
  /// Get the primary identifier for this record
  String get id => verificationId;
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
