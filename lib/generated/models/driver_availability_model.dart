import '../utils/geo_json.dart';

/// Generated model class for table driver_availability
/// Database triggers associated with this table:
/// - driver_availability_updated_at_trigger: UPDATE BEFORE - EXECUTE FUNCTION update_driver_availability_updated_at()
///   Signature: update_driver_availability_updated_at() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
/// - driver_availability_validation_trigger: INSERT BEFORE - EXECUTE FUNCTION validate_driver_availability()
///   Signature: validate_driver_availability() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     -- Validate coordinates if provided     IF NEW.current_location_lat IS NOT NULL AND NEW.current_location_l...
/// - driver_availability_validation_trigger: UPDATE BEFORE - EXECUTE FUNCTION validate_driver_availability()
///   Signature: validate_driver_availability() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN     -- Validate coordinates if provided     IF NEW.current_location_lat IS NOT NULL AND NEW.current_location_l...
///
class DriverAvailabilityModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  /// References profiles(id)
  final String driverId;
  final bool? isAvailableForInstantRides;
  final double? maxPickupDistanceKm;
  final List<String>? preferredRideTypes;
  final bool? autoAcceptRides;
  final double? minimumFare;
  final int? maximumPassengers;
  final bool? acceptsPets;
  final bool? acceptsSmoking;
  final List<String>? vehicleAmenities;
  final List<String>? preferredPaymentMethods;
  final double? surgeMultiplierThreshold;
  final DateTime? breakTimeStart;
  final DateTime? breakTimeEnd;
  final double? currentLocationLat;
  final double? currentLocationLng;
  final String? currentLocationPoint;
  final double? heading;
  final double? speedKmh;
  final int? batteryLevel;
  final int? fuelLevelPercent;
  final DateTime? lastRideCompletedAt;
  final DateTime? availableFrom;
  final DateTime? availableUntil;
  final List<int>? availableDays;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  DriverAvailabilityModel({this.id = "", required this.driverId, this.isAvailableForInstantRides, this.maxPickupDistanceKm, this.preferredRideTypes, this.autoAcceptRides, this.minimumFare, this.maximumPassengers, this.acceptsPets, this.acceptsSmoking, this.vehicleAmenities, this.preferredPaymentMethods, this.surgeMultiplierThreshold, this.breakTimeStart, this.breakTimeEnd, this.currentLocationLat, this.currentLocationLng, this.currentLocationPoint, this.heading, this.speedKmh, this.batteryLevel, this.fuelLevelPercent, this.lastRideCompletedAt, this.availableFrom, this.availableUntil, this.availableDays, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(driverId != null, "driver_id constraint violation"); return true; }());

  factory DriverAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return DriverAvailabilityModel(
      id: json['id'] ?? '',
      driverId: json['driver_id'] ?? '',
      isAvailableForInstantRides: json['is_available_for_instant_rides'],
      maxPickupDistanceKm: json['max_pickup_distance_km'] != null ? _toDouble(json['max_pickup_distance_km']) : null,
      preferredRideTypes: json['preferred_ride_types'] != null ? (json['preferred_ride_types'] as List).cast<String>() : null,
      autoAcceptRides: json['auto_accept_rides'],
      minimumFare: json['minimum_fare'] != null ? _toDouble(json['minimum_fare']) : null,
      maximumPassengers: json['maximum_passengers'],
      acceptsPets: json['accepts_pets'],
      acceptsSmoking: json['accepts_smoking'],
      vehicleAmenities: json['vehicle_amenities'] != null ? (json['vehicle_amenities'] as List).cast<String>() : null,
      preferredPaymentMethods: json['preferred_payment_methods'] != null ? (json['preferred_payment_methods'] as List).cast<String>() : null,
      surgeMultiplierThreshold: json['surge_multiplier_threshold'] != null ? _toDouble(json['surge_multiplier_threshold']) : null,
      breakTimeStart: json['break_time_start'] != null ? _parseTime(json['break_time_start'].toString()) : null,
      breakTimeEnd: json['break_time_end'] != null ? _parseTime(json['break_time_end'].toString()) : null,
      currentLocationLat: json['current_location_lat'] != null ? _toDouble(json['current_location_lat']) : null,
      currentLocationLng: json['current_location_lng'] != null ? _toDouble(json['current_location_lng']) : null,
      currentLocationPoint: json['current_location_point'],
      heading: json['heading'] != null ? _toDouble(json['heading']) : null,
      speedKmh: json['speed_kmh'] != null ? _toDouble(json['speed_kmh']) : null,
      batteryLevel: json['battery_level'],
      fuelLevelPercent: json['fuel_level_percent'],
      lastRideCompletedAt: json['last_ride_completed_at'] != null ? DateTime.parse(json['last_ride_completed_at'].toString()) : null,
      availableFrom: json['available_from'] != null ? _parseTime(json['available_from'].toString()) : null,
      availableUntil: json['available_until'] != null ? _parseTime(json['available_until'].toString()) : null,
      availableDays: json['available_days'] != null ? (json['available_days'] as List).cast<int>() : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'driver_id': driverId,
      'is_available_for_instant_rides': isAvailableForInstantRides,
      'max_pickup_distance_km': maxPickupDistanceKm,
      'preferred_ride_types': preferredRideTypes,
      'auto_accept_rides': autoAcceptRides,
      'minimum_fare': minimumFare,
      'maximum_passengers': maximumPassengers,
      'accepts_pets': acceptsPets,
      'accepts_smoking': acceptsSmoking,
      'vehicle_amenities': vehicleAmenities,
      'preferred_payment_methods': preferredPaymentMethods,
      'surge_multiplier_threshold': surgeMultiplierThreshold,
      'break_time_start': breakTimeStart != null ? "${breakTimeStart!.hour.toString().padLeft(2, '0')}:${breakTimeStart!.minute.toString().padLeft(2, '0')}:${breakTimeStart!.second.toString().padLeft(2, '0')}" : null,
      'break_time_end': breakTimeEnd != null ? "${breakTimeEnd!.hour.toString().padLeft(2, '0')}:${breakTimeEnd!.minute.toString().padLeft(2, '0')}:${breakTimeEnd!.second.toString().padLeft(2, '0')}" : null,
      'current_location_lat': currentLocationLat,
      'current_location_lng': currentLocationLng,
      'current_location_point': currentLocationPoint,
      'heading': heading,
      'speed_kmh': speedKmh,
      'battery_level': batteryLevel,
      'fuel_level_percent': fuelLevelPercent,
      'last_ride_completed_at': lastRideCompletedAt?.toIso8601String(),
      'available_from': availableFrom != null ? "${availableFrom!.hour.toString().padLeft(2, '0')}:${availableFrom!.minute.toString().padLeft(2, '0')}:${availableFrom!.second.toString().padLeft(2, '0')}" : null,
      'available_until': availableUntil != null ? "${availableUntil!.hour.toString().padLeft(2, '0')}:${availableUntil!.minute.toString().padLeft(2, '0')}:${availableUntil!.second.toString().padLeft(2, '0')}" : null,
      'available_days': availableDays,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'driver_id': driverId,
      'is_available_for_instant_rides': isAvailableForInstantRides,
      'max_pickup_distance_km': maxPickupDistanceKm,
      'preferred_ride_types': preferredRideTypes,
      'auto_accept_rides': autoAcceptRides,
      'minimum_fare': minimumFare,
      'maximum_passengers': maximumPassengers,
      'accepts_pets': acceptsPets,
      'accepts_smoking': acceptsSmoking,
      'vehicle_amenities': vehicleAmenities,
      'preferred_payment_methods': preferredPaymentMethods,
      'surge_multiplier_threshold': surgeMultiplierThreshold,
      'break_time_start': breakTimeStart != null ? "${breakTimeStart!.hour.toString().padLeft(2, '0')}:${breakTimeStart!.minute.toString().padLeft(2, '0')}:${breakTimeStart!.second.toString().padLeft(2, '0')}" : null,
      'break_time_end': breakTimeEnd != null ? "${breakTimeEnd!.hour.toString().padLeft(2, '0')}:${breakTimeEnd!.minute.toString().padLeft(2, '0')}:${breakTimeEnd!.second.toString().padLeft(2, '0')}" : null,
      'current_location_lat': currentLocationLat,
      'current_location_lng': currentLocationLng,
      'heading': heading,
      'speed_kmh': speedKmh,
      'battery_level': batteryLevel,
      'fuel_level_percent': fuelLevelPercent,
      'last_ride_completed_at': lastRideCompletedAt?.toIso8601String(),
      'available_from': availableFrom != null ? "${availableFrom!.hour.toString().padLeft(2, '0')}:${availableFrom!.minute.toString().padLeft(2, '0')}:${availableFrom!.second.toString().padLeft(2, '0')}" : null,
      'available_until': availableUntil != null ? "${availableUntil!.hour.toString().padLeft(2, '0')}:${availableUntil!.minute.toString().padLeft(2, '0')}:${availableUntil!.second.toString().padLeft(2, '0')}" : null,
      'available_days': availableDays,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'driver_id': driverId,
      'is_available_for_instant_rides': isAvailableForInstantRides,
      'max_pickup_distance_km': maxPickupDistanceKm,
      'preferred_ride_types': preferredRideTypes,
      'auto_accept_rides': autoAcceptRides,
      'minimum_fare': minimumFare,
      'maximum_passengers': maximumPassengers,
      'accepts_pets': acceptsPets,
      'accepts_smoking': acceptsSmoking,
      'vehicle_amenities': vehicleAmenities,
      'preferred_payment_methods': preferredPaymentMethods,
      'surge_multiplier_threshold': surgeMultiplierThreshold,
      'break_time_start': breakTimeStart != null ? "${breakTimeStart!.hour.toString().padLeft(2, '0')}:${breakTimeStart!.minute.toString().padLeft(2, '0')}:${breakTimeStart!.second.toString().padLeft(2, '0')}" : null,
      'break_time_end': breakTimeEnd != null ? "${breakTimeEnd!.hour.toString().padLeft(2, '0')}:${breakTimeEnd!.minute.toString().padLeft(2, '0')}:${breakTimeEnd!.second.toString().padLeft(2, '0')}" : null,
      'current_location_lat': currentLocationLat,
      'current_location_lng': currentLocationLng,
      'heading': heading,
      'speed_kmh': speedKmh,
      'battery_level': batteryLevel,
      'fuel_level_percent': fuelLevelPercent,
      'last_ride_completed_at': lastRideCompletedAt?.toIso8601String(),
      'available_from': availableFrom != null ? "${availableFrom!.hour.toString().padLeft(2, '0')}:${availableFrom!.minute.toString().padLeft(2, '0')}:${availableFrom!.second.toString().padLeft(2, '0')}" : null,
      'available_until': availableUntil != null ? "${availableUntil!.hour.toString().padLeft(2, '0')}:${availableUntil!.minute.toString().padLeft(2, '0')}:${availableUntil!.second.toString().padLeft(2, '0')}" : null,
      'available_days': availableDays,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DriverAvailabilityModel && other.id == id && other.driverId == driverId && other.isAvailableForInstantRides == isAvailableForInstantRides && other.maxPickupDistanceKm == maxPickupDistanceKm && other.preferredRideTypes == preferredRideTypes && other.autoAcceptRides == autoAcceptRides && other.minimumFare == minimumFare && other.maximumPassengers == maximumPassengers && other.acceptsPets == acceptsPets && other.acceptsSmoking == acceptsSmoking && other.vehicleAmenities == vehicleAmenities && other.preferredPaymentMethods == preferredPaymentMethods && other.surgeMultiplierThreshold == surgeMultiplierThreshold && other.breakTimeStart == breakTimeStart && other.breakTimeEnd == breakTimeEnd && other.currentLocationLat == currentLocationLat && other.currentLocationLng == currentLocationLng && other.currentLocationPoint == currentLocationPoint && other.heading == heading && other.speedKmh == speedKmh && other.batteryLevel == batteryLevel && other.fuelLevelPercent == fuelLevelPercent && other.lastRideCompletedAt == lastRideCompletedAt && other.availableFrom == availableFrom && other.availableUntil == availableUntil && other.availableDays == availableDays && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ driverId.hashCode ^ isAvailableForInstantRides.hashCode ^ maxPickupDistanceKm.hashCode ^ preferredRideTypes.hashCode ^ autoAcceptRides.hashCode ^ minimumFare.hashCode ^ maximumPassengers.hashCode ^ acceptsPets.hashCode ^ acceptsSmoking.hashCode ^ vehicleAmenities.hashCode ^ preferredPaymentMethods.hashCode ^ surgeMultiplierThreshold.hashCode ^ breakTimeStart.hashCode ^ breakTimeEnd.hashCode ^ currentLocationLat.hashCode ^ currentLocationLng.hashCode ^ currentLocationPoint.hashCode ^ heading.hashCode ^ speedKmh.hashCode ^ batteryLevel.hashCode ^ fuelLevelPercent.hashCode ^ lastRideCompletedAt.hashCode ^ availableFrom.hashCode ^ availableUntil.hashCode ^ availableDays.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'DriverAvailabilityModel(id: $id, driverId: $driverId, isAvailableForInstantRides: $isAvailableForInstantRides, maxPickupDistanceKm: $maxPickupDistanceKm, preferredRideTypes: $preferredRideTypes, autoAcceptRides: $autoAcceptRides, minimumFare: $minimumFare, maximumPassengers: $maximumPassengers, acceptsPets: $acceptsPets, acceptsSmoking: $acceptsSmoking, vehicleAmenities: $vehicleAmenities, preferredPaymentMethods: $preferredPaymentMethods, surgeMultiplierThreshold: $surgeMultiplierThreshold, breakTimeStart: $breakTimeStart, breakTimeEnd: $breakTimeEnd, currentLocationLat: $currentLocationLat, currentLocationLng: $currentLocationLng, currentLocationPoint: $currentLocationPoint, heading: $heading, speedKmh: $speedKmh, batteryLevel: $batteryLevel, fuelLevelPercent: $fuelLevelPercent, lastRideCompletedAt: $lastRideCompletedAt, availableFrom: $availableFrom, availableUntil: $availableUntil, availableDays: $availableDays, createdAt: $createdAt, updatedAt: $updatedAt)';
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

  /// Helper function to parse TIME format (HH:MM:SS)
  DateTime _parseTime(String timeStr) {
    final parts = timeStr.split(':');
    return DateTime(
      1970, 1, 1, // epoch date
      int.parse(parts[0]), // hour
      int.parse(parts[1]), // minute
      int.parse(parts[2])  // second
    );
  }
