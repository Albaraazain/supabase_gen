import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/en_route_phase_model.dart';

/// A type-safe query builder for EnRoutePhaseModel
class EnRoutePhaseModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  EnRoutePhaseModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('en_route_phase').select();
  }
  
  /// Set the fields to select
  EnRoutePhaseModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('en_route_phase').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  EnRoutePhaseModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  EnRoutePhaseModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  EnRoutePhaseModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  EnRoutePhaseModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by route_started_at
  EnRoutePhaseModelQueryBuilder whereRouteStartedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('route_started_at', value);
    return this;
  }
  
  /// Filter by route_started_at with multiple values (IN operator)
  EnRoutePhaseModelQueryBuilder whereRouteStartedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('route_started_at', values);
    return this;
  }
  
    /// Filter route_started_at greater than
  EnRoutePhaseModelQueryBuilder whereRouteStartedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('route_started_at', value);
    return this;
  }
  
  /// Filter route_started_at greater than or equal
  EnRoutePhaseModelQueryBuilder whereRouteStartedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('route_started_at', value);
    return this;
  }
  
  /// Filter route_started_at less than
  EnRoutePhaseModelQueryBuilder whereRouteStartedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('route_started_at', value);
    return this;
  }
  
  /// Filter route_started_at less than or equal
  EnRoutePhaseModelQueryBuilder whereRouteStartedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('route_started_at', value);
    return this;
  }
  
  /// Filter route_started_at between two values
  EnRoutePhaseModelQueryBuilder whereRouteStartedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('route_started_at', min).lte('route_started_at', max);
    return this;
  }

  /// Filter by arrived_at
  EnRoutePhaseModelQueryBuilder whereArrivedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('arrived_at', value);
    return this;
  }
  
  /// Filter by arrived_at with multiple values (IN operator)
  EnRoutePhaseModelQueryBuilder whereArrivedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('arrived_at', values);
    return this;
  }
  
    /// Filter arrived_at greater than
  EnRoutePhaseModelQueryBuilder whereArrivedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('arrived_at', value);
    return this;
  }
  
  /// Filter arrived_at greater than or equal
  EnRoutePhaseModelQueryBuilder whereArrivedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('arrived_at', value);
    return this;
  }
  
  /// Filter arrived_at less than
  EnRoutePhaseModelQueryBuilder whereArrivedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('arrived_at', value);
    return this;
  }
  
  /// Filter arrived_at less than or equal
  EnRoutePhaseModelQueryBuilder whereArrivedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('arrived_at', value);
    return this;
  }
  
  /// Filter arrived_at between two values
  EnRoutePhaseModelQueryBuilder whereArrivedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('arrived_at', min).lte('arrived_at', max);
    return this;
  }

  /// Filter by estimated_arrival
  EnRoutePhaseModelQueryBuilder whereEstimatedArrival(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('estimated_arrival', value);
    return this;
  }
  
  /// Filter by estimated_arrival with multiple values (IN operator)
  EnRoutePhaseModelQueryBuilder whereEstimatedArrivalIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('estimated_arrival', values);
    return this;
  }
  
    /// Filter estimated_arrival greater than
  EnRoutePhaseModelQueryBuilder whereEstimatedArrivalGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('estimated_arrival', value);
    return this;
  }
  
  /// Filter estimated_arrival greater than or equal
  EnRoutePhaseModelQueryBuilder whereEstimatedArrivalGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('estimated_arrival', value);
    return this;
  }
  
  /// Filter estimated_arrival less than
  EnRoutePhaseModelQueryBuilder whereEstimatedArrivalLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('estimated_arrival', value);
    return this;
  }
  
  /// Filter estimated_arrival less than or equal
  EnRoutePhaseModelQueryBuilder whereEstimatedArrivalLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('estimated_arrival', value);
    return this;
  }
  
  /// Filter estimated_arrival between two values
  EnRoutePhaseModelQueryBuilder whereEstimatedArrivalBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('estimated_arrival', min).lte('estimated_arrival', max);
    return this;
  }

  /// Filter by distance_km
  EnRoutePhaseModelQueryBuilder whereDistanceKm(double? value) {
    _queryBuilder = _queryBuilder.eq('distance_km', value);
    return this;
  }
  
  /// Filter by distance_km with multiple values (IN operator)
  EnRoutePhaseModelQueryBuilder whereDistanceKmIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('distance_km', values);
    return this;
  }
  
    /// Filter distance_km greater than
  EnRoutePhaseModelQueryBuilder whereDistanceKmGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('distance_km', value);
    return this;
  }
  
  /// Filter distance_km greater than or equal
  EnRoutePhaseModelQueryBuilder whereDistanceKmGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('distance_km', value);
    return this;
  }
  
  /// Filter distance_km less than
  EnRoutePhaseModelQueryBuilder whereDistanceKmLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('distance_km', value);
    return this;
  }
  
  /// Filter distance_km less than or equal
  EnRoutePhaseModelQueryBuilder whereDistanceKmLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('distance_km', value);
    return this;
  }
  
  /// Filter distance_km between two values
  EnRoutePhaseModelQueryBuilder whereDistanceKmBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('distance_km', min).lte('distance_km', max);
    return this;
  }

  /// Filter by transport_mode
  EnRoutePhaseModelQueryBuilder whereTransportMode(String? value) {
    _queryBuilder = _queryBuilder.eq('transport_mode', value);
    return this;
  }
  
  /// Filter by transport_mode with multiple values (IN operator)
  EnRoutePhaseModelQueryBuilder whereTransportModeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('transport_mode', values);
    return this;
  }
  
  
  
  /// Order by job_id in ascending order
  EnRoutePhaseModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  EnRoutePhaseModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by route_started_at in ascending order
  EnRoutePhaseModelQueryBuilder orderByRouteStartedAtAsc() {
    _queryBuilder = _queryBuilder.order('route_started_at', ascending: true);
    return this;
  }
  
  /// Order by route_started_at in descending order
  EnRoutePhaseModelQueryBuilder orderByRouteStartedAtDesc() {
    _queryBuilder = _queryBuilder.order('route_started_at', ascending: false);
    return this;
  }

  /// Order by arrived_at in ascending order
  EnRoutePhaseModelQueryBuilder orderByArrivedAtAsc() {
    _queryBuilder = _queryBuilder.order('arrived_at', ascending: true);
    return this;
  }
  
  /// Order by arrived_at in descending order
  EnRoutePhaseModelQueryBuilder orderByArrivedAtDesc() {
    _queryBuilder = _queryBuilder.order('arrived_at', ascending: false);
    return this;
  }

  /// Order by estimated_arrival in ascending order
  EnRoutePhaseModelQueryBuilder orderByEstimatedArrivalAsc() {
    _queryBuilder = _queryBuilder.order('estimated_arrival', ascending: true);
    return this;
  }
  
  /// Order by estimated_arrival in descending order
  EnRoutePhaseModelQueryBuilder orderByEstimatedArrivalDesc() {
    _queryBuilder = _queryBuilder.order('estimated_arrival', ascending: false);
    return this;
  }

  /// Order by distance_km in ascending order
  EnRoutePhaseModelQueryBuilder orderByDistanceKmAsc() {
    _queryBuilder = _queryBuilder.order('distance_km', ascending: true);
    return this;
  }
  
  /// Order by distance_km in descending order
  EnRoutePhaseModelQueryBuilder orderByDistanceKmDesc() {
    _queryBuilder = _queryBuilder.order('distance_km', ascending: false);
    return this;
  }

  /// Order by transport_mode in ascending order
  EnRoutePhaseModelQueryBuilder orderByTransportModeAsc() {
    _queryBuilder = _queryBuilder.order('transport_mode', ascending: true);
    return this;
  }
  
  /// Order by transport_mode in descending order
  EnRoutePhaseModelQueryBuilder orderByTransportModeDesc() {
    _queryBuilder = _queryBuilder.order('transport_mode', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of EnRoutePhaseModel
  Future<List<EnRoutePhaseModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => EnRoutePhaseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<EnRoutePhaseModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return EnRoutePhaseModel.fromJson(response.first as Map<String, dynamic>);
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
