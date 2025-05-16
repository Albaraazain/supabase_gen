import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/location_verification_attempts_model.dart';

/// A type-safe query builder for LocationVerificationAttemptsModel
class LocationVerificationAttemptsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  LocationVerificationAttemptsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('location_verification_attempts').select();
  }
  
  /// Set the fields to select
  LocationVerificationAttemptsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('location_verification_attempts').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  LocationVerificationAttemptsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  LocationVerificationAttemptsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by attempt_id
  LocationVerificationAttemptsModelQueryBuilder whereAttemptId(String value) {
    _queryBuilder = _queryBuilder.eq('attempt_id', value);
    return this;
  }
  
  /// Filter by attempt_id with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereAttemptIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('attempt_id', values);
    return this;
  }
  
  

  /// Filter by verification_id
  LocationVerificationAttemptsModelQueryBuilder whereVerificationId(String value) {
    _queryBuilder = _queryBuilder.eq('verification_id', value);
    return this;
  }
  
  /// Filter by verification_id with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereVerificationIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_id', values);
    return this;
  }
  
  

  /// Filter by latitude
  LocationVerificationAttemptsModelQueryBuilder whereLatitude(double value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  LocationVerificationAttemptsModelQueryBuilder whereLatitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  LocationVerificationAttemptsModelQueryBuilder whereLatitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  LocationVerificationAttemptsModelQueryBuilder whereLatitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  LocationVerificationAttemptsModelQueryBuilder whereLatitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  LocationVerificationAttemptsModelQueryBuilder whereLatitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  LocationVerificationAttemptsModelQueryBuilder whereLongitude(double value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  LocationVerificationAttemptsModelQueryBuilder whereLongitudeGreaterThan(double value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  LocationVerificationAttemptsModelQueryBuilder whereLongitudeGreaterThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  LocationVerificationAttemptsModelQueryBuilder whereLongitudeLessThan(double value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  LocationVerificationAttemptsModelQueryBuilder whereLongitudeLessThanOrEqual(double value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  LocationVerificationAttemptsModelQueryBuilder whereLongitudeBetween(double min, double max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by accuracy_meters
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMeters(double? value) {
    _queryBuilder = _queryBuilder.eq('accuracy_meters', value);
    return this;
  }
  
  /// Filter by accuracy_meters with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMetersIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('accuracy_meters', values);
    return this;
  }
  
    /// Filter accuracy_meters greater than
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMetersGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters greater than or equal
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMetersGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters less than
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMetersLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters less than or equal
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMetersLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('accuracy_meters', value);
    return this;
  }
  
  /// Filter accuracy_meters between two values
  LocationVerificationAttemptsModelQueryBuilder whereAccuracyMetersBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('accuracy_meters', min).lte('accuracy_meters', max);
    return this;
  }

  /// Filter by attempted_at
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('attempted_at', value);
    return this;
  }
  
  /// Filter by attempted_at with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('attempted_at', values);
    return this;
  }
  
    /// Filter attempted_at greater than
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('attempted_at', value);
    return this;
  }
  
  /// Filter attempted_at greater than or equal
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('attempted_at', value);
    return this;
  }
  
  /// Filter attempted_at less than
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('attempted_at', value);
    return this;
  }
  
  /// Filter attempted_at less than or equal
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('attempted_at', value);
    return this;
  }
  
  /// Filter attempted_at between two values
  LocationVerificationAttemptsModelQueryBuilder whereAttemptedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('attempted_at', min).lte('attempted_at', max);
    return this;
  }

  /// Filter by success
  LocationVerificationAttemptsModelQueryBuilder whereSuccess(bool value) {
    _queryBuilder = _queryBuilder.eq('success', value);
    return this;
  }
  
  /// Filter by success with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereSuccessIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('success', values);
    return this;
  }
  
  

  /// Filter by failure_reason
  LocationVerificationAttemptsModelQueryBuilder whereFailureReason(String? value) {
    _queryBuilder = _queryBuilder.eq('failure_reason', value);
    return this;
  }
  
  /// Filter by failure_reason with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereFailureReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('failure_reason', values);
    return this;
  }
  
  

  /// Filter by created_at
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  LocationVerificationAttemptsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by attempt_id in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByAttemptIdAsc() {
    _queryBuilder = _queryBuilder.order('attempt_id', ascending: true);
    return this;
  }
  
  /// Order by attempt_id in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByAttemptIdDesc() {
    _queryBuilder = _queryBuilder.order('attempt_id', ascending: false);
    return this;
  }

  /// Order by verification_id in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByVerificationIdAsc() {
    _queryBuilder = _queryBuilder.order('verification_id', ascending: true);
    return this;
  }
  
  /// Order by verification_id in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByVerificationIdDesc() {
    _queryBuilder = _queryBuilder.order('verification_id', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by accuracy_meters in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByAccuracyMetersAsc() {
    _queryBuilder = _queryBuilder.order('accuracy_meters', ascending: true);
    return this;
  }
  
  /// Order by accuracy_meters in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByAccuracyMetersDesc() {
    _queryBuilder = _queryBuilder.order('accuracy_meters', ascending: false);
    return this;
  }

  /// Order by attempted_at in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByAttemptedAtAsc() {
    _queryBuilder = _queryBuilder.order('attempted_at', ascending: true);
    return this;
  }
  
  /// Order by attempted_at in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByAttemptedAtDesc() {
    _queryBuilder = _queryBuilder.order('attempted_at', ascending: false);
    return this;
  }

  /// Order by success in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderBySuccessAsc() {
    _queryBuilder = _queryBuilder.order('success', ascending: true);
    return this;
  }
  
  /// Order by success in descending order
  LocationVerificationAttemptsModelQueryBuilder orderBySuccessDesc() {
    _queryBuilder = _queryBuilder.order('success', ascending: false);
    return this;
  }

  /// Order by failure_reason in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByFailureReasonAsc() {
    _queryBuilder = _queryBuilder.order('failure_reason', ascending: true);
    return this;
  }
  
  /// Order by failure_reason in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByFailureReasonDesc() {
    _queryBuilder = _queryBuilder.order('failure_reason', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  LocationVerificationAttemptsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  LocationVerificationAttemptsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of LocationVerificationAttemptsModel
  Future<List<LocationVerificationAttemptsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => LocationVerificationAttemptsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<LocationVerificationAttemptsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return LocationVerificationAttemptsModel.fromJson(response.first as Map<String, dynamic>);
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
