import 'dart:convert';

class HomeownerProfilesModel {
  final String? address;
  final String? city;
  final String? country;
  final DateTime? createdAt;
  final String? homeownerId;
  final double? latitude;
  final double? longitude;
  final Map<String, dynamic>? notificationPreferences;
  final String? preferredLanguage;
  final String? state;
  final DateTime? updatedAt;
  final String? verificationStatus;
  final DateTime? verifiedAt;
  final String? zipCode;

  HomeownerProfilesModel({
    this.address,
    this.city,
    this.country,
    this.createdAt,
    this.homeownerId,
    this.latitude,
    this.longitude,
    this.notificationPreferences,
    this.preferredLanguage,
    this.state,
    this.updatedAt,
    this.verificationStatus,
    this.verifiedAt,
    this.zipCode,
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

  factory HomeownerProfilesModel.fromJson(Map<String, dynamic> json) {
    return HomeownerProfilesModel(
      address: json['address'],
      city: json['city'],
      country: json['country'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      homeownerId: json['homeowner_id'],
      latitude: json['latitude'] != null ? _toDouble(json['latitude']) : null,
      longitude: json['longitude'] != null ? _toDouble(json['longitude']) : null,
      notificationPreferences: json['notification_preferences'] != null ? (json['notification_preferences'] is String ? jsonDecode(json['notification_preferences']) : json['notification_preferences']) : null,
      preferredLanguage: json['preferred_language'],
      state: json['state'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      verificationStatus: json['verification_status'],
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      zipCode: json['zip_code'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (address != null) {
      json['address'] = address;
    }
    if (city != null) {
      json['city'] = city;
    }
    if (country != null) {
      json['country'] = country;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (homeownerId != null) {
      json['homeowner_id'] = homeownerId;
    }
    if (latitude != null) {
      json['latitude'] = latitude;
    }
    if (longitude != null) {
      json['longitude'] = longitude;
    }
    if (notificationPreferences != null) {
      json['notification_preferences'] = notificationPreferences;
    }
    if (preferredLanguage != null) {
      json['preferred_language'] = preferredLanguage;
    }
    if (state != null) {
      json['state'] = state;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (verificationStatus != null) {
      json['verification_status'] = verificationStatus;
    }
    if (verifiedAt != null) {
      json['verified_at'] = verifiedAt!.toIso8601String();
    }
    if (zipCode != null) {
      json['zip_code'] = zipCode;
    }
    return json;
  }

  HomeownerProfilesModel copyWith({
    String? address,
    String? city,
    String? country,
    DateTime? createdAt,
    String? homeownerId,
    double? latitude,
    double? longitude,
    Map<String, dynamic>? notificationPreferences,
    String? preferredLanguage,
    String? state,
    DateTime? updatedAt,
    String? verificationStatus,
    DateTime? verifiedAt,
    String? zipCode,
  }) {
    return HomeownerProfilesModel(
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
      homeownerId: homeownerId ?? this.homeownerId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      state: state ?? this.state,
      updatedAt: updatedAt ?? this.updatedAt,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
