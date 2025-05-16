import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/homeowner_profiles_model.dart';

/// A type-safe query builder for HomeownerProfilesModel
class HomeownerProfilesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  HomeownerProfilesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('homeowner_profiles').select();
  }
  
  /// Set the fields to select
  HomeownerProfilesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('homeowner_profiles').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  HomeownerProfilesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  HomeownerProfilesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by homeowner_id
  HomeownerProfilesModelQueryBuilder whereHomeownerId(String value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by address
  HomeownerProfilesModelQueryBuilder whereAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('address', value);
    return this;
  }
  
  /// Filter by address with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('address', values);
    return this;
  }
  
  

  /// Filter by city
  HomeownerProfilesModelQueryBuilder whereCity(String? value) {
    _queryBuilder = _queryBuilder.eq('city', value);
    return this;
  }
  
  /// Filter by city with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereCityIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('city', values);
    return this;
  }
  
  

  /// Filter by state
  HomeownerProfilesModelQueryBuilder whereState(String? value) {
    _queryBuilder = _queryBuilder.eq('state', value);
    return this;
  }
  
  /// Filter by state with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereStateIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('state', values);
    return this;
  }
  
  

  /// Filter by zip_code
  HomeownerProfilesModelQueryBuilder whereZipCode(String? value) {
    _queryBuilder = _queryBuilder.eq('zip_code', value);
    return this;
  }
  
  /// Filter by zip_code with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereZipCodeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('zip_code', values);
    return this;
  }
  
  

  /// Filter by country
  HomeownerProfilesModelQueryBuilder whereCountry(String? value) {
    _queryBuilder = _queryBuilder.eq('country', value);
    return this;
  }
  
  /// Filter by country with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereCountryIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('country', values);
    return this;
  }
  
  

  /// Filter by latitude
  HomeownerProfilesModelQueryBuilder whereLatitude(double? value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  HomeownerProfilesModelQueryBuilder whereLatitudeGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  HomeownerProfilesModelQueryBuilder whereLatitudeGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  HomeownerProfilesModelQueryBuilder whereLatitudeLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  HomeownerProfilesModelQueryBuilder whereLatitudeLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  HomeownerProfilesModelQueryBuilder whereLatitudeBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  HomeownerProfilesModelQueryBuilder whereLongitude(double? value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  HomeownerProfilesModelQueryBuilder whereLongitudeGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  HomeownerProfilesModelQueryBuilder whereLongitudeGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  HomeownerProfilesModelQueryBuilder whereLongitudeLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  HomeownerProfilesModelQueryBuilder whereLongitudeLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  HomeownerProfilesModelQueryBuilder whereLongitudeBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by preferred_language
  HomeownerProfilesModelQueryBuilder wherePreferredLanguage(String? value) {
    _queryBuilder = _queryBuilder.eq('preferred_language', value);
    return this;
  }
  
  /// Filter by preferred_language with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder wherePreferredLanguageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('preferred_language', values);
    return this;
  }
  
  

  /// Filter by notification_preferences
  HomeownerProfilesModelQueryBuilder whereNotificationPreferences(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('notification_preferences', value);
    return this;
  }
  
  /// Filter by notification_preferences with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereNotificationPreferencesIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('notification_preferences', values);
    return this;
  }
  
  

  /// Filter by verification_status
  HomeownerProfilesModelQueryBuilder whereVerificationStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('verification_status', value);
    return this;
  }
  
  /// Filter by verification_status with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereVerificationStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_status', values);
    return this;
  }
  
  

  /// Filter by verified_at
  HomeownerProfilesModelQueryBuilder whereVerifiedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('verified_at', value);
    return this;
  }
  
  /// Filter by verified_at with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereVerifiedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verified_at', values);
    return this;
  }
  
    /// Filter verified_at greater than
  HomeownerProfilesModelQueryBuilder whereVerifiedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at greater than or equal
  HomeownerProfilesModelQueryBuilder whereVerifiedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than
  HomeownerProfilesModelQueryBuilder whereVerifiedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than or equal
  HomeownerProfilesModelQueryBuilder whereVerifiedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at between two values
  HomeownerProfilesModelQueryBuilder whereVerifiedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('verified_at', min).lte('verified_at', max);
    return this;
  }

  /// Filter by created_at
  HomeownerProfilesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  HomeownerProfilesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  HomeownerProfilesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  HomeownerProfilesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  HomeownerProfilesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  HomeownerProfilesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  HomeownerProfilesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  HomeownerProfilesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  HomeownerProfilesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  HomeownerProfilesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  HomeownerProfilesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  HomeownerProfilesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  HomeownerProfilesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by homeowner_id in ascending order
  HomeownerProfilesModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  HomeownerProfilesModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by address in ascending order
  HomeownerProfilesModelQueryBuilder orderByAddressAsc() {
    _queryBuilder = _queryBuilder.order('address', ascending: true);
    return this;
  }
  
  /// Order by address in descending order
  HomeownerProfilesModelQueryBuilder orderByAddressDesc() {
    _queryBuilder = _queryBuilder.order('address', ascending: false);
    return this;
  }

  /// Order by city in ascending order
  HomeownerProfilesModelQueryBuilder orderByCityAsc() {
    _queryBuilder = _queryBuilder.order('city', ascending: true);
    return this;
  }
  
  /// Order by city in descending order
  HomeownerProfilesModelQueryBuilder orderByCityDesc() {
    _queryBuilder = _queryBuilder.order('city', ascending: false);
    return this;
  }

  /// Order by state in ascending order
  HomeownerProfilesModelQueryBuilder orderByStateAsc() {
    _queryBuilder = _queryBuilder.order('state', ascending: true);
    return this;
  }
  
  /// Order by state in descending order
  HomeownerProfilesModelQueryBuilder orderByStateDesc() {
    _queryBuilder = _queryBuilder.order('state', ascending: false);
    return this;
  }

  /// Order by zip_code in ascending order
  HomeownerProfilesModelQueryBuilder orderByZipCodeAsc() {
    _queryBuilder = _queryBuilder.order('zip_code', ascending: true);
    return this;
  }
  
  /// Order by zip_code in descending order
  HomeownerProfilesModelQueryBuilder orderByZipCodeDesc() {
    _queryBuilder = _queryBuilder.order('zip_code', ascending: false);
    return this;
  }

  /// Order by country in ascending order
  HomeownerProfilesModelQueryBuilder orderByCountryAsc() {
    _queryBuilder = _queryBuilder.order('country', ascending: true);
    return this;
  }
  
  /// Order by country in descending order
  HomeownerProfilesModelQueryBuilder orderByCountryDesc() {
    _queryBuilder = _queryBuilder.order('country', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  HomeownerProfilesModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  HomeownerProfilesModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  HomeownerProfilesModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  HomeownerProfilesModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by preferred_language in ascending order
  HomeownerProfilesModelQueryBuilder orderByPreferredLanguageAsc() {
    _queryBuilder = _queryBuilder.order('preferred_language', ascending: true);
    return this;
  }
  
  /// Order by preferred_language in descending order
  HomeownerProfilesModelQueryBuilder orderByPreferredLanguageDesc() {
    _queryBuilder = _queryBuilder.order('preferred_language', ascending: false);
    return this;
  }

  /// Order by notification_preferences in ascending order
  HomeownerProfilesModelQueryBuilder orderByNotificationPreferencesAsc() {
    _queryBuilder = _queryBuilder.order('notification_preferences', ascending: true);
    return this;
  }
  
  /// Order by notification_preferences in descending order
  HomeownerProfilesModelQueryBuilder orderByNotificationPreferencesDesc() {
    _queryBuilder = _queryBuilder.order('notification_preferences', ascending: false);
    return this;
  }

  /// Order by verification_status in ascending order
  HomeownerProfilesModelQueryBuilder orderByVerificationStatusAsc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: true);
    return this;
  }
  
  /// Order by verification_status in descending order
  HomeownerProfilesModelQueryBuilder orderByVerificationStatusDesc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: false);
    return this;
  }

  /// Order by verified_at in ascending order
  HomeownerProfilesModelQueryBuilder orderByVerifiedAtAsc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: true);
    return this;
  }
  
  /// Order by verified_at in descending order
  HomeownerProfilesModelQueryBuilder orderByVerifiedAtDesc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  HomeownerProfilesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  HomeownerProfilesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  HomeownerProfilesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  HomeownerProfilesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of HomeownerProfilesModel
  Future<List<HomeownerProfilesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => HomeownerProfilesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<HomeownerProfilesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return HomeownerProfilesModel.fromJson(response.first as Map<String, dynamic>);
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
