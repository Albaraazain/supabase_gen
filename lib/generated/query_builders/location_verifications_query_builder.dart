import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/location_verifications_model.dart';

/// A type-safe query builder for LocationVerificationsModel
class LocationVerificationsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  LocationVerificationsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('location_verifications').select();
  }
  
  /// Set the fields to select
  LocationVerificationsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('location_verifications').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  LocationVerificationsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  LocationVerificationsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by verification_id
  LocationVerificationsModelQueryBuilder whereVerificationId(String value) {
    _queryBuilder = _queryBuilder.eq('verification_id', value);
    return this;
  }
  
  /// Filter by verification_id with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereVerificationIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_id', values);
    return this;
  }
  
  

  /// Filter by job_id
  LocationVerificationsModelQueryBuilder whereJobId(String value) {
    _queryBuilder = _queryBuilder.eq('job_id', value);
    return this;
  }
  
  /// Filter by job_id with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereJobIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('job_id', values);
    return this;
  }
  
  

  /// Filter by user_id
  LocationVerificationsModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by latitude
  LocationVerificationsModelQueryBuilder whereLatitude(double value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  LocationVerificationsModelQueryBuilder whereLatitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  LocationVerificationsModelQueryBuilder whereLatitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  LocationVerificationsModelQueryBuilder whereLatitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  LocationVerificationsModelQueryBuilder whereLatitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  LocationVerificationsModelQueryBuilder whereLatitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  LocationVerificationsModelQueryBuilder whereLongitude(double value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  LocationVerificationsModelQueryBuilder whereLongitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  LocationVerificationsModelQueryBuilder whereLongitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  LocationVerificationsModelQueryBuilder whereLongitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  LocationVerificationsModelQueryBuilder whereLongitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  LocationVerificationsModelQueryBuilder whereLongitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by accuracy_meters
  LocationVerificationsModelQueryBuilder whereAccuracyMeters(double? value) {
    _queryBuilder = _queryBuilder.eq('accuracy_meters', value);
    return this;
  }
  
  /// Filter by accuracy_meters with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereAccuracyMetersIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accuracy_meters', values);
    return this;
  }
  
    /// Filter accuracy_meters greater than
  LocationVerificationsModelQueryBuilder whereAccuracyMetersGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters greater than or equal
  LocationVerificationsModelQueryBuilder whereAccuracyMetersGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters less than
  LocationVerificationsModelQueryBuilder whereAccuracyMetersLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters less than or equal
  LocationVerificationsModelQueryBuilder whereAccuracyMetersLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters between two values
  LocationVerificationsModelQueryBuilder whereAccuracyMetersBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('accuracy_meters', min).lte('accuracy_meters', max);
    return this;
  }

  /// Filter by verified_at
  LocationVerificationsModelQueryBuilder whereVerifiedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('verified_at', value);
    return this;
  }
  
  /// Filter by verified_at with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereVerifiedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verified_at', values);
    return this;
  }
  
    /// Filter verified_at greater than
  LocationVerificationsModelQueryBuilder whereVerifiedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at greater than or equal
  LocationVerificationsModelQueryBuilder whereVerifiedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than
  LocationVerificationsModelQueryBuilder whereVerifiedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than or equal
  LocationVerificationsModelQueryBuilder whereVerifiedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at between two values
  LocationVerificationsModelQueryBuilder whereVerifiedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('verified_at', min).lte('verified_at', max);
    return this;
  }

  /// Filter by verification_type
  LocationVerificationsModelQueryBuilder whereVerificationType(String value) {
    _queryBuilder = _queryBuilder.eq('verification_type', value);
    return this;
  }
  
  /// Filter by verification_type with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereVerificationTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_type', values);
    return this;
  }
  
  

  /// Filter by created_at
  LocationVerificationsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  LocationVerificationsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  LocationVerificationsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  LocationVerificationsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  LocationVerificationsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  LocationVerificationsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by address_line1
  LocationVerificationsModelQueryBuilder whereAddressLine1(String? value) {
    _queryBuilder = _queryBuilder.eq('address_line1', value);
    return this;
  }
  
  /// Filter by address_line1 with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereAddressLine1In(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('address_line1', values);
    return this;
  }
  
  

  /// Filter by address_line2
  LocationVerificationsModelQueryBuilder whereAddressLine2(String? value) {
    _queryBuilder = _queryBuilder.eq('address_line2', value);
    return this;
  }
  
  /// Filter by address_line2 with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereAddressLine2In(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('address_line2', values);
    return this;
  }
  
  

  /// Filter by city
  LocationVerificationsModelQueryBuilder whereCity(String? value) {
    _queryBuilder = _queryBuilder.eq('city', value);
    return this;
  }
  
  /// Filter by city with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereCityIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('city', values);
    return this;
  }
  
  

  /// Filter by state
  LocationVerificationsModelQueryBuilder whereState(String? value) {
    _queryBuilder = _queryBuilder.eq('state', value);
    return this;
  }
  
  /// Filter by state with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereStateIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('state', values);
    return this;
  }
  
  

  /// Filter by postal_code
  LocationVerificationsModelQueryBuilder wherePostalCode(String? value) {
    _queryBuilder = _queryBuilder.eq('postal_code', value);
    return this;
  }
  
  /// Filter by postal_code with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder wherePostalCodeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('postal_code', values);
    return this;
  }
  
  

  /// Filter by country
  LocationVerificationsModelQueryBuilder whereCountry(String? value) {
    _queryBuilder = _queryBuilder.eq('country', value);
    return this;
  }
  
  /// Filter by country with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereCountryIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('country', values);
    return this;
  }
  
  

  /// Filter by address_verified
  LocationVerificationsModelQueryBuilder whereAddressVerified(bool? value) {
    _queryBuilder = _queryBuilder.eq('address_verified', value);
    return this;
  }
  
  /// Filter by address_verified with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereAddressVerifiedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('address_verified', values);
    return this;
  }
  
  

  /// Filter by verification_status
  LocationVerificationsModelQueryBuilder whereVerificationStatus(String value) {
    _queryBuilder = _queryBuilder.eq('verification_status', value);
    return this;
  }
  
  /// Filter by verification_status with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereVerificationStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_status', values);
    return this;
  }
  
  

  /// Filter by failure_reason
  LocationVerificationsModelQueryBuilder whereFailureReason(String? value) {
    _queryBuilder = _queryBuilder.eq('failure_reason', value);
    return this;
  }
  
  /// Filter by failure_reason with multiple values (IN operator)
  LocationVerificationsModelQueryBuilder whereFailureReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('failure_reason', values);
    return this;
  }
  
  
  
  /// Order by verification_id in ascending order
  LocationVerificationsModelQueryBuilder orderByVerificationIdAsc() {
    _queryBuilder = _queryBuilder.order('verification_id', ascending: true);
    return this;
  }
  
  /// Order by verification_id in descending order
  LocationVerificationsModelQueryBuilder orderByVerificationIdDesc() {
    _queryBuilder = _queryBuilder.order('verification_id', ascending: false);
    return this;
  }

  /// Order by job_id in ascending order
  LocationVerificationsModelQueryBuilder orderByJobIdAsc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: true);
    return this;
  }
  
  /// Order by job_id in descending order
  LocationVerificationsModelQueryBuilder orderByJobIdDesc() {
    _queryBuilder = _queryBuilder.order('job_id', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  LocationVerificationsModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  LocationVerificationsModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  LocationVerificationsModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  LocationVerificationsModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  LocationVerificationsModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  LocationVerificationsModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by accuracy_meters in ascending order
  LocationVerificationsModelQueryBuilder orderByAccuracyMetersAsc() {
    _queryBuilder = _queryBuilder.order('accuracy_meters', ascending: true);
    return this;
  }
  
  /// Order by accuracy_meters in descending order
  LocationVerificationsModelQueryBuilder orderByAccuracyMetersDesc() {
    _queryBuilder = _queryBuilder.order('accuracy_meters', ascending: false);
    return this;
  }

  /// Order by verified_at in ascending order
  LocationVerificationsModelQueryBuilder orderByVerifiedAtAsc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: true);
    return this;
  }
  
  /// Order by verified_at in descending order
  LocationVerificationsModelQueryBuilder orderByVerifiedAtDesc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: false);
    return this;
  }

  /// Order by verification_type in ascending order
  LocationVerificationsModelQueryBuilder orderByVerificationTypeAsc() {
    _queryBuilder = _queryBuilder.order('verification_type', ascending: true);
    return this;
  }
  
  /// Order by verification_type in descending order
  LocationVerificationsModelQueryBuilder orderByVerificationTypeDesc() {
    _queryBuilder = _queryBuilder.order('verification_type', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  LocationVerificationsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  LocationVerificationsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by address_line1 in ascending order
  LocationVerificationsModelQueryBuilder orderByAddressLine1Asc() {
    _queryBuilder = _queryBuilder.order('address_line1', ascending: true);
    return this;
  }
  
  /// Order by address_line1 in descending order
  LocationVerificationsModelQueryBuilder orderByAddressLine1Desc() {
    _queryBuilder = _queryBuilder.order('address_line1', ascending: false);
    return this;
  }

  /// Order by address_line2 in ascending order
  LocationVerificationsModelQueryBuilder orderByAddressLine2Asc() {
    _queryBuilder = _queryBuilder.order('address_line2', ascending: true);
    return this;
  }
  
  /// Order by address_line2 in descending order
  LocationVerificationsModelQueryBuilder orderByAddressLine2Desc() {
    _queryBuilder = _queryBuilder.order('address_line2', ascending: false);
    return this;
  }

  /// Order by city in ascending order
  LocationVerificationsModelQueryBuilder orderByCityAsc() {
    _queryBuilder = _queryBuilder.order('city', ascending: true);
    return this;
  }
  
  /// Order by city in descending order
  LocationVerificationsModelQueryBuilder orderByCityDesc() {
    _queryBuilder = _queryBuilder.order('city', ascending: false);
    return this;
  }

  /// Order by state in ascending order
  LocationVerificationsModelQueryBuilder orderByStateAsc() {
    _queryBuilder = _queryBuilder.order('state', ascending: true);
    return this;
  }
  
  /// Order by state in descending order
  LocationVerificationsModelQueryBuilder orderByStateDesc() {
    _queryBuilder = _queryBuilder.order('state', ascending: false);
    return this;
  }

  /// Order by postal_code in ascending order
  LocationVerificationsModelQueryBuilder orderByPostalCodeAsc() {
    _queryBuilder = _queryBuilder.order('postal_code', ascending: true);
    return this;
  }
  
  /// Order by postal_code in descending order
  LocationVerificationsModelQueryBuilder orderByPostalCodeDesc() {
    _queryBuilder = _queryBuilder.order('postal_code', ascending: false);
    return this;
  }

  /// Order by country in ascending order
  LocationVerificationsModelQueryBuilder orderByCountryAsc() {
    _queryBuilder = _queryBuilder.order('country', ascending: true);
    return this;
  }
  
  /// Order by country in descending order
  LocationVerificationsModelQueryBuilder orderByCountryDesc() {
    _queryBuilder = _queryBuilder.order('country', ascending: false);
    return this;
  }

  /// Order by address_verified in ascending order
  LocationVerificationsModelQueryBuilder orderByAddressVerifiedAsc() {
    _queryBuilder = _queryBuilder.order('address_verified', ascending: true);
    return this;
  }
  
  /// Order by address_verified in descending order
  LocationVerificationsModelQueryBuilder orderByAddressVerifiedDesc() {
    _queryBuilder = _queryBuilder.order('address_verified', ascending: false);
    return this;
  }

  /// Order by verification_status in ascending order
  LocationVerificationsModelQueryBuilder orderByVerificationStatusAsc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: true);
    return this;
  }
  
  /// Order by verification_status in descending order
  LocationVerificationsModelQueryBuilder orderByVerificationStatusDesc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: false);
    return this;
  }

  /// Order by failure_reason in ascending order
  LocationVerificationsModelQueryBuilder orderByFailureReasonAsc() {
    _queryBuilder = _queryBuilder.order('failure_reason', ascending: true);
    return this;
  }
  
  /// Order by failure_reason in descending order
  LocationVerificationsModelQueryBuilder orderByFailureReasonDesc() {
    _queryBuilder = _queryBuilder.order('failure_reason', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of LocationVerificationsModel
  Future<List<LocationVerificationsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => LocationVerificationsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<LocationVerificationsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return LocationVerificationsModel.fromJson(response.first as Map<String, dynamic>);
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
