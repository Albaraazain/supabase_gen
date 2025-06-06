import '../utils/geo_json.dart';

/// Generated model class for table trips
/// Database triggers associated with this table:
/// - update_trips_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
///   Signature: update_updated_at_column() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
///
class TripsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References profiles(id)
  final String driverId;
  /// Non-nullable field
  /// References vehicles(id)
  final String vehicleId;
  /// Non-nullable field
  final String originAddress;
  /// Non-nullable field
  final double originLat;
  /// Non-nullable field
  final double originLng;
  final String? originPoint;
  /// Non-nullable field
  final String destinationAddress;
  /// Non-nullable field
  final double destinationLat;
  /// Non-nullable field
  final double destinationLng;
  final String? destinationPoint;
  /// Non-nullable field
  final DateTime departureTime;
  final DateTime? estimatedArrivalTime;
  /// Non-nullable field
  final int availableSeats;
  final double? totalDistanceKm;
  /// Non-nullable field
  final double pricePerSeat;
  final String? currency;
  final String? tripStatus;
  final bool? isRecurring;
  final Map<String, dynamic>? recurringPattern;
  final bool? allowsPets;
  final bool? allowsSmoking;
  final bool? allowsMusic;
  final String? maxLuggageSize;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? startedAt;
  final DateTime? completedAt;

  TripsModel({this.id = "", required this.driverId, required this.vehicleId, required this.originAddress, required this.originLat, required this.originLng, this.originPoint, required this.destinationAddress, required this.destinationLat, required this.destinationLng, this.destinationPoint, DateTime? departureTime, this.estimatedArrivalTime, required this.availableSeats, this.totalDistanceKm, required this.pricePerSeat, this.currency, this.tripStatus, this.isRecurring, this.recurringPattern, this.allowsPets, this.allowsSmoking, this.allowsMusic, this.maxLuggageSize, this.notes, this.createdAt, this.updatedAt, this.startedAt, this.completedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(driverId != null, "driver_id constraint violation"); assert(vehicleId != null, "vehicle_id constraint violation"); assert(originAddress != null, "origin_address constraint violation"); assert(originLat != null, "origin_lat constraint violation"); assert(originLng != null, "origin_lng constraint violation"); assert(destinationAddress != null, "destination_address constraint violation"); assert(destinationLat != null, "destination_lat constraint violation"); assert(destinationLng != null, "destination_lng constraint violation"); assert(departureTime != null, "departure_time constraint violation"); assert(availableSeats != null, "available_seats constraint violation"); assert(pricePerSeat != null, "price_per_seat constraint violation"); return true; }()),
        departureTime = departureTime ?? DateTime.now();

  factory TripsModel.fromJson(Map<String, dynamic> json) {
    return TripsModel(
      id: json['id'] ?? '',
      driverId: json['driver_id'] ?? '',
      vehicleId: json['vehicle_id'] ?? '',
      originAddress: json['origin_address'] ?? '',
      originLat: _toDouble(json['origin_lat']) ?? 0.0,
      originLng: _toDouble(json['origin_lng']) ?? 0.0,
      originPoint: json['origin_point'],
      destinationAddress: json['destination_address'] ?? '',
      destinationLat: _toDouble(json['destination_lat']) ?? 0.0,
      destinationLng: _toDouble(json['destination_lng']) ?? 0.0,
      destinationPoint: json['destination_point'],
      departureTime: DateTime.parse(json['departure_time'].toString()),
      estimatedArrivalTime: json['estimated_arrival_time'] != null ? DateTime.parse(json['estimated_arrival_time'].toString()) : null,
      availableSeats: json['available_seats'] ?? 0,
      totalDistanceKm: json['total_distance_km'] != null ? _toDouble(json['total_distance_km']) : null,
      pricePerSeat: _toDouble(json['price_per_seat']) ?? 0.0,
      currency: json['currency'],
      tripStatus: json['trip_status'],
      isRecurring: json['is_recurring'],
      recurringPattern: json['recurring_pattern'],
      allowsPets: json['allows_pets'],
      allowsSmoking: json['allows_smoking'],
      allowsMusic: json['allows_music'],
      maxLuggageSize: json['max_luggage_size'],
      notes: json['notes'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      startedAt: json['started_at'] != null ? DateTime.parse(json['started_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driver_id': driverId,
      'vehicle_id': vehicleId,
      'origin_address': originAddress,
      'origin_lat': originLat,
      'origin_lng': originLng,
      'origin_point': originPoint,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'destination_point': destinationPoint,
      'departure_time': departureTime.toIso8601String(),
      'estimated_arrival_time': estimatedArrivalTime?.toIso8601String(),
      'available_seats': availableSeats,
      'total_distance_km': totalDistanceKm,
      'price_per_seat': pricePerSeat,
      'currency': currency,
      'trip_status': tripStatus,
      'is_recurring': isRecurring,
      'recurring_pattern': recurringPattern,
      'allows_pets': allowsPets,
      'allows_smoking': allowsSmoking,
      'allows_music': allowsMusic,
      'max_luggage_size': maxLuggageSize,
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'driver_id': driverId,
      'vehicle_id': vehicleId,
      'origin_address': originAddress,
      'origin_lat': originLat,
      'origin_lng': originLng,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'departure_time': departureTime.toIso8601String(),
      'estimated_arrival_time': estimatedArrivalTime?.toIso8601String(),
      'available_seats': availableSeats,
      'total_distance_km': totalDistanceKm,
      'price_per_seat': pricePerSeat,
      'currency': currency,
      'trip_status': tripStatus,
      'is_recurring': isRecurring,
      'recurring_pattern': recurringPattern,
      'allows_pets': allowsPets,
      'allows_smoking': allowsSmoking,
      'allows_music': allowsMusic,
      'max_luggage_size': maxLuggageSize,
      'notes': notes,
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'driver_id': driverId,
      'vehicle_id': vehicleId,
      'origin_address': originAddress,
      'origin_lat': originLat,
      'origin_lng': originLng,
      'destination_address': destinationAddress,
      'destination_lat': destinationLat,
      'destination_lng': destinationLng,
      'departure_time': departureTime.toIso8601String(),
      'estimated_arrival_time': estimatedArrivalTime?.toIso8601String(),
      'available_seats': availableSeats,
      'total_distance_km': totalDistanceKm,
      'price_per_seat': pricePerSeat,
      'currency': currency,
      'trip_status': tripStatus,
      'is_recurring': isRecurring,
      'recurring_pattern': recurringPattern,
      'allows_pets': allowsPets,
      'allows_smoking': allowsSmoking,
      'allows_music': allowsMusic,
      'max_luggage_size': maxLuggageSize,
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TripsModel && other.id == id && other.driverId == driverId && other.vehicleId == vehicleId && other.originAddress == originAddress && other.originLat == originLat && other.originLng == originLng && other.originPoint == originPoint && other.destinationAddress == destinationAddress && other.destinationLat == destinationLat && other.destinationLng == destinationLng && other.destinationPoint == destinationPoint && other.departureTime == departureTime && other.estimatedArrivalTime == estimatedArrivalTime && other.availableSeats == availableSeats && other.totalDistanceKm == totalDistanceKm && other.pricePerSeat == pricePerSeat && other.currency == currency && other.tripStatus == tripStatus && other.isRecurring == isRecurring && other.recurringPattern == recurringPattern && other.allowsPets == allowsPets && other.allowsSmoking == allowsSmoking && other.allowsMusic == allowsMusic && other.maxLuggageSize == maxLuggageSize && other.notes == notes && other.createdAt == createdAt && other.updatedAt == updatedAt && other.startedAt == startedAt && other.completedAt == completedAt;
  }

  @override
  int get hashCode => id.hashCode ^ driverId.hashCode ^ vehicleId.hashCode ^ originAddress.hashCode ^ originLat.hashCode ^ originLng.hashCode ^ originPoint.hashCode ^ destinationAddress.hashCode ^ destinationLat.hashCode ^ destinationLng.hashCode ^ destinationPoint.hashCode ^ departureTime.hashCode ^ estimatedArrivalTime.hashCode ^ availableSeats.hashCode ^ totalDistanceKm.hashCode ^ pricePerSeat.hashCode ^ currency.hashCode ^ tripStatus.hashCode ^ isRecurring.hashCode ^ recurringPattern.hashCode ^ allowsPets.hashCode ^ allowsSmoking.hashCode ^ allowsMusic.hashCode ^ maxLuggageSize.hashCode ^ notes.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ startedAt.hashCode ^ completedAt.hashCode;

  @override
  String toString() {
    return 'TripsModel(id: $id, driverId: $driverId, vehicleId: $vehicleId, originAddress: $originAddress, originLat: $originLat, originLng: $originLng, originPoint: $originPoint, destinationAddress: $destinationAddress, destinationLat: $destinationLat, destinationLng: $destinationLng, destinationPoint: $destinationPoint, departureTime: $departureTime, estimatedArrivalTime: $estimatedArrivalTime, availableSeats: $availableSeats, totalDistanceKm: $totalDistanceKm, pricePerSeat: $pricePerSeat, currency: $currency, tripStatus: $tripStatus, isRecurring: $isRecurring, recurringPattern: $recurringPattern, allowsPets: $allowsPets, allowsSmoking: $allowsSmoking, allowsMusic: $allowsMusic, maxLuggageSize: $maxLuggageSize, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, startedAt: $startedAt, completedAt: $completedAt)';
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
