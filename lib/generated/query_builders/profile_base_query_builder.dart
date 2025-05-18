import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/profile_base_model.dart';

/// A type-safe query builder for ProfileBaseModel
class ProfileBaseModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfileBaseModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('profile_base').select();
  }
  
  /// Set the fields to select
  ProfileBaseModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('profile_base').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfileBaseModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfileBaseModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  ProfileBaseModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by email
  ProfileBaseModelQueryBuilder whereEmail(String value) {
    _queryBuilder = _queryBuilder.eq('email', value);
    return this;
  }
  
  /// Filter by email with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereEmailIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('email', values);
    return this;
  }
  
  

  /// Filter by full_name
  ProfileBaseModelQueryBuilder whereFullName(String value) {
    _queryBuilder = _queryBuilder.eq('full_name', value);
    return this;
  }
  
  /// Filter by full_name with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereFullNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('full_name', values);
    return this;
  }
  
  

  /// Filter by phone
  ProfileBaseModelQueryBuilder wherePhone(String? value) {
    _queryBuilder = _queryBuilder.eq('phone', value);
    return this;
  }
  
  /// Filter by phone with multiple values (IN operator)
  ProfileBaseModelQueryBuilder wherePhoneIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('phone', values);
    return this;
  }
  
  

  /// Filter by profile_image_url
  ProfileBaseModelQueryBuilder whereProfileImageUrl(String? value) {
    _queryBuilder = _queryBuilder.eq('profile_image_url', value);
    return this;
  }
  
  /// Filter by profile_image_url with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereProfileImageUrlIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('profile_image_url', values);
    return this;
  }
  
  

  /// Filter by user_type
  ProfileBaseModelQueryBuilder whereUserType(String value) {
    _queryBuilder = _queryBuilder.eq('user_type', value);
    return this;
  }
  
  /// Filter by user_type with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereUserTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_type', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfileBaseModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfileBaseModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfileBaseModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfileBaseModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfileBaseModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfileBaseModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfileBaseModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfileBaseModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfileBaseModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfileBaseModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfileBaseModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfileBaseModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by status
  ProfileBaseModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  ProfileBaseModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  
  
  /// Order by id in ascending order
  ProfileBaseModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  ProfileBaseModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by email in ascending order
  ProfileBaseModelQueryBuilder orderByEmailAsc() {
    _queryBuilder = _queryBuilder.order('email', ascending: true);
    return this;
  }
  
  /// Order by email in descending order
  ProfileBaseModelQueryBuilder orderByEmailDesc() {
    _queryBuilder = _queryBuilder.order('email', ascending: false);
    return this;
  }

  /// Order by full_name in ascending order
  ProfileBaseModelQueryBuilder orderByFullNameAsc() {
    _queryBuilder = _queryBuilder.order('full_name', ascending: true);
    return this;
  }
  
  /// Order by full_name in descending order
  ProfileBaseModelQueryBuilder orderByFullNameDesc() {
    _queryBuilder = _queryBuilder.order('full_name', ascending: false);
    return this;
  }

  /// Order by phone in ascending order
  ProfileBaseModelQueryBuilder orderByPhoneAsc() {
    _queryBuilder = _queryBuilder.order('phone', ascending: true);
    return this;
  }
  
  /// Order by phone in descending order
  ProfileBaseModelQueryBuilder orderByPhoneDesc() {
    _queryBuilder = _queryBuilder.order('phone', ascending: false);
    return this;
  }

  /// Order by profile_image_url in ascending order
  ProfileBaseModelQueryBuilder orderByProfileImageUrlAsc() {
    _queryBuilder = _queryBuilder.order('profile_image_url', ascending: true);
    return this;
  }
  
  /// Order by profile_image_url in descending order
  ProfileBaseModelQueryBuilder orderByProfileImageUrlDesc() {
    _queryBuilder = _queryBuilder.order('profile_image_url', ascending: false);
    return this;
  }

  /// Order by user_type in ascending order
  ProfileBaseModelQueryBuilder orderByUserTypeAsc() {
    _queryBuilder = _queryBuilder.order('user_type', ascending: true);
    return this;
  }
  
  /// Order by user_type in descending order
  ProfileBaseModelQueryBuilder orderByUserTypeDesc() {
    _queryBuilder = _queryBuilder.order('user_type', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfileBaseModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfileBaseModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfileBaseModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfileBaseModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  ProfileBaseModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  ProfileBaseModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfileBaseModel
  Future<List<ProfileBaseModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfileBaseModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfileBaseModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfileBaseModel.fromJson(response.first as Map<String, dynamic>);
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
