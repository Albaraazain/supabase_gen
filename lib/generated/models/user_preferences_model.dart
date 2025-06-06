import '../utils/geo_json.dart';

/// Generated model class for table user_preferences
/// Database triggers associated with this table:
/// - update_user_preferences_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
///   Signature: update_updated_at_column() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
///
class UserPreferencesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  /// References profiles(id)
  final String userId;
  final String? preferredGenderDriver;
  final String? preferredGenderPassenger;
  final int? maxDetourKm;
  final double? minRatingThreshold;
  final double? autoAcceptThreshold;
  final Map<String, dynamic>? notificationSettings;
  final Map<String, dynamic>? privacySettings;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserPreferencesModel({this.id = "", required this.userId, this.preferredGenderDriver, this.preferredGenderPassenger, this.maxDetourKm, this.minRatingThreshold, this.autoAcceptThreshold, this.notificationSettings, this.privacySettings, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(userId != null, "user_id constraint violation"); return true; }());

  factory UserPreferencesModel.fromJson(Map<String, dynamic> json) {
    return UserPreferencesModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      preferredGenderDriver: json['preferred_gender_driver'],
      preferredGenderPassenger: json['preferred_gender_passenger'],
      maxDetourKm: json['max_detour_km'],
      minRatingThreshold: json['min_rating_threshold'] != null ? _toDouble(json['min_rating_threshold']) : null,
      autoAcceptThreshold: json['auto_accept_threshold'] != null ? _toDouble(json['auto_accept_threshold']) : null,
      notificationSettings: json['notification_settings'],
      privacySettings: json['privacy_settings'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'preferred_gender_driver': preferredGenderDriver,
      'preferred_gender_passenger': preferredGenderPassenger,
      'max_detour_km': maxDetourKm,
      'min_rating_threshold': minRatingThreshold,
      'auto_accept_threshold': autoAcceptThreshold,
      'notification_settings': notificationSettings,
      'privacy_settings': privacySettings,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'user_id': userId,
      'preferred_gender_driver': preferredGenderDriver,
      'preferred_gender_passenger': preferredGenderPassenger,
      'max_detour_km': maxDetourKm,
      'min_rating_threshold': minRatingThreshold,
      'auto_accept_threshold': autoAcceptThreshold,
      'notification_settings': notificationSettings,
      'privacy_settings': privacySettings,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'user_id': userId,
      'preferred_gender_driver': preferredGenderDriver,
      'preferred_gender_passenger': preferredGenderPassenger,
      'max_detour_km': maxDetourKm,
      'min_rating_threshold': minRatingThreshold,
      'auto_accept_threshold': autoAcceptThreshold,
      'notification_settings': notificationSettings,
      'privacy_settings': privacySettings,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserPreferencesModel && other.id == id && other.userId == userId && other.preferredGenderDriver == preferredGenderDriver && other.preferredGenderPassenger == preferredGenderPassenger && other.maxDetourKm == maxDetourKm && other.minRatingThreshold == minRatingThreshold && other.autoAcceptThreshold == autoAcceptThreshold && other.notificationSettings == notificationSettings && other.privacySettings == privacySettings && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ preferredGenderDriver.hashCode ^ preferredGenderPassenger.hashCode ^ maxDetourKm.hashCode ^ minRatingThreshold.hashCode ^ autoAcceptThreshold.hashCode ^ notificationSettings.hashCode ^ privacySettings.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'UserPreferencesModel(id: $id, userId: $userId, preferredGenderDriver: $preferredGenderDriver, preferredGenderPassenger: $preferredGenderPassenger, maxDetourKm: $maxDetourKm, minRatingThreshold: $minRatingThreshold, autoAcceptThreshold: $autoAcceptThreshold, notificationSettings: $notificationSettings, privacySettings: $privacySettings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  // Primary identifier is already defined as a field
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
