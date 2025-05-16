import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/users_model.dart';

/// A type-safe query builder for UsersModel
class UsersModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  UsersModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('users').select();
  }
  
  /// Set the fields to select
  UsersModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('users').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  UsersModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  UsersModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by user_id
  UsersModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  UsersModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by email
  UsersModelQueryBuilder whereEmail(String value) {
    _queryBuilder = _queryBuilder.eq('email', value);
    return this;
  }
  
  /// Filter by email with multiple values (IN operator)
  UsersModelQueryBuilder whereEmailIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('email', values);
    return this;
  }
  
  

  /// Filter by full_name
  UsersModelQueryBuilder whereFullName(String value) {
    _queryBuilder = _queryBuilder.eq('full_name', value);
    return this;
  }
  
  /// Filter by full_name with multiple values (IN operator)
  UsersModelQueryBuilder whereFullNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('full_name', values);
    return this;
  }
  
  

  /// Filter by phone
  UsersModelQueryBuilder wherePhone(String? value) {
    _queryBuilder = _queryBuilder.eq('phone', value);
    return this;
  }
  
  /// Filter by phone with multiple values (IN operator)
  UsersModelQueryBuilder wherePhoneIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('phone', values);
    return this;
  }
  
  

  /// Filter by profile_image_url
  UsersModelQueryBuilder whereProfileImageUrl(String? value) {
    _queryBuilder = _queryBuilder.eq('profile_image_url', value);
    return this;
  }
  
  /// Filter by profile_image_url with multiple values (IN operator)
  UsersModelQueryBuilder whereProfileImageUrlIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('profile_image_url', values);
    return this;
  }
  
  

  /// Filter by user_type
  UsersModelQueryBuilder whereUserType(String value) {
    _queryBuilder = _queryBuilder.eq('user_type', value);
    return this;
  }
  
  /// Filter by user_type with multiple values (IN operator)
  UsersModelQueryBuilder whereUserTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_type', values);
    return this;
  }
  
  

  /// Filter by created_at
  UsersModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  UsersModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  UsersModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  UsersModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  UsersModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  UsersModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  UsersModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  UsersModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  UsersModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  UsersModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  UsersModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  UsersModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  UsersModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  UsersModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by status
  UsersModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  UsersModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  
  
  /// Order by user_id in ascending order
  UsersModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  UsersModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by email in ascending order
  UsersModelQueryBuilder orderByEmailAsc() {
    _queryBuilder = _queryBuilder.order('email', ascending: true);
    return this;
  }
  
  /// Order by email in descending order
  UsersModelQueryBuilder orderByEmailDesc() {
    _queryBuilder = _queryBuilder.order('email', ascending: false);
    return this;
  }

  /// Order by full_name in ascending order
  UsersModelQueryBuilder orderByFullNameAsc() {
    _queryBuilder = _queryBuilder.order('full_name', ascending: true);
    return this;
  }
  
  /// Order by full_name in descending order
  UsersModelQueryBuilder orderByFullNameDesc() {
    _queryBuilder = _queryBuilder.order('full_name', ascending: false);
    return this;
  }

  /// Order by phone in ascending order
  UsersModelQueryBuilder orderByPhoneAsc() {
    _queryBuilder = _queryBuilder.order('phone', ascending: true);
    return this;
  }
  
  /// Order by phone in descending order
  UsersModelQueryBuilder orderByPhoneDesc() {
    _queryBuilder = _queryBuilder.order('phone', ascending: false);
    return this;
  }

  /// Order by profile_image_url in ascending order
  UsersModelQueryBuilder orderByProfileImageUrlAsc() {
    _queryBuilder = _queryBuilder.order('profile_image_url', ascending: true);
    return this;
  }
  
  /// Order by profile_image_url in descending order
  UsersModelQueryBuilder orderByProfileImageUrlDesc() {
    _queryBuilder = _queryBuilder.order('profile_image_url', ascending: false);
    return this;
  }

  /// Order by user_type in ascending order
  UsersModelQueryBuilder orderByUserTypeAsc() {
    _queryBuilder = _queryBuilder.order('user_type', ascending: true);
    return this;
  }
  
  /// Order by user_type in descending order
  UsersModelQueryBuilder orderByUserTypeDesc() {
    _queryBuilder = _queryBuilder.order('user_type', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  UsersModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  UsersModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  UsersModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  UsersModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  UsersModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  UsersModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of UsersModel
  Future<List<UsersModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => UsersModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<UsersModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return UsersModel.fromJson(response.first as Map<String, dynamic>);
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
