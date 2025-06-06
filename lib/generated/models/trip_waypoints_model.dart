import '../utils/geo_json.dart';

/// Generated model class for table trip_waypoints
class TripWaypointsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  /// References trips(id)
  final String tripId;
  /// Non-nullable field
  final String address;
  /// Non-nullable field
  final double lat;
  /// Non-nullable field
  final double lng;
  final String? point;
  /// Unique field
  /// Non-nullable field
  final int orderIndex;
  final DateTime? estimatedArrivalTime;
  final DateTime? createdAt;

  TripWaypointsModel({this.id = "", required this.tripId, required this.address, required this.lat, required this.lng, this.point, required this.orderIndex, this.estimatedArrivalTime, this.createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(tripId != null, "trip_id constraint violation"); assert(address != null, "address constraint violation"); assert(lat != null, "lat constraint violation"); assert(lng != null, "lng constraint violation"); assert(orderIndex != null, "order_index constraint violation"); return true; }());

  factory TripWaypointsModel.fromJson(Map<String, dynamic> json) {
    return TripWaypointsModel(
      id: json['id'] ?? '',
      tripId: json['trip_id'] ?? '',
      address: json['address'] ?? '',
      lat: _toDouble(json['lat']) ?? 0.0,
      lng: _toDouble(json['lng']) ?? 0.0,
      point: json['point'],
      orderIndex: json['order_index'] ?? 0,
      estimatedArrivalTime: json['estimated_arrival_time'] != null ? DateTime.parse(json['estimated_arrival_time'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trip_id': tripId,
      'address': address,
      'lat': lat,
      'lng': lng,
      'point': point,
      'order_index': orderIndex,
      'estimated_arrival_time': estimatedArrivalTime?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'trip_id': tripId,
      'address': address,
      'lat': lat,
      'lng': lng,
      'order_index': orderIndex,
      'estimated_arrival_time': estimatedArrivalTime?.toIso8601String(),
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'trip_id': tripId,
      'address': address,
      'lat': lat,
      'lng': lng,
      'order_index': orderIndex,
      'estimated_arrival_time': estimatedArrivalTime?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripWaypointsModel && other.id == id && other.tripId == tripId && other.address == address && other.lat == lat && other.lng == lng && other.point == point && other.orderIndex == orderIndex && other.estimatedArrivalTime == estimatedArrivalTime && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ tripId.hashCode ^ address.hashCode ^ lat.hashCode ^ lng.hashCode ^ point.hashCode ^ orderIndex.hashCode ^ estimatedArrivalTime.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'TripWaypointsModel(id: $id, tripId: $tripId, address: $address, lat: $lat, lng: $lng, point: $point, orderIndex: $orderIndex, estimatedArrivalTime: $estimatedArrivalTime, createdAt: $createdAt)';
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
