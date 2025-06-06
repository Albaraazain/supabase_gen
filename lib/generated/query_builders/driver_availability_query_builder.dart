import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/driver_availability_model.dart';

/// A type-safe query builder for DriverAvailabilityModel
class DriverAvailabilityModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  DriverAvailabilityModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('driver_availability').select();
  }
  
  /// Set the fields to select
  DriverAvailabilityModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('driver_availability').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  DriverAvailabilityModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  DriverAvailabilityModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  DriverAvailabilityModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by driver_id
  DriverAvailabilityModelQueryBuilder whereDriverId(String value) {
    _queryBuilder = _queryBuilder.eq('driver_id', value);
    return this;
  }
  
  /// Filter by driver_id with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereDriverIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_id', values);
    return this;
  }
  
  

  /// Filter by is_available_for_instant_rides
  DriverAvailabilityModelQueryBuilder whereIsAvailableForInstantRides(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_available_for_instant_rides', value);
    return this;
  }
  
  /// Filter by is_available_for_instant_rides with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereIsAvailableForInstantRidesIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_available_for_instant_rides', values);
    return this;
  }
  
  

  /// Filter by max_pickup_distance_km
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKm(double? value) {
    _queryBuilder = _queryBuilder.eq('max_pickup_distance_km', value);
    return this;
  }
  
  /// Filter by max_pickup_distance_km with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKmIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('max_pickup_distance_km', values);
    return this;
  }
  
    /// Filter max_pickup_distance_km greater than
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKmGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('max_pickup_distance_km', value);
    return this;
  }
  
  /// Filter max_pickup_distance_km greater than or equal
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKmGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('max_pickup_distance_km', value);
    return this;
  }
  
  /// Filter max_pickup_distance_km less than
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKmLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('max_pickup_distance_km', value);
    return this;
  }
  
  /// Filter max_pickup_distance_km less than or equal
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKmLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('max_pickup_distance_km', value);
    return this;
  }
  
  /// Filter max_pickup_distance_km between two values
  DriverAvailabilityModelQueryBuilder whereMaxPickupDistanceKmBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('max_pickup_distance_km', min).lte('max_pickup_distance_km', max);
    return this;
  }

  /// Filter by preferred_ride_types
  DriverAvailabilityModelQueryBuilder wherePreferredRideTypes(List<dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('preferred_ride_types', value);
    return this;
  }
  
  /// Filter by preferred_ride_types with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder wherePreferredRideTypesIn(List<List<dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('preferred_ride_types', values);
    return this;
  }
  
  

  /// Filter by auto_accept_rides
  DriverAvailabilityModelQueryBuilder whereAutoAcceptRides(bool? value) {
    _queryBuilder = _queryBuilder.eq('auto_accept_rides', value);
    return this;
  }
  
  /// Filter by auto_accept_rides with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereAutoAcceptRidesIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('auto_accept_rides', values);
    return this;
  }
  
  

  /// Filter by minimum_fare
  DriverAvailabilityModelQueryBuilder whereMinimumFare(double? value) {
    _queryBuilder = _queryBuilder.eq('minimum_fare', value);
    return this;
  }
  
  /// Filter by minimum_fare with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereMinimumFareIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('minimum_fare', values);
    return this;
  }
  
    /// Filter minimum_fare greater than
  DriverAvailabilityModelQueryBuilder whereMinimumFareGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('minimum_fare', value);
    return this;
  }
  
  /// Filter minimum_fare greater than or equal
  DriverAvailabilityModelQueryBuilder whereMinimumFareGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('minimum_fare', value);
    return this;
  }
  
  /// Filter minimum_fare less than
  DriverAvailabilityModelQueryBuilder whereMinimumFareLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('minimum_fare', value);
    return this;
  }
  
  /// Filter minimum_fare less than or equal
  DriverAvailabilityModelQueryBuilder whereMinimumFareLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('minimum_fare', value);
    return this;
  }
  
  /// Filter minimum_fare between two values
  DriverAvailabilityModelQueryBuilder whereMinimumFareBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('minimum_fare', min).lte('minimum_fare', max);
    return this;
  }

  /// Filter by maximum_passengers
  DriverAvailabilityModelQueryBuilder whereMaximumPassengers(int? value) {
    _queryBuilder = _queryBuilder.eq('maximum_passengers', value);
    return this;
  }
  
  /// Filter by maximum_passengers with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereMaximumPassengersIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('maximum_passengers', values);
    return this;
  }
  
    /// Filter maximum_passengers greater than
  DriverAvailabilityModelQueryBuilder whereMaximumPassengersGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('maximum_passengers', value);
    return this;
  }
  
  /// Filter maximum_passengers greater than or equal
  DriverAvailabilityModelQueryBuilder whereMaximumPassengersGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('maximum_passengers', value);
    return this;
  }
  
  /// Filter maximum_passengers less than
  DriverAvailabilityModelQueryBuilder whereMaximumPassengersLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('maximum_passengers', value);
    return this;
  }
  
  /// Filter maximum_passengers less than or equal
  DriverAvailabilityModelQueryBuilder whereMaximumPassengersLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('maximum_passengers', value);
    return this;
  }
  
  /// Filter maximum_passengers between two values
  DriverAvailabilityModelQueryBuilder whereMaximumPassengersBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('maximum_passengers', min).lte('maximum_passengers', max);
    return this;
  }

  /// Filter by accepts_pets
  DriverAvailabilityModelQueryBuilder whereAcceptsPets(bool? value) {
    _queryBuilder = _queryBuilder.eq('accepts_pets', value);
    return this;
  }
  
  /// Filter by accepts_pets with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereAcceptsPetsIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accepts_pets', values);
    return this;
  }
  
  

  /// Filter by accepts_smoking
  DriverAvailabilityModelQueryBuilder whereAcceptsSmoking(bool? value) {
    _queryBuilder = _queryBuilder.eq('accepts_smoking', value);
    return this;
  }
  
  /// Filter by accepts_smoking with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereAcceptsSmokingIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accepts_smoking', values);
    return this;
  }
  
  

  /// Filter by vehicle_amenities
  DriverAvailabilityModelQueryBuilder whereVehicleAmenities(List<dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('vehicle_amenities', value);
    return this;
  }
  
  /// Filter by vehicle_amenities with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereVehicleAmenitiesIn(List<List<dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('vehicle_amenities', values);
    return this;
  }
  
  

  /// Filter by preferred_payment_methods
  DriverAvailabilityModelQueryBuilder wherePreferredPaymentMethods(List<dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('preferred_payment_methods', value);
    return this;
  }
  
  /// Filter by preferred_payment_methods with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder wherePreferredPaymentMethodsIn(List<List<dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('preferred_payment_methods', values);
    return this;
  }
  
  

  /// Filter by surge_multiplier_threshold
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThreshold(double? value) {
    _queryBuilder = _queryBuilder.eq('surge_multiplier_threshold', value);
    return this;
  }
  
  /// Filter by surge_multiplier_threshold with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThresholdIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('surge_multiplier_threshold', values);
    return this;
  }
  
    /// Filter surge_multiplier_threshold greater than
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThresholdGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('surge_multiplier_threshold', value);
    return this;
  }
  
  /// Filter surge_multiplier_threshold greater than or equal
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThresholdGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('surge_multiplier_threshold', value);
    return this;
  }
  
  /// Filter surge_multiplier_threshold less than
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThresholdLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('surge_multiplier_threshold', value);
    return this;
  }
  
  /// Filter surge_multiplier_threshold less than or equal
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThresholdLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('surge_multiplier_threshold', value);
    return this;
  }
  
  /// Filter surge_multiplier_threshold between two values
  DriverAvailabilityModelQueryBuilder whereSurgeMultiplierThresholdBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('surge_multiplier_threshold', min).lte('surge_multiplier_threshold', max);
    return this;
  }

  /// Filter by break_time_start
  DriverAvailabilityModelQueryBuilder whereBreakTimeStart(String? value) {
    _queryBuilder = _queryBuilder.eq('break_time_start', value);
    return this;
  }
  
  /// Filter by break_time_start with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereBreakTimeStartIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('break_time_start', values);
    return this;
  }
  
  

  /// Filter by break_time_end
  DriverAvailabilityModelQueryBuilder whereBreakTimeEnd(String? value) {
    _queryBuilder = _queryBuilder.eq('break_time_end', value);
    return this;
  }
  
  /// Filter by break_time_end with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereBreakTimeEndIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('break_time_end', values);
    return this;
  }
  
  

  /// Filter by current_location_lat
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLat(double? value) {
    _queryBuilder = _queryBuilder.eq('current_location_lat', value);
    return this;
  }
  
  /// Filter by current_location_lat with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_location_lat', values);
    return this;
  }
  
    /// Filter current_location_lat greater than
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat greater than or equal
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat less than
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat less than or equal
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat between two values
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('current_location_lat', min).lte('current_location_lat', max);
    return this;
  }

  /// Filter by current_location_lng
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLng(double? value) {
    _queryBuilder = _queryBuilder.eq('current_location_lng', value);
    return this;
  }
  
  /// Filter by current_location_lng with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_location_lng', values);
    return this;
  }
  
    /// Filter current_location_lng greater than
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng greater than or equal
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng less than
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng less than or equal
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng between two values
  DriverAvailabilityModelQueryBuilder whereCurrentLocationLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('current_location_lng', min).lte('current_location_lng', max);
    return this;
  }

  /// Filter by current_location_point
  DriverAvailabilityModelQueryBuilder whereCurrentLocationPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('current_location_point', value);
    return this;
  }
  
  /// Filter by current_location_point with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereCurrentLocationPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_location_point', values);
    return this;
  }
  
  

  /// Filter by heading
  DriverAvailabilityModelQueryBuilder whereHeading(double? value) {
    _queryBuilder = _queryBuilder.eq('heading', value);
    return this;
  }
  
  /// Filter by heading with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereHeadingIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('heading', values);
    return this;
  }
  
    /// Filter heading greater than
  DriverAvailabilityModelQueryBuilder whereHeadingGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('heading', value);
    return this;
  }
  
  /// Filter heading greater than or equal
  DriverAvailabilityModelQueryBuilder whereHeadingGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('heading', value);
    return this;
  }
  
  /// Filter heading less than
  DriverAvailabilityModelQueryBuilder whereHeadingLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('heading', value);
    return this;
  }
  
  /// Filter heading less than or equal
  DriverAvailabilityModelQueryBuilder whereHeadingLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('heading', value);
    return this;
  }
  
  /// Filter heading between two values
  DriverAvailabilityModelQueryBuilder whereHeadingBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('heading', min).lte('heading', max);
    return this;
  }

  /// Filter by speed_kmh
  DriverAvailabilityModelQueryBuilder whereSpeedKmh(double? value) {
    _queryBuilder = _queryBuilder.eq('speed_kmh', value);
    return this;
  }
  
  /// Filter by speed_kmh with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereSpeedKmhIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('speed_kmh', values);
    return this;
  }
  
    /// Filter speed_kmh greater than
  DriverAvailabilityModelQueryBuilder whereSpeedKmhGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('speed_kmh', value);
    return this;
  }
  
  /// Filter speed_kmh greater than or equal
  DriverAvailabilityModelQueryBuilder whereSpeedKmhGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('speed_kmh', value);
    return this;
  }
  
  /// Filter speed_kmh less than
  DriverAvailabilityModelQueryBuilder whereSpeedKmhLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('speed_kmh', value);
    return this;
  }
  
  /// Filter speed_kmh less than or equal
  DriverAvailabilityModelQueryBuilder whereSpeedKmhLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('speed_kmh', value);
    return this;
  }
  
  /// Filter speed_kmh between two values
  DriverAvailabilityModelQueryBuilder whereSpeedKmhBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('speed_kmh', min).lte('speed_kmh', max);
    return this;
  }

  /// Filter by battery_level
  DriverAvailabilityModelQueryBuilder whereBatteryLevel(int? value) {
    _queryBuilder = _queryBuilder.eq('battery_level', value);
    return this;
  }
  
  /// Filter by battery_level with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereBatteryLevelIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('battery_level', values);
    return this;
  }
  
    /// Filter battery_level greater than
  DriverAvailabilityModelQueryBuilder whereBatteryLevelGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('battery_level', value);
    return this;
  }
  
  /// Filter battery_level greater than or equal
  DriverAvailabilityModelQueryBuilder whereBatteryLevelGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('battery_level', value);
    return this;
  }
  
  /// Filter battery_level less than
  DriverAvailabilityModelQueryBuilder whereBatteryLevelLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('battery_level', value);
    return this;
  }
  
  /// Filter battery_level less than or equal
  DriverAvailabilityModelQueryBuilder whereBatteryLevelLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('battery_level', value);
    return this;
  }
  
  /// Filter battery_level between two values
  DriverAvailabilityModelQueryBuilder whereBatteryLevelBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('battery_level', min).lte('battery_level', max);
    return this;
  }

  /// Filter by fuel_level_percent
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercent(int? value) {
    _queryBuilder = _queryBuilder.eq('fuel_level_percent', value);
    return this;
  }
  
  /// Filter by fuel_level_percent with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercentIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('fuel_level_percent', values);
    return this;
  }
  
    /// Filter fuel_level_percent greater than
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercentGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('fuel_level_percent', value);
    return this;
  }
  
  /// Filter fuel_level_percent greater than or equal
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercentGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('fuel_level_percent', value);
    return this;
  }
  
  /// Filter fuel_level_percent less than
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercentLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('fuel_level_percent', value);
    return this;
  }
  
  /// Filter fuel_level_percent less than or equal
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercentLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('fuel_level_percent', value);
    return this;
  }
  
  /// Filter fuel_level_percent between two values
  DriverAvailabilityModelQueryBuilder whereFuelLevelPercentBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('fuel_level_percent', min).lte('fuel_level_percent', max);
    return this;
  }

  /// Filter by last_ride_completed_at
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('last_ride_completed_at', value);
    return this;
  }
  
  /// Filter by last_ride_completed_at with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('last_ride_completed_at', values);
    return this;
  }
  
    /// Filter last_ride_completed_at greater than
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('last_ride_completed_at', value);
    return this;
  }
  
  /// Filter last_ride_completed_at greater than or equal
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('last_ride_completed_at', value);
    return this;
  }
  
  /// Filter last_ride_completed_at less than
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('last_ride_completed_at', value);
    return this;
  }
  
  /// Filter last_ride_completed_at less than or equal
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('last_ride_completed_at', value);
    return this;
  }
  
  /// Filter last_ride_completed_at between two values
  DriverAvailabilityModelQueryBuilder whereLastRideCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('last_ride_completed_at', min).lte('last_ride_completed_at', max);
    return this;
  }

  /// Filter by available_from
  DriverAvailabilityModelQueryBuilder whereAvailableFrom(String? value) {
    _queryBuilder = _queryBuilder.eq('available_from', value);
    return this;
  }
  
  /// Filter by available_from with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereAvailableFromIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('available_from', values);
    return this;
  }
  
  

  /// Filter by available_until
  DriverAvailabilityModelQueryBuilder whereAvailableUntil(String? value) {
    _queryBuilder = _queryBuilder.eq('available_until', value);
    return this;
  }
  
  /// Filter by available_until with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereAvailableUntilIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('available_until', values);
    return this;
  }
  
  

  /// Filter by available_days
  DriverAvailabilityModelQueryBuilder whereAvailableDays(int? value) {
    _queryBuilder = _queryBuilder.eq('available_days', value);
    return this;
  }
  
  /// Filter by available_days with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereAvailableDaysIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('available_days', values);
    return this;
  }
  
    /// Filter available_days greater than
  DriverAvailabilityModelQueryBuilder whereAvailableDaysGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('available_days', value);
    return this;
  }
  
  /// Filter available_days greater than or equal
  DriverAvailabilityModelQueryBuilder whereAvailableDaysGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('available_days', value);
    return this;
  }
  
  /// Filter available_days less than
  DriverAvailabilityModelQueryBuilder whereAvailableDaysLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('available_days', value);
    return this;
  }
  
  /// Filter available_days less than or equal
  DriverAvailabilityModelQueryBuilder whereAvailableDaysLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('available_days', value);
    return this;
  }
  
  /// Filter available_days between two values
  DriverAvailabilityModelQueryBuilder whereAvailableDaysBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('available_days', min).lte('available_days', max);
    return this;
  }

  /// Filter by created_at
  DriverAvailabilityModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  DriverAvailabilityModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  DriverAvailabilityModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  DriverAvailabilityModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  DriverAvailabilityModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  DriverAvailabilityModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  DriverAvailabilityModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  DriverAvailabilityModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  DriverAvailabilityModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  DriverAvailabilityModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  DriverAvailabilityModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  DriverAvailabilityModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  DriverAvailabilityModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  DriverAvailabilityModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  DriverAvailabilityModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by driver_id in ascending order
  DriverAvailabilityModelQueryBuilder orderByDriverIdAsc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: true);
    return this;
  }
  
  /// Order by driver_id in descending order
  DriverAvailabilityModelQueryBuilder orderByDriverIdDesc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: false);
    return this;
  }

  /// Order by is_available_for_instant_rides in ascending order
  DriverAvailabilityModelQueryBuilder orderByIsAvailableForInstantRidesAsc() {
    _queryBuilder = _queryBuilder.order('is_available_for_instant_rides', ascending: true);
    return this;
  }
  
  /// Order by is_available_for_instant_rides in descending order
  DriverAvailabilityModelQueryBuilder orderByIsAvailableForInstantRidesDesc() {
    _queryBuilder = _queryBuilder.order('is_available_for_instant_rides', ascending: false);
    return this;
  }

  /// Order by max_pickup_distance_km in ascending order
  DriverAvailabilityModelQueryBuilder orderByMaxPickupDistanceKmAsc() {
    _queryBuilder = _queryBuilder.order('max_pickup_distance_km', ascending: true);
    return this;
  }
  
  /// Order by max_pickup_distance_km in descending order
  DriverAvailabilityModelQueryBuilder orderByMaxPickupDistanceKmDesc() {
    _queryBuilder = _queryBuilder.order('max_pickup_distance_km', ascending: false);
    return this;
  }

  /// Order by preferred_ride_types in ascending order
  DriverAvailabilityModelQueryBuilder orderByPreferredRideTypesAsc() {
    _queryBuilder = _queryBuilder.order('preferred_ride_types', ascending: true);
    return this;
  }
  
  /// Order by preferred_ride_types in descending order
  DriverAvailabilityModelQueryBuilder orderByPreferredRideTypesDesc() {
    _queryBuilder = _queryBuilder.order('preferred_ride_types', ascending: false);
    return this;
  }

  /// Order by auto_accept_rides in ascending order
  DriverAvailabilityModelQueryBuilder orderByAutoAcceptRidesAsc() {
    _queryBuilder = _queryBuilder.order('auto_accept_rides', ascending: true);
    return this;
  }
  
  /// Order by auto_accept_rides in descending order
  DriverAvailabilityModelQueryBuilder orderByAutoAcceptRidesDesc() {
    _queryBuilder = _queryBuilder.order('auto_accept_rides', ascending: false);
    return this;
  }

  /// Order by minimum_fare in ascending order
  DriverAvailabilityModelQueryBuilder orderByMinimumFareAsc() {
    _queryBuilder = _queryBuilder.order('minimum_fare', ascending: true);
    return this;
  }
  
  /// Order by minimum_fare in descending order
  DriverAvailabilityModelQueryBuilder orderByMinimumFareDesc() {
    _queryBuilder = _queryBuilder.order('minimum_fare', ascending: false);
    return this;
  }

  /// Order by maximum_passengers in ascending order
  DriverAvailabilityModelQueryBuilder orderByMaximumPassengersAsc() {
    _queryBuilder = _queryBuilder.order('maximum_passengers', ascending: true);
    return this;
  }
  
  /// Order by maximum_passengers in descending order
  DriverAvailabilityModelQueryBuilder orderByMaximumPassengersDesc() {
    _queryBuilder = _queryBuilder.order('maximum_passengers', ascending: false);
    return this;
  }

  /// Order by accepts_pets in ascending order
  DriverAvailabilityModelQueryBuilder orderByAcceptsPetsAsc() {
    _queryBuilder = _queryBuilder.order('accepts_pets', ascending: true);
    return this;
  }
  
  /// Order by accepts_pets in descending order
  DriverAvailabilityModelQueryBuilder orderByAcceptsPetsDesc() {
    _queryBuilder = _queryBuilder.order('accepts_pets', ascending: false);
    return this;
  }

  /// Order by accepts_smoking in ascending order
  DriverAvailabilityModelQueryBuilder orderByAcceptsSmokingAsc() {
    _queryBuilder = _queryBuilder.order('accepts_smoking', ascending: true);
    return this;
  }
  
  /// Order by accepts_smoking in descending order
  DriverAvailabilityModelQueryBuilder orderByAcceptsSmokingDesc() {
    _queryBuilder = _queryBuilder.order('accepts_smoking', ascending: false);
    return this;
  }

  /// Order by vehicle_amenities in ascending order
  DriverAvailabilityModelQueryBuilder orderByVehicleAmenitiesAsc() {
    _queryBuilder = _queryBuilder.order('vehicle_amenities', ascending: true);
    return this;
  }
  
  /// Order by vehicle_amenities in descending order
  DriverAvailabilityModelQueryBuilder orderByVehicleAmenitiesDesc() {
    _queryBuilder = _queryBuilder.order('vehicle_amenities', ascending: false);
    return this;
  }

  /// Order by preferred_payment_methods in ascending order
  DriverAvailabilityModelQueryBuilder orderByPreferredPaymentMethodsAsc() {
    _queryBuilder = _queryBuilder.order('preferred_payment_methods', ascending: true);
    return this;
  }
  
  /// Order by preferred_payment_methods in descending order
  DriverAvailabilityModelQueryBuilder orderByPreferredPaymentMethodsDesc() {
    _queryBuilder = _queryBuilder.order('preferred_payment_methods', ascending: false);
    return this;
  }

  /// Order by surge_multiplier_threshold in ascending order
  DriverAvailabilityModelQueryBuilder orderBySurgeMultiplierThresholdAsc() {
    _queryBuilder = _queryBuilder.order('surge_multiplier_threshold', ascending: true);
    return this;
  }
  
  /// Order by surge_multiplier_threshold in descending order
  DriverAvailabilityModelQueryBuilder orderBySurgeMultiplierThresholdDesc() {
    _queryBuilder = _queryBuilder.order('surge_multiplier_threshold', ascending: false);
    return this;
  }

  /// Order by break_time_start in ascending order
  DriverAvailabilityModelQueryBuilder orderByBreakTimeStartAsc() {
    _queryBuilder = _queryBuilder.order('break_time_start', ascending: true);
    return this;
  }
  
  /// Order by break_time_start in descending order
  DriverAvailabilityModelQueryBuilder orderByBreakTimeStartDesc() {
    _queryBuilder = _queryBuilder.order('break_time_start', ascending: false);
    return this;
  }

  /// Order by break_time_end in ascending order
  DriverAvailabilityModelQueryBuilder orderByBreakTimeEndAsc() {
    _queryBuilder = _queryBuilder.order('break_time_end', ascending: true);
    return this;
  }
  
  /// Order by break_time_end in descending order
  DriverAvailabilityModelQueryBuilder orderByBreakTimeEndDesc() {
    _queryBuilder = _queryBuilder.order('break_time_end', ascending: false);
    return this;
  }

  /// Order by current_location_lat in ascending order
  DriverAvailabilityModelQueryBuilder orderByCurrentLocationLatAsc() {
    _queryBuilder = _queryBuilder.order('current_location_lat', ascending: true);
    return this;
  }
  
  /// Order by current_location_lat in descending order
  DriverAvailabilityModelQueryBuilder orderByCurrentLocationLatDesc() {
    _queryBuilder = _queryBuilder.order('current_location_lat', ascending: false);
    return this;
  }

  /// Order by current_location_lng in ascending order
  DriverAvailabilityModelQueryBuilder orderByCurrentLocationLngAsc() {
    _queryBuilder = _queryBuilder.order('current_location_lng', ascending: true);
    return this;
  }
  
  /// Order by current_location_lng in descending order
  DriverAvailabilityModelQueryBuilder orderByCurrentLocationLngDesc() {
    _queryBuilder = _queryBuilder.order('current_location_lng', ascending: false);
    return this;
  }

  /// Order by current_location_point in ascending order
  DriverAvailabilityModelQueryBuilder orderByCurrentLocationPointAsc() {
    _queryBuilder = _queryBuilder.order('current_location_point', ascending: true);
    return this;
  }
  
  /// Order by current_location_point in descending order
  DriverAvailabilityModelQueryBuilder orderByCurrentLocationPointDesc() {
    _queryBuilder = _queryBuilder.order('current_location_point', ascending: false);
    return this;
  }

  /// Order by heading in ascending order
  DriverAvailabilityModelQueryBuilder orderByHeadingAsc() {
    _queryBuilder = _queryBuilder.order('heading', ascending: true);
    return this;
  }
  
  /// Order by heading in descending order
  DriverAvailabilityModelQueryBuilder orderByHeadingDesc() {
    _queryBuilder = _queryBuilder.order('heading', ascending: false);
    return this;
  }

  /// Order by speed_kmh in ascending order
  DriverAvailabilityModelQueryBuilder orderBySpeedKmhAsc() {
    _queryBuilder = _queryBuilder.order('speed_kmh', ascending: true);
    return this;
  }
  
  /// Order by speed_kmh in descending order
  DriverAvailabilityModelQueryBuilder orderBySpeedKmhDesc() {
    _queryBuilder = _queryBuilder.order('speed_kmh', ascending: false);
    return this;
  }

  /// Order by battery_level in ascending order
  DriverAvailabilityModelQueryBuilder orderByBatteryLevelAsc() {
    _queryBuilder = _queryBuilder.order('battery_level', ascending: true);
    return this;
  }
  
  /// Order by battery_level in descending order
  DriverAvailabilityModelQueryBuilder orderByBatteryLevelDesc() {
    _queryBuilder = _queryBuilder.order('battery_level', ascending: false);
    return this;
  }

  /// Order by fuel_level_percent in ascending order
  DriverAvailabilityModelQueryBuilder orderByFuelLevelPercentAsc() {
    _queryBuilder = _queryBuilder.order('fuel_level_percent', ascending: true);
    return this;
  }
  
  /// Order by fuel_level_percent in descending order
  DriverAvailabilityModelQueryBuilder orderByFuelLevelPercentDesc() {
    _queryBuilder = _queryBuilder.order('fuel_level_percent', ascending: false);
    return this;
  }

  /// Order by last_ride_completed_at in ascending order
  DriverAvailabilityModelQueryBuilder orderByLastRideCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('last_ride_completed_at', ascending: true);
    return this;
  }
  
  /// Order by last_ride_completed_at in descending order
  DriverAvailabilityModelQueryBuilder orderByLastRideCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('last_ride_completed_at', ascending: false);
    return this;
  }

  /// Order by available_from in ascending order
  DriverAvailabilityModelQueryBuilder orderByAvailableFromAsc() {
    _queryBuilder = _queryBuilder.order('available_from', ascending: true);
    return this;
  }
  
  /// Order by available_from in descending order
  DriverAvailabilityModelQueryBuilder orderByAvailableFromDesc() {
    _queryBuilder = _queryBuilder.order('available_from', ascending: false);
    return this;
  }

  /// Order by available_until in ascending order
  DriverAvailabilityModelQueryBuilder orderByAvailableUntilAsc() {
    _queryBuilder = _queryBuilder.order('available_until', ascending: true);
    return this;
  }
  
  /// Order by available_until in descending order
  DriverAvailabilityModelQueryBuilder orderByAvailableUntilDesc() {
    _queryBuilder = _queryBuilder.order('available_until', ascending: false);
    return this;
  }

  /// Order by available_days in ascending order
  DriverAvailabilityModelQueryBuilder orderByAvailableDaysAsc() {
    _queryBuilder = _queryBuilder.order('available_days', ascending: true);
    return this;
  }
  
  /// Order by available_days in descending order
  DriverAvailabilityModelQueryBuilder orderByAvailableDaysDesc() {
    _queryBuilder = _queryBuilder.order('available_days', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  DriverAvailabilityModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  DriverAvailabilityModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  DriverAvailabilityModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  DriverAvailabilityModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of DriverAvailabilityModel
  Future<List<DriverAvailabilityModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => DriverAvailabilityModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<DriverAvailabilityModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return DriverAvailabilityModel.fromJson(response.first as Map<String, dynamic>);
      }
      
      return null;
    } catch (e) {
      print('Error retrieving single result: $e');
      return null;
    }
  }
  
  /// Execute the query and return the count
  Future<int> count() async {
    try {
      // Use count() method directly according to Supabase Flutter 2.9.0 API
      final response = await _queryBuilder.count();
      
      // For Supabase Flutter 2.9.0+, count() returns a response with count property
      if (response.count != null) {
        return response.count ?? 0;
      }
      
      // Fallback for older versions or when count is not available
      return 0;
    } catch (e) {
      print('Error counting records: $e');
      return 0;
    }
  }
}
