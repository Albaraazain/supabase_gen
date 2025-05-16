import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/location_map_settings_model.dart';

/// A type-safe query builder for LocationMapSettingsModel
class LocationMapSettingsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  LocationMapSettingsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('location_map_settings').select();
  }
  
  /// Set the fields to select
  LocationMapSettingsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('location_map_settings').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  LocationMapSettingsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  LocationMapSettingsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by setting_id
  LocationMapSettingsModelQueryBuilder whereSettingId(String value) {
    _queryBuilder = _queryBuilder.eq('setting_id', value);
    return this;
  }
  
  /// Filter by setting_id with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereSettingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('setting_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  LocationMapSettingsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by zoom_level
  LocationMapSettingsModelQueryBuilder whereZoomLevel(double? value) {
    _queryBuilder = _queryBuilder.eq('zoom_level', value);
    return this;
  }
  
  /// Filter by zoom_level with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereZoomLevelIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('zoom_level', values);
    return this;
  }
  
    /// Filter zoom_level greater than
  LocationMapSettingsModelQueryBuilder whereZoomLevelGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('zoom_level', value);
    return this;
  }
  
  /// Filter zoom_level greater than or equal
  LocationMapSettingsModelQueryBuilder whereZoomLevelGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('zoom_level', value);
    return this;
  }
  
  /// Filter zoom_level less than
  LocationMapSettingsModelQueryBuilder whereZoomLevelLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('zoom_level', value);
    return this;
  }
  
  /// Filter zoom_level less than or equal
  LocationMapSettingsModelQueryBuilder whereZoomLevelLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('zoom_level', value);
    return this;
  }
  
  /// Filter zoom_level between two values
  LocationMapSettingsModelQueryBuilder whereZoomLevelBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('zoom_level', min).lte('zoom_level', max);
    return this;
  }

  /// Filter by center_latitude
  LocationMapSettingsModelQueryBuilder whereCenterLatitude(double? value) {
    _queryBuilder = _queryBuilder.eq('center_latitude', value);
    return this;
  }
  
  /// Filter by center_latitude with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereCenterLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('center_latitude', values);
    return this;
  }
  
    /// Filter center_latitude greater than
  LocationMapSettingsModelQueryBuilder whereCenterLatitudeGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('center_latitude', value);
    return this;
  }
  
  /// Filter center_latitude greater than or equal
  LocationMapSettingsModelQueryBuilder whereCenterLatitudeGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('center_latitude', value);
    return this;
  }
  
  /// Filter center_latitude less than
  LocationMapSettingsModelQueryBuilder whereCenterLatitudeLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('center_latitude', value);
    return this;
  }
  
  /// Filter center_latitude less than or equal
  LocationMapSettingsModelQueryBuilder whereCenterLatitudeLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('center_latitude', value);
    return this;
  }
  
  /// Filter center_latitude between two values
  LocationMapSettingsModelQueryBuilder whereCenterLatitudeBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('center_latitude', min).lte('center_latitude', max);
    return this;
  }

  /// Filter by center_longitude
  LocationMapSettingsModelQueryBuilder whereCenterLongitude(double? value) {
    _queryBuilder = _queryBuilder.eq('center_longitude', value);
    return this;
  }
  
  /// Filter by center_longitude with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereCenterLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('center_longitude', values);
    return this;
  }
  
    /// Filter center_longitude greater than
  LocationMapSettingsModelQueryBuilder whereCenterLongitudeGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('center_longitude', value);
    return this;
  }
  
  /// Filter center_longitude greater than or equal
  LocationMapSettingsModelQueryBuilder whereCenterLongitudeGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('center_longitude', value);
    return this;
  }
  
  /// Filter center_longitude less than
  LocationMapSettingsModelQueryBuilder whereCenterLongitudeLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('center_longitude', value);
    return this;
  }
  
  /// Filter center_longitude less than or equal
  LocationMapSettingsModelQueryBuilder whereCenterLongitudeLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('center_longitude', value);
    return this;
  }
  
  /// Filter center_longitude between two values
  LocationMapSettingsModelQueryBuilder whereCenterLongitudeBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('center_longitude', min).lte('center_longitude', max);
    return this;
  }

  /// Filter by show_terrain
  LocationMapSettingsModelQueryBuilder whereShowTerrain(bool? value) {
    _queryBuilder = _queryBuilder.eq('show_terrain', value);
    return this;
  }
  
  /// Filter by show_terrain with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereShowTerrainIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('show_terrain', values);
    return this;
  }
  
  

  /// Filter by show_traffic
  LocationMapSettingsModelQueryBuilder whereShowTraffic(bool? value) {
    _queryBuilder = _queryBuilder.eq('show_traffic', value);
    return this;
  }
  
  /// Filter by show_traffic with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereShowTrafficIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('show_traffic', values);
    return this;
  }
  
  

  /// Filter by created_by
  LocationMapSettingsModelQueryBuilder whereCreatedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('created_by', value);
    return this;
  }
  
  /// Filter by created_by with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereCreatedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  LocationMapSettingsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  LocationMapSettingsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  LocationMapSettingsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  LocationMapSettingsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  LocationMapSettingsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  LocationMapSettingsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  LocationMapSettingsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  LocationMapSettingsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  LocationMapSettingsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  LocationMapSettingsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  LocationMapSettingsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  LocationMapSettingsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  LocationMapSettingsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by setting_id in ascending order
  LocationMapSettingsModelQueryBuilder orderBySettingIdAsc() {
    _queryBuilder = _queryBuilder.order('setting_id', ascending: true);
    return this;
  }
  
  /// Order by setting_id in descending order
  LocationMapSettingsModelQueryBuilder orderBySettingIdDesc() {
    _queryBuilder = _queryBuilder.order('setting_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  LocationMapSettingsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  LocationMapSettingsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by zoom_level in ascending order
  LocationMapSettingsModelQueryBuilder orderByZoomLevelAsc() {
    _queryBuilder = _queryBuilder.order('zoom_level', ascending: true);
    return this;
  }
  
  /// Order by zoom_level in descending order
  LocationMapSettingsModelQueryBuilder orderByZoomLevelDesc() {
    _queryBuilder = _queryBuilder.order('zoom_level', ascending: false);
    return this;
  }

  /// Order by center_latitude in ascending order
  LocationMapSettingsModelQueryBuilder orderByCenterLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('center_latitude', ascending: true);
    return this;
  }
  
  /// Order by center_latitude in descending order
  LocationMapSettingsModelQueryBuilder orderByCenterLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('center_latitude', ascending: false);
    return this;
  }

  /// Order by center_longitude in ascending order
  LocationMapSettingsModelQueryBuilder orderByCenterLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('center_longitude', ascending: true);
    return this;
  }
  
  /// Order by center_longitude in descending order
  LocationMapSettingsModelQueryBuilder orderByCenterLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('center_longitude', ascending: false);
    return this;
  }

  /// Order by show_terrain in ascending order
  LocationMapSettingsModelQueryBuilder orderByShowTerrainAsc() {
    _queryBuilder = _queryBuilder.order('show_terrain', ascending: true);
    return this;
  }
  
  /// Order by show_terrain in descending order
  LocationMapSettingsModelQueryBuilder orderByShowTerrainDesc() {
    _queryBuilder = _queryBuilder.order('show_terrain', ascending: false);
    return this;
  }

  /// Order by show_traffic in ascending order
  LocationMapSettingsModelQueryBuilder orderByShowTrafficAsc() {
    _queryBuilder = _queryBuilder.order('show_traffic', ascending: true);
    return this;
  }
  
  /// Order by show_traffic in descending order
  LocationMapSettingsModelQueryBuilder orderByShowTrafficDesc() {
    _queryBuilder = _queryBuilder.order('show_traffic', ascending: false);
    return this;
  }

  /// Order by created_by in ascending order
  LocationMapSettingsModelQueryBuilder orderByCreatedByAsc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: true);
    return this;
  }
  
  /// Order by created_by in descending order
  LocationMapSettingsModelQueryBuilder orderByCreatedByDesc() {
    _queryBuilder = _queryBuilder.order('created_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  LocationMapSettingsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  LocationMapSettingsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  LocationMapSettingsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  LocationMapSettingsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of LocationMapSettingsModel
  Future<List<LocationMapSettingsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => LocationMapSettingsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<LocationMapSettingsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return LocationMapSettingsModel.fromJson(response.first as Map<String, dynamic>);
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
