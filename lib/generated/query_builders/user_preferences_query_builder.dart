import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_preferences_model.dart';

/// A type-safe query builder for UserPreferencesModel
class UserPreferencesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  UserPreferencesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('user_preferences').select();
  }
  
  /// Set the fields to select
  UserPreferencesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('user_preferences').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  UserPreferencesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  UserPreferencesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  UserPreferencesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by user_id
  UserPreferencesModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by preferred_gender_driver
  UserPreferencesModelQueryBuilder wherePreferredGenderDriver(String? value) {
    _queryBuilder = _queryBuilder.eq('preferred_gender_driver', value);
    return this;
  }
  
  /// Filter by preferred_gender_driver with multiple values (IN operator)
  UserPreferencesModelQueryBuilder wherePreferredGenderDriverIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('preferred_gender_driver', values);
    return this;
  }
  
  

  /// Filter by preferred_gender_passenger
  UserPreferencesModelQueryBuilder wherePreferredGenderPassenger(String? value) {
    _queryBuilder = _queryBuilder.eq('preferred_gender_passenger', value);
    return this;
  }
  
  /// Filter by preferred_gender_passenger with multiple values (IN operator)
  UserPreferencesModelQueryBuilder wherePreferredGenderPassengerIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('preferred_gender_passenger', values);
    return this;
  }
  
  

  /// Filter by max_detour_km
  UserPreferencesModelQueryBuilder whereMaxDetourKm(int? value) {
    _queryBuilder = _queryBuilder.eq('max_detour_km', value);
    return this;
  }
  
  /// Filter by max_detour_km with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereMaxDetourKmIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('max_detour_km', values);
    return this;
  }
  
    /// Filter max_detour_km greater than
  UserPreferencesModelQueryBuilder whereMaxDetourKmGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km greater than or equal
  UserPreferencesModelQueryBuilder whereMaxDetourKmGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km less than
  UserPreferencesModelQueryBuilder whereMaxDetourKmLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km less than or equal
  UserPreferencesModelQueryBuilder whereMaxDetourKmLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km between two values
  UserPreferencesModelQueryBuilder whereMaxDetourKmBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('max_detour_km', min).lte('max_detour_km', max);
    return this;
  }

  /// Filter by min_rating_threshold
  UserPreferencesModelQueryBuilder whereMinRatingThreshold(double? value) {
    _queryBuilder = _queryBuilder.eq('min_rating_threshold', value);
    return this;
  }
  
  /// Filter by min_rating_threshold with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereMinRatingThresholdIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('min_rating_threshold', values);
    return this;
  }
  
    /// Filter min_rating_threshold greater than
  UserPreferencesModelQueryBuilder whereMinRatingThresholdGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('min_rating_threshold', value);
    return this;
  }
  
  /// Filter min_rating_threshold greater than or equal
  UserPreferencesModelQueryBuilder whereMinRatingThresholdGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('min_rating_threshold', value);
    return this;
  }
  
  /// Filter min_rating_threshold less than
  UserPreferencesModelQueryBuilder whereMinRatingThresholdLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('min_rating_threshold', value);
    return this;
  }
  
  /// Filter min_rating_threshold less than or equal
  UserPreferencesModelQueryBuilder whereMinRatingThresholdLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('min_rating_threshold', value);
    return this;
  }
  
  /// Filter min_rating_threshold between two values
  UserPreferencesModelQueryBuilder whereMinRatingThresholdBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('min_rating_threshold', min).lte('min_rating_threshold', max);
    return this;
  }

  /// Filter by auto_accept_threshold
  UserPreferencesModelQueryBuilder whereAutoAcceptThreshold(double? value) {
    _queryBuilder = _queryBuilder.eq('auto_accept_threshold', value);
    return this;
  }
  
  /// Filter by auto_accept_threshold with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereAutoAcceptThresholdIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('auto_accept_threshold', values);
    return this;
  }
  
    /// Filter auto_accept_threshold greater than
  UserPreferencesModelQueryBuilder whereAutoAcceptThresholdGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('auto_accept_threshold', value);
    return this;
  }
  
  /// Filter auto_accept_threshold greater than or equal
  UserPreferencesModelQueryBuilder whereAutoAcceptThresholdGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('auto_accept_threshold', value);
    return this;
  }
  
  /// Filter auto_accept_threshold less than
  UserPreferencesModelQueryBuilder whereAutoAcceptThresholdLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('auto_accept_threshold', value);
    return this;
  }
  
  /// Filter auto_accept_threshold less than or equal
  UserPreferencesModelQueryBuilder whereAutoAcceptThresholdLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('auto_accept_threshold', value);
    return this;
  }
  
  /// Filter auto_accept_threshold between two values
  UserPreferencesModelQueryBuilder whereAutoAcceptThresholdBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('auto_accept_threshold', min).lte('auto_accept_threshold', max);
    return this;
  }

  /// Filter by notification_settings
  UserPreferencesModelQueryBuilder whereNotificationSettings(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('notification_settings', value);
    return this;
  }
  
  /// Filter by notification_settings with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereNotificationSettingsIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notification_settings', values);
    return this;
  }
  
  

  /// Filter by privacy_settings
  UserPreferencesModelQueryBuilder wherePrivacySettings(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('privacy_settings', value);
    return this;
  }
  
  /// Filter by privacy_settings with multiple values (IN operator)
  UserPreferencesModelQueryBuilder wherePrivacySettingsIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('privacy_settings', values);
    return this;
  }
  
  

  /// Filter by created_at
  UserPreferencesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  UserPreferencesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  UserPreferencesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  UserPreferencesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  UserPreferencesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  UserPreferencesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  UserPreferencesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  UserPreferencesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  UserPreferencesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  UserPreferencesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  UserPreferencesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  UserPreferencesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  UserPreferencesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  UserPreferencesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  UserPreferencesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  UserPreferencesModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  UserPreferencesModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by preferred_gender_driver in ascending order
  UserPreferencesModelQueryBuilder orderByPreferredGenderDriverAsc() {
    _queryBuilder = _queryBuilder.order('preferred_gender_driver', ascending: true);
    return this;
  }
  
  /// Order by preferred_gender_driver in descending order
  UserPreferencesModelQueryBuilder orderByPreferredGenderDriverDesc() {
    _queryBuilder = _queryBuilder.order('preferred_gender_driver', ascending: false);
    return this;
  }

  /// Order by preferred_gender_passenger in ascending order
  UserPreferencesModelQueryBuilder orderByPreferredGenderPassengerAsc() {
    _queryBuilder = _queryBuilder.order('preferred_gender_passenger', ascending: true);
    return this;
  }
  
  /// Order by preferred_gender_passenger in descending order
  UserPreferencesModelQueryBuilder orderByPreferredGenderPassengerDesc() {
    _queryBuilder = _queryBuilder.order('preferred_gender_passenger', ascending: false);
    return this;
  }

  /// Order by max_detour_km in ascending order
  UserPreferencesModelQueryBuilder orderByMaxDetourKmAsc() {
    _queryBuilder = _queryBuilder.order('max_detour_km', ascending: true);
    return this;
  }
  
  /// Order by max_detour_km in descending order
  UserPreferencesModelQueryBuilder orderByMaxDetourKmDesc() {
    _queryBuilder = _queryBuilder.order('max_detour_km', ascending: false);
    return this;
  }

  /// Order by min_rating_threshold in ascending order
  UserPreferencesModelQueryBuilder orderByMinRatingThresholdAsc() {
    _queryBuilder = _queryBuilder.order('min_rating_threshold', ascending: true);
    return this;
  }
  
  /// Order by min_rating_threshold in descending order
  UserPreferencesModelQueryBuilder orderByMinRatingThresholdDesc() {
    _queryBuilder = _queryBuilder.order('min_rating_threshold', ascending: false);
    return this;
  }

  /// Order by auto_accept_threshold in ascending order
  UserPreferencesModelQueryBuilder orderByAutoAcceptThresholdAsc() {
    _queryBuilder = _queryBuilder.order('auto_accept_threshold', ascending: true);
    return this;
  }
  
  /// Order by auto_accept_threshold in descending order
  UserPreferencesModelQueryBuilder orderByAutoAcceptThresholdDesc() {
    _queryBuilder = _queryBuilder.order('auto_accept_threshold', ascending: false);
    return this;
  }

  /// Order by notification_settings in ascending order
  UserPreferencesModelQueryBuilder orderByNotificationSettingsAsc() {
    _queryBuilder = _queryBuilder.order('notification_settings', ascending: true);
    return this;
  }
  
  /// Order by notification_settings in descending order
  UserPreferencesModelQueryBuilder orderByNotificationSettingsDesc() {
    _queryBuilder = _queryBuilder.order('notification_settings', ascending: false);
    return this;
  }

  /// Order by privacy_settings in ascending order
  UserPreferencesModelQueryBuilder orderByPrivacySettingsAsc() {
    _queryBuilder = _queryBuilder.order('privacy_settings', ascending: true);
    return this;
  }
  
  /// Order by privacy_settings in descending order
  UserPreferencesModelQueryBuilder orderByPrivacySettingsDesc() {
    _queryBuilder = _queryBuilder.order('privacy_settings', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  UserPreferencesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  UserPreferencesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  UserPreferencesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  UserPreferencesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of UserPreferencesModel
  Future<List<UserPreferencesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => UserPreferencesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<UserPreferencesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return UserPreferencesModel.fromJson(response.first as Map<String, dynamic>);
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
