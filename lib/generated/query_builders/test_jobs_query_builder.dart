import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/test_jobs_model.dart';

/// A type-safe query builder for TestJobsModel
class TestJobsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  TestJobsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('test_jobs').select();
  }
  
  /// Set the fields to select
  TestJobsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('test_jobs').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  TestJobsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  TestJobsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by job_id
  TestJobsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  TestJobsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by name
  TestJobsModelQueryBuilder whereName(String value) {
    _queryBuilder = _queryBuilder.eq('name', value);
    return this;
  }
  
  /// Filter by name with multiple values (IN operator)
  TestJobsModelQueryBuilder whereNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('name', values);
    return this;
  }
  
  

  /// Filter by description
  TestJobsModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  TestJobsModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by created_at
  TestJobsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  TestJobsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  TestJobsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  TestJobsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  TestJobsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  TestJobsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  TestJobsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by job_id in ascending order
  TestJobsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  TestJobsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by name in ascending order
  TestJobsModelQueryBuilder orderByNameAsc() {
    _queryBuilder = _queryBuilder.order('name', ascending: true);
    return this;
  }
  
  /// Order by name in descending order
  TestJobsModelQueryBuilder orderByNameDesc() {
    _queryBuilder = _queryBuilder.order('name', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  TestJobsModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  TestJobsModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  TestJobsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  TestJobsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of TestJobsModel
  Future<List<TestJobsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => TestJobsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<TestJobsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return TestJobsModel.fromJson(response.first as Map<String, dynamic>);
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
