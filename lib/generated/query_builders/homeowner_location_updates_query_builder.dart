import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/homeowner_location_updates_model.dart';

/// A type-safe query builder for HomeownerLocationUpdatesModel
class HomeownerLocationUpdatesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  HomeownerLocationUpdatesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('homeowner_location_updates').select();
  }
  
  /// Set the fields to select
  HomeownerLocationUpdatesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('homeowner_location_updates').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  HomeownerLocationUpdatesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  HomeownerLocationUpdatesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  HomeownerLocationUpdatesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  HomeownerLocationUpdatesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by homeowner_id
  HomeownerLocationUpdatesModelQueryBuilder whereHomeownerId(String value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  HomeownerLocationUpdatesModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by latitude
  HomeownerLocationUpdatesModelQueryBuilder whereLatitude(double value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  HomeownerLocationUpdatesModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  HomeownerLocationUpdatesModelQueryBuilder whereLatitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  HomeownerLocationUpdatesModelQueryBuilder whereLatitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  HomeownerLocationUpdatesModelQueryBuilder whereLatitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  HomeownerLocationUpdatesModelQueryBuilder whereLatitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  HomeownerLocationUpdatesModelQueryBuilder whereLatitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  HomeownerLocationUpdatesModelQueryBuilder whereLongitude(double value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  HomeownerLocationUpdatesModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  HomeownerLocationUpdatesModelQueryBuilder whereLongitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  HomeownerLocationUpdatesModelQueryBuilder whereLongitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  HomeownerLocationUpdatesModelQueryBuilder whereLongitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  HomeownerLocationUpdatesModelQueryBuilder whereLongitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  HomeownerLocationUpdatesModelQueryBuilder whereLongitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by created_at
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  HomeownerLocationUpdatesModelQueryBuilder whereCreatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  HomeownerLocationUpdatesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  HomeownerLocationUpdatesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by homeowner_id in ascending order
  HomeownerLocationUpdatesModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  HomeownerLocationUpdatesModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  HomeownerLocationUpdatesModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  HomeownerLocationUpdatesModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  HomeownerLocationUpdatesModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  HomeownerLocationUpdatesModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  HomeownerLocationUpdatesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  HomeownerLocationUpdatesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of HomeownerLocationUpdatesModel
  Future<List<HomeownerLocationUpdatesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => HomeownerLocationUpdatesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<HomeownerLocationUpdatesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return HomeownerLocationUpdatesModel.fromJson(response.first as Map<String, dynamic>);
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
