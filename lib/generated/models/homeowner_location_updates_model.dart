import '../utils/geo_json.dart';

/// Generated model class for table homeowner_location_updates
class HomeownerLocationUpdatesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  final String homeownerId;
  /// Non-nullable field
  final double latitude;
  /// Non-nullable field
  final double longitude;
  /// Unique field
  /// Non-nullable field
  final DateTime createdAt;

  HomeownerLocationUpdatesModel({this.id = "", required this.homeownerId, required this.latitude, required this.longitude, DateTime? createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(homeownerId != null, "homeowner_id constraint violation"); assert(latitude != null, "latitude constraint violation"); assert(longitude != null, "longitude constraint violation"); assert(createdAt != null, "created_at constraint violation"); return true; }()),
        createdAt = createdAt ?? DateTime.now();

  factory HomeownerLocationUpdatesModel.fromJson(Map<String, dynamic> json) {
    return HomeownerLocationUpdatesModel(
      id: json['id'] ?? '',
      homeownerId: json['homeowner_id'] ?? '',
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'homeowner_id': homeownerId,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HomeownerLocationUpdatesModel && other.id == id && other.homeownerId == homeownerId && other.latitude == latitude && other.longitude == longitude && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ homeownerId.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'HomeownerLocationUpdatesModel(id: $id, homeownerId: $homeownerId, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
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
