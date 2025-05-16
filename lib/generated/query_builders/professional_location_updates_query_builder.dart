import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_location_updates_model.dart';

/// A type-safe query builder for ProfessionalLocationUpdatesModel
class ProfessionalLocationUpdatesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfessionalLocationUpdatesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('professional_location_updates').select();
  }
  
  /// Set the fields to select
  ProfessionalLocationUpdatesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('professional_location_updates').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfessionalLocationUpdatesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfessionalLocationUpdatesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  ProfessionalLocationUpdatesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  ProfessionalLocationUpdatesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by professional_id
  ProfessionalLocationUpdatesModelQueryBuilder whereProfessionalId(String value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ProfessionalLocationUpdatesModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by latitude
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitude(double value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  ProfessionalLocationUpdatesModelQueryBuilder whereLatitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitude(double value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  ProfessionalLocationUpdatesModelQueryBuilder whereLongitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by is_online
  ProfessionalLocationUpdatesModelQueryBuilder whereIsOnline(bool value) {
    _queryBuilder = _queryBuilder.eq('is_online', value);
    return this;
  }
  
  /// Filter by is_online with multiple values (IN operator)
  ProfessionalLocationUpdatesModelQueryBuilder whereIsOnlineIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_online', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAt(DateTime value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAtGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAtLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfessionalLocationUpdatesModelQueryBuilder whereCreatedAtBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by professional_id in ascending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by is_online in ascending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByIsOnlineAsc() {
    _queryBuilder = _queryBuilder.order('is_online', ascending: true);
    return this;
  }
  
  /// Order by is_online in descending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByIsOnlineDesc() {
    _queryBuilder = _queryBuilder.order('is_online', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfessionalLocationUpdatesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfessionalLocationUpdatesModel
  Future<List<ProfessionalLocationUpdatesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfessionalLocationUpdatesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfessionalLocationUpdatesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfessionalLocationUpdatesModel.fromJson(response.first as Map<String, dynamic>);
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
