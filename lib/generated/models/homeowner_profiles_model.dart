import 'dart:convert';

class HomeownerProfilesModel {
  final String homeownerId;
  final String userId;
  final String? preferredLanguage;
  final Map<String, dynamic>? notificationPreferences;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  HomeownerProfilesModel({
    required this.homeownerId,
    required this.userId,
    this.preferredLanguage,
    this.notificationPreferences,
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

  factory HomeownerProfilesModel.fromJson(Map<String, dynamic> json) {
    return HomeownerProfilesModel(
      homeownerId: json['homeowner_id'] ?? '',
      userId: json['user_id'] ?? '',
      preferredLanguage: json['preferred_language'],
      notificationPreferences: json['notification_preferences'] != null ? (json['notification_preferences'] is String ? jsonDecode(json['notification_preferences']) : json['notification_preferences']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeowner_id': homeownerId,
      'user_id': userId,
      'preferred_language': preferredLanguage,
      'notification_preferences': notificationPreferences,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  HomeownerProfilesModel copyWith({
    String? homeownerId,
    String? userId,
    String? preferredLanguage,
    Map<String, dynamic>? notificationPreferences,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return HomeownerProfilesModel(
      homeownerId: homeownerId ?? this.homeownerId,
      userId: userId ?? this.userId,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      notificationPreferences: notificationPreferences ?? this.notificationPreferences,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
