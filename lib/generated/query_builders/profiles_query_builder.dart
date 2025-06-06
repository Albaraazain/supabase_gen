import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/profiles_model.dart';

/// A type-safe query builder for ProfilesModel
class ProfilesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfilesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('profiles').select();
  }
  
  /// Set the fields to select
  ProfilesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('profiles').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfilesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfilesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  ProfilesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  ProfilesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by email
  ProfilesModelQueryBuilder whereEmail(String value) {
    _queryBuilder = _queryBuilder.eq('email', value);
    return this;
  }
  
  /// Filter by email with multiple values (IN operator)
  ProfilesModelQueryBuilder whereEmailIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('email', values);
    return this;
  }
  
  

  /// Filter by phone
  ProfilesModelQueryBuilder wherePhone(String? value) {
    _queryBuilder = _queryBuilder.eq('phone', value);
    return this;
  }
  
  /// Filter by phone with multiple values (IN operator)
  ProfilesModelQueryBuilder wherePhoneIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('phone', values);
    return this;
  }
  
  

  /// Filter by full_name
  ProfilesModelQueryBuilder whereFullName(String value) {
    _queryBuilder = _queryBuilder.eq('full_name', value);
    return this;
  }
  
  /// Filter by full_name with multiple values (IN operator)
  ProfilesModelQueryBuilder whereFullNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('full_name', values);
    return this;
  }
  
  

  /// Filter by avatar_url
  ProfilesModelQueryBuilder whereAvatarUrl(String? value) {
    _queryBuilder = _queryBuilder.eq('avatar_url', value);
    return this;
  }
  
  /// Filter by avatar_url with multiple values (IN operator)
  ProfilesModelQueryBuilder whereAvatarUrlIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('avatar_url', values);
    return this;
  }
  
  

  /// Filter by date_of_birth
  ProfilesModelQueryBuilder whereDateOfBirth(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('date_of_birth', value);
    return this;
  }
  
  /// Filter by date_of_birth with multiple values (IN operator)
  ProfilesModelQueryBuilder whereDateOfBirthIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('date_of_birth', values);
    return this;
  }
  
    /// Filter date_of_birth greater than
  ProfilesModelQueryBuilder whereDateOfBirthGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('date_of_birth', value);
    return this;
  }
  
  /// Filter date_of_birth greater than or equal
  ProfilesModelQueryBuilder whereDateOfBirthGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('date_of_birth', value);
    return this;
  }
  
  /// Filter date_of_birth less than
  ProfilesModelQueryBuilder whereDateOfBirthLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('date_of_birth', value);
    return this;
  }
  
  /// Filter date_of_birth less than or equal
  ProfilesModelQueryBuilder whereDateOfBirthLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('date_of_birth', value);
    return this;
  }
  
  /// Filter date_of_birth between two values
  ProfilesModelQueryBuilder whereDateOfBirthBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('date_of_birth', min).lte('date_of_birth', max);
    return this;
  }

  /// Filter by gender
  ProfilesModelQueryBuilder whereGender(String? value) {
    _queryBuilder = _queryBuilder.eq('gender', value);
    return this;
  }
  
  /// Filter by gender with multiple values (IN operator)
  ProfilesModelQueryBuilder whereGenderIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('gender', values);
    return this;
  }
  
  

  /// Filter by bio
  ProfilesModelQueryBuilder whereBio(String? value) {
    _queryBuilder = _queryBuilder.eq('bio', value);
    return this;
  }
  
  /// Filter by bio with multiple values (IN operator)
  ProfilesModelQueryBuilder whereBioIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('bio', values);
    return this;
  }
  
  

  /// Filter by is_verified
  ProfilesModelQueryBuilder whereIsVerified(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_verified', value);
    return this;
  }
  
  /// Filter by is_verified with multiple values (IN operator)
  ProfilesModelQueryBuilder whereIsVerifiedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_verified', values);
    return this;
  }
  
  

  /// Filter by verification_status
  ProfilesModelQueryBuilder whereVerificationStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('verification_status', value);
    return this;
  }
  
  /// Filter by verification_status with multiple values (IN operator)
  ProfilesModelQueryBuilder whereVerificationStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_status', values);
    return this;
  }
  
  

  /// Filter by driver_rating
  ProfilesModelQueryBuilder whereDriverRating(double? value) {
    _queryBuilder = _queryBuilder.eq('driver_rating', value);
    return this;
  }
  
  /// Filter by driver_rating with multiple values (IN operator)
  ProfilesModelQueryBuilder whereDriverRatingIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('driver_rating', values);
    return this;
  }
  
    /// Filter driver_rating greater than
  ProfilesModelQueryBuilder whereDriverRatingGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('driver_rating', value);
    return this;
  }
  
  /// Filter driver_rating greater than or equal
  ProfilesModelQueryBuilder whereDriverRatingGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('driver_rating', value);
    return this;
  }
  
  /// Filter driver_rating less than
  ProfilesModelQueryBuilder whereDriverRatingLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('driver_rating', value);
    return this;
  }
  
  /// Filter driver_rating less than or equal
  ProfilesModelQueryBuilder whereDriverRatingLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('driver_rating', value);
    return this;
  }
  
  /// Filter driver_rating between two values
  ProfilesModelQueryBuilder whereDriverRatingBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('driver_rating', min).lte('driver_rating', max);
    return this;
  }

  /// Filter by passenger_rating
  ProfilesModelQueryBuilder wherePassengerRating(double? value) {
    _queryBuilder = _queryBuilder.eq('passenger_rating', value);
    return this;
  }
  
  /// Filter by passenger_rating with multiple values (IN operator)
  ProfilesModelQueryBuilder wherePassengerRatingIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('passenger_rating', values);
    return this;
  }
  
    /// Filter passenger_rating greater than
  ProfilesModelQueryBuilder wherePassengerRatingGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('passenger_rating', value);
    return this;
  }
  
  /// Filter passenger_rating greater than or equal
  ProfilesModelQueryBuilder wherePassengerRatingGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('passenger_rating', value);
    return this;
  }
  
  /// Filter passenger_rating less than
  ProfilesModelQueryBuilder wherePassengerRatingLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('passenger_rating', value);
    return this;
  }
  
  /// Filter passenger_rating less than or equal
  ProfilesModelQueryBuilder wherePassengerRatingLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('passenger_rating', value);
    return this;
  }
  
  /// Filter passenger_rating between two values
  ProfilesModelQueryBuilder wherePassengerRatingBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('passenger_rating', min).lte('passenger_rating', max);
    return this;
  }

  /// Filter by total_trips_as_driver
  ProfilesModelQueryBuilder whereTotalTripsAsDriver(int? value) {
    _queryBuilder = _queryBuilder.eq('total_trips_as_driver', value);
    return this;
  }
  
  /// Filter by total_trips_as_driver with multiple values (IN operator)
  ProfilesModelQueryBuilder whereTotalTripsAsDriverIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_trips_as_driver', values);
    return this;
  }
  
    /// Filter total_trips_as_driver greater than
  ProfilesModelQueryBuilder whereTotalTripsAsDriverGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('total_trips_as_driver', value);
    return this;
  }
  
  /// Filter total_trips_as_driver greater than or equal
  ProfilesModelQueryBuilder whereTotalTripsAsDriverGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('total_trips_as_driver', value);
    return this;
  }
  
  /// Filter total_trips_as_driver less than
  ProfilesModelQueryBuilder whereTotalTripsAsDriverLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('total_trips_as_driver', value);
    return this;
  }
  
  /// Filter total_trips_as_driver less than or equal
  ProfilesModelQueryBuilder whereTotalTripsAsDriverLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('total_trips_as_driver', value);
    return this;
  }
  
  /// Filter total_trips_as_driver between two values
  ProfilesModelQueryBuilder whereTotalTripsAsDriverBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('total_trips_as_driver', min).lte('total_trips_as_driver', max);
    return this;
  }

  /// Filter by total_trips_as_passenger
  ProfilesModelQueryBuilder whereTotalTripsAsPassenger(int? value) {
    _queryBuilder = _queryBuilder.eq('total_trips_as_passenger', value);
    return this;
  }
  
  /// Filter by total_trips_as_passenger with multiple values (IN operator)
  ProfilesModelQueryBuilder whereTotalTripsAsPassengerIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_trips_as_passenger', values);
    return this;
  }
  
    /// Filter total_trips_as_passenger greater than
  ProfilesModelQueryBuilder whereTotalTripsAsPassengerGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('total_trips_as_passenger', value);
    return this;
  }
  
  /// Filter total_trips_as_passenger greater than or equal
  ProfilesModelQueryBuilder whereTotalTripsAsPassengerGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('total_trips_as_passenger', value);
    return this;
  }
  
  /// Filter total_trips_as_passenger less than
  ProfilesModelQueryBuilder whereTotalTripsAsPassengerLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('total_trips_as_passenger', value);
    return this;
  }
  
  /// Filter total_trips_as_passenger less than or equal
  ProfilesModelQueryBuilder whereTotalTripsAsPassengerLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('total_trips_as_passenger', value);
    return this;
  }
  
  /// Filter total_trips_as_passenger between two values
  ProfilesModelQueryBuilder whereTotalTripsAsPassengerBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('total_trips_as_passenger', min).lte('total_trips_as_passenger', max);
    return this;
  }

  /// Filter by preferred_language
  ProfilesModelQueryBuilder wherePreferredLanguage(String? value) {
    _queryBuilder = _queryBuilder.eq('preferred_language', value);
    return this;
  }
  
  /// Filter by preferred_language with multiple values (IN operator)
  ProfilesModelQueryBuilder wherePreferredLanguageIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('preferred_language', values);
    return this;
  }
  
  

  /// Filter by emergency_contact_name
  ProfilesModelQueryBuilder whereEmergencyContactName(String? value) {
    _queryBuilder = _queryBuilder.eq('emergency_contact_name', value);
    return this;
  }
  
  /// Filter by emergency_contact_name with multiple values (IN operator)
  ProfilesModelQueryBuilder whereEmergencyContactNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('emergency_contact_name', values);
    return this;
  }
  
  

  /// Filter by emergency_contact_phone
  ProfilesModelQueryBuilder whereEmergencyContactPhone(String? value) {
    _queryBuilder = _queryBuilder.eq('emergency_contact_phone', value);
    return this;
  }
  
  /// Filter by emergency_contact_phone with multiple values (IN operator)
  ProfilesModelQueryBuilder whereEmergencyContactPhoneIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('emergency_contact_phone', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfilesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfilesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfilesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfilesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfilesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfilesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfilesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfilesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfilesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfilesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfilesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfilesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfilesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfilesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by last_active_at
  ProfilesModelQueryBuilder whereLastActiveAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('last_active_at', value);
    return this;
  }
  
  /// Filter by last_active_at with multiple values (IN operator)
  ProfilesModelQueryBuilder whereLastActiveAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('last_active_at', values);
    return this;
  }
  
    /// Filter last_active_at greater than
  ProfilesModelQueryBuilder whereLastActiveAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('last_active_at', value);
    return this;
  }
  
  /// Filter last_active_at greater than or equal
  ProfilesModelQueryBuilder whereLastActiveAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('last_active_at', value);
    return this;
  }
  
  /// Filter last_active_at less than
  ProfilesModelQueryBuilder whereLastActiveAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('last_active_at', value);
    return this;
  }
  
  /// Filter last_active_at less than or equal
  ProfilesModelQueryBuilder whereLastActiveAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('last_active_at', value);
    return this;
  }
  
  /// Filter last_active_at between two values
  ProfilesModelQueryBuilder whereLastActiveAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('last_active_at', min).lte('last_active_at', max);
    return this;
  }

  /// Filter by is_banned
  ProfilesModelQueryBuilder whereIsBanned(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_banned', value);
    return this;
  }
  
  /// Filter by is_banned with multiple values (IN operator)
  ProfilesModelQueryBuilder whereIsBannedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_banned', values);
    return this;
  }
  
  

  /// Filter by ban_reason
  ProfilesModelQueryBuilder whereBanReason(String? value) {
    _queryBuilder = _queryBuilder.eq('ban_reason', value);
    return this;
  }
  
  /// Filter by ban_reason with multiple values (IN operator)
  ProfilesModelQueryBuilder whereBanReasonIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('ban_reason', values);
    return this;
  }
  
  
  
  /// Order by id in ascending order
  ProfilesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  ProfilesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by email in ascending order
  ProfilesModelQueryBuilder orderByEmailAsc() {
    _queryBuilder = _queryBuilder.order('email', ascending: true);
    return this;
  }
  
  /// Order by email in descending order
  ProfilesModelQueryBuilder orderByEmailDesc() {
    _queryBuilder = _queryBuilder.order('email', ascending: false);
    return this;
  }

  /// Order by phone in ascending order
  ProfilesModelQueryBuilder orderByPhoneAsc() {
    _queryBuilder = _queryBuilder.order('phone', ascending: true);
    return this;
  }
  
  /// Order by phone in descending order
  ProfilesModelQueryBuilder orderByPhoneDesc() {
    _queryBuilder = _queryBuilder.order('phone', ascending: false);
    return this;
  }

  /// Order by full_name in ascending order
  ProfilesModelQueryBuilder orderByFullNameAsc() {
    _queryBuilder = _queryBuilder.order('full_name', ascending: true);
    return this;
  }
  
  /// Order by full_name in descending order
  ProfilesModelQueryBuilder orderByFullNameDesc() {
    _queryBuilder = _queryBuilder.order('full_name', ascending: false);
    return this;
  }

  /// Order by avatar_url in ascending order
  ProfilesModelQueryBuilder orderByAvatarUrlAsc() {
    _queryBuilder = _queryBuilder.order('avatar_url', ascending: true);
    return this;
  }
  
  /// Order by avatar_url in descending order
  ProfilesModelQueryBuilder orderByAvatarUrlDesc() {
    _queryBuilder = _queryBuilder.order('avatar_url', ascending: false);
    return this;
  }

  /// Order by date_of_birth in ascending order
  ProfilesModelQueryBuilder orderByDateOfBirthAsc() {
    _queryBuilder = _queryBuilder.order('date_of_birth', ascending: true);
    return this;
  }
  
  /// Order by date_of_birth in descending order
  ProfilesModelQueryBuilder orderByDateOfBirthDesc() {
    _queryBuilder = _queryBuilder.order('date_of_birth', ascending: false);
    return this;
  }

  /// Order by gender in ascending order
  ProfilesModelQueryBuilder orderByGenderAsc() {
    _queryBuilder = _queryBuilder.order('gender', ascending: true);
    return this;
  }
  
  /// Order by gender in descending order
  ProfilesModelQueryBuilder orderByGenderDesc() {
    _queryBuilder = _queryBuilder.order('gender', ascending: false);
    return this;
  }

  /// Order by bio in ascending order
  ProfilesModelQueryBuilder orderByBioAsc() {
    _queryBuilder = _queryBuilder.order('bio', ascending: true);
    return this;
  }
  
  /// Order by bio in descending order
  ProfilesModelQueryBuilder orderByBioDesc() {
    _queryBuilder = _queryBuilder.order('bio', ascending: false);
    return this;
  }

  /// Order by is_verified in ascending order
  ProfilesModelQueryBuilder orderByIsVerifiedAsc() {
    _queryBuilder = _queryBuilder.order('is_verified', ascending: true);
    return this;
  }
  
  /// Order by is_verified in descending order
  ProfilesModelQueryBuilder orderByIsVerifiedDesc() {
    _queryBuilder = _queryBuilder.order('is_verified', ascending: false);
    return this;
  }

  /// Order by verification_status in ascending order
  ProfilesModelQueryBuilder orderByVerificationStatusAsc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: true);
    return this;
  }
  
  /// Order by verification_status in descending order
  ProfilesModelQueryBuilder orderByVerificationStatusDesc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: false);
    return this;
  }

  /// Order by driver_rating in ascending order
  ProfilesModelQueryBuilder orderByDriverRatingAsc() {
    _queryBuilder = _queryBuilder.order('driver_rating', ascending: true);
    return this;
  }
  
  /// Order by driver_rating in descending order
  ProfilesModelQueryBuilder orderByDriverRatingDesc() {
    _queryBuilder = _queryBuilder.order('driver_rating', ascending: false);
    return this;
  }

  /// Order by passenger_rating in ascending order
  ProfilesModelQueryBuilder orderByPassengerRatingAsc() {
    _queryBuilder = _queryBuilder.order('passenger_rating', ascending: true);
    return this;
  }
  
  /// Order by passenger_rating in descending order
  ProfilesModelQueryBuilder orderByPassengerRatingDesc() {
    _queryBuilder = _queryBuilder.order('passenger_rating', ascending: false);
    return this;
  }

  /// Order by total_trips_as_driver in ascending order
  ProfilesModelQueryBuilder orderByTotalTripsAsDriverAsc() {
    _queryBuilder = _queryBuilder.order('total_trips_as_driver', ascending: true);
    return this;
  }
  
  /// Order by total_trips_as_driver in descending order
  ProfilesModelQueryBuilder orderByTotalTripsAsDriverDesc() {
    _queryBuilder = _queryBuilder.order('total_trips_as_driver', ascending: false);
    return this;
  }

  /// Order by total_trips_as_passenger in ascending order
  ProfilesModelQueryBuilder orderByTotalTripsAsPassengerAsc() {
    _queryBuilder = _queryBuilder.order('total_trips_as_passenger', ascending: true);
    return this;
  }
  
  /// Order by total_trips_as_passenger in descending order
  ProfilesModelQueryBuilder orderByTotalTripsAsPassengerDesc() {
    _queryBuilder = _queryBuilder.order('total_trips_as_passenger', ascending: false);
    return this;
  }

  /// Order by preferred_language in ascending order
  ProfilesModelQueryBuilder orderByPreferredLanguageAsc() {
    _queryBuilder = _queryBuilder.order('preferred_language', ascending: true);
    return this;
  }
  
  /// Order by preferred_language in descending order
  ProfilesModelQueryBuilder orderByPreferredLanguageDesc() {
    _queryBuilder = _queryBuilder.order('preferred_language', ascending: false);
    return this;
  }

  /// Order by emergency_contact_name in ascending order
  ProfilesModelQueryBuilder orderByEmergencyContactNameAsc() {
    _queryBuilder = _queryBuilder.order('emergency_contact_name', ascending: true);
    return this;
  }
  
  /// Order by emergency_contact_name in descending order
  ProfilesModelQueryBuilder orderByEmergencyContactNameDesc() {
    _queryBuilder = _queryBuilder.order('emergency_contact_name', ascending: false);
    return this;
  }

  /// Order by emergency_contact_phone in ascending order
  ProfilesModelQueryBuilder orderByEmergencyContactPhoneAsc() {
    _queryBuilder = _queryBuilder.order('emergency_contact_phone', ascending: true);
    return this;
  }
  
  /// Order by emergency_contact_phone in descending order
  ProfilesModelQueryBuilder orderByEmergencyContactPhoneDesc() {
    _queryBuilder = _queryBuilder.order('emergency_contact_phone', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfilesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfilesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfilesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfilesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by last_active_at in ascending order
  ProfilesModelQueryBuilder orderByLastActiveAtAsc() {
    _queryBuilder = _queryBuilder.order('last_active_at', ascending: true);
    return this;
  }
  
  /// Order by last_active_at in descending order
  ProfilesModelQueryBuilder orderByLastActiveAtDesc() {
    _queryBuilder = _queryBuilder.order('last_active_at', ascending: false);
    return this;
  }

  /// Order by is_banned in ascending order
  ProfilesModelQueryBuilder orderByIsBannedAsc() {
    _queryBuilder = _queryBuilder.order('is_banned', ascending: true);
    return this;
  }
  
  /// Order by is_banned in descending order
  ProfilesModelQueryBuilder orderByIsBannedDesc() {
    _queryBuilder = _queryBuilder.order('is_banned', ascending: false);
    return this;
  }

  /// Order by ban_reason in ascending order
  ProfilesModelQueryBuilder orderByBanReasonAsc() {
    _queryBuilder = _queryBuilder.order('ban_reason', ascending: true);
    return this;
  }
  
  /// Order by ban_reason in descending order
  ProfilesModelQueryBuilder orderByBanReasonDesc() {
    _queryBuilder = _queryBuilder.order('ban_reason', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfilesModel
  Future<List<ProfilesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfilesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfilesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfilesModel.fromJson(response.first as Map<String, dynamic>);
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
