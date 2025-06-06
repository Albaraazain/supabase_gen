import '../utils/geo_json.dart';

/// Generated model class for table bookings
/// Database triggers associated with this table:
/// - update_bookings_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
///   Signature: update_updated_at_column() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
///
class BookingsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References trips(id)
  final String tripId;
  /// Unique field
  /// Non-nullable field
  /// References ride_requests(id)
  final String rideRequestId;
  /// Non-nullable field
  /// References profiles(id)
  final String passengerId;
  /// Non-nullable field
  /// References profiles(id)
  final String driverId;
  /// Non-nullable field
  final int seatsBooked;
  /// Non-nullable field
  final double finalPrice;
  final String? bookingStatus;
  final String? pickupCode;
  final String? paymentStatus;
  final String? paymentMethod;
  /// References profiles(id)
  final String? cancelledBy;
  final String? cancellationReason;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pickedUpAt;
  final DateTime? completedAt;

  BookingsModel({this.id = "", required this.tripId, required this.rideRequestId, required this.passengerId, required this.driverId, required this.seatsBooked, required this.finalPrice, this.bookingStatus, this.pickupCode, this.paymentStatus, this.paymentMethod, this.cancelledBy, this.cancellationReason, this.createdAt, this.updatedAt, this.pickedUpAt, this.completedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(tripId != null, "trip_id constraint violation"); assert(rideRequestId != null, "ride_request_id constraint violation"); assert(passengerId != null, "passenger_id constraint violation"); assert(driverId != null, "driver_id constraint violation"); assert(seatsBooked != null, "seats_booked constraint violation"); assert(finalPrice != null, "final_price constraint violation"); return true; }());

  factory BookingsModel.fromJson(Map<String, dynamic> json) {
    return BookingsModel(
      id: json['id'] ?? '',
      tripId: json['trip_id'] ?? '',
      rideRequestId: json['ride_request_id'] ?? '',
      passengerId: json['passenger_id'] ?? '',
      driverId: json['driver_id'] ?? '',
      seatsBooked: json['seats_booked'] ?? 0,
      finalPrice: _toDouble(json['final_price']) ?? 0.0,
      bookingStatus: json['booking_status'],
      pickupCode: json['pickup_code'],
      paymentStatus: json['payment_status'],
      paymentMethod: json['payment_method'],
      cancelledBy: json['cancelled_by'],
      cancellationReason: json['cancellation_reason'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      pickedUpAt: json['picked_up_at'] != null ? DateTime.parse(json['picked_up_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trip_id': tripId,
      'ride_request_id': rideRequestId,
      'passenger_id': passengerId,
      'driver_id': driverId,
      'seats_booked': seatsBooked,
      'final_price': finalPrice,
      'booking_status': bookingStatus,
      'pickup_code': pickupCode,
      'payment_status': paymentStatus,
      'payment_method': paymentMethod,
      'cancelled_by': cancelledBy,
      'cancellation_reason': cancellationReason,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'picked_up_at': pickedUpAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'trip_id': tripId,
      'ride_request_id': rideRequestId,
      'passenger_id': passengerId,
      'driver_id': driverId,
      'seats_booked': seatsBooked,
      'final_price': finalPrice,
      'booking_status': bookingStatus,
      'pickup_code': pickupCode,
      'payment_status': paymentStatus,
      'payment_method': paymentMethod,
      'cancelled_by': cancelledBy,
      'cancellation_reason': cancellationReason,
      'picked_up_at': pickedUpAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'trip_id': tripId,
      'ride_request_id': rideRequestId,
      'passenger_id': passengerId,
      'driver_id': driverId,
      'seats_booked': seatsBooked,
      'final_price': finalPrice,
      'booking_status': bookingStatus,
      'pickup_code': pickupCode,
      'payment_status': paymentStatus,
      'payment_method': paymentMethod,
      'cancelled_by': cancelledBy,
      'cancellation_reason': cancellationReason,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'picked_up_at': pickedUpAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BookingsModel && other.id == id && other.tripId == tripId && other.rideRequestId == rideRequestId && other.passengerId == passengerId && other.driverId == driverId && other.seatsBooked == seatsBooked && other.finalPrice == finalPrice && other.bookingStatus == bookingStatus && other.pickupCode == pickupCode && other.paymentStatus == paymentStatus && other.paymentMethod == paymentMethod && other.cancelledBy == cancelledBy && other.cancellationReason == cancellationReason && other.createdAt == createdAt && other.updatedAt == updatedAt && other.pickedUpAt == pickedUpAt && other.completedAt == completedAt;
  }

  @override
  int get hashCode => id.hashCode ^ tripId.hashCode ^ rideRequestId.hashCode ^ passengerId.hashCode ^ driverId.hashCode ^ seatsBooked.hashCode ^ finalPrice.hashCode ^ bookingStatus.hashCode ^ pickupCode.hashCode ^ paymentStatus.hashCode ^ paymentMethod.hashCode ^ cancelledBy.hashCode ^ cancellationReason.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ pickedUpAt.hashCode ^ completedAt.hashCode;

  @override
  String toString() {
    return 'BookingsModel(id: $id, tripId: $tripId, rideRequestId: $rideRequestId, passengerId: $passengerId, driverId: $driverId, seatsBooked: $seatsBooked, finalPrice: $finalPrice, bookingStatus: $bookingStatus, pickupCode: $pickupCode, paymentStatus: $paymentStatus, paymentMethod: $paymentMethod, cancelledBy: $cancelledBy, cancellationReason: $cancellationReason, createdAt: $createdAt, updatedAt: $updatedAt, pickedUpAt: $pickedUpAt, completedAt: $completedAt)';
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
