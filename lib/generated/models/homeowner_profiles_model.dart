import '../utils/geo_json.dart';

/// Generated model class for table homeowner_profiles
class HomeownerProfilesModel {
  /// Primary key field
  /// Non-nullable field
  final String homeownerId;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? country;
  final double? latitude;
  final double? longitude;
  final String? preferredLanguage;
  final Map<String, dynamic>? notificationPreferences;
  final String? verificationStatus;
  final DateTime? verifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HomeownerProfilesModel({required this.homeownerId, this.address, this.city, this.state, this.zipCode, this.country, this.latitude, this.longitude, this.preferredLanguage, this.notificationPreferences, this.verificationStatus, this.verifiedAt, this.createdAt, this.updatedAt})
      : assert(() { assert(homeownerId != null, "homeowner_id constraint violation"); return true; }());

  factory HomeownerProfilesModel.fromJson(Map<String, dynamic> json) {
    return HomeownerProfilesModel(
      homeownerId: json['homeowner_id'] ?? '',
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip_code'],
      country: json['country'],
      latitude: json['latitude'] != null ? _toDouble(json['latitude']) : null,
      longitude: json['longitude'] != null ? _toDouble(json['longitude']) : null,
      preferredLanguage: json['preferred_language'],
      notificationPreferences: json['notification_preferences'],
      verificationStatus: json['verification_status'],
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeowner_id': homeownerId,
      'address': address,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'preferred_language': preferredLanguage,
      'notification_preferences': notificationPreferences,
      'verification_status': verificationStatus,
      'verified_at': verifiedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeownerProfilesModel && other.homeownerId == homeownerId && other.address == address && other.city == city && other.state == state && other.zipCode == zipCode && other.country == country && other.latitude == latitude && other.longitude == longitude && other.preferredLanguage == preferredLanguage && other.notificationPreferences == notificationPreferences && other.verificationStatus == verificationStatus && other.verifiedAt == verifiedAt && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => homeownerId.hashCode ^ address.hashCode ^ city.hashCode ^ state.hashCode ^ zipCode.hashCode ^ country.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ preferredLanguage.hashCode ^ notificationPreferences.hashCode ^ verificationStatus.hashCode ^ verifiedAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'HomeownerProfilesModel(homeownerId: $homeownerId, address: $address, city: $city, state: $state, zipCode: $zipCode, country: $country, latitude: $latitude, longitude: $longitude, preferredLanguage: $preferredLanguage, notificationPreferences: $notificationPreferences, verificationStatus: $verificationStatus, verifiedAt: $verifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => homeownerId;
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
