import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/task_photos_model.dart';

/// A type-safe query builder for TaskPhotosModel
class TaskPhotosModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  TaskPhotosModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('task_photos').select();
  }
  
  /// Set the fields to select
  TaskPhotosModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('task_photos').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  TaskPhotosModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  TaskPhotosModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by task_photo_id
  TaskPhotosModelQueryBuilder whereTaskPhotoId(String value) {
    _queryBuilder = _queryBuilder.eq('task_photo_id', value);
    return this;
  }
  
  /// Filter by task_photo_id with multiple values (IN operator)
  TaskPhotosModelQueryBuilder whereTaskPhotoIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('task_photo_id', values);
    return this;
  }
  
  

  /// Filter by task_id
  TaskPhotosModelQueryBuilder whereTaskId(String value) {
    _queryBuilder = _queryBuilder.eq('task_id', value);
    return this;
  }
  
  /// Filter by task_id with multiple values (IN operator)
  TaskPhotosModelQueryBuilder whereTaskIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('task_id', values);
    return this;
  }
  
  

  /// Filter by photo_id
  TaskPhotosModelQueryBuilder wherePhotoId(String value) {
    _queryBuilder = _queryBuilder.eq('photo_id', value);
    return this;
  }
  
  /// Filter by photo_id with multiple values (IN operator)
  TaskPhotosModelQueryBuilder wherePhotoIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('photo_id', values);
    return this;
  }
  
  

  /// Filter by is_primary
  TaskPhotosModelQueryBuilder whereIsPrimary(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_primary', value);
    return this;
  }
  
  /// Filter by is_primary with multiple values (IN operator)
  TaskPhotosModelQueryBuilder whereIsPrimaryIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_primary', values);
    return this;
  }
  
  

  /// Filter by created_at
  TaskPhotosModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  TaskPhotosModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  TaskPhotosModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  TaskPhotosModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  TaskPhotosModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  TaskPhotosModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  TaskPhotosModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by task_photo_id in ascending order
  TaskPhotosModelQueryBuilder orderByTaskPhotoIdAsc() {
    _queryBuilder = _queryBuilder.order('task_photo_id', ascending: true);
    return this;
  }
  
  /// Order by task_photo_id in descending order
  TaskPhotosModelQueryBuilder orderByTaskPhotoIdDesc() {
    _queryBuilder = _queryBuilder.order('task_photo_id', ascending: false);
    return this;
  }

  /// Order by task_id in ascending order
  TaskPhotosModelQueryBuilder orderByTaskIdAsc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: true);
    return this;
  }
  
  /// Order by task_id in descending order
  TaskPhotosModelQueryBuilder orderByTaskIdDesc() {
    _queryBuilder = _queryBuilder.order('task_id', ascending: false);
    return this;
  }

  /// Order by photo_id in ascending order
  TaskPhotosModelQueryBuilder orderByPhotoIdAsc() {
    _queryBuilder = _queryBuilder.order('photo_id', ascending: true);
    return this;
  }
  
  /// Order by photo_id in descending order
  TaskPhotosModelQueryBuilder orderByPhotoIdDesc() {
    _queryBuilder = _queryBuilder.order('photo_id', ascending: false);
    return this;
  }

  /// Order by is_primary in ascending order
  TaskPhotosModelQueryBuilder orderByIsPrimaryAsc() {
    _queryBuilder = _queryBuilder.order('is_primary', ascending: true);
    return this;
  }
  
  /// Order by is_primary in descending order
  TaskPhotosModelQueryBuilder orderByIsPrimaryDesc() {
    _queryBuilder = _queryBuilder.order('is_primary', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  TaskPhotosModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  TaskPhotosModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of TaskPhotosModel
  Future<List<TaskPhotosModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => TaskPhotosModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<TaskPhotosModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return TaskPhotosModel.fromJson(response.first as Map<String, dynamic>);
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
