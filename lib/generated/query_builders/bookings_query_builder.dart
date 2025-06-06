import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/bookings_model.dart';

/// A type-safe query builder for BookingsModel
class BookingsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  BookingsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('bookings').select();
  }
  
  /// Set the fields to select
  BookingsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('bookings').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  BookingsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  BookingsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  BookingsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  BookingsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by trip_id
  BookingsModelQueryBuilder whereTripId(String value) {
    _queryBuilder = _queryBuilder.eq('trip_id', value);
    return this;
  }
  
  /// Filter by trip_id with multiple values (IN operator)
  BookingsModelQueryBuilder whereTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('trip_id', values);
    return this;
  }
  
  

  /// Filter by ride_request_id
  BookingsModelQueryBuilder whereRideRequestId(String value) {
    _queryBuilder = _queryBuilder.eq('ride_request_id', value);
    return this;
  }
  
  /// Filter by ride_request_id with multiple values (IN operator)
  BookingsModelQueryBuilder whereRideRequestIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('ride_request_id', values);
    return this;
  }
  
  

  /// Filter by passenger_id
  BookingsModelQueryBuilder wherePassengerId(String value) {
    _queryBuilder = _queryBuilder.eq('passenger_id', value);
    return this;
  }
  
  /// Filter by passenger_id with multiple values (IN operator)
  BookingsModelQueryBuilder wherePassengerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('passenger_id', values);
    return this;
  }
  
  

  /// Filter by driver_id
  BookingsModelQueryBuilder whereDriverId(String value) {
    _queryBuilder = _queryBuilder.eq('driver_id', value);
    return this;
  }
  
  /// Filter by driver_id with multiple values (IN operator)
  BookingsModelQueryBuilder whereDriverIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_id', values);
    return this;
  }
  
  

  /// Filter by seats_booked
  BookingsModelQueryBuilder whereSeatsBooked(int value) {
    _queryBuilder = _queryBuilder.eq('seats_booked', value);
    return this;
  }
  
  /// Filter by seats_booked with multiple values (IN operator)
  BookingsModelQueryBuilder whereSeatsBookedIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('seats_booked', values);
    return this;
  }
  
    /// Filter seats_booked greater than
  BookingsModelQueryBuilder whereSeatsBookedGreaterThan(int value) {
    _queryBuilder = _queryBuilder.gt('seats_booked', value);
    return this;
  }
  
  /// Filter seats_booked greater than or equal
  BookingsModelQueryBuilder whereSeatsBookedGreaterThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.gte('seats_booked', value);
    return this;
  }
  
  /// Filter seats_booked less than
  BookingsModelQueryBuilder whereSeatsBookedLessThan(int value) {
    _queryBuilder = _queryBuilder.lt('seats_booked', value);
    return this;
  }
  
  /// Filter seats_booked less than or equal
  BookingsModelQueryBuilder whereSeatsBookedLessThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.lte('seats_booked', value);
    return this;
  }
  
  /// Filter seats_booked between two values
  BookingsModelQueryBuilder whereSeatsBookedBetween(int min, int max) {
    _queryBuilder = _queryBuilder.gte('seats_booked', min).lte('seats_booked', max);
    return this;
  }

  /// Filter by final_price
  BookingsModelQueryBuilder whereFinalPrice(double value) {
    _queryBuilder = _queryBuilder.eq('final_price', value);
    return this;
  }
  
  /// Filter by final_price with multiple values (IN operator)
  BookingsModelQueryBuilder whereFinalPriceIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('final_price', values);
    return this;
  }
  
    /// Filter final_price greater than
  BookingsModelQueryBuilder whereFinalPriceGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('final_price', value);
    return this;
  }
  
  /// Filter final_price greater than or equal
  BookingsModelQueryBuilder whereFinalPriceGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('final_price', value);
    return this;
  }
  
  /// Filter final_price less than
  BookingsModelQueryBuilder whereFinalPriceLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('final_price', value);
    return this;
  }
  
  /// Filter final_price less than or equal
  BookingsModelQueryBuilder whereFinalPriceLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('final_price', value);
    return this;
  }
  
  /// Filter final_price between two values
  BookingsModelQueryBuilder whereFinalPriceBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('final_price', min).lte('final_price', max);
    return this;
  }

  /// Filter by booking_status
  BookingsModelQueryBuilder whereBookingStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('booking_status', value);
    return this;
  }
  
  /// Filter by booking_status with multiple values (IN operator)
  BookingsModelQueryBuilder whereBookingStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('booking_status', values);
    return this;
  }
  
  

  /// Filter by pickup_code
  BookingsModelQueryBuilder wherePickupCode(String? value) {
    _queryBuilder = _queryBuilder.eq('pickup_code', value);
    return this;
  }
  
  /// Filter by pickup_code with multiple values (IN operator)
  BookingsModelQueryBuilder wherePickupCodeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('pickup_code', values);
    return this;
  }
  
  

  /// Filter by payment_status
  BookingsModelQueryBuilder wherePaymentStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('payment_status', value);
    return this;
  }
  
  /// Filter by payment_status with multiple values (IN operator)
  BookingsModelQueryBuilder wherePaymentStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payment_status', values);
    return this;
  }
  
  

  /// Filter by payment_method
  BookingsModelQueryBuilder wherePaymentMethod(String? value) {
    _queryBuilder = _queryBuilder.eq('payment_method', value);
    return this;
  }
  
  /// Filter by payment_method with multiple values (IN operator)
  BookingsModelQueryBuilder wherePaymentMethodIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('payment_method', values);
    return this;
  }
  
  

  /// Filter by cancelled_by
  BookingsModelQueryBuilder whereCancelledBy(String? value) {
    _queryBuilder = _queryBuilder.eq('cancelled_by', value);
    return this;
  }
  
  /// Filter by cancelled_by with multiple values (IN operator)
  BookingsModelQueryBuilder whereCancelledByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('cancelled_by', values);
    return this;
  }
  
  

  /// Filter by cancellation_reason
  BookingsModelQueryBuilder whereCancellationReason(String? value) {
    _queryBuilder = _queryBuilder.eq('cancellation_reason', value);
    return this;
  }
  
  /// Filter by cancellation_reason with multiple values (IN operator)
  BookingsModelQueryBuilder whereCancellationReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('cancellation_reason', values);
    return this;
  }
  
  

  /// Filter by created_at
  BookingsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  BookingsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  BookingsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  BookingsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  BookingsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  BookingsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  BookingsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  BookingsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  BookingsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  BookingsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  BookingsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  BookingsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  BookingsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  BookingsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by picked_up_at
  BookingsModelQueryBuilder wherePickedUpAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('picked_up_at', value);
    return this;
  }
  
  /// Filter by picked_up_at with multiple values (IN operator)
  BookingsModelQueryBuilder wherePickedUpAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('picked_up_at', values);
    return this;
  }
  
    /// Filter picked_up_at greater than
  BookingsModelQueryBuilder wherePickedUpAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('picked_up_at', value);
    return this;
  }
  
  /// Filter picked_up_at greater than or equal
  BookingsModelQueryBuilder wherePickedUpAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('picked_up_at', value);
    return this;
  }
  
  /// Filter picked_up_at less than
  BookingsModelQueryBuilder wherePickedUpAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('picked_up_at', value);
    return this;
  }
  
  /// Filter picked_up_at less than or equal
  BookingsModelQueryBuilder wherePickedUpAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('picked_up_at', value);
    return this;
  }
  
  /// Filter picked_up_at between two values
  BookingsModelQueryBuilder wherePickedUpAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('picked_up_at', min).lte('picked_up_at', max);
    return this;
  }

  /// Filter by completed_at
  BookingsModelQueryBuilder whereCompletedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('completed_at', value);
    return this;
  }
  
  /// Filter by completed_at with multiple values (IN operator)
  BookingsModelQueryBuilder whereCompletedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('completed_at', values);
    return this;
  }
  
    /// Filter completed_at greater than
  BookingsModelQueryBuilder whereCompletedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at greater than or equal
  BookingsModelQueryBuilder whereCompletedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than
  BookingsModelQueryBuilder whereCompletedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('completed_at', value);
    return this;
  }
  
  /// Filter completed_at less than or equal
  BookingsModelQueryBuilder whereCompletedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('completed_at', value);
    return this;
  }
  
  /// Filter completed_at between two values
  BookingsModelQueryBuilder whereCompletedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('completed_at', min).lte('completed_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  BookingsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  BookingsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by trip_id in ascending order
  BookingsModelQueryBuilder orderByTripIdAsc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: true);
    return this;
  }
  
  /// Order by trip_id in descending order
  BookingsModelQueryBuilder orderByTripIdDesc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: false);
    return this;
  }

  /// Order by ride_request_id in ascending order
  BookingsModelQueryBuilder orderByRideRequestIdAsc() {
    _queryBuilder = _queryBuilder.order('ride_request_id', ascending: true);
    return this;
  }
  
  /// Order by ride_request_id in descending order
  BookingsModelQueryBuilder orderByRideRequestIdDesc() {
    _queryBuilder = _queryBuilder.order('ride_request_id', ascending: false);
    return this;
  }

  /// Order by passenger_id in ascending order
  BookingsModelQueryBuilder orderByPassengerIdAsc() {
    _queryBuilder = _queryBuilder.order('passenger_id', ascending: true);
    return this;
  }
  
  /// Order by passenger_id in descending order
  BookingsModelQueryBuilder orderByPassengerIdDesc() {
    _queryBuilder = _queryBuilder.order('passenger_id', ascending: false);
    return this;
  }

  /// Order by driver_id in ascending order
  BookingsModelQueryBuilder orderByDriverIdAsc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: true);
    return this;
  }
  
  /// Order by driver_id in descending order
  BookingsModelQueryBuilder orderByDriverIdDesc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: false);
    return this;
  }

  /// Order by seats_booked in ascending order
  BookingsModelQueryBuilder orderBySeatsBookedAsc() {
    _queryBuilder = _queryBuilder.order('seats_booked', ascending: true);
    return this;
  }
  
  /// Order by seats_booked in descending order
  BookingsModelQueryBuilder orderBySeatsBookedDesc() {
    _queryBuilder = _queryBuilder.order('seats_booked', ascending: false);
    return this;
  }

  /// Order by final_price in ascending order
  BookingsModelQueryBuilder orderByFinalPriceAsc() {
    _queryBuilder = _queryBuilder.order('final_price', ascending: true);
    return this;
  }
  
  /// Order by final_price in descending order
  BookingsModelQueryBuilder orderByFinalPriceDesc() {
    _queryBuilder = _queryBuilder.order('final_price', ascending: false);
    return this;
  }

  /// Order by booking_status in ascending order
  BookingsModelQueryBuilder orderByBookingStatusAsc() {
    _queryBuilder = _queryBuilder.order('booking_status', ascending: true);
    return this;
  }
  
  /// Order by booking_status in descending order
  BookingsModelQueryBuilder orderByBookingStatusDesc() {
    _queryBuilder = _queryBuilder.order('booking_status', ascending: false);
    return this;
  }

  /// Order by pickup_code in ascending order
  BookingsModelQueryBuilder orderByPickupCodeAsc() {
    _queryBuilder = _queryBuilder.order('pickup_code', ascending: true);
    return this;
  }
  
  /// Order by pickup_code in descending order
  BookingsModelQueryBuilder orderByPickupCodeDesc() {
    _queryBuilder = _queryBuilder.order('pickup_code', ascending: false);
    return this;
  }

  /// Order by payment_status in ascending order
  BookingsModelQueryBuilder orderByPaymentStatusAsc() {
    _queryBuilder = _queryBuilder.order('payment_status', ascending: true);
    return this;
  }
  
  /// Order by payment_status in descending order
  BookingsModelQueryBuilder orderByPaymentStatusDesc() {
    _queryBuilder = _queryBuilder.order('payment_status', ascending: false);
    return this;
  }

  /// Order by payment_method in ascending order
  BookingsModelQueryBuilder orderByPaymentMethodAsc() {
    _queryBuilder = _queryBuilder.order('payment_method', ascending: true);
    return this;
  }
  
  /// Order by payment_method in descending order
  BookingsModelQueryBuilder orderByPaymentMethodDesc() {
    _queryBuilder = _queryBuilder.order('payment_method', ascending: false);
    return this;
  }

  /// Order by cancelled_by in ascending order
  BookingsModelQueryBuilder orderByCancelledByAsc() {
    _queryBuilder = _queryBuilder.order('cancelled_by', ascending: true);
    return this;
  }
  
  /// Order by cancelled_by in descending order
  BookingsModelQueryBuilder orderByCancelledByDesc() {
    _queryBuilder = _queryBuilder.order('cancelled_by', ascending: false);
    return this;
  }

  /// Order by cancellation_reason in ascending order
  BookingsModelQueryBuilder orderByCancellationReasonAsc() {
    _queryBuilder = _queryBuilder.order('cancellation_reason', ascending: true);
    return this;
  }
  
  /// Order by cancellation_reason in descending order
  BookingsModelQueryBuilder orderByCancellationReasonDesc() {
    _queryBuilder = _queryBuilder.order('cancellation_reason', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  BookingsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  BookingsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  BookingsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  BookingsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by picked_up_at in ascending order
  BookingsModelQueryBuilder orderByPickedUpAtAsc() {
    _queryBuilder = _queryBuilder.order('picked_up_at', ascending: true);
    return this;
  }
  
  /// Order by picked_up_at in descending order
  BookingsModelQueryBuilder orderByPickedUpAtDesc() {
    _queryBuilder = _queryBuilder.order('picked_up_at', ascending: false);
    return this;
  }

  /// Order by completed_at in ascending order
  BookingsModelQueryBuilder orderByCompletedAtAsc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: true);
    return this;
  }
  
  /// Order by completed_at in descending order
  BookingsModelQueryBuilder orderByCompletedAtDesc() {
    _queryBuilder = _queryBuilder.order('completed_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of BookingsModel
  Future<List<BookingsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => BookingsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<BookingsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return BookingsModel.fromJson(response.first as Map<String, dynamic>);
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
