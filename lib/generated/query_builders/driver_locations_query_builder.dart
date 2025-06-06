import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/driver_locations_model.dart';

/// A type-safe query builder for DriverLocationsModel
class DriverLocationsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  DriverLocationsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('driver_locations').select();
  }
  
  /// Set the fields to select
  DriverLocationsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('driver_locations').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  DriverLocationsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  DriverLocationsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  DriverLocationsModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by driver_id
  DriverLocationsModelQueryBuilder whereDriverId(String value) {
    _queryBuilder = _queryBuilder.eq('driver_id', value);
    return this;
  }
  
  /// Filter by driver_id with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereDriverIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_id', values);
    return this;
  }
  
  

  /// Filter by latitude
  DriverLocationsModelQueryBuilder whereLatitude(double value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  DriverLocationsModelQueryBuilder whereLatitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  DriverLocationsModelQueryBuilder whereLatitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  DriverLocationsModelQueryBuilder whereLatitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  DriverLocationsModelQueryBuilder whereLatitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  DriverLocationsModelQueryBuilder whereLatitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  DriverLocationsModelQueryBuilder whereLongitude(double value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  DriverLocationsModelQueryBuilder whereLongitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  DriverLocationsModelQueryBuilder whereLongitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  DriverLocationsModelQueryBuilder whereLongitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  DriverLocationsModelQueryBuilder whereLongitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  DriverLocationsModelQueryBuilder whereLongitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by heading
  DriverLocationsModelQueryBuilder whereHeading(double? value) {
    _queryBuilder = _queryBuilder.eq('heading', value);
    return this;
  }
  
  /// Filter by heading with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereHeadingIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('heading', values);
    return this;
  }
  
    /// Filter heading greater than
  DriverLocationsModelQueryBuilder whereHeadingGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('heading', value);
    return this;
  }
  
  /// Filter heading greater than or equal
  DriverLocationsModelQueryBuilder whereHeadingGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('heading', value);
    return this;
  }
  
  /// Filter heading less than
  DriverLocationsModelQueryBuilder whereHeadingLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('heading', value);
    return this;
  }
  
  /// Filter heading less than or equal
  DriverLocationsModelQueryBuilder whereHeadingLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('heading', value);
    return this;
  }
  
  /// Filter heading between two values
  DriverLocationsModelQueryBuilder whereHeadingBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('heading', min).lte('heading', max);
    return this;
  }

  /// Filter by speed
  DriverLocationsModelQueryBuilder whereSpeed(double? value) {
    _queryBuilder = _queryBuilder.eq('speed', value);
    return this;
  }
  
  /// Filter by speed with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereSpeedIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('speed', values);
    return this;
  }
  
    /// Filter speed greater than
  DriverLocationsModelQueryBuilder whereSpeedGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('speed', value);
    return this;
  }
  
  /// Filter speed greater than or equal
  DriverLocationsModelQueryBuilder whereSpeedGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('speed', value);
    return this;
  }
  
  /// Filter speed less than
  DriverLocationsModelQueryBuilder whereSpeedLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('speed', value);
    return this;
  }
  
  /// Filter speed less than or equal
  DriverLocationsModelQueryBuilder whereSpeedLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('speed', value);
    return this;
  }
  
  /// Filter speed between two values
  DriverLocationsModelQueryBuilder whereSpeedBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('speed', min).lte('speed', max);
    return this;
  }

  /// Filter by accuracy
  DriverLocationsModelQueryBuilder whereAccuracy(double? value) {
    _queryBuilder = _queryBuilder.eq('accuracy', value);
    return this;
  }
  
  /// Filter by accuracy with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereAccuracyIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accuracy', values);
    return this;
  }
  
    /// Filter accuracy greater than
  DriverLocationsModelQueryBuilder whereAccuracyGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('accuracy', value);
    return this;
  }
  
  /// Filter accuracy greater than or equal
  DriverLocationsModelQueryBuilder whereAccuracyGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('accuracy', value);
    return this;
  }
  
  /// Filter accuracy less than
  DriverLocationsModelQueryBuilder whereAccuracyLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('accuracy', value);
    return this;
  }
  
  /// Filter accuracy less than or equal
  DriverLocationsModelQueryBuilder whereAccuracyLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('accuracy', value);
    return this;
  }
  
  /// Filter accuracy between two values
  DriverLocationsModelQueryBuilder whereAccuracyBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('accuracy', min).lte('accuracy', max);
    return this;
  }

  /// Filter by is_online
  DriverLocationsModelQueryBuilder whereIsOnline(bool value) {
    _queryBuilder = _queryBuilder.eq('is_online', value);
    return this;
  }
  
  /// Filter by is_online with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereIsOnlineIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_online', values);
    return this;
  }
  
  

  /// Filter by is_driving
  DriverLocationsModelQueryBuilder whereIsDriving(bool value) {
    _queryBuilder = _queryBuilder.eq('is_driving', value);
    return this;
  }
  
  /// Filter by is_driving with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereIsDrivingIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_driving', values);
    return this;
  }
  
  

  /// Filter by current_trip_id
  DriverLocationsModelQueryBuilder whereCurrentTripId(String? value) {
    _queryBuilder = _queryBuilder.eq('current_trip_id', value);
    return this;
  }
  
  /// Filter by current_trip_id with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereCurrentTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_trip_id', values);
    return this;
  }
  
  

  /// Filter by location_point
  DriverLocationsModelQueryBuilder whereLocationPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('location_point', value);
    return this;
  }
  
  /// Filter by location_point with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereLocationPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('location_point', values);
    return this;
  }
  
  

  /// Filter by updated_at
  DriverLocationsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  DriverLocationsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  DriverLocationsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  DriverLocationsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  DriverLocationsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  DriverLocationsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by created_at
  DriverLocationsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  DriverLocationsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  DriverLocationsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  DriverLocationsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  DriverLocationsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  DriverLocationsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  DriverLocationsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  DriverLocationsModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  DriverLocationsModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by driver_id in ascending order
  DriverLocationsModelQueryBuilder orderByDriverIdAsc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: true);
    return this;
  }
  
  /// Order by driver_id in descending order
  DriverLocationsModelQueryBuilder orderByDriverIdDesc() {
    _queryBuilder = _queryBuilder.order('driver_id', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  DriverLocationsModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  DriverLocationsModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  DriverLocationsModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  DriverLocationsModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by heading in ascending order
  DriverLocationsModelQueryBuilder orderByHeadingAsc() {
    _queryBuilder = _queryBuilder.order('heading', ascending: true);
    return this;
  }
  
  /// Order by heading in descending order
  DriverLocationsModelQueryBuilder orderByHeadingDesc() {
    _queryBuilder = _queryBuilder.order('heading', ascending: false);
    return this;
  }

  /// Order by speed in ascending order
  DriverLocationsModelQueryBuilder orderBySpeedAsc() {
    _queryBuilder = _queryBuilder.order('speed', ascending: true);
    return this;
  }
  
  /// Order by speed in descending order
  DriverLocationsModelQueryBuilder orderBySpeedDesc() {
    _queryBuilder = _queryBuilder.order('speed', ascending: false);
    return this;
  }

  /// Order by accuracy in ascending order
  DriverLocationsModelQueryBuilder orderByAccuracyAsc() {
    _queryBuilder = _queryBuilder.order('accuracy', ascending: true);
    return this;
  }
  
  /// Order by accuracy in descending order
  DriverLocationsModelQueryBuilder orderByAccuracyDesc() {
    _queryBuilder = _queryBuilder.order('accuracy', ascending: false);
    return this;
  }

  /// Order by is_online in ascending order
  DriverLocationsModelQueryBuilder orderByIsOnlineAsc() {
    _queryBuilder = _queryBuilder.order('is_online', ascending: true);
    return this;
  }
  
  /// Order by is_online in descending order
  DriverLocationsModelQueryBuilder orderByIsOnlineDesc() {
    _queryBuilder = _queryBuilder.order('is_online', ascending: false);
    return this;
  }

  /// Order by is_driving in ascending order
  DriverLocationsModelQueryBuilder orderByIsDrivingAsc() {
    _queryBuilder = _queryBuilder.order('is_driving', ascending: true);
    return this;
  }
  
  /// Order by is_driving in descending order
  DriverLocationsModelQueryBuilder orderByIsDrivingDesc() {
    _queryBuilder = _queryBuilder.order('is_driving', ascending: false);
    return this;
  }

  /// Order by current_trip_id in ascending order
  DriverLocationsModelQueryBuilder orderByCurrentTripIdAsc() {
    _queryBuilder = _queryBuilder.order('current_trip_id', ascending: true);
    return this;
  }
  
  /// Order by current_trip_id in descending order
  DriverLocationsModelQueryBuilder orderByCurrentTripIdDesc() {
    _queryBuilder = _queryBuilder.order('current_trip_id', ascending: false);
    return this;
  }

  /// Order by location_point in ascending order
  DriverLocationsModelQueryBuilder orderByLocationPointAsc() {
    _queryBuilder = _queryBuilder.order('location_point', ascending: true);
    return this;
  }
  
  /// Order by location_point in descending order
  DriverLocationsModelQueryBuilder orderByLocationPointDesc() {
    _queryBuilder = _queryBuilder.order('location_point', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  DriverLocationsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  DriverLocationsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  DriverLocationsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  DriverLocationsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of DriverLocationsModel
  Future<List<DriverLocationsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => DriverLocationsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<DriverLocationsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return DriverLocationsModel.fromJson(response.first as Map<String, dynamic>);
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
