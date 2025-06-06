import '../utils/geo_json.dart';

/// Generated model class for table driver_locations
/// Database triggers associated with this table:
/// - trigger_update_driver_locations_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_driver_location_updated_at()
///   Signature: update_driver_location_updated_at() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
///
class DriverLocationsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References profiles(id)
  final String driverId;
  /// Non-nullable field
  final double latitude;
  /// Non-nullable field
  final double longitude;
  final double? heading;
  final double? speed;
  final double? accuracy;
  /// Non-nullable field
  final bool isOnline;
  /// Non-nullable field
  final bool isDriving;
  /// References trips(id)
  final String? currentTripId;
  final String? locationPoint;
  final DateTime? updatedAt;
  final DateTime? createdAt;

  DriverLocationsModel({this.id = "", required this.driverId, required this.latitude, required this.longitude, this.heading, this.speed, this.accuracy, this.isOnline = false, this.isDriving = false, this.currentTripId, this.locationPoint, this.updatedAt, this.createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(driverId != null, "driver_id constraint violation"); assert(latitude != null, "latitude constraint violation"); assert(longitude != null, "longitude constraint violation"); assert(isOnline != null, "is_online constraint violation"); assert(isDriving != null, "is_driving constraint violation"); return true; }());

  factory DriverLocationsModel.fromJson(Map<String, dynamic> json) {
    return DriverLocationsModel(
      id: json['id'] ?? '',
      driverId: json['driver_id'] ?? '',
      latitude: _toDouble(json['latitude']) ?? 0.0,
      longitude: _toDouble(json['longitude']) ?? 0.0,
      heading: json['heading'] != null ? _toDouble(json['heading']) : null,
      speed: json['speed'] != null ? _toDouble(json['speed']) : null,
      accuracy: json['accuracy'] != null ? _toDouble(json['accuracy']) : null,
      isOnline: json['is_online'] ?? false,
      isDriving: json['is_driving'] ?? false,
      currentTripId: json['current_trip_id'],
      locationPoint: json['location_point'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driver_id': driverId,
      'latitude': latitude,
      'longitude': longitude,
      'heading': heading,
      'speed': speed,
      'accuracy': accuracy,
      'is_online': isOnline,
      'is_driving': isDriving,
      'current_trip_id': currentTripId,
      'location_point': locationPoint,
      'updated_at': updatedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'driver_id': driverId,
      'latitude': latitude,
      'longitude': longitude,
      'heading': heading,
      'speed': speed,
      'accuracy': accuracy,
      'is_online': isOnline,
      'is_driving': isDriving,
      'current_trip_id': currentTripId,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'driver_id': driverId,
      'latitude': latitude,
      'longitude': longitude,
      'heading': heading,
      'speed': speed,
      'accuracy': accuracy,
      'is_online': isOnline,
      'is_driving': isDriving,
      'current_trip_id': currentTripId,
      'updated_at': updatedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DriverLocationsModel && other.id == id && other.driverId == driverId && other.latitude == latitude && other.longitude == longitude && other.heading == heading && other.speed == speed && other.accuracy == accuracy && other.isOnline == isOnline && other.isDriving == isDriving && other.currentTripId == currentTripId && other.locationPoint == locationPoint && other.updatedAt == updatedAt && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ driverId.hashCode ^ latitude.hashCode ^ longitude.hashCode ^ heading.hashCode ^ speed.hashCode ^ accuracy.hashCode ^ isOnline.hashCode ^ isDriving.hashCode ^ currentTripId.hashCode ^ locationPoint.hashCode ^ updatedAt.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'DriverLocationsModel(id: $id, driverId: $driverId, latitude: $latitude, longitude: $longitude, heading: $heading, speed: $speed, accuracy: $accuracy, isOnline: $isOnline, isDriving: $isDriving, currentTripId: $currentTripId, locationPoint: $locationPoint, updatedAt: $updatedAt, createdAt: $createdAt)';
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
