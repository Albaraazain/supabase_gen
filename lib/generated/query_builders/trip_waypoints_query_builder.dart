import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip_waypoints_model.dart';

/// A type-safe query builder for TripWaypointsModel
class TripWaypointsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  TripWaypointsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('trip_waypoints').select();
  }
  
  /// Set the fields to select
  TripWaypointsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('trip_waypoints').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  TripWaypointsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  TripWaypointsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  TripWaypointsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by trip_id
  TripWaypointsModelQueryBuilder whereTripId(String value) {
    _queryBuilder = _queryBuilder.eq('trip_id', value);
    return this;
  }
  
  /// Filter by trip_id with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('trip_id', values);
    return this;
  }
  
  

  /// Filter by address
  TripWaypointsModelQueryBuilder whereAddress(String value) {
    _queryBuilder = _queryBuilder.eq('address', value);
    return this;
  }
  
  /// Filter by address with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('address', values);
    return this;
  }
  
  

  /// Filter by lat
  TripWaypointsModelQueryBuilder whereLat(double value) {
    _queryBuilder = _queryBuilder.eq('lat', value);
    return this;
  }
  
  /// Filter by lat with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('lat', values);
    return this;
  }
  
    /// Filter lat greater than
  TripWaypointsModelQueryBuilder whereLatGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('lat', value);
    return this;
  }
  
  /// Filter lat greater than or equal
  TripWaypointsModelQueryBuilder whereLatGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('lat', value);
    return this;
  }
  
  /// Filter lat less than
  TripWaypointsModelQueryBuilder whereLatLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('lat', value);
    return this;
  }
  
  /// Filter lat less than or equal
  TripWaypointsModelQueryBuilder whereLatLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('lat', value);
    return this;
  }
  
  /// Filter lat between two values
  TripWaypointsModelQueryBuilder whereLatBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('lat', min).lte('lat', max);
    return this;
  }

  /// Filter by lng
  TripWaypointsModelQueryBuilder whereLng(double value) {
    _queryBuilder = _queryBuilder.eq('lng', value);
    return this;
  }
  
  /// Filter by lng with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('lng', values);
    return this;
  }
  
    /// Filter lng greater than
  TripWaypointsModelQueryBuilder whereLngGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('lng', value);
    return this;
  }
  
  /// Filter lng greater than or equal
  TripWaypointsModelQueryBuilder whereLngGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('lng', value);
    return this;
  }
  
  /// Filter lng less than
  TripWaypointsModelQueryBuilder whereLngLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('lng', value);
    return this;
  }
  
  /// Filter lng less than or equal
  TripWaypointsModelQueryBuilder whereLngLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('lng', value);
    return this;
  }
  
  /// Filter lng between two values
  TripWaypointsModelQueryBuilder whereLngBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('lng', min).lte('lng', max);
    return this;
  }

  /// Filter by point
  TripWaypointsModelQueryBuilder wherePoint(String? value) {
    _queryBuilder = _queryBuilder.eq('point', value);
    return this;
  }
  
  /// Filter by point with multiple values (IN operator)
  TripWaypointsModelQueryBuilder wherePointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('point', values);
    return this;
  }
  
  

  /// Filter by order_index
  TripWaypointsModelQueryBuilder whereOrderIndex(int value) {
    _queryBuilder = _queryBuilder.eq('order_index', value);
    return this;
  }
  
  /// Filter by order_index with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereOrderIndexIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('order_index', values);
    return this;
  }
  
    /// Filter order_index greater than
  TripWaypointsModelQueryBuilder whereOrderIndexGreaterThan(int value) {
    _queryBuilder = _queryBuilder.gt('order_index', value);
    return this;
  }
  
  /// Filter order_index greater than or equal
  TripWaypointsModelQueryBuilder whereOrderIndexGreaterThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.gte('order_index', value);
    return this;
  }
  
  /// Filter order_index less than
  TripWaypointsModelQueryBuilder whereOrderIndexLessThan(int value) {
    _queryBuilder = _queryBuilder.lt('order_index', value);
    return this;
  }
  
  /// Filter order_index less than or equal
  TripWaypointsModelQueryBuilder whereOrderIndexLessThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.lte('order_index', value);
    return this;
  }
  
  /// Filter order_index between two values
  TripWaypointsModelQueryBuilder whereOrderIndexBetween(int min, int max) {
    _queryBuilder = _queryBuilder.gte('order_index', min).lte('order_index', max);
    return this;
  }

  /// Filter by estimated_arrival_time
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter by estimated_arrival_time with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_arrival_time', values);
    return this;
  }
  
    /// Filter estimated_arrival_time greater than
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time greater than or equal
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time less than
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time less than or equal
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('estimated_arrival_time', value);
    return this;
  }
  
  /// Filter estimated_arrival_time between two values
  TripWaypointsModelQueryBuilder whereEstimatedArrivalTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('estimated_arrival_time', min).lte('estimated_arrival_time', max);
    return this;
  }

  /// Filter by created_at
  TripWaypointsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  TripWaypointsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  TripWaypointsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  TripWaypointsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  TripWaypointsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  TripWaypointsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  TripWaypointsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  TripWaypointsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  TripWaypointsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by trip_id in ascending order
  TripWaypointsModelQueryBuilder orderByTripIdAsc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: true);
    return this;
  }
  
  /// Order by trip_id in descending order
  TripWaypointsModelQueryBuilder orderByTripIdDesc() {
    _queryBuilder = _queryBuilder.order('trip_id', ascending: false);
    return this;
  }

  /// Order by address in ascending order
  TripWaypointsModelQueryBuilder orderByAddressAsc() {
    _queryBuilder = _queryBuilder.order('address', ascending: true);
    return this;
  }
  
  /// Order by address in descending order
  TripWaypointsModelQueryBuilder orderByAddressDesc() {
    _queryBuilder = _queryBuilder.order('address', ascending: false);
    return this;
  }

  /// Order by lat in ascending order
  TripWaypointsModelQueryBuilder orderByLatAsc() {
    _queryBuilder = _queryBuilder.order('lat', ascending: true);
    return this;
  }
  
  /// Order by lat in descending order
  TripWaypointsModelQueryBuilder orderByLatDesc() {
    _queryBuilder = _queryBuilder.order('lat', ascending: false);
    return this;
  }

  /// Order by lng in ascending order
  TripWaypointsModelQueryBuilder orderByLngAsc() {
    _queryBuilder = _queryBuilder.order('lng', ascending: true);
    return this;
  }
  
  /// Order by lng in descending order
  TripWaypointsModelQueryBuilder orderByLngDesc() {
    _queryBuilder = _queryBuilder.order('lng', ascending: false);
    return this;
  }

  /// Order by point in ascending order
  TripWaypointsModelQueryBuilder orderByPointAsc() {
    _queryBuilder = _queryBuilder.order('point', ascending: true);
    return this;
  }
  
  /// Order by point in descending order
  TripWaypointsModelQueryBuilder orderByPointDesc() {
    _queryBuilder = _queryBuilder.order('point', ascending: false);
    return this;
  }

  /// Order by order_index in ascending order
  TripWaypointsModelQueryBuilder orderByOrderIndexAsc() {
    _queryBuilder = _queryBuilder.order('order_index', ascending: true);
    return this;
  }
  
  /// Order by order_index in descending order
  TripWaypointsModelQueryBuilder orderByOrderIndexDesc() {
    _queryBuilder = _queryBuilder.order('order_index', ascending: false);
    return this;
  }

  /// Order by estimated_arrival_time in ascending order
  TripWaypointsModelQueryBuilder orderByEstimatedArrivalTimeAsc() {
    _queryBuilder = _queryBuilder.order('estimated_arrival_time', ascending: true);
    return this;
  }
  
  /// Order by estimated_arrival_time in descending order
  TripWaypointsModelQueryBuilder orderByEstimatedArrivalTimeDesc() {
    _queryBuilder = _queryBuilder.order('estimated_arrival_time', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  TripWaypointsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  TripWaypointsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of TripWaypointsModel
  Future<List<TripWaypointsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => TripWaypointsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<TripWaypointsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return TripWaypointsModel.fromJson(response.first as Map<String, dynamic>);
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
