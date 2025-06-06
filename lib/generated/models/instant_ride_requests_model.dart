import '../utils/geo_json.dart';

/// Generated model class for table instant_ride_requests
/// Database triggers associated with this table:
/// - instant_ride_auto_booking_trigger: UPDATE AFTER - EXECUTE FUNCTION auto_create_ride_on_acceptance()
///   Signature: auto_create_ride_on_acceptance() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  DECLARE   booking_result JSON; BEGIN   -- Only proceed if status changed to 'accepted'   IF NEW.status = 'accepted' ...
/// - instant_ride_request_validation_trigger: INSERT BEFORE - EXECUTE FUNCTION validate_instant_ride_request()
///   Signature: validate_instant_ride_request() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     -- Validate coordinates are reasonable (basic sanity check)     IF NEW.pickup_lat < -90 OR NEW.pickup_lat ...
/// - instant_ride_request_validation_trigger: UPDATE BEFORE - EXECUTE FUNCTION validate_instant_ride_request()
///   Signature: validate_instant_ride_request() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     -- Validate coordinates are reasonable (basic sanity check)     IF NEW.pickup_lat < -90 OR NEW.pickup_lat ...
/// - instant_ride_requests_updated_at_trigger: UPDATE BEFORE - EXECUTE FUNCTION update_instant_ride_requests_updated_at()
///   Signature: update_instant_ride_requests_updated_at() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
///
class InstantRideRequestsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References profiles(id)
  final String passengerId;
  /// Non-nullable field
  final String pickupAddress;
  /// Non-nullable field
  final double pickupLat;
  /// Non-nullable field
  final double pickupLng;
  final String? pickupPoint;
  /// Non-nullable field
  final String destinationAddress;
  /// Non-nullable field
  final double destinationLat;
  /// Non-nullable field
  final double destinationLng;
  final String? destinationPoint;
  final double? estimatedDistanceKm;
  final int? estimatedDurationMinutes;
  /// Non-nullable field
  final double offeredFare;
  final double? maxFareWillingness;
  final double? surgeMultiplier;
  final int? seatsRequested;
  final double? searchRadiusKm;
  final String? status;
  /// References profiles(id)
  final String? matchedDriverId;
  final DateTime? driverResponseDeadline;
  final String? specialRequests;
  final DateTime? requestedAt;
  final DateTime? expiresAt;
  final DateTime? matchedAt;
  final DateTime? acceptedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;
  final String? cancellationReason;
  final String? cancellationBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  InstantRideRequestsModel({this.id = "", required this.passengerId, required this.pickupAddress, required this.pickupLat, required this.pickupLng, this.pickupPoint, required this.destinationAddress, required this.destinationLat, required this.destinationLng, this.destinationPoint, this.estimatedDistanceKm, this.estimatedDurationMinutes, required this.offeredFare, this.maxFareWillingness, this.surgeMultiplier, this.seatsRequested, this.searchRadiusKm, this.status, this.matchedDriverId, this.driverResponseDeadline, this.specialRequests, this.requestedAt, this.expiresAt, this.matchedAt, this.acceptedAt, this.completedAt, this.cancelledAt, this.cancellationReason, this.cancellationBy, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(passengerId != null, "passenger_id constraint violation"); assert(pickupAddress != null, "pickup_address constraint violation"); assert(pickupLat != null, "pickup_lat constraint violation"); assert(pickupLng != null, "pickup_lng constraint violation"); assert(destinationAddress != null, "destination_address constraint violation"); assert(destinationLat != null, "destination_lat constraint violation"); assert(destinationLng != null, "destination_lng constraint violation"); assert(offeredFare != null, "offered_fare constraint violation"); return true; }());

  factory InstantRideRequestsModel.fromJson(Map<String, dynamic> json) {
    return InstantRideRequestsModel(
      id: json['id'] ?? '',
      passengerId: json['passenger_id'] ?? '',
      pickupAddress: json['pickup_address'] ?? '',
      pickupLat: _toDouble(json['pickup_lat']) ?? 0.0,
      pickupLng: _toDouble(json['pickup_lng']) ?? 0.0,
      pickupPoint: json['pickup_point'],
      destinationAddress: json['destination_address'] ?? '',
      destinationLat: _toDouble(json['destination_lat']) ?? 0.0,
      destinationLng: _toDouble(json['destination_lng']) ?? 0.0,
      destinationPoint: json['destination_point'],
      estimatedDistanceKm: json['estimated_distance_km'] != null ? _toDouble(json['estimated_distance_km']) : null,
      estimatedDurationMinutes: json['estimated_duration_minutes'],
      offeredFare: _toDouble(json['offered_fare']) ?? 0.0,
      maxFareWillingness: json['max_fare_willingness'] != null ? _toDouble(json['max_fare_willingness']) : null,
      surgeMultiplier: json['surge_multiplier'] != null ? _toDouble(json['surge_multiplier']) : null,
      seatsRequested: json['seats_requested'],
      searchRadiusKm: json['search_radius_km'] != null ? _toDouble(json['search_radius_km']) : null,
      status: json['status'],
      matchedDriverId: json['matched_driver_id'],
      driverResponseDeadline: json['driver_response_deadline'] != null ? DateTime.parse(json['driver_response_deadline'].toString()) : null,
      specialRequests: json['special_requests'],
      requestedAt: json['requested_at'] != null ? DateTime.parse(json['requested_at'].toString()) : null,
      expiresAt: json['expires_at'] != null ? DateTime.parse(json['expires_at'].toString()) : null,
      matchedAt: json['matched_at'] != null ? DateTime.parse(json['matched_at'].toString()) : null,
      acceptedAt: json['accepted_at'] != null ? DateTime.parse(json['accepted_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
      cancelledAt: json['cancelled_at'] != null ? DateTime.parse(json['cancelled_at'].toString()) : null,
      cancellationReason: json['cancellation_reason'],
      cancellationBy: json['cancellation_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'passenger_id': passengerId,
      'pickup_address': pickupAddress,
      'pickup_lat': pickupLat,
      'pickup_lng': pickupLng,
      'pickup_point': pickupPoint,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'destination_point': destinationPoint,
      'estimated_distance_km': estimatedDistanceKm,
      'estimated_duration_minutes': estimatedDurationMinutes,
      'offered_fare': offeredFare,
      'max_fare_willingness': maxFareWillingness,
      'surge_multiplier': surgeMultiplier,
      'seats_requested': seatsRequested,
      'search_radius_km': searchRadiusKm,
      'status': status,
      'matched_driver_id': matchedDriverId,
      'driver_response_deadline': driverResponseDeadline?.toIso8601String(),
      'special_requests': specialRequests,
      'requested_at': requestedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'matched_at': matchedAt?.toIso8601String(),
      'accepted_at': acceptedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'cancelled_at': cancelledAt?.toIso8601String(),
      'cancellation_reason': cancellationReason,
      'cancellation_by': cancellationBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'passenger_id': passengerId,
      'pickup_address': pickupAddress,
      'pickup_lat': pickupLat,
      'pickup_lng': pickupLng,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'estimated_distance_km': estimatedDistanceKm,
      'estimated_duration_minutes': estimatedDurationMinutes,
      'offered_fare': offeredFare,
      'max_fare_willingness': maxFareWillingness,
      'surge_multiplier': surgeMultiplier,
      'seats_requested': seatsRequested,
      'search_radius_km': searchRadiusKm,
      'status': status,
      'matched_driver_id': matchedDriverId,
      'driver_response_deadline': driverResponseDeadline?.toIso8601String(),
      'special_requests': specialRequests,
      'matched_at': matchedAt?.toIso8601String(),
      'accepted_at': acceptedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'cancelled_at': cancelledAt?.toIso8601String(),
      'cancellation_reason': cancellationReason,
      'cancellation_by': cancellationBy,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'passenger_id': passengerId,
      'pickup_address': pickupAddress,
      'pickup_lat': pickupLat,
      'pickup_lng': pickupLng,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'estimated_distance_km': estimatedDistanceKm,
      'estimated_duration_minutes': estimatedDurationMinutes,
      'offered_fare': offeredFare,
      'max_fare_willingness': maxFareWillingness,
      'surge_multiplier': surgeMultiplier,
      'seats_requested': seatsRequested,
      'search_radius_km': searchRadiusKm,
      'status': status,
      'matched_driver_id': matchedDriverId,
      'driver_response_deadline': driverResponseDeadline?.toIso8601String(),
      'special_requests': specialRequests,
      'requested_at': requestedAt?.toIso8601String(),
      'expires_at': expiresAt?.toIso8601String(),
      'matched_at': matchedAt?.toIso8601String(),
      'accepted_at': acceptedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'cancelled_at': cancelledAt?.toIso8601String(),
      'cancellation_reason': cancellationReason,
      'cancellation_by': cancellationBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstantRideRequestsModel && other.id == id && other.passengerId == passengerId && other.pickupAddress == pickupAddress && other.pickupLat == pickupLat && other.pickupLng == pickupLng && other.pickupPoint == pickupPoint && other.destinationAddress == destinationAddress && other.destinationLat == destinationLat && other.destinationLng == destinationLng && other.destinationPoint == destinationPoint && other.estimatedDistanceKm == estimatedDistanceKm && other.estimatedDurationMinutes == estimatedDurationMinutes && other.offeredFare == offeredFare && other.maxFareWillingness == maxFareWillingness && other.surgeMultiplier == surgeMultiplier && other.seatsRequested == seatsRequested && other.searchRadiusKm == searchRadiusKm && other.status == status && other.matchedDriverId == matchedDriverId && other.driverResponseDeadline == driverResponseDeadline && other.specialRequests == specialRequests && other.requestedAt == requestedAt && other.expiresAt == expiresAt && other.matchedAt == matchedAt && other.acceptedAt == acceptedAt && other.completedAt == completedAt && other.cancelledAt == cancelledAt && other.cancellationReason == cancellationReason && other.cancellationBy == cancellationBy && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ passengerId.hashCode ^ pickupAddress.hashCode ^ pickupLat.hashCode ^ pickupLng.hashCode ^ pickupPoint.hashCode ^ destinationAddress.hashCode ^ destinationLat.hashCode ^ destinationLng.hashCode ^ destinationPoint.hashCode ^ estimatedDistanceKm.hashCode ^ estimatedDurationMinutes.hashCode ^ offeredFare.hashCode ^ maxFareWillingness.hashCode ^ surgeMultiplier.hashCode ^ seatsRequested.hashCode ^ searchRadiusKm.hashCode ^ status.hashCode ^ matchedDriverId.hashCode ^ driverResponseDeadline.hashCode ^ specialRequests.hashCode ^ requestedAt.hashCode ^ expiresAt.hashCode ^ matchedAt.hashCode ^ acceptedAt.hashCode ^ completedAt.hashCode ^ cancelledAt.hashCode ^ cancellationReason.hashCode ^ cancellationBy.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'InstantRideRequestsModel(id: $id, passengerId: $passengerId, pickupAddress: $pickupAddress, pickupLat: $pickupLat, pickupLng: $pickupLng, pickupPoint: $pickupPoint, destinationAddress: $destinationAddress, destinationLat: $destinationLat, destinationLng: $destinationLng, destinationPoint: $destinationPoint, estimatedDistanceKm: $estimatedDistanceKm, estimatedDurationMinutes: $estimatedDurationMinutes, offeredFare: $offeredFare, maxFareWillingness: $maxFareWillingness, surgeMultiplier: $surgeMultiplier, seatsRequested: $seatsRequested, searchRadiusKm: $searchRadiusKm, status: $status, matchedDriverId: $matchedDriverId, driverResponseDeadline: $driverResponseDeadline, specialRequests: $specialRequests, requestedAt: $requestedAt, expiresAt: $expiresAt, matchedAt: $matchedAt, acceptedAt: $acceptedAt, completedAt: $completedAt, cancelledAt: $cancelledAt, cancellationReason: $cancellationReason, cancellationBy: $cancellationBy, createdAt: $createdAt, updatedAt: $updatedAt)';
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
