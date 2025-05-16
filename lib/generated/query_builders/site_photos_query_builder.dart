import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/site_photos_model.dart';

/// A type-safe query builder for SitePhotosModel
class SitePhotosModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  SitePhotosModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('site_photos').select();
  }
  
  /// Set the fields to select
  SitePhotosModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('site_photos').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  SitePhotosModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  SitePhotosModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by photo_id
  SitePhotosModelQueryBuilder wherePhotoId(String value) {
    _queryBuilder = _queryBuilder.eq('photo_id', value);
    return this;
  }
  
  /// Filter by photo_id with multiple values (IN operator)
  SitePhotosModelQueryBuilder wherePhotoIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('photo_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  SitePhotosModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  SitePhotosModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by photo_url
  SitePhotosModelQueryBuilder wherePhotoUrl(String value) {
    _queryBuilder = _queryBuilder.eq('photo_url', value);
    return this;
  }
  
  /// Filter by photo_url with multiple values (IN operator)
  SitePhotosModelQueryBuilder wherePhotoUrlIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('photo_url', values);
    return this;
  }
  
  

  /// Filter by description
  SitePhotosModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  SitePhotosModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by photo_type
  SitePhotosModelQueryBuilder wherePhotoType(String? value) {
    _queryBuilder = _queryBuilder.eq('photo_type', value);
    return this;
  }
  
  /// Filter by photo_type with multiple values (IN operator)
  SitePhotosModelQueryBuilder wherePhotoTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('photo_type', values);
    return this;
  }
  
  

  /// Filter by taken_at
  SitePhotosModelQueryBuilder whereTakenAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('taken_at', value);
    return this;
  }
  
  /// Filter by taken_at with multiple values (IN operator)
  SitePhotosModelQueryBuilder whereTakenAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('taken_at', values);
    return this;
  }
  
    /// Filter taken_at greater than
  SitePhotosModelQueryBuilder whereTakenAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('taken_at', value);
    return this;
  }
  
  /// Filter taken_at greater than or equal
  SitePhotosModelQueryBuilder whereTakenAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('taken_at', value);
    return this;
  }
  
  /// Filter taken_at less than
  SitePhotosModelQueryBuilder whereTakenAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('taken_at', value);
    return this;
  }
  
  /// Filter taken_at less than or equal
  SitePhotosModelQueryBuilder whereTakenAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('taken_at', value);
    return this;
  }
  
  /// Filter taken_at between two values
  SitePhotosModelQueryBuilder whereTakenAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('taken_at', min).lte('taken_at', max);
    return this;
  }

  /// Filter by uploaded_by
  SitePhotosModelQueryBuilder whereUploadedBy(String? value) {
    _queryBuilder = _queryBuilder.eq('uploaded_by', value);
    return this;
  }
  
  /// Filter by uploaded_by with multiple values (IN operator)
  SitePhotosModelQueryBuilder whereUploadedByIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('uploaded_by', values);
    return this;
  }
  
  

  /// Filter by created_at
  SitePhotosModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  SitePhotosModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  SitePhotosModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  SitePhotosModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  SitePhotosModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  SitePhotosModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  SitePhotosModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by photo_id in ascending order
  SitePhotosModelQueryBuilder orderByPhotoIdAsc() {
    _queryBuilder = _queryBuilder.order('photo_id', ascending: true);
    return this;
  }
  
  /// Order by photo_id in descending order
  SitePhotosModelQueryBuilder orderByPhotoIdDesc() {
    _queryBuilder = _queryBuilder.order('photo_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  SitePhotosModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  SitePhotosModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by photo_url in ascending order
  SitePhotosModelQueryBuilder orderByPhotoUrlAsc() {
    _queryBuilder = _queryBuilder.order('photo_url', ascending: true);
    return this;
  }
  
  /// Order by photo_url in descending order
  SitePhotosModelQueryBuilder orderByPhotoUrlDesc() {
    _queryBuilder = _queryBuilder.order('photo_url', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  SitePhotosModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  SitePhotosModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by photo_type in ascending order
  SitePhotosModelQueryBuilder orderByPhotoTypeAsc() {
    _queryBuilder = _queryBuilder.order('photo_type', ascending: true);
    return this;
  }
  
  /// Order by photo_type in descending order
  SitePhotosModelQueryBuilder orderByPhotoTypeDesc() {
    _queryBuilder = _queryBuilder.order('photo_type', ascending: false);
    return this;
  }

  /// Order by taken_at in ascending order
  SitePhotosModelQueryBuilder orderByTakenAtAsc() {
    _queryBuilder = _queryBuilder.order('taken_at', ascending: true);
    return this;
  }
  
  /// Order by taken_at in descending order
  SitePhotosModelQueryBuilder orderByTakenAtDesc() {
    _queryBuilder = _queryBuilder.order('taken_at', ascending: false);
    return this;
  }

  /// Order by uploaded_by in ascending order
  SitePhotosModelQueryBuilder orderByUploadedByAsc() {
    _queryBuilder = _queryBuilder.order('uploaded_by', ascending: true);
    return this;
  }
  
  /// Order by uploaded_by in descending order
  SitePhotosModelQueryBuilder orderByUploadedByDesc() {
    _queryBuilder = _queryBuilder.order('uploaded_by', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  SitePhotosModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  SitePhotosModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of SitePhotosModel
  Future<List<SitePhotosModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => SitePhotosModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<SitePhotosModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return SitePhotosModel.fromJson(response.first as Map<String, dynamic>);
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
