import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trips_model.dart';

/// A type-safe query builder for TripsModel
class TripsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  TripsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('trips').select();
  }
  
  /// Set the fields to select
  TripsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('trips').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  TripsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  TripsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  TripsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  TripsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by driver_id
  TripsModelQueryBuilder whereDriverId(String value) {
    _queryBuilder = _queryBuilder.eq('driver_id', value);
    return this;
  }
  
  /// Filter by driver_id with multiple values (IN operator)
  TripsModelQueryBuilder whereDriverIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_id', values);
    return this;
  }
  
  

  /// Filter by vehicle_id
  TripsModelQueryBuilder whereVehicleId(String value) {
    _queryBuilder = _queryBuilder.eq('vehicle_id', value);
    return this;
  }
  
  /// Filter by vehicle_id with multiple values (IN operator)
  TripsModelQueryBuilder whereVehicleIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('vehicle_id', values);
    return this;
  }
  
  

  /// Filter by origin_address
  TripsModelQueryBuilder whereOriginAddress(String value) {
    _queryBuilder = _queryBuilder.eq('origin_address', value);
    return this;
  }
  
  /// Filter by origin_address with multiple values (IN operator)
  TripsModelQueryBuilder whereOriginAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_address', values);
    return this;
  }
  
  

  /// Filter by origin_lat
  TripsModelQueryBuilder whereOriginLat(double value) {
    _queryBuilder = _queryBuilder.eq('origin_lat', value);
    return this;
  }
  
  /// Filter by origin_lat with multiple values (IN operator)
  TripsModelQueryBuilder whereOriginLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_lat', values);
    return this;
  }
  
    /// Filter origin_lat greater than
  TripsModelQueryBuilder whereOriginLatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat greater than or equal
  TripsModelQueryBuilder whereOriginLatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat less than
  TripsModelQueryBuilder whereOriginLatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat less than or equal
  TripsModelQueryBuilder whereOriginLatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat between two values
  TripsModelQueryBuilder whereOriginLatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('origin_lat', min).lte('origin_lat', max);
    return this;
  }

  /// Filter by origin_lng
  TripsModelQueryBuilder whereOriginLng(double value) {
    _queryBuilder = _queryBuilder.eq('origin_lng', value);
    return this;
  }
  
  /// Filter by origin_lng with multiple values (IN operator)
  TripsModelQueryBuilder whereOriginLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_lng', values);
    return this;
  }
  
    /// Filter origin_lng greater than
  TripsModelQueryBuilder whereOriginLngGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng greater than or equal
  TripsModelQueryBuilder whereOriginLngGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng less than
  TripsModelQueryBuilder whereOriginLngLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng less than or equal
  TripsModelQueryBuilder whereOriginLngLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng between two values
  TripsModelQueryBuilder whereOriginLngBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('origin_lng', min).lte('origin_lng', max);
    return this;
  }

  /// Filter by origin_point
  TripsModelQueryBuilder whereOriginPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('origin_point', value);
    return this;
  }
  
  /// Filter by origin_point with multiple values (IN operator)
  TripsModelQueryBuilder whereOriginPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_point', values);
    return this;
  }
  
  

  /// Filter by destination_address
  TripsModelQueryBuilder whereDestinationAddress(String value) {
    _queryBuilder = _queryBuilder.eq('destination_address', value);
    return this;
  }
  
  /// Filter by destination_address with multiple values (IN operator)
  TripsModelQueryBuilder whereDestinationAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_address', values);
    return this;
  }
  
  

  /// Filter by destination_lat
  TripsModelQueryBuilder whereDestinationLat(double value) {
    _queryBuilder = _queryBuilder.eq('destination_lat', value);
    return this;
  }
  
  /// Filter by destination_lat with multiple values (IN operator)
  TripsModelQueryBuilder whereDestinationLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_lat', values);
    return this;
  }
  
    /// Filter destination_lat greater than
  TripsModelQueryBuilder whereDestinationLatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat greater than or equal
  TripsModelQueryBuilder whereDestinationLatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat less than
  TripsModelQueryBuilder whereDestinationLatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat less than or equal
  TripsModelQueryBuilder whereDestinationLatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat between two values
  TripsModelQueryBuilder whereDestinationLatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('destination_lat', min).lte('destination_lat', max);
    return this;
  }

  /// Filter by destination_lng
  TripsModelQueryBuilder whereDestinationLng(double value) {
    _queryBuilder = _queryBuilder.eq('destination_lng', value);
    return this;
  }
  
  /// Filter by destination_lng with multiple values (IN operator)
  TripsModelQueryBuilder whereDestinationLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_lng', values);
    return this;
  }
  
    /// Filter destination_lng greater than
  TripsModelQueryBuilder whereDestinationLngGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng greater than or equal
  TripsModelQueryBuilder whereDestinationLngGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng less than
  TripsModelQueryBuilder whereDestinationLngLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng less than or equal
  TripsModelQueryBuilder whereDestinationLngLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng between two values
  TripsModelQueryBuilder whereDestinationLngBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('destination_lng', min).lte('destination_lng', max);
    return this;
  }

  /// Filter by destination_point
  TripsModelQueryBuilder whereDestinationPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('destination_point', value);
    return this;
  }
  
  /// Filter by destination_point with multiple values (IN operator)
  TripsModelQueryBuilder whereDestinationPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_point', values);
    return this;
  }
  
  

  /// Filter by departure_time
  TripsModelQueryBuilder whereDepartureTime(DateTime value) {
    _queryBuilder = _queryBuilder.eq('departure_time', value);
    return this;
  }
  
  /// Filter by departure_time with multiple values (IN operator)
  TripsModelQueryBuilder whereDepartureTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('departure_time', values);
    return this;
  }
  
    /// Filter departure_time greater than
  TripsModelQueryBuilder whereDepartureTimeGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('departure_time', value);
    return this;
  }
  
  /// Filter departure_time greater than or equal
  TripsModelQueryBuilder whereDepartureTimeGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('departure_time', value);
    return this;
  }
  
  /// Filter departure_time less than
  TripsModelQueryBuilder whereDepartureTimeLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('departure_time', value);
    return this;
  }
  
  /// Filter departure_time less than or equal
  TripsModelQueryBuilder whereDepartureTimeLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('departure_time', value);
    return this;
  }
  
  /// Filter departure_time between two values
  TripsModelQueryBuilder whereDepartureTimeBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('departure_time', min).lte('departure_time', max);
    return this;
  }

  /// Filter by estimated_arrival_time
  TripsModelQueryBuilder whereEstimatedArrivalTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter by estimated_arrival_time with multiple values (IN operator)
  TripsModelQueryBuilder whereEstimatedArrivalTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_arrival_time', values);
    return this;
  }
  
    /// Filter estimated_arrival_time greater than
  TripsModelQueryBuilder whereEstimatedArrivalTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time greater than or equal
  TripsModelQueryBuilder whereEstimatedArrivalTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time less than
  TripsModelQueryBuilder whereEstimatedArrivalTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time less than or equal
  TripsModelQueryBuilder whereEstimatedArrivalTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time between two values
  TripsModelQueryBuilder whereEstimatedArrivalTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('estimated_arrival_time', min).lte('estimated_arrival_time', max);
    return this;
  }

  /// Filter by available_seats
  TripsModelQueryBuilder whereAvailableSeats(int value) {
    _queryBuilder = _queryBuilder.eq('available_seats', value);
    return this;
  }
  
  /// Filter by available_seats with multiple values (IN operator)
  TripsModelQueryBuilder whereAvailableSeatsIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('available_seats', values);
    return this;
  }
  
    /// Filter available_seats greater than
  TripsModelQueryBuilder whereAvailableSeatsGreaterThan(int value) {
    _queryBuilder = _queryBuilder.gt('available_seats', value);
    return this;
  }
  
  /// Filter available_seats greater than or equal
  TripsModelQueryBuilder whereAvailableSeatsGreaterThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.gte('available_seats', value);
    return this;
  }
  
  /// Filter available_seats less than
  TripsModelQueryBuilder whereAvailableSeatsLessThan(int value) {
    _queryBuilder = _queryBuilder.lt('available_seats', value);
    return this;
  }
  
  /// Filter available_seats less than or equal
  TripsModelQueryBuilder whereAvailableSeatsLessThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.lte('available_seats', value);
    return this;
  }
  
  /// Filter available_seats between two values
  TripsModelQueryBuilder whereAvailableSeatsBetween(int min, int max) {
    _queryBuilder = _queryBuilder.gte('available_seats', min).lte('available_seats', max);
    return this;
  }

  /// Filter by total_distance_km
  TripsModelQueryBuilder whereTotalDistanceKm(double? value) {
    _queryBuilder = _queryBuilder.eq('total_distance_km', value);
    return this;
  }
  
  /// Filter by total_distance_km with multiple values (IN operator)
  TripsModelQueryBuilder whereTotalDistanceKmIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_distance_km', values);
    return this;
  }
  
    /// Filter total_distance_km greater than
  TripsModelQueryBuilder whereTotalDistanceKmGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('total_distance_km', value);
    return this;
  }
  
  /// Filter total_distance_km greater than or equal
  TripsModelQueryBuilder whereTotalDistanceKmGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('total_distance_km', value);
    return this;
  }
  
  /// Filter total_distance_km less than
  TripsModelQueryBuilder whereTotalDistanceKmLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('total_distance_km', value);
    return this;
  }
  
  /// Filter total_distance_km less than or equal
  TripsModelQueryBuilder whereTotalDistanceKmLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('total_distance_km', value);
    return this;
  }
  
  /// Filter total_distance_km between two values
  TripsModelQueryBuilder whereTotalDistanceKmBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('total_distance_km', min).lte('total_distance_km', max);
    return this;
  }

  /// Filter by price_per_seat
  TripsModelQueryBuilder wherePricePerSeat(double value) {
    _queryBuilder = _queryBuilder.eq('price_per_seat', value);
    return this;
  }
  
  /// Filter by price_per_seat with multiple values (IN operator)
  TripsModelQueryBuilder wherePricePerSeatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_per_seat', values);
    return this;
  }
  
    /// Filter price_per_seat greater than
  TripsModelQueryBuilder wherePricePerSeatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('price_per_seat', value);
    return this;
  }
  
  /// Filter price_per_seat greater than or equal
  TripsModelQueryBuilder wherePricePerSeatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('price_per_seat', value);
    return this;
  }
  
  /// Filter price_per_seat less than
  TripsModelQueryBuilder wherePricePerSeatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('price_per_seat', value);
    return this;
  }
  
  /// Filter price_per_seat less than or equal
  TripsModelQueryBuilder wherePricePerSeatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('price_per_seat', value);
    return this;
  }
  
  /// Filter price_per_seat between two values
  TripsModelQueryBuilder wherePricePerSeatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('price_per_seat', min).lte('price_per_seat', max);
    return this;
  }

  /// Filter by currency
  TripsModelQueryBuilder whereCurrency(String? value) {
    _queryBuilder = _queryBuilder.eq('currency', value);
    return this;
  }
  
  /// Filter by currency with multiple values (IN operator)
  TripsModelQueryBuilder whereCurrencyIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('currency', values);
    return this;
  }
  
  

  /// Filter by trip_status
  TripsModelQueryBuilder whereTripStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('trip_status', value);
    return this;
  }
  
  /// Filter by trip_status with multiple values (IN operator)
  TripsModelQueryBuilder whereTripStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('trip_status', values);
    return this;
  }
  
  

  /// Filter by is_recurring
  TripsModelQueryBuilder whereIsRecurring(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_recurring', value);
    return this;
  }
  
  /// Filter by is_recurring with multiple values (IN operator)
  TripsModelQueryBuilder whereIsRecurringIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_recurring', values);
    return this;
  }
  
  

  /// Filter by recurring_pattern
  TripsModelQueryBuilder whereRecurringPattern(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('recurring_pattern', value);
    return this;
  }
  
  /// Filter by recurring_pattern with multiple values (IN operator)
  TripsModelQueryBuilder whereRecurringPatternIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('recurring_pattern', values);
    return this;
  }
  
  

  /// Filter by allows_pets
  TripsModelQueryBuilder whereAllowsPets(bool? value) {
    _queryBuilder = _queryBuilder.eq('allows_pets', value);
    return this;
  }
  
  /// Filter by allows_pets with multiple values (IN operator)
  TripsModelQueryBuilder whereAllowsPetsIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('allows_pets', values);
    return this;
  }
  
  

  /// Filter by allows_smoking
  TripsModelQueryBuilder whereAllowsSmoking(bool? value) {
    _queryBuilder = _queryBuilder.eq('allows_smoking', value);
    return this;
  }
  
  /// Filter by allows_smoking with multiple values (IN operator)
  TripsModelQueryBuilder whereAllowsSmokingIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('allows_smoking', values);
    return this;
  }
  
  

  /// Filter by allows_music
  TripsModelQueryBuilder whereAllowsMusic(bool? value) {
    _queryBuilder = _queryBuilder.eq('allows_music', value);
    return this;
  }
  
  /// Filter by allows_music with multiple values (IN operator)
  TripsModelQueryBuilder whereAllowsMusicIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('allows_music', values);
    return this;
  }
  
  

  /// Filter by max_luggage_size
  TripsModelQueryBuilder whereMaxLuggageSize(String? value) {
    _queryBuilder = _queryBuilder.eq('max_luggage_size', value);
    return this;
  }
  
  /// Filter by max_luggage_size with multiple values (IN operator)
  TripsModelQueryBuilder whereMaxLuggageSizeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('max_luggage_size', values);
    return this;
  }
  
  

  /// Filter by notes
  TripsModelQueryBuilder whereNotes(String? value) {
    _queryBuilder = _queryBuilder.eq('notes', value);
    return this;
  }
  
  /// Filter by notes with multiple values (IN operator)
  TripsModelQueryBuilder whereNotesIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notes', values);
    return this;
  }
  
  

  /// Filter by created_at
  TripsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  TripsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  TripsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  TripsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  TripsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  TripsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  TripsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  TripsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  TripsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  TripsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  TripsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  TripsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  TripsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  TripsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by started_at
  TripsModelQueryBuilder whereStartedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('started_at', value);
    return this;
  }
  
  /// Filter by started_at with multiple values (IN operator)
  TripsModelQueryBuilder whereStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('started_at', values);
    return this;
  }
  
    /// Filter started_at greater than
  TripsModelQueryBuilder whereStartedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('started_at', value);
    return this;
  }
  
  /// Filter started_at greater than or equal
  TripsModelQueryBuilder whereStartedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('started_at', value);
    return this;
  }
  
  /// Filter started_at less than
  TripsModelQueryBuilder whereStartedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('started_at', value);
    return this;
  }
  
  /// Filter started_at less than or equal
  TripsModelQueryBuilder whereStartedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('started_at', value);
    return this;
  }
  
  /// Filter started_at between two values
  TripsModelQueryBuilder whereStartedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('started_at', min).lte('started_at', max);
    return this;
  }

  /// Filter by completed_at
  TripsModelQueryBuilder whereCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('completed_at', value);
    return this;
  }
  
  /// Filter by completed_at with multiple values (IN operator)
  TripsModelQueryBuilder whereCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completed_at', values);
    return this;
  }
  
    /// Filter completed_at greater than
  TripsModelQueryBuilder whereCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at greater than or equal
  TripsModelQueryBuilder whereCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than
  TripsModelQueryBuilder whereCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than or equal
  TripsModelQueryBuilder whereCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at between two values
  TripsModelQueryBuilder whereCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('completed_at', min).lte('completed_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  TripsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  TripsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by driver_id in ascending order
  TripsModelQueryBuilder orderByDriverIdAsc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: true);
    return this;
  }
  
  /// Order by driver_id in descending order
  TripsModelQueryBuilder orderByDriverIdDesc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: false);
    return this;
  }

  /// Order by vehicle_id in ascending order
  TripsModelQueryBuilder orderByVehicleIdAsc() {
    _queryBuilder = _queryBuilder.order('vehicle_id', ascending: true);
    return this;
  }
  
  /// Order by vehicle_id in descending order
  TripsModelQueryBuilder orderByVehicleIdDesc() {
    _queryBuilder = _queryBuilder.order('vehicle_id', ascending: false);
    return this;
  }

  /// Order by origin_address in ascending order
  TripsModelQueryBuilder orderByOriginAddressAsc() {
    _queryBuilder = _queryBuilder.order('origin_address', ascending: true);
    return this;
  }
  
  /// Order by origin_address in descending order
  TripsModelQueryBuilder orderByOriginAddressDesc() {
    _queryBuilder = _queryBuilder.order('origin_address', ascending: false);
    return this;
  }

  /// Order by origin_lat in ascending order
  TripsModelQueryBuilder orderByOriginLatAsc() {
    _queryBuilder = _queryBuilder.order('origin_lat', ascending: true);
    return this;
  }
  
  /// Order by origin_lat in descending order
  TripsModelQueryBuilder orderByOriginLatDesc() {
    _queryBuilder = _queryBuilder.order('origin_lat', ascending: false);
    return this;
  }

  /// Order by origin_lng in ascending order
  TripsModelQueryBuilder orderByOriginLngAsc() {
    _queryBuilder = _queryBuilder.order('origin_lng', ascending: true);
    return this;
  }
  
  /// Order by origin_lng in descending order
  TripsModelQueryBuilder orderByOriginLngDesc() {
    _queryBuilder = _queryBuilder.order('origin_lng', ascending: false);
    return this;
  }

  /// Order by origin_point in ascending order
  TripsModelQueryBuilder orderByOriginPointAsc() {
    _queryBuilder = _queryBuilder.order('origin_point', ascending: true);
    return this;
  }
  
  /// Order by origin_point in descending order
  TripsModelQueryBuilder orderByOriginPointDesc() {
    _queryBuilder = _queryBuilder.order('origin_point', ascending: false);
    return this;
  }

  /// Order by destination_address in ascending order
  TripsModelQueryBuilder orderByDestinationAddressAsc() {
    _queryBuilder = _queryBuilder.order('destination_address', ascending: true);
    return this;
  }
  
  /// Order by destination_address in descending order
  TripsModelQueryBuilder orderByDestinationAddressDesc() {
    _queryBuilder = _queryBuilder.order('destination_address', ascending: false);
    return this;
  }

  /// Order by destination_lat in ascending order
  TripsModelQueryBuilder orderByDestinationLatAsc() {
    _queryBuilder = _queryBuilder.order('destination_lat', ascending: true);
    return this;
  }
  
  /// Order by destination_lat in descending order
  TripsModelQueryBuilder orderByDestinationLatDesc() {
    _queryBuilder = _queryBuilder.order('destination_lat', ascending: false);
    return this;
  }

  /// Order by destination_lng in ascending order
  TripsModelQueryBuilder orderByDestinationLngAsc() {
    _queryBuilder = _queryBuilder.order('destination_lng', ascending: true);
    return this;
  }
  
  /// Order by destination_lng in descending order
  TripsModelQueryBuilder orderByDestinationLngDesc() {
    _queryBuilder = _queryBuilder.order('destination_lng', ascending: false);
    return this;
  }

  /// Order by destination_point in ascending order
  TripsModelQueryBuilder orderByDestinationPointAsc() {
    _queryBuilder = _queryBuilder.order('destination_point', ascending: true);
    return this;
  }
  
  /// Order by destination_point in descending order
  TripsModelQueryBuilder orderByDestinationPointDesc() {
    _queryBuilder = _queryBuilder.order('destination_point', ascending: false);
    return this;
  }

  /// Order by departure_time in ascending order
  TripsModelQueryBuilder orderByDepartureTimeAsc() {
    _queryBuilder = _queryBuilder.order('departure_time', ascending: true);
    return this;
  }
  
  /// Order by departure_time in descending order
  TripsModelQueryBuilder orderByDepartureTimeDesc() {
    _queryBuilder = _queryBuilder.order('departure_time', ascending: false);
    return this;
  }

  /// Order by estimated_arrival_time in ascending order
  TripsModelQueryBuilder orderByEstimatedArrivalTimeAsc() {
    _queryBuilder = _queryBuilder.order('estimated_arrival_time', ascending: true);
    return this;
  }
  
  /// Order by estimated_arrival_time in descending order
  TripsModelQueryBuilder orderByEstimatedArrivalTimeDesc() {
    _queryBuilder = _queryBuilder.order('estimated_arrival_time', ascending: false);
    return this;
  }

  /// Order by available_seats in ascending order
  TripsModelQueryBuilder orderByAvailableSeatsAsc() {
    _queryBuilder = _queryBuilder.order('available_seats', ascending: true);
    return this;
  }
  
  /// Order by available_seats in descending order
  TripsModelQueryBuilder orderByAvailableSeatsDesc() {
    _queryBuilder = _queryBuilder.order('available_seats', ascending: false);
    return this;
  }

  /// Order by total_distance_km in ascending order
  TripsModelQueryBuilder orderByTotalDistanceKmAsc() {
    _queryBuilder = _queryBuilder.order('total_distance_km', ascending: true);
    return this;
  }
  
  /// Order by total_distance_km in descending order
  TripsModelQueryBuilder orderByTotalDistanceKmDesc() {
    _queryBuilder = _queryBuilder.order('total_distance_km', ascending: false);
    return this;
  }

  /// Order by price_per_seat in ascending order
  TripsModelQueryBuilder orderByPricePerSeatAsc() {
    _queryBuilder = _queryBuilder.order('price_per_seat', ascending: true);
    return this;
  }
  
  /// Order by price_per_seat in descending order
  TripsModelQueryBuilder orderByPricePerSeatDesc() {
    _queryBuilder = _queryBuilder.order('price_per_seat', ascending: false);
    return this;
  }

  /// Order by currency in ascending order
  TripsModelQueryBuilder orderByCurrencyAsc() {
    _queryBuilder = _queryBuilder.order('currency', ascending: true);
    return this;
  }
  
  /// Order by currency in descending order
  TripsModelQueryBuilder orderByCurrencyDesc() {
    _queryBuilder = _queryBuilder.order('currency', ascending: false);
    return this;
  }

  /// Order by trip_status in ascending order
  TripsModelQueryBuilder orderByTripStatusAsc() {
    _queryBuilder = _queryBuilder.order('trip_status', ascending: true);
    return this;
  }
  
  /// Order by trip_status in descending order
  TripsModelQueryBuilder orderByTripStatusDesc() {
    _queryBuilder = _queryBuilder.order('trip_status', ascending: false);
    return this;
  }

  /// Order by is_recurring in ascending order
  TripsModelQueryBuilder orderByIsRecurringAsc() {
    _queryBuilder = _queryBuilder.order('is_recurring', ascending: true);
    return this;
  }
  
  /// Order by is_recurring in descending order
  TripsModelQueryBuilder orderByIsRecurringDesc() {
    _queryBuilder = _queryBuilder.order('is_recurring', ascending: false);
    return this;
  }

  /// Order by recurring_pattern in ascending order
  TripsModelQueryBuilder orderByRecurringPatternAsc() {
    _queryBuilder = _queryBuilder.order('recurring_pattern', ascending: true);
    return this;
  }
  
  /// Order by recurring_pattern in descending order
  TripsModelQueryBuilder orderByRecurringPatternDesc() {
    _queryBuilder = _queryBuilder.order('recurring_pattern', ascending: false);
    return this;
  }

  /// Order by allows_pets in ascending order
  TripsModelQueryBuilder orderByAllowsPetsAsc() {
    _queryBuilder = _queryBuilder.order('allows_pets', ascending: true);
    return this;
  }
  
  /// Order by allows_pets in descending order
  TripsModelQueryBuilder orderByAllowsPetsDesc() {
    _queryBuilder = _queryBuilder.order('allows_pets', ascending: false);
    return this;
  }

  /// Order by allows_smoking in ascending order
  TripsModelQueryBuilder orderByAllowsSmokingAsc() {
    _queryBuilder = _queryBuilder.order('allows_smoking', ascending: true);
    return this;
  }
  
  /// Order by allows_smoking in descending order
  TripsModelQueryBuilder orderByAllowsSmokingDesc() {
    _queryBuilder = _queryBuilder.order('allows_smoking', ascending: false);
    return this;
  }

  /// Order by allows_music in ascending order
  TripsModelQueryBuilder orderByAllowsMusicAsc() {
    _queryBuilder = _queryBuilder.order('allows_music', ascending: true);
    return this;
  }
  
  /// Order by allows_music in descending order
  TripsModelQueryBuilder orderByAllowsMusicDesc() {
    _queryBuilder = _queryBuilder.order('allows_music', ascending: false);
    return this;
  }

  /// Order by max_luggage_size in ascending order
  TripsModelQueryBuilder orderByMaxLuggageSizeAsc() {
    _queryBuilder = _queryBuilder.order('max_luggage_size', ascending: true);
    return this;
  }
  
  /// Order by max_luggage_size in descending order
  TripsModelQueryBuilder orderByMaxLuggageSizeDesc() {
    _queryBuilder = _queryBuilder.order('max_luggage_size', ascending: false);
    return this;
  }

  /// Order by notes in ascending order
  TripsModelQueryBuilder orderByNotesAsc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: true);
    return this;
  }
  
  /// Order by notes in descending order
  TripsModelQueryBuilder orderByNotesDesc() {
    _queryBuilder = _queryBuilder.order('notes', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  TripsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  TripsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  TripsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  TripsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by started_at in ascending order
  TripsModelQueryBuilder orderByStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: true);
    return this;
  }
  
  /// Order by started_at in descending order
  TripsModelQueryBuilder orderByStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('started_at', ascending: false);
    return this;
  }

  /// Order by completed_at in ascending order
  TripsModelQueryBuilder orderByCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: true);
    return this;
  }
  
  /// Order by completed_at in descending order
  TripsModelQueryBuilder orderByCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of TripsModel
  Future<List<TripsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => TripsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<TripsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return TripsModel.fromJson(response.first as Map<String, dynamic>);
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
