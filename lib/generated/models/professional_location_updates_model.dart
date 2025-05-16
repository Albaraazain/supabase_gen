import '../utils/geo_json.dart';

/// Generated model class for table professional_location_updates
class ProfessionalLocationUpdatesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  final String professionalId;
  /// Non-nullable field
  final double latitude;
  /// Non-nullable field
  final double longitude;
  /// Non-nullable field
  final bool isOnline;
  /// Unique field
  /// Non-nullable field
  final DateTime createdAt;

  ProfessionalLocationUpdatesModel({this.id = "", required this.professionalId, required this.latitude, required this.longitude, this.isOnline = true, DateTime? createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(professionalId != null, "professional_id constraint violation"); assert(latitude != null, "latitude constraint violation"); assert(longitude != null, "longitude constraint violation"); assert(isOnline != null, "is_online constraint violation"); assert(createdAt != null, "created_at constraint violation"); return true; }()),
        createdAt = createdAt ?? DateTime.now();

  factory ProfessionalLocationUpdatesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalLocationUpdatesModel(
      id: json['id'] ?? '',
      professionalId: json['professional_id'] ?? '',
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      isOnline: json['is_online'] ?? false,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professional_id': professionalId,
      'latitude': latitude,
      'longitude': longitude,
      'is_online': isOnline,
      'created_at': createdAt.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfessionalLocationUpdatesModel && other.id == id && other.professionalId == professionalId && other.latitude == latitude && other.longitude == longitude && other.isOnline == isOnline && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ professionalId.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ isOnline.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'ProfessionalLocationUpdatesModel(id: $id, professionalId: $professionalId, latitude: $latitude, longitude: $longitude, isOnline: $isOnline, createdAt: $createdAt)';
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
