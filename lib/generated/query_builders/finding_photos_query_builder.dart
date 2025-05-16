import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/finding_photos_model.dart';

/// A type-safe query builder for FindingPhotosModel
class FindingPhotosModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  FindingPhotosModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('finding_photos').select();
  }
  
  /// Set the fields to select
  FindingPhotosModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('finding_photos').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  FindingPhotosModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  FindingPhotosModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by finding_photo_id
  FindingPhotosModelQueryBuilder whereFindingPhotoId(String value) {
    _queryBuilder = _queryBuilder.eq('finding_photo_id', value);
    return this;
  }
  
  /// Filter by finding_photo_id with multiple values (IN operator)
  FindingPhotosModelQueryBuilder whereFindingPhotoIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('finding_photo_id', values);
    return this;
  }
  
  

  /// Filter by finding_id
  FindingPhotosModelQueryBuilder whereFindingId(String value) {
    _queryBuilder = _queryBuilder.eq('finding_id', value);
    return this;
  }
  
  /// Filter by finding_id with multiple values (IN operator)
  FindingPhotosModelQueryBuilder whereFindingIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('finding_id', values);
    return this;
  }
  
  

  /// Filter by photo_id
  FindingPhotosModelQueryBuilder wherePhotoId(String value) {
    _queryBuilder = _queryBuilder.eq('photo_id', value);
    return this;
  }
  
  /// Filter by photo_id with multiple values (IN operator)
  FindingPhotosModelQueryBuilder wherePhotoIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('photo_id', values);
    return this;
  }
  
  

  /// Filter by is_primary
  FindingPhotosModelQueryBuilder whereIsPrimary(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_primary', value);
    return this;
  }
  
  /// Filter by is_primary with multiple values (IN operator)
  FindingPhotosModelQueryBuilder whereIsPrimaryIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_primary', values);
    return this;
  }
  
  

  /// Filter by created_at
  FindingPhotosModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  FindingPhotosModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  FindingPhotosModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  FindingPhotosModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  FindingPhotosModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  FindingPhotosModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  FindingPhotosModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by finding_photo_id in ascending order
  FindingPhotosModelQueryBuilder orderByFindingPhotoIdAsc() {
    _queryBuilder = _queryBuilder.order('finding_photo_id', ascending: true);
    return this;
  }
  
  /// Order by finding_photo_id in descending order
  FindingPhotosModelQueryBuilder orderByFindingPhotoIdDesc() {
    _queryBuilder = _queryBuilder.order('finding_photo_id', ascending: false);
    return this;
  }

  /// Order by finding_id in ascending order
  FindingPhotosModelQueryBuilder orderByFindingIdAsc() {
    _queryBuilder = _queryBuilder.order('finding_id', ascending: true);
    return this;
  }
  
  /// Order by finding_id in descending order
  FindingPhotosModelQueryBuilder orderByFindingIdDesc() {
    _queryBuilder = _queryBuilder.order('finding_id', ascending: false);
    return this;
  }

  /// Order by photo_id in ascending order
  FindingPhotosModelQueryBuilder orderByPhotoIdAsc() {
    _queryBuilder = _queryBuilder.order('photo_id', ascending: true);
    return this;
  }
  
  /// Order by photo_id in descending order
  FindingPhotosModelQueryBuilder orderByPhotoIdDesc() {
    _queryBuilder = _queryBuilder.order('photo_id', ascending: false);
    return this;
  }

  /// Order by is_primary in ascending order
  FindingPhotosModelQueryBuilder orderByIsPrimaryAsc() {
    _queryBuilder = _queryBuilder.order('is_primary', ascending: true);
    return this;
  }
  
  /// Order by is_primary in descending order
  FindingPhotosModelQueryBuilder orderByIsPrimaryDesc() {
    _queryBuilder = _queryBuilder.order('is_primary', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  FindingPhotosModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  FindingPhotosModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of FindingPhotosModel
  Future<List<FindingPhotosModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => FindingPhotosModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<FindingPhotosModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return FindingPhotosModel.fromJson(response.first as Map<String, dynamic>);
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
