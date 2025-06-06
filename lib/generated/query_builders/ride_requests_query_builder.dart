import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/ride_requests_model.dart';

/// A type-safe query builder for RideRequestsModel
class RideRequestsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  RideRequestsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('ride_requests').select();
  }
  
  /// Set the fields to select
  RideRequestsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('ride_requests').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  RideRequestsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  RideRequestsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  RideRequestsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by trip_id
  RideRequestsModelQueryBuilder whereTripId(String value) {
    _queryBuilder = _queryBuilder.eq('trip_id', value);
    return this;
  }
  
  /// Filter by trip_id with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('trip_id', values);
    return this;
  }
  
  

  /// Filter by passenger_id
  RideRequestsModelQueryBuilder wherePassengerId(String value) {
    _queryBuilder = _queryBuilder.eq('passenger_id', value);
    return this;
  }
  
  /// Filter by passenger_id with multiple values (IN operator)
  RideRequestsModelQueryBuilder wherePassengerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('passenger_id', values);
    return this;
  }
  
  

  /// Filter by seats_requested
  RideRequestsModelQueryBuilder whereSeatsRequested(int value) {
    _queryBuilder = _queryBuilder.eq('seats_requested', value);
    return this;
  }
  
  /// Filter by seats_requested with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereSeatsRequestedIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('seats_requested', values);
    return this;
  }
  
    /// Filter seats_requested greater than
  RideRequestsModelQueryBuilder whereSeatsRequestedGreaterThan(int value) {
    _queryBuilder = _queryBuilder.gt('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested greater than or equal
  RideRequestsModelQueryBuilder whereSeatsRequestedGreaterThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.gte('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested less than
  RideRequestsModelQueryBuilder whereSeatsRequestedLessThan(int value) {
    _queryBuilder = _queryBuilder.lt('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested less than or equal
  RideRequestsModelQueryBuilder whereSeatsRequestedLessThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.lte('seats_requested', value);
    return this;
  }
  
  /// Filter seats_requested between two values
  RideRequestsModelQueryBuilder whereSeatsRequestedBetween(int min, int max) {
    _queryBuilder = _queryBuilder.gte('seats_requested', min).lte('seats_requested', max);
    return this;
  }

  /// Filter by pickup_address
  RideRequestsModelQueryBuilder wherePickupAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('pickup_address', value);
    return this;
  }
  
  /// Filter by pickup_address with multiple values (IN operator)
  RideRequestsModelQueryBuilder wherePickupAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_address', values);
    return this;
  }
  
  

  /// Filter by pickup_lat
  RideRequestsModelQueryBuilder wherePickupLat(double? value) {
    _queryBuilder = _queryBuilder.eq('pickup_lat', value);
    return this;
  }
  
  /// Filter by pickup_lat with multiple values (IN operator)
  RideRequestsModelQueryBuilder wherePickupLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_lat', values);
    return this;
  }
  
    /// Filter pickup_lat greater than
  RideRequestsModelQueryBuilder wherePickupLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat greater than or equal
  RideRequestsModelQueryBuilder wherePickupLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat less than
  RideRequestsModelQueryBuilder wherePickupLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat less than or equal
  RideRequestsModelQueryBuilder wherePickupLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('pickup_lat', value);
    return this;
  }
  
  /// Filter pickup_lat between two values
  RideRequestsModelQueryBuilder wherePickupLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('pickup_lat', min).lte('pickup_lat', max);
    return this;
  }

  /// Filter by pickup_lng
  RideRequestsModelQueryBuilder wherePickupLng(double? value) {
    _queryBuilder = _queryBuilder.eq('pickup_lng', value);
    return this;
  }
  
  /// Filter by pickup_lng with multiple values (IN operator)
  RideRequestsModelQueryBuilder wherePickupLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_lng', values);
    return this;
  }
  
    /// Filter pickup_lng greater than
  RideRequestsModelQueryBuilder wherePickupLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng greater than or equal
  RideRequestsModelQueryBuilder wherePickupLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng less than
  RideRequestsModelQueryBuilder wherePickupLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng less than or equal
  RideRequestsModelQueryBuilder wherePickupLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('pickup_lng', value);
    return this;
  }
  
  /// Filter pickup_lng between two values
  RideRequestsModelQueryBuilder wherePickupLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('pickup_lng', min).lte('pickup_lng', max);
    return this;
  }

  /// Filter by pickup_point
  RideRequestsModelQueryBuilder wherePickupPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('pickup_point', value);
    return this;
  }
  
  /// Filter by pickup_point with multiple values (IN operator)
  RideRequestsModelQueryBuilder wherePickupPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_point', values);
    return this;
  }
  
  

  /// Filter by dropoff_address
  RideRequestsModelQueryBuilder whereDropoffAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('dropoff_address', value);
    return this;
  }
  
  /// Filter by dropoff_address with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereDropoffAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('dropoff_address', values);
    return this;
  }
  
  

  /// Filter by dropoff_lat
  RideRequestsModelQueryBuilder whereDropoffLat(double? value) {
    _queryBuilder = _queryBuilder.eq('dropoff_lat', value);
    return this;
  }
  
  /// Filter by dropoff_lat with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereDropoffLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('dropoff_lat', values);
    return this;
  }
  
    /// Filter dropoff_lat greater than
  RideRequestsModelQueryBuilder whereDropoffLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('dropoff_lat', value);
    return this;
  }
  
  /// Filter dropoff_lat greater than or equal
  RideRequestsModelQueryBuilder whereDropoffLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('dropoff_lat', value);
    return this;
  }
  
  /// Filter dropoff_lat less than
  RideRequestsModelQueryBuilder whereDropoffLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('dropoff_lat', value);
    return this;
  }
  
  /// Filter dropoff_lat less than or equal
  RideRequestsModelQueryBuilder whereDropoffLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('dropoff_lat', value);
    return this;
  }
  
  /// Filter dropoff_lat between two values
  RideRequestsModelQueryBuilder whereDropoffLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('dropoff_lat', min).lte('dropoff_lat', max);
    return this;
  }

  /// Filter by dropoff_lng
  RideRequestsModelQueryBuilder whereDropoffLng(double? value) {
    _queryBuilder = _queryBuilder.eq('dropoff_lng', value);
    return this;
  }
  
  /// Filter by dropoff_lng with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereDropoffLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('dropoff_lng', values);
    return this;
  }
  
    /// Filter dropoff_lng greater than
  RideRequestsModelQueryBuilder whereDropoffLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('dropoff_lng', value);
    return this;
  }
  
  /// Filter dropoff_lng greater than or equal
  RideRequestsModelQueryBuilder whereDropoffLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('dropoff_lng', value);
    return this;
  }
  
  /// Filter dropoff_lng less than
  RideRequestsModelQueryBuilder whereDropoffLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('dropoff_lng', value);
    return this;
  }
  
  /// Filter dropoff_lng less than or equal
  RideRequestsModelQueryBuilder whereDropoffLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('dropoff_lng', value);
    return this;
  }
  
  /// Filter dropoff_lng between two values
  RideRequestsModelQueryBuilder whereDropoffLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('dropoff_lng', min).lte('dropoff_lng', max);
    return this;
  }

  /// Filter by dropoff_point
  RideRequestsModelQueryBuilder whereDropoffPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('dropoff_point', value);
    return this;
  }
  
  /// Filter by dropoff_point with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereDropoffPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('dropoff_point', values);
    return this;
  }
  
  

  /// Filter by offered_price_per_seat
  RideRequestsModelQueryBuilder whereOfferedPricePerSeat(double value) {
    _queryBuilder = _queryBuilder.eq('offered_price_per_seat', value);
    return this;
  }
  
  /// Filter by offered_price_per_seat with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereOfferedPricePerSeatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('offered_price_per_seat', values);
    return this;
  }
  
    /// Filter offered_price_per_seat greater than
  RideRequestsModelQueryBuilder whereOfferedPricePerSeatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('offered_price_per_seat', value);
    return this;
  }
  
  /// Filter offered_price_per_seat greater than or equal
  RideRequestsModelQueryBuilder whereOfferedPricePerSeatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('offered_price_per_seat', value);
    return this;
  }
  
  /// Filter offered_price_per_seat less than
  RideRequestsModelQueryBuilder whereOfferedPricePerSeatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('offered_price_per_seat', value);
    return this;
  }
  
  /// Filter offered_price_per_seat less than or equal
  RideRequestsModelQueryBuilder whereOfferedPricePerSeatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('offered_price_per_seat', value);
    return this;
  }
  
  /// Filter offered_price_per_seat between two values
  RideRequestsModelQueryBuilder whereOfferedPricePerSeatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('offered_price_per_seat', min).lte('offered_price_per_seat', max);
    return this;
  }

  /// Filter by total_offered_price
  RideRequestsModelQueryBuilder whereTotalOfferedPrice(double? value) {
    _queryBuilder = _queryBuilder.eq('total_offered_price', value);
    return this;
  }
  
  /// Filter by total_offered_price with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereTotalOfferedPriceIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_offered_price', values);
    return this;
  }
  
    /// Filter total_offered_price greater than
  RideRequestsModelQueryBuilder whereTotalOfferedPriceGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('total_offered_price', value);
    return this;
  }
  
  /// Filter total_offered_price greater than or equal
  RideRequestsModelQueryBuilder whereTotalOfferedPriceGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('total_offered_price', value);
    return this;
  }
  
  /// Filter total_offered_price less than
  RideRequestsModelQueryBuilder whereTotalOfferedPriceLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('total_offered_price', value);
    return this;
  }
  
  /// Filter total_offered_price less than or equal
  RideRequestsModelQueryBuilder whereTotalOfferedPriceLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('total_offered_price', value);
    return this;
  }
  
  /// Filter total_offered_price between two values
  RideRequestsModelQueryBuilder whereTotalOfferedPriceBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('total_offered_price', min).lte('total_offered_price', max);
    return this;
  }

  /// Filter by status
  RideRequestsModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by message_to_driver
  RideRequestsModelQueryBuilder whereMessageToDriver(String? value) {
    _queryBuilder = _queryBuilder.eq('message_to_driver', value);
    return this;
  }
  
  /// Filter by message_to_driver with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereMessageToDriverIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('message_to_driver', values);
    return this;
  }
  
  

  /// Filter by driver_response_message
  RideRequestsModelQueryBuilder whereDriverResponseMessage(String? value) {
    _queryBuilder = _queryBuilder.eq('driver_response_message', value);
    return this;
  }
  
  /// Filter by driver_response_message with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereDriverResponseMessageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_response_message', values);
    return this;
  }
  
  

  /// Filter by requested_at
  RideRequestsModelQueryBuilder whereRequestedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('requested_at', value);
    return this;
  }
  
  /// Filter by requested_at with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereRequestedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('requested_at', values);
    return this;
  }
  
    /// Filter requested_at greater than
  RideRequestsModelQueryBuilder whereRequestedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('requested_at', value);
    return this;
  }
  
  /// Filter requested_at greater than or equal
  RideRequestsModelQueryBuilder whereRequestedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('requested_at', value);
    return this;
  }
  
  /// Filter requested_at less than
  RideRequestsModelQueryBuilder whereRequestedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('requested_at', value);
    return this;
  }
  
  /// Filter requested_at less than or equal
  RideRequestsModelQueryBuilder whereRequestedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('requested_at', value);
    return this;
  }
  
  /// Filter requested_at between two values
  RideRequestsModelQueryBuilder whereRequestedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('requested_at', min).lte('requested_at', max);
    return this;
  }

  /// Filter by responded_at
  RideRequestsModelQueryBuilder whereRespondedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('responded_at', value);
    return this;
  }
  
  /// Filter by responded_at with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereRespondedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('responded_at', values);
    return this;
  }
  
    /// Filter responded_at greater than
  RideRequestsModelQueryBuilder whereRespondedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('responded_at', value);
    return this;
  }
  
  /// Filter responded_at greater than or equal
  RideRequestsModelQueryBuilder whereRespondedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('responded_at', value);
    return this;
  }
  
  /// Filter responded_at less than
  RideRequestsModelQueryBuilder whereRespondedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('responded_at', value);
    return this;
  }
  
  /// Filter responded_at less than or equal
  RideRequestsModelQueryBuilder whereRespondedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('responded_at', value);
    return this;
  }
  
  /// Filter responded_at between two values
  RideRequestsModelQueryBuilder whereRespondedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('responded_at', min).lte('responded_at', max);
    return this;
  }

  /// Filter by expires_at
  RideRequestsModelQueryBuilder whereExpiresAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('expires_at', value);
    return this;
  }
  
  /// Filter by expires_at with multiple values (IN operator)
  RideRequestsModelQueryBuilder whereExpiresAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('expires_at', values);
    return this;
  }
  
    /// Filter expires_at greater than
  RideRequestsModelQueryBuilder whereExpiresAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at greater than or equal
  RideRequestsModelQueryBuilder whereExpiresAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than
  RideRequestsModelQueryBuilder whereExpiresAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than or equal
  RideRequestsModelQueryBuilder whereExpiresAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at between two values
  RideRequestsModelQueryBuilder whereExpiresAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('expires_at', min).lte('expires_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  RideRequestsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  RideRequestsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by trip_id in ascending order
  RideRequestsModelQueryBuilder orderByTripIdAsc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: true);
    return this;
  }
  
  /// Order by trip_id in descending order
  RideRequestsModelQueryBuilder orderByTripIdDesc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: false);
    return this;
  }

  /// Order by passenger_id in ascending order
  RideRequestsModelQueryBuilder orderByPassengerIdAsc() {
    _queryBuilder = _queryBuilder.order('passenger_id', ascending: true);
    return this;
  }
  
  /// Order by passenger_id in descending order
  RideRequestsModelQueryBuilder orderByPassengerIdDesc() {
    _queryBuilder = _queryBuilder.order('passenger_id', ascending: false);
    return this;
  }

  /// Order by seats_requested in ascending order
  RideRequestsModelQueryBuilder orderBySeatsRequestedAsc() {
    _queryBuilder = _queryBuilder.order('seats_requested', ascending: true);
    return this;
  }
  
  /// Order by seats_requested in descending order
  RideRequestsModelQueryBuilder orderBySeatsRequestedDesc() {
    _queryBuilder = _queryBuilder.order('seats_requested', ascending: false);
    return this;
  }

  /// Order by pickup_address in ascending order
  RideRequestsModelQueryBuilder orderByPickupAddressAsc() {
    _queryBuilder = _queryBuilder.order('pickup_address', ascending: true);
    return this;
  }
  
  /// Order by pickup_address in descending order
  RideRequestsModelQueryBuilder orderByPickupAddressDesc() {
    _queryBuilder = _queryBuilder.order('pickup_address', ascending: false);
    return this;
  }

  /// Order by pickup_lat in ascending order
  RideRequestsModelQueryBuilder orderByPickupLatAsc() {
    _queryBuilder = _queryBuilder.order('pickup_lat', ascending: true);
    return this;
  }
  
  /// Order by pickup_lat in descending order
  RideRequestsModelQueryBuilder orderByPickupLatDesc() {
    _queryBuilder = _queryBuilder.order('pickup_lat', ascending: false);
    return this;
  }

  /// Order by pickup_lng in ascending order
  RideRequestsModelQueryBuilder orderByPickupLngAsc() {
    _queryBuilder = _queryBuilder.order('pickup_lng', ascending: true);
    return this;
  }
  
  /// Order by pickup_lng in descending order
  RideRequestsModelQueryBuilder orderByPickupLngDesc() {
    _queryBuilder = _queryBuilder.order('pickup_lng', ascending: false);
    return this;
  }

  /// Order by pickup_point in ascending order
  RideRequestsModelQueryBuilder orderByPickupPointAsc() {
    _queryBuilder = _queryBuilder.order('pickup_point', ascending: true);
    return this;
  }
  
  /// Order by pickup_point in descending order
  RideRequestsModelQueryBuilder orderByPickupPointDesc() {
    _queryBuilder = _queryBuilder.order('pickup_point', ascending: false);
    return this;
  }

  /// Order by dropoff_address in ascending order
  RideRequestsModelQueryBuilder orderByDropoffAddressAsc() {
    _queryBuilder = _queryBuilder.order('dropoff_address', ascending: true);
    return this;
  }
  
  /// Order by dropoff_address in descending order
  RideRequestsModelQueryBuilder orderByDropoffAddressDesc() {
    _queryBuilder = _queryBuilder.order('dropoff_address', ascending: false);
    return this;
  }

  /// Order by dropoff_lat in ascending order
  RideRequestsModelQueryBuilder orderByDropoffLatAsc() {
    _queryBuilder = _queryBuilder.order('dropoff_lat', ascending: true);
    return this;
  }
  
  /// Order by dropoff_lat in descending order
  RideRequestsModelQueryBuilder orderByDropoffLatDesc() {
    _queryBuilder = _queryBuilder.order('dropoff_lat', ascending: false);
    return this;
  }

  /// Order by dropoff_lng in ascending order
  RideRequestsModelQueryBuilder orderByDropoffLngAsc() {
    _queryBuilder = _queryBuilder.order('dropoff_lng', ascending: true);
    return this;
  }
  
  /// Order by dropoff_lng in descending order
  RideRequestsModelQueryBuilder orderByDropoffLngDesc() {
    _queryBuilder = _queryBuilder.order('dropoff_lng', ascending: false);
    return this;
  }

  /// Order by dropoff_point in ascending order
  RideRequestsModelQueryBuilder orderByDropoffPointAsc() {
    _queryBuilder = _queryBuilder.order('dropoff_point', ascending: true);
    return this;
  }
  
  /// Order by dropoff_point in descending order
  RideRequestsModelQueryBuilder orderByDropoffPointDesc() {
    _queryBuilder = _queryBuilder.order('dropoff_point', ascending: false);
    return this;
  }

  /// Order by offered_price_per_seat in ascending order
  RideRequestsModelQueryBuilder orderByOfferedPricePerSeatAsc() {
    _queryBuilder = _queryBuilder.order('offered_price_per_seat', ascending: true);
    return this;
  }
  
  /// Order by offered_price_per_seat in descending order
  RideRequestsModelQueryBuilder orderByOfferedPricePerSeatDesc() {
    _queryBuilder = _queryBuilder.order('offered_price_per_seat', ascending: false);
    return this;
  }

  /// Order by total_offered_price in ascending order
  RideRequestsModelQueryBuilder orderByTotalOfferedPriceAsc() {
    _queryBuilder = _queryBuilder.order('total_offered_price', ascending: true);
    return this;
  }
  
  /// Order by total_offered_price in descending order
  RideRequestsModelQueryBuilder orderByTotalOfferedPriceDesc() {
    _queryBuilder = _queryBuilder.order('total_offered_price', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  RideRequestsModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  RideRequestsModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by message_to_driver in ascending order
  RideRequestsModelQueryBuilder orderByMessageToDriverAsc() {
    _queryBuilder = _queryBuilder.order('message_to_driver', ascending: true);
    return this;
  }
  
  /// Order by message_to_driver in descending order
  RideRequestsModelQueryBuilder orderByMessageToDriverDesc() {
    _queryBuilder = _queryBuilder.order('message_to_driver', ascending: false);
    return this;
  }

  /// Order by driver_response_message in ascending order
  RideRequestsModelQueryBuilder orderByDriverResponseMessageAsc() {
    _queryBuilder = _queryBuilder.order('driver_response_message', ascending: true);
    return this;
  }
  
  /// Order by driver_response_message in descending order
  RideRequestsModelQueryBuilder orderByDriverResponseMessageDesc() {
    _queryBuilder = _queryBuilder.order('driver_response_message', ascending: false);
    return this;
  }

  /// Order by requested_at in ascending order
  RideRequestsModelQueryBuilder orderByRequestedAtAsc() {
    _queryBuilder = _queryBuilder.order('requested_at', ascending: true);
    return this;
  }
  
  /// Order by requested_at in descending order
  RideRequestsModelQueryBuilder orderByRequestedAtDesc() {
    _queryBuilder = _queryBuilder.order('requested_at', ascending: false);
    return this;
  }

  /// Order by responded_at in ascending order
  RideRequestsModelQueryBuilder orderByRespondedAtAsc() {
    _queryBuilder = _queryBuilder.order('responded_at', ascending: true);
    return this;
  }
  
  /// Order by responded_at in descending order
  RideRequestsModelQueryBuilder orderByRespondedAtDesc() {
    _queryBuilder = _queryBuilder.order('responded_at', ascending: false);
    return this;
  }

  /// Order by expires_at in ascending order
  RideRequestsModelQueryBuilder orderByExpiresAtAsc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: true);
    return this;
  }
  
  /// Order by expires_at in descending order
  RideRequestsModelQueryBuilder orderByExpiresAtDesc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of RideRequestsModel
  Future<List<RideRequestsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => RideRequestsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<RideRequestsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return RideRequestsModel.fromJson(response.first as Map<String, dynamic>);
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
