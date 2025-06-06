import '../utils/geo_json.dart';

/// Generated model class for table ride_requests
class RideRequestsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  /// References trips(id)
  final String tripId;
  /// Unique field
  /// Non-nullable field
  /// References profiles(id)
  final String passengerId;
  /// Non-nullable field
  final int seatsRequested;
  final String? pickupAddress;
  final double? pickupLat;
  final double? pickupLng;
  final String? pickupPoint;
  final String? dropoffAddress;
  final double? dropoffLat;
  final double? dropoffLng;
  final String? dropoffPoint;
  /// Non-nullable field
  final double offeredPricePerSeat;
  final double? totalOfferedPrice;
  final String? status;
  final String? messageToDriver;
  final String? driverResponseMessage;
  final DateTime? requestedAt;
  final DateTime? respondedAt;
  final DateTime? expiresAt;

  RideRequestsModel({this.id = "", required this.tripId, required this.passengerId, this.seatsRequested = 1, this.pickupAddress, this.pickupLat, this.pickupLng, this.pickupPoint, this.dropoffAddress, this.dropoffLat, this.dropoffLng, this.dropoffPoint, required this.offeredPricePerSeat, this.totalOfferedPrice, this.status, this.messageToDriver, this.driverResponseMessage, this.requestedAt, this.respondedAt, this.expiresAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(tripId != null, "trip_id constraint violation"); assert(passengerId != null, "passenger_id constraint violation"); assert(seatsRequested != null, "seats_requested constraint violation"); assert(offeredPricePerSeat != null, "offered_price_per_seat constraint violation"); return true; }());

  factory RideRequestsModel.fromJson(Map<String, dynamic> json) {
    return RideRequestsModel(
      id: json['id'] ?? '',
      tripId: json['trip_id'] ?? '',
      passengerId: json['passenger_id'] ?? '',
      seatsRequested: json['seats_requested'] ?? 0,
      pickupAddress: json['pickup_address'],
      pickupLat: json['pickup_lat'] != null ? _toDouble(json['pickup_lat']) : null,
      pickupLng: json['pickup_lng'] != null ? _toDouble(json['pickup_lng']) : null,
      pickupPoint: json['pickup_point'],
      dropoffAddress: json['dropoff_address'],
      dropoffLat: json['dropoff_lat'] != null ? _toDouble(json['dropoff_lat']) : null,
      dropoffLng: json['dropoff_lng'] != null ? _toDouble(json['dropoff_lng']) : null,
      dropoffPoint: json['dropoff_point'],
      offeredPricePerSeat: _toDouble(json['offered_price_per_seat']) ?? 0.0,
      totalOfferedPrice: json['total_offered_price'] != null ? _toDouble(json['total_offered_price']) : null,
      status: json['status'],
      messageToDriver: json['message_to_driver'],
      driverResponseMessage: json['driver_response_message'],
      requestedAt: json['requested_at'] != null ? DateTime.parse(json['requested_at'].toString()) : null,
      respondedAt: json['responded_at'] != null ? DateTime.parse(json['responded_at'].toString()) : null,
      expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trip_id': tripId,
      'passenger_id': passengerId,
      'seats_requested': seatsRequested,
      'pickup_address': pickupAddress,
      'pickup_lat': pickupLat,
      'pickup_lng': pickupLng,
      'pickup_point': pickupPoint,
      'dropoff_address': dropoffAddress,
      'dropoff_lat': dropoffLat,
      'dropoff_lng': dropoffLng,
      'dropoff_point': dropoffPoint,
      'offered_price_per_seat': offeredPricePerSeat,
      'total_offered_price': totalOfferedPrice,
      'status': status,
      'message_to_driver': messageToDriver,
      'driver_response_message': driverResponseMessage,
      'requested_at': requestedAt?.toIso8601String(),
      'responded_at': respondedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'trip_id': tripId,
      'passenger_id': passengerId,
      'seats_requested': seatsRequested,
      'pickup_address': pickupAddress,
      'pickup_lat': pickupLat,
      'pickup_lng': pickupLng,
      'dropoff_address': dropoffAddress,
      'dropoff_lat': dropoffLat,
      'dropoff_lng': dropoffLng,
      'offered_price_per_seat': offeredPricePerSeat,
      'status': status,
      'message_to_driver': messageToDriver,
      'driver_response_message': driverResponseMessage,
      'responded_at': respondedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'trip_id': tripId,
      'passenger_id': passengerId,
      'seats_requested': seatsRequested,
      'pickup_address': pickupAddress,
      'pickup_lat': pickupLat,
      'pickup_lng': pickupLng,
      'dropoff_address': dropoffAddress,
      'dropoff_lat': dropoffLat,
      'dropoff_lng': dropoffLng,
      'offered_price_per_seat': offeredPricePerSeat,
      'status': status,
      'message_to_driver': messageToDriver,
      'driver_response_message': driverResponseMessage,
      'requested_at': requestedAt?.toIso8601String(),
      'responded_at': respondedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RideRequestsModel && other.id == id && other.tripId == tripId && other.passengerId == passengerId && other.seatsRequested == seatsRequested && other.pickupAddress == pickupAddress && other.pickupLat == pickupLat && other.pickupLng == pickupLng && other.pickupPoint == pickupPoint && other.dropoffAddress == dropoffAddress && other.dropoffLat == dropoffLat && other.dropoffLng == dropoffLng && other.dropoffPoint == dropoffPoint && other.offeredPricePerSeat == offeredPricePerSeat && other.totalOfferedPrice == totalOfferedPrice && other.status == status && other.messageToDriver == messageToDriver && other.driverResponseMessage == driverResponseMessage && other.requestedAt == requestedAt && other.respondedAt == respondedAt && other.expiresAt == expiresAt;
  }

  @override
  int get hashCode => id.hashCode ^ tripId.hashCode ^ passengerId.hashCode ^ seatsRequested.hashCode ^ pickupAddress.hashCode ^ pickupLat.hashCode ^ pickupLng.hashCode ^ pickupPoint.hashCode ^ dropoffAddress.hashCode ^ dropoffLat.hashCode ^ dropoffLng.hashCode ^ dropoffPoint.hashCode ^ offeredPricePerSeat.hashCode ^ totalOfferedPrice.hashCode ^ status.hashCode ^ messageToDriver.hashCode ^ driverResponseMessage.hashCode ^ requestedAt.hashCode ^ respondedAt.hashCode ^ expiresAt.hashCode;

  @override
  String toString() {
    return 'RideRequestsModel(id: $id, tripId: $tripId, passengerId: $passengerId, seatsRequested: $seatsRequested, pickupAddress: $pickupAddress, pickupLat: $pickupLat, pickupLng: $pickupLng, pickupPoint: $pickupPoint, dropoffAddress: $dropoffAddress, dropoffLat: $dropoffLat, dropoffLng: $dropoffLng, dropoffPoint: $dropoffPoint, offeredPricePerSeat: $offeredPricePerSeat, totalOfferedPrice: $totalOfferedPrice, status: $status, messageToDriver: $messageToDriver, driverResponseMessage: $driverResponseMessage, requestedAt: $requestedAt, respondedAt: $respondedAt, expiresAt: $expiresAt)';
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
