import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/instant_ride_requests_model.dart';

/// A type-safe query builder for InstantRideRequestsModel
class InstantRideRequestsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  InstantRideRequestsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('instant_ride_requests').select();
  }
  
  /// Set the fields to select
  InstantRideRequestsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('instant_ride_requests').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  InstantRideRequestsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  InstantRideRequestsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  InstantRideRequestsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by passenger_id
  InstantRideRequestsModelQueryBuilder wherePassengerId(String value) {
    _queryBuilder = _queryBuilder.eq('passenger_id', value);
    return this;
  }
  
  /// Filter by passenger_id with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder wherePassengerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('passenger_id', values);
    return this;
  }
  
  

  /// Filter by pickup_address
  InstantRideRequestsModelQueryBuilder wherePickupAddress(String value) {
    _queryBuilder = _queryBuilder.eq('pickup_address', value);
    return this;
  }
  
  /// Filter by pickup_address with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder wherePickupAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_address', values);
    return this;
  }
  
  

  /// Filter by pickup_lat
  InstantRideRequestsModelQueryBuilder wherePickupLat(double value) {
    _queryBuilder = _queryBuilder.eq('pickup_lat', value);
    return this;
  }
  
  /// Filter by pickup_lat with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder wherePickupLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_lat', values);
    return this;
  }
  
    /// Filter pickup_lat greater than
  InstantRideRequestsModelQueryBuilder wherePickupLatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat greater than or equal
  InstantRideRequestsModelQueryBuilder wherePickupLatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat less than
  InstantRideRequestsModelQueryBuilder wherePickupLatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat less than or equal
  InstantRideRequestsModelQueryBuilder wherePickupLatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat between two values
  InstantRideRequestsModelQueryBuilder wherePickupLatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('pickup_lat', min).lte('pickup_lat', max);
    return this;
  }

  /// Filter by pickup_lng
  InstantRideRequestsModelQueryBuilder wherePickupLng(double value) {
    _queryBuilder = _queryBuilder.eq('pickup_lng', value);
    return this;
  }
  
  /// Filter by pickup_lng with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder wherePickupLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_lng', values);
    return this;
  }
  
    /// Filter pickup_lng greater than
  InstantRideRequestsModelQueryBuilder wherePickupLngGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng greater than or equal
  InstantRideRequestsModelQueryBuilder wherePickupLngGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng less than
  InstantRideRequestsModelQueryBuilder wherePickupLngLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng less than or equal
  InstantRideRequestsModelQueryBuilder wherePickupLngLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng between two values
  InstantRideRequestsModelQueryBuilder wherePickupLngBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('pickup_lng', min).lte('pickup_lng', max);
    return this;
  }

  /// Filter by pickup_point
  InstantRideRequestsModelQueryBuilder wherePickupPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('pickup_point', value);
    return this;
  }
  
  /// Filter by pickup_point with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder wherePickupPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_point', values);
    return this;
  }
  
  

  /// Filter by destination_address
  InstantRideRequestsModelQueryBuilder whereDestinationAddress(String value) {
    _queryBuilder = _queryBuilder.eq('destination_address', value);
    return this;
  }
  
  /// Filter by destination_address with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereDestinationAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_address', values);
    return this;
  }
  
  

  /// Filter by destination_lat
  InstantRideRequestsModelQueryBuilder whereDestinationLat(double value) {
    _queryBuilder = _queryBuilder.eq('destination_lat', value);
    return this;
  }
  
  /// Filter by destination_lat with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereDestinationLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_lat', values);
    return this;
  }
  
    /// Filter destination_lat greater than
  InstantRideRequestsModelQueryBuilder whereDestinationLatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat greater than or equal
  InstantRideRequestsModelQueryBuilder whereDestinationLatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat less than
  InstantRideRequestsModelQueryBuilder whereDestinationLatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat less than or equal
  InstantRideRequestsModelQueryBuilder whereDestinationLatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat between two values
  InstantRideRequestsModelQueryBuilder whereDestinationLatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('destination_lat', min).lte('destination_lat', max);
    return this;
  }

  /// Filter by destination_lng
  InstantRideRequestsModelQueryBuilder whereDestinationLng(double value) {
    _queryBuilder = _queryBuilder.eq('destination_lng', value);
    return this;
  }
  
  /// Filter by destination_lng with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereDestinationLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_lng', values);
    return this;
  }
  
    /// Filter destination_lng greater than
  InstantRideRequestsModelQueryBuilder whereDestinationLngGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng greater than or equal
  InstantRideRequestsModelQueryBuilder whereDestinationLngGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng less than
  InstantRideRequestsModelQueryBuilder whereDestinationLngLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng less than or equal
  InstantRideRequestsModelQueryBuilder whereDestinationLngLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng between two values
  InstantRideRequestsModelQueryBuilder whereDestinationLngBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('destination_lng', min).lte('destination_lng', max);
    return this;
  }

  /// Filter by destination_point
  InstantRideRequestsModelQueryBuilder whereDestinationPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('destination_point', value);
    return this;
  }
  
  /// Filter by destination_point with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereDestinationPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_point', values);
    return this;
  }
  
  

  /// Filter by estimated_distance_km
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKm(double? value) {
    _queryBuilder = _queryBuilder.eq('estimated_distance_km', value);
    return this;
  }
  
  /// Filter by estimated_distance_km with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKmIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_distance_km', values);
    return this;
  }
  
    /// Filter estimated_distance_km greater than
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKmGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('estimated_distance_km', value);
    return this;
  }
  
  /// Filter estimated_distance_km greater than or equal
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKmGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('estimated_distance_km', value);
    return this;
  }
  
  /// Filter estimated_distance_km less than
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKmLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('estimated_distance_km', value);
    return this;
  }
  
  /// Filter estimated_distance_km less than or equal
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKmLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('estimated_distance_km', value);
    return this;
  }
  
  /// Filter estimated_distance_km between two values
  InstantRideRequestsModelQueryBuilder whereEstimatedDistanceKmBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('estimated_distance_km', min).lte('estimated_distance_km', max);
    return this;
  }

  /// Filter by estimated_duration_minutes
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutes(int? value) {
    _queryBuilder = _queryBuilder.eq('estimated_duration_minutes', value);
    return this;
  }
  
  /// Filter by estimated_duration_minutes with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutesIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_duration_minutes', values);
    return this;
  }
  
    /// Filter estimated_duration_minutes greater than
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutesGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('estimated_duration_minutes', value);
    return this;
  }
  
  /// Filter estimated_duration_minutes greater than or equal
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutesGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('estimated_duration_minutes', value);
    return this;
  }
  
  /// Filter estimated_duration_minutes less than
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutesLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('estimated_duration_minutes', value);
    return this;
  }
  
  /// Filter estimated_duration_minutes less than or equal
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutesLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('estimated_duration_minutes', value);
    return this;
  }
  
  /// Filter estimated_duration_minutes between two values
  InstantRideRequestsModelQueryBuilder whereEstimatedDurationMinutesBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('estimated_duration_minutes', min).lte('estimated_duration_minutes', max);
    return this;
  }

  /// Filter by offered_fare
  InstantRideRequestsModelQueryBuilder whereOfferedFare(double value) {
    _queryBuilder = _queryBuilder.eq('offered_fare', value);
    return this;
  }
  
  /// Filter by offered_fare with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereOfferedFareIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('offered_fare', values);
    return this;
  }
  
    /// Filter offered_fare greater than
  InstantRideRequestsModelQueryBuilder whereOfferedFareGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('offered_fare', value);
    return this;
  }
  
  /// Filter offered_fare greater than or equal
  InstantRideRequestsModelQueryBuilder whereOfferedFareGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('offered_fare', value);
    return this;
  }
  
  /// Filter offered_fare less than
  InstantRideRequestsModelQueryBuilder whereOfferedFareLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('offered_fare', value);
    return this;
  }
  
  /// Filter offered_fare less than or equal
  InstantRideRequestsModelQueryBuilder whereOfferedFareLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('offered_fare', value);
    return this;
  }
  
  /// Filter offered_fare between two values
  InstantRideRequestsModelQueryBuilder whereOfferedFareBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('offered_fare', min).lte('offered_fare', max);
    return this;
  }

  /// Filter by max_fare_willingness
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingness(double? value) {
    _queryBuilder = _queryBuilder.eq('max_fare_willingness', value);
    return this;
  }
  
  /// Filter by max_fare_willingness with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingnessIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('max_fare_willingness', values);
    return this;
  }
  
    /// Filter max_fare_willingness greater than
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingnessGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('max_fare_willingness', value);
    return this;
  }
  
  /// Filter max_fare_willingness greater than or equal
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingnessGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('max_fare_willingness', value);
    return this;
  }
  
  /// Filter max_fare_willingness less than
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingnessLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('max_fare_willingness', value);
    return this;
  }
  
  /// Filter max_fare_willingness less than or equal
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingnessLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('max_fare_willingness', value);
    return this;
  }
  
  /// Filter max_fare_willingness between two values
  InstantRideRequestsModelQueryBuilder whereMaxFareWillingnessBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('max_fare_willingness', min).lte('max_fare_willingness', max);
    return this;
  }

  /// Filter by surge_multiplier
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplier(double? value) {
    _queryBuilder = _queryBuilder.eq('surge_multiplier', value);
    return this;
  }
  
  /// Filter by surge_multiplier with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplierIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('surge_multiplier', values);
    return this;
  }
  
    /// Filter surge_multiplier greater than
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplierGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('surge_multiplier', value);
    return this;
  }
  
  /// Filter surge_multiplier greater than or equal
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplierGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('surge_multiplier', value);
    return this;
  }
  
  /// Filter surge_multiplier less than
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplierLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('surge_multiplier', value);
    return this;
  }
  
  /// Filter surge_multiplier less than or equal
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplierLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('surge_multiplier', value);
    return this;
  }
  
  /// Filter surge_multiplier between two values
  InstantRideRequestsModelQueryBuilder whereSurgeMultiplierBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('surge_multiplier', min).lte('surge_multiplier', max);
    return this;
  }

  /// Filter by seats_requested
  InstantRideRequestsModelQueryBuilder whereSeatsRequested(int? value) {
    _queryBuilder = _queryBuilder.eq('seats_requested', value);
    return this;
  }
  
  /// Filter by seats_requested with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereSeatsRequestedIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('seats_requested', values);
    return this;
  }
  
    /// Filter seats_requested greater than
  InstantRideRequestsModelQueryBuilder whereSeatsRequestedGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested greater than or equal
  InstantRideRequestsModelQueryBuilder whereSeatsRequestedGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested less than
  InstantRideRequestsModelQueryBuilder whereSeatsRequestedLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested less than or equal
  InstantRideRequestsModelQueryBuilder whereSeatsRequestedLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested between two values
  InstantRideRequestsModelQueryBuilder whereSeatsRequestedBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('seats_requested', min).lte('seats_requested', max);
    return this;
  }

  /// Filter by search_radius_km
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKm(double? value) {
    _queryBuilder = _queryBuilder.eq('search_radius_km', value);
    return this;
  }
  
  /// Filter by search_radius_km with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKmIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('search_radius_km', values);
    return this;
  }
  
    /// Filter search_radius_km greater than
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKmGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('search_radius_km', value);
    return this;
  }
  
  /// Filter search_radius_km greater than or equal
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKmGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('search_radius_km', value);
    return this;
  }
  
  /// Filter search_radius_km less than
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKmLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('search_radius_km', value);
    return this;
  }
  
  /// Filter search_radius_km less than or equal
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKmLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('search_radius_km', value);
    return this;
  }
  
  /// Filter search_radius_km between two values
  InstantRideRequestsModelQueryBuilder whereSearchRadiusKmBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('search_radius_km', min).lte('search_radius_km', max);
    return this;
  }

  /// Filter by status
  InstantRideRequestsModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by matched_driver_id
  InstantRideRequestsModelQueryBuilder whereMatchedDriverId(String? value) {
    _queryBuilder = _queryBuilder.eq('matched_driver_id', value);
    return this;
  }
  
  /// Filter by matched_driver_id with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereMatchedDriverIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('matched_driver_id', values);
    return this;
  }
  
  

  /// Filter by driver_response_deadline
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadline(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('driver_response_deadline', value);
    return this;
  }
  
  /// Filter by driver_response_deadline with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadlineIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_response_deadline', values);
    return this;
  }
  
    /// Filter driver_response_deadline greater than
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadlineGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('driver_response_deadline', value);
    return this;
  }
  
  /// Filter driver_response_deadline greater than or equal
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadlineGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('driver_response_deadline', value);
    return this;
  }
  
  /// Filter driver_response_deadline less than
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadlineLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('driver_response_deadline', value);
    return this;
  }
  
  /// Filter driver_response_deadline less than or equal
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadlineLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('driver_response_deadline', value);
    return this;
  }
  
  /// Filter driver_response_deadline between two values
  InstantRideRequestsModelQueryBuilder whereDriverResponseDeadlineBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('driver_response_deadline', min).lte('driver_response_deadline', max);
    return this;
  }

  /// Filter by special_requests
  InstantRideRequestsModelQueryBuilder whereSpecialRequests(String? value) {
    _queryBuilder = _queryBuilder.eq('special_requests', value);
    return this;
  }
  
  /// Filter by special_requests with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereSpecialRequestsIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('special_requests', values);
    return this;
  }
  
  

  /// Filter by requested_at
  InstantRideRequestsModelQueryBuilder whereRequestedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('requested_at', value);
    return this;
  }
  
  /// Filter by requested_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereRequestedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('requested_at', values);
    return this;
  }
  
    /// Filter requested_at greater than
  InstantRideRequestsModelQueryBuilder whereRequestedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('requested_at', value);
    return this;
  }
  
  /// Filter requested_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereRequestedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('requested_at', value);
    return this;
  }
  
  /// Filter requested_at less than
  InstantRideRequestsModelQueryBuilder whereRequestedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('requested_at', value);
    return this;
  }
  
  /// Filter requested_at less than or equal
  InstantRideRequestsModelQueryBuilder whereRequestedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('requested_at', value);
    return this;
  }
  
  /// Filter requested_at between two values
  InstantRideRequestsModelQueryBuilder whereRequestedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('requested_at', min).lte('requested_at', max);
    return this;
  }

  /// Filter by expires_at
  InstantRideRequestsModelQueryBuilder whereExpiresAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('expires_at', value);
    return this;
  }
  
  /// Filter by expires_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereExpiresAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('expires_at', values);
    return this;
  }
  
    /// Filter expires_at greater than
  InstantRideRequestsModelQueryBuilder whereExpiresAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereExpiresAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than
  InstantRideRequestsModelQueryBuilder whereExpiresAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than or equal
  InstantRideRequestsModelQueryBuilder whereExpiresAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at between two values
  InstantRideRequestsModelQueryBuilder whereExpiresAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('expires_at', min).lte('expires_at', max);
    return this;
  }

  /// Filter by matched_at
  InstantRideRequestsModelQueryBuilder whereMatchedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('matched_at', value);
    return this;
  }
  
  /// Filter by matched_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereMatchedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('matched_at', values);
    return this;
  }
  
    /// Filter matched_at greater than
  InstantRideRequestsModelQueryBuilder whereMatchedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('matched_at', value);
    return this;
  }
  
  /// Filter matched_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereMatchedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('matched_at', value);
    return this;
  }
  
  /// Filter matched_at less than
  InstantRideRequestsModelQueryBuilder whereMatchedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('matched_at', value);
    return this;
  }
  
  /// Filter matched_at less than or equal
  InstantRideRequestsModelQueryBuilder whereMatchedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('matched_at', value);
    return this;
  }
  
  /// Filter matched_at between two values
  InstantRideRequestsModelQueryBuilder whereMatchedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('matched_at', min).lte('matched_at', max);
    return this;
  }

  /// Filter by accepted_at
  InstantRideRequestsModelQueryBuilder whereAcceptedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('accepted_at', value);
    return this;
  }
  
  /// Filter by accepted_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereAcceptedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accepted_at', values);
    return this;
  }
  
    /// Filter accepted_at greater than
  InstantRideRequestsModelQueryBuilder whereAcceptedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereAcceptedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at less than
  InstantRideRequestsModelQueryBuilder whereAcceptedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at less than or equal
  InstantRideRequestsModelQueryBuilder whereAcceptedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('accepted_at', value);
    return this;
  }
  
  /// Filter accepted_at between two values
  InstantRideRequestsModelQueryBuilder whereAcceptedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('accepted_at', min).lte('accepted_at', max);
    return this;
  }

  /// Filter by completed_at
  InstantRideRequestsModelQueryBuilder whereCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('completed_at', value);
    return this;
  }
  
  /// Filter by completed_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completed_at', values);
    return this;
  }
  
    /// Filter completed_at greater than
  InstantRideRequestsModelQueryBuilder whereCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than
  InstantRideRequestsModelQueryBuilder whereCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than or equal
  InstantRideRequestsModelQueryBuilder whereCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at between two values
  InstantRideRequestsModelQueryBuilder whereCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('completed_at', min).lte('completed_at', max);
    return this;
  }

  /// Filter by cancelled_at
  InstantRideRequestsModelQueryBuilder whereCancelledAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('cancelled_at', value);
    return this;
  }
  
  /// Filter by cancelled_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereCancelledAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('cancelled_at', values);
    return this;
  }
  
    /// Filter cancelled_at greater than
  InstantRideRequestsModelQueryBuilder whereCancelledAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('cancelled_at', value);
    return this;
  }
  
  /// Filter cancelled_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereCancelledAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('cancelled_at', value);
    return this;
  }
  
  /// Filter cancelled_at less than
  InstantRideRequestsModelQueryBuilder whereCancelledAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('cancelled_at', value);
    return this;
  }
  
  /// Filter cancelled_at less than or equal
  InstantRideRequestsModelQueryBuilder whereCancelledAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('cancelled_at', value);
    return this;
  }
  
  /// Filter cancelled_at between two values
  InstantRideRequestsModelQueryBuilder whereCancelledAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('cancelled_at', min).lte('cancelled_at', max);
    return this;
  }

  /// Filter by cancellation_reason
  InstantRideRequestsModelQueryBuilder whereCancellationReason(String? value) {
    _queryBuilder = _queryBuilder.eq('cancellation_reason', value);
    return this;
  }
  
  /// Filter by cancellation_reason with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereCancellationReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('cancellation_reason', values);
    return this;
  }
  
  

  /// Filter by cancellation_by
  InstantRideRequestsModelQueryBuilder whereCancellationBy(String? value) {
    _queryBuilder = _queryBuilder.eq('cancellation_by', value);
    return this;
  }
  
  /// Filter by cancellation_by with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereCancellationByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('cancellation_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  InstantRideRequestsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  InstantRideRequestsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  InstantRideRequestsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  InstantRideRequestsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  InstantRideRequestsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  InstantRideRequestsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  InstantRideRequestsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  InstantRideRequestsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  InstantRideRequestsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  InstantRideRequestsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  InstantRideRequestsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  InstantRideRequestsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  InstantRideRequestsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  InstantRideRequestsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by passenger_id in ascending order
  InstantRideRequestsModelQueryBuilder orderByPassengerIdAsc() {
    _queryBuilder = _queryBuilder.order('passenger_id', ascending: true);
    return this;
  }
  
  /// Order by passenger_id in descending order
  InstantRideRequestsModelQueryBuilder orderByPassengerIdDesc() {
    _queryBuilder = _queryBuilder.order('passenger_id', ascending: false);
    return this;
  }

  /// Order by pickup_address in ascending order
  InstantRideRequestsModelQueryBuilder orderByPickupAddressAsc() {
    _queryBuilder = _queryBuilder.order('pickup_address', ascending: true);
    return this;
  }
  
  /// Order by pickup_address in descending order
  InstantRideRequestsModelQueryBuilder orderByPickupAddressDesc() {
    _queryBuilder = _queryBuilder.order('pickup_address', ascending: false);
    return this;
  }

  /// Order by pickup_lat in ascending order
  InstantRideRequestsModelQueryBuilder orderByPickupLatAsc() {
    _queryBuilder = _queryBuilder.order('pickup_lat', ascending: true);
    return this;
  }
  
  /// Order by pickup_lat in descending order
  InstantRideRequestsModelQueryBuilder orderByPickupLatDesc() {
    _queryBuilder = _queryBuilder.order('pickup_lat', ascending: false);
    return this;
  }

  /// Order by pickup_lng in ascending order
  InstantRideRequestsModelQueryBuilder orderByPickupLngAsc() {
    _queryBuilder = _queryBuilder.order('pickup_lng', ascending: true);
    return this;
  }
  
  /// Order by pickup_lng in descending order
  InstantRideRequestsModelQueryBuilder orderByPickupLngDesc() {
    _queryBuilder = _queryBuilder.order('pickup_lng', ascending: false);
    return this;
  }

  /// Order by pickup_point in ascending order
  InstantRideRequestsModelQueryBuilder orderByPickupPointAsc() {
    _queryBuilder = _queryBuilder.order('pickup_point', ascending: true);
    return this;
  }
  
  /// Order by pickup_point in descending order
  InstantRideRequestsModelQueryBuilder orderByPickupPointDesc() {
    _queryBuilder = _queryBuilder.order('pickup_point', ascending: false);
    return this;
  }

  /// Order by destination_address in ascending order
  InstantRideRequestsModelQueryBuilder orderByDestinationAddressAsc() {
    _queryBuilder = _queryBuilder.order('destination_address', ascending: true);
    return this;
  }
  
  /// Order by destination_address in descending order
  InstantRideRequestsModelQueryBuilder orderByDestinationAddressDesc() {
    _queryBuilder = _queryBuilder.order('destination_address', ascending: false);
    return this;
  }

  /// Order by destination_lat in ascending order
  InstantRideRequestsModelQueryBuilder orderByDestinationLatAsc() {
    _queryBuilder = _queryBuilder.order('destination_lat', ascending: true);
    return this;
  }
  
  /// Order by destination_lat in descending order
  InstantRideRequestsModelQueryBuilder orderByDestinationLatDesc() {
    _queryBuilder = _queryBuilder.order('destination_lat', ascending: false);
    return this;
  }

  /// Order by destination_lng in ascending order
  InstantRideRequestsModelQueryBuilder orderByDestinationLngAsc() {
    _queryBuilder = _queryBuilder.order('destination_lng', ascending: true);
    return this;
  }
  
  /// Order by destination_lng in descending order
  InstantRideRequestsModelQueryBuilder orderByDestinationLngDesc() {
    _queryBuilder = _queryBuilder.order('destination_lng', ascending: false);
    return this;
  }

  /// Order by destination_point in ascending order
  InstantRideRequestsModelQueryBuilder orderByDestinationPointAsc() {
    _queryBuilder = _queryBuilder.order('destination_point', ascending: true);
    return this;
  }
  
  /// Order by destination_point in descending order
  InstantRideRequestsModelQueryBuilder orderByDestinationPointDesc() {
    _queryBuilder = _queryBuilder.order('destination_point', ascending: false);
    return this;
  }

  /// Order by estimated_distance_km in ascending order
  InstantRideRequestsModelQueryBuilder orderByEstimatedDistanceKmAsc() {
    _queryBuilder = _queryBuilder.order('estimated_distance_km', ascending: true);
    return this;
  }
  
  /// Order by estimated_distance_km in descending order
  InstantRideRequestsModelQueryBuilder orderByEstimatedDistanceKmDesc() {
    _queryBuilder = _queryBuilder.order('estimated_distance_km', ascending: false);
    return this;
  }

  /// Order by estimated_duration_minutes in ascending order
  InstantRideRequestsModelQueryBuilder orderByEstimatedDurationMinutesAsc() {
    _queryBuilder = _queryBuilder.order('estimated_duration_minutes', ascending: true);
    return this;
  }
  
  /// Order by estimated_duration_minutes in descending order
  InstantRideRequestsModelQueryBuilder orderByEstimatedDurationMinutesDesc() {
    _queryBuilder = _queryBuilder.order('estimated_duration_minutes', ascending: false);
    return this;
  }

  /// Order by offered_fare in ascending order
  InstantRideRequestsModelQueryBuilder orderByOfferedFareAsc() {
    _queryBuilder = _queryBuilder.order('offered_fare', ascending: true);
    return this;
  }
  
  /// Order by offered_fare in descending order
  InstantRideRequestsModelQueryBuilder orderByOfferedFareDesc() {
    _queryBuilder = _queryBuilder.order('offered_fare', ascending: false);
    return this;
  }

  /// Order by max_fare_willingness in ascending order
  InstantRideRequestsModelQueryBuilder orderByMaxFareWillingnessAsc() {
    _queryBuilder = _queryBuilder.order('max_fare_willingness', ascending: true);
    return this;
  }
  
  /// Order by max_fare_willingness in descending order
  InstantRideRequestsModelQueryBuilder orderByMaxFareWillingnessDesc() {
    _queryBuilder = _queryBuilder.order('max_fare_willingness', ascending: false);
    return this;
  }

  /// Order by surge_multiplier in ascending order
  InstantRideRequestsModelQueryBuilder orderBySurgeMultiplierAsc() {
    _queryBuilder = _queryBuilder.order('surge_multiplier', ascending: true);
    return this;
  }
  
  /// Order by surge_multiplier in descending order
  InstantRideRequestsModelQueryBuilder orderBySurgeMultiplierDesc() {
    _queryBuilder = _queryBuilder.order('surge_multiplier', ascending: false);
    return this;
  }

  /// Order by seats_requested in ascending order
  InstantRideRequestsModelQueryBuilder orderBySeatsRequestedAsc() {
    _queryBuilder = _queryBuilder.order('seats_requested', ascending: true);
    return this;
  }
  
  /// Order by seats_requested in descending order
  InstantRideRequestsModelQueryBuilder orderBySeatsRequestedDesc() {
    _queryBuilder = _queryBuilder.order('seats_requested', ascending: false);
    return this;
  }

  /// Order by search_radius_km in ascending order
  InstantRideRequestsModelQueryBuilder orderBySearchRadiusKmAsc() {
    _queryBuilder = _queryBuilder.order('search_radius_km', ascending: true);
    return this;
  }
  
  /// Order by search_radius_km in descending order
  InstantRideRequestsModelQueryBuilder orderBySearchRadiusKmDesc() {
    _queryBuilder = _queryBuilder.order('search_radius_km', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  InstantRideRequestsModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  InstantRideRequestsModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by matched_driver_id in ascending order
  InstantRideRequestsModelQueryBuilder orderByMatchedDriverIdAsc() {
    _queryBuilder = _queryBuilder.order('matched_driver_id', ascending: true);
    return this;
  }
  
  /// Order by matched_driver_id in descending order
  InstantRideRequestsModelQueryBuilder orderByMatchedDriverIdDesc() {
    _queryBuilder = _queryBuilder.order('matched_driver_id', ascending: false);
    return this;
  }

  /// Order by driver_response_deadline in ascending order
  InstantRideRequestsModelQueryBuilder orderByDriverResponseDeadlineAsc() {
    _queryBuilder = _queryBuilder.order('driver_response_deadline', ascending: true);
    return this;
  }
  
  /// Order by driver_response_deadline in descending order
  InstantRideRequestsModelQueryBuilder orderByDriverResponseDeadlineDesc() {
    _queryBuilder = _queryBuilder.order('driver_response_deadline', ascending: false);
    return this;
  }

  /// Order by special_requests in ascending order
  InstantRideRequestsModelQueryBuilder orderBySpecialRequestsAsc() {
    _queryBuilder = _queryBuilder.order('special_requests', ascending: true);
    return this;
  }
  
  /// Order by special_requests in descending order
  InstantRideRequestsModelQueryBuilder orderBySpecialRequestsDesc() {
    _queryBuilder = _queryBuilder.order('special_requests', ascending: false);
    return this;
  }

  /// Order by requested_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByRequestedAtAsc() {
    _queryBuilder = _queryBuilder.order('requested_at', ascending: true);
    return this;
  }
  
  /// Order by requested_at in descending order
  InstantRideRequestsModelQueryBuilder orderByRequestedAtDesc() {
    _queryBuilder = _queryBuilder.order('requested_at', ascending: false);
    return this;
  }

  /// Order by expires_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByExpiresAtAsc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: true);
    return this;
  }
  
  /// Order by expires_at in descending order
  InstantRideRequestsModelQueryBuilder orderByExpiresAtDesc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: false);
    return this;
  }

  /// Order by matched_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByMatchedAtAsc() {
    _queryBuilder = _queryBuilder.order('matched_at', ascending: true);
    return this;
  }
  
  /// Order by matched_at in descending order
  InstantRideRequestsModelQueryBuilder orderByMatchedAtDesc() {
    _queryBuilder = _queryBuilder.order('matched_at', ascending: false);
    return this;
  }

  /// Order by accepted_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByAcceptedAtAsc() {
    _queryBuilder = _queryBuilder.order('accepted_at', ascending: true);
    return this;
  }
  
  /// Order by accepted_at in descending order
  InstantRideRequestsModelQueryBuilder orderByAcceptedAtDesc() {
    _queryBuilder = _queryBuilder.order('accepted_at', ascending: false);
    return this;
  }

  /// Order by completed_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: true);
    return this;
  }
  
  /// Order by completed_at in descending order
  InstantRideRequestsModelQueryBuilder orderByCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: false);
    return this;
  }

  /// Order by cancelled_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByCancelledAtAsc() {
    _queryBuilder = _queryBuilder.order('cancelled_at', ascending: true);
    return this;
  }
  
  /// Order by cancelled_at in descending order
  InstantRideRequestsModelQueryBuilder orderByCancelledAtDesc() {
    _queryBuilder = _queryBuilder.order('cancelled_at', ascending: false);
    return this;
  }

  /// Order by cancellation_reason in ascending order
  InstantRideRequestsModelQueryBuilder orderByCancellationReasonAsc() {
    _queryBuilder = _queryBuilder.order('cancellation_reason', ascending: true);
    return this;
  }
  
  /// Order by cancellation_reason in descending order
  InstantRideRequestsModelQueryBuilder orderByCancellationReasonDesc() {
    _queryBuilder = _queryBuilder.order('cancellation_reason', ascending: false);
    return this;
  }

  /// Order by cancellation_by in ascending order
  InstantRideRequestsModelQueryBuilder orderByCancellationByAsc() {
    _queryBuilder = _queryBuilder.order('cancellation_by', ascending: true);
    return this;
  }
  
  /// Order by cancellation_by in descending order
  InstantRideRequestsModelQueryBuilder orderByCancellationByDesc() {
    _queryBuilder = _queryBuilder.order('cancellation_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  InstantRideRequestsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  InstantRideRequestsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  InstantRideRequestsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of InstantRideRequestsModel
  Future<List<InstantRideRequestsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => InstantRideRequestsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<InstantRideRequestsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return InstantRideRequestsModel.fromJson(response.first as Map<String, dynamic>);
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
