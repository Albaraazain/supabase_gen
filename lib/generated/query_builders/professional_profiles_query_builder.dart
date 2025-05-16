import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/professional_profiles_model.dart';

/// A type-safe query builder for ProfessionalProfilesModel
class ProfessionalProfilesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  ProfessionalProfilesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('professional_profiles').select();
  }
  
  /// Set the fields to select
  ProfessionalProfilesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('professional_profiles').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  ProfessionalProfilesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  ProfessionalProfilesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by professional_id
  ProfessionalProfilesModelQueryBuilder whereProfessionalId(String value) {
    _queryBuilder = _queryBuilder.eq('professional_id', value);
    return this;
  }
  
  /// Filter by professional_id with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereProfessionalIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('professional_id', values);
    return this;
  }
  
  

  /// Filter by bio
  ProfessionalProfilesModelQueryBuilder whereBio(String? value) {
    _queryBuilder = _queryBuilder.eq('bio', value);
    return this;
  }
  
  /// Filter by bio with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereBioIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('bio', values);
    return this;
  }
  
  

  /// Filter by business_name
  ProfessionalProfilesModelQueryBuilder whereBusinessName(String? value) {
    _queryBuilder = _queryBuilder.eq('business_name', value);
    return this;
  }
  
  /// Filter by business_name with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereBusinessNameIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('business_name', values);
    return this;
  }
  
  

  /// Filter by license_number
  ProfessionalProfilesModelQueryBuilder whereLicenseNumber(String? value) {
    _queryBuilder = _queryBuilder.eq('license_number', value);
    return this;
  }
  
  /// Filter by license_number with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereLicenseNumberIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('license_number', values);
    return this;
  }
  
  

  /// Filter by license_type
  ProfessionalProfilesModelQueryBuilder whereLicenseType(String? value) {
    _queryBuilder = _queryBuilder.eq('license_type', value);
    return this;
  }
  
  /// Filter by license_type with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereLicenseTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('license_type', values);
    return this;
  }
  
  

  /// Filter by license_verified
  ProfessionalProfilesModelQueryBuilder whereLicenseVerified(bool? value) {
    _queryBuilder = _queryBuilder.eq('license_verified', value);
    return this;
  }
  
  /// Filter by license_verified with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereLicenseVerifiedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('license_verified', values);
    return this;
  }
  
  

  /// Filter by verification_status
  ProfessionalProfilesModelQueryBuilder whereVerificationStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('verification_status', value);
    return this;
  }
  
  /// Filter by verification_status with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereVerificationStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_status', values);
    return this;
  }
  
  

  /// Filter by verified_at
  ProfessionalProfilesModelQueryBuilder whereVerifiedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('verified_at', value);
    return this;
  }
  
  /// Filter by verified_at with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereVerifiedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verified_at', values);
    return this;
  }
  
    /// Filter verified_at greater than
  ProfessionalProfilesModelQueryBuilder whereVerifiedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at greater than or equal
  ProfessionalProfilesModelQueryBuilder whereVerifiedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than
  ProfessionalProfilesModelQueryBuilder whereVerifiedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('verified_at', value);
    return this;
  }
  
  /// Filter verified_at less than or equal
  ProfessionalProfilesModelQueryBuilder whereVerifiedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('verified_at', value);
    return this;
  }
  
  /// Filter verified_at between two values
  ProfessionalProfilesModelQueryBuilder whereVerifiedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('verified_at', min).lte('verified_at', max);
    return this;
  }

  /// Filter by years_experience
  ProfessionalProfilesModelQueryBuilder whereYearsExperience(int? value) {
    _queryBuilder = _queryBuilder.eq('years_experience', value);
    return this;
  }
  
  /// Filter by years_experience with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereYearsExperienceIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('years_experience', values);
    return this;
  }
  
    /// Filter years_experience greater than
  ProfessionalProfilesModelQueryBuilder whereYearsExperienceGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('years_experience', value);
    return this;
  }
  
  /// Filter years_experience greater than or equal
  ProfessionalProfilesModelQueryBuilder whereYearsExperienceGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('years_experience', value);
    return this;
  }
  
  /// Filter years_experience less than
  ProfessionalProfilesModelQueryBuilder whereYearsExperienceLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('years_experience', value);
    return this;
  }
  
  /// Filter years_experience less than or equal
  ProfessionalProfilesModelQueryBuilder whereYearsExperienceLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('years_experience', value);
    return this;
  }
  
  /// Filter years_experience between two values
  ProfessionalProfilesModelQueryBuilder whereYearsExperienceBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('years_experience', min).lte('years_experience', max);
    return this;
  }

  /// Filter by experience_years
  ProfessionalProfilesModelQueryBuilder whereExperienceYears(int? value) {
    _queryBuilder = _queryBuilder.eq('experience_years', value);
    return this;
  }
  
  /// Filter by experience_years with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereExperienceYearsIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('experience_years', values);
    return this;
  }
  
    /// Filter experience_years greater than
  ProfessionalProfilesModelQueryBuilder whereExperienceYearsGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('experience_years', value);
    return this;
  }
  
  /// Filter experience_years greater than or equal
  ProfessionalProfilesModelQueryBuilder whereExperienceYearsGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('experience_years', value);
    return this;
  }
  
  /// Filter experience_years less than
  ProfessionalProfilesModelQueryBuilder whereExperienceYearsLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('experience_years', value);
    return this;
  }
  
  /// Filter experience_years less than or equal
  ProfessionalProfilesModelQueryBuilder whereExperienceYearsLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('experience_years', value);
    return this;
  }
  
  /// Filter experience_years between two values
  ProfessionalProfilesModelQueryBuilder whereExperienceYearsBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('experience_years', min).lte('experience_years', max);
    return this;
  }

  /// Filter by radius_miles
  ProfessionalProfilesModelQueryBuilder whereRadiusMiles(int? value) {
    _queryBuilder = _queryBuilder.eq('radius_miles', value);
    return this;
  }
  
  /// Filter by radius_miles with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereRadiusMilesIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('radius_miles', values);
    return this;
  }
  
    /// Filter radius_miles greater than
  ProfessionalProfilesModelQueryBuilder whereRadiusMilesGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('radius_miles', value);
    return this;
  }
  
  /// Filter radius_miles greater than or equal
  ProfessionalProfilesModelQueryBuilder whereRadiusMilesGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('radius_miles', value);
    return this;
  }
  
  /// Filter radius_miles less than
  ProfessionalProfilesModelQueryBuilder whereRadiusMilesLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('radius_miles', value);
    return this;
  }
  
  /// Filter radius_miles less than or equal
  ProfessionalProfilesModelQueryBuilder whereRadiusMilesLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('radius_miles', value);
    return this;
  }
  
  /// Filter radius_miles between two values
  ProfessionalProfilesModelQueryBuilder whereRadiusMilesBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('radius_miles', min).lte('radius_miles', max);
    return this;
  }

  /// Filter by service_radius
  ProfessionalProfilesModelQueryBuilder whereServiceRadius(int? value) {
    _queryBuilder = _queryBuilder.eq('service_radius', value);
    return this;
  }
  
  /// Filter by service_radius with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereServiceRadiusIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_radius', values);
    return this;
  }
  
    /// Filter service_radius greater than
  ProfessionalProfilesModelQueryBuilder whereServiceRadiusGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('service_radius', value);
    return this;
  }
  
  /// Filter service_radius greater than or equal
  ProfessionalProfilesModelQueryBuilder whereServiceRadiusGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('service_radius', value);
    return this;
  }
  
  /// Filter service_radius less than
  ProfessionalProfilesModelQueryBuilder whereServiceRadiusLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('service_radius', value);
    return this;
  }
  
  /// Filter service_radius less than or equal
  ProfessionalProfilesModelQueryBuilder whereServiceRadiusLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('service_radius', value);
    return this;
  }
  
  /// Filter service_radius between two values
  ProfessionalProfilesModelQueryBuilder whereServiceRadiusBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('service_radius', min).lte('service_radius', max);
    return this;
  }

  /// Filter by availability
  ProfessionalProfilesModelQueryBuilder whereAvailability(String? value) {
    _queryBuilder = _queryBuilder.eq('availability', value);
    return this;
  }
  
  /// Filter by availability with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereAvailabilityIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('availability', values);
    return this;
  }
  
  

  /// Filter by availability_status
  ProfessionalProfilesModelQueryBuilder whereAvailabilityStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('availability_status', value);
    return this;
  }
  
  /// Filter by availability_status with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereAvailabilityStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('availability_status', values);
    return this;
  }
  
  

  /// Filter by base_location_lat
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLat(double? value) {
    _queryBuilder = _queryBuilder.eq('base_location_lat', value);
    return this;
  }
  
  /// Filter by base_location_lat with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('base_location_lat', values);
    return this;
  }
  
    /// Filter base_location_lat greater than
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('base_location_lat', value);
    return this;
  }
  
  /// Filter base_location_lat greater than or equal
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('base_location_lat', value);
    return this;
  }
  
  /// Filter base_location_lat less than
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('base_location_lat', value);
    return this;
  }
  
  /// Filter base_location_lat less than or equal
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('base_location_lat', value);
    return this;
  }
  
  /// Filter base_location_lat between two values
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('base_location_lat', min).lte('base_location_lat', max);
    return this;
  }

  /// Filter by base_location_lng
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLng(double? value) {
    _queryBuilder = _queryBuilder.eq('base_location_lng', value);
    return this;
  }
  
  /// Filter by base_location_lng with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('base_location_lng', values);
    return this;
  }
  
    /// Filter base_location_lng greater than
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('base_location_lng', value);
    return this;
  }
  
  /// Filter base_location_lng greater than or equal
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('base_location_lng', value);
    return this;
  }
  
  /// Filter base_location_lng less than
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('base_location_lng', value);
    return this;
  }
  
  /// Filter base_location_lng less than or equal
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('base_location_lng', value);
    return this;
  }
  
  /// Filter base_location_lng between two values
  ProfessionalProfilesModelQueryBuilder whereBaseLocationLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('base_location_lng', min).lte('base_location_lng', max);
    return this;
  }

  /// Filter by current_location_lat
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLat(double? value) {
    _queryBuilder = _queryBuilder.eq('current_location_lat', value);
    return this;
  }
  
  /// Filter by current_location_lat with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_location_lat', values);
    return this;
  }
  
    /// Filter current_location_lat greater than
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat greater than or equal
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat less than
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat less than or equal
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('current_location_lat', value);
    return this;
  }
  
  /// Filter current_location_lat between two values
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('current_location_lat', min).lte('current_location_lat', max);
    return this;
  }

  /// Filter by current_location_lng
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLng(double? value) {
    _queryBuilder = _queryBuilder.eq('current_location_lng', value);
    return this;
  }
  
  /// Filter by current_location_lng with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('current_location_lng', values);
    return this;
  }
  
    /// Filter current_location_lng greater than
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng greater than or equal
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng less than
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng less than or equal
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('current_location_lng', value);
    return this;
  }
  
  /// Filter current_location_lng between two values
  ProfessionalProfilesModelQueryBuilder whereCurrentLocationLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('current_location_lng', min).lte('current_location_lng', max);
    return this;
  }

  /// Filter by rating
  ProfessionalProfilesModelQueryBuilder whereRating(double? value) {
    _queryBuilder = _queryBuilder.eq('rating', value);
    return this;
  }
  
  /// Filter by rating with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereRatingIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('rating', values);
    return this;
  }
  
    /// Filter rating greater than
  ProfessionalProfilesModelQueryBuilder whereRatingGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('rating', value);
    return this;
  }
  
  /// Filter rating greater than or equal
  ProfessionalProfilesModelQueryBuilder whereRatingGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('rating', value);
    return this;
  }
  
  /// Filter rating less than
  ProfessionalProfilesModelQueryBuilder whereRatingLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('rating', value);
    return this;
  }
  
  /// Filter rating less than or equal
  ProfessionalProfilesModelQueryBuilder whereRatingLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('rating', value);
    return this;
  }
  
  /// Filter rating between two values
  ProfessionalProfilesModelQueryBuilder whereRatingBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('rating', min).lte('rating', max);
    return this;
  }

  /// Filter by total_ratings
  ProfessionalProfilesModelQueryBuilder whereTotalRatings(int? value) {
    _queryBuilder = _queryBuilder.eq('total_ratings', value);
    return this;
  }
  
  /// Filter by total_ratings with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereTotalRatingsIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_ratings', values);
    return this;
  }
  
    /// Filter total_ratings greater than
  ProfessionalProfilesModelQueryBuilder whereTotalRatingsGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('total_ratings', value);
    return this;
  }
  
  /// Filter total_ratings greater than or equal
  ProfessionalProfilesModelQueryBuilder whereTotalRatingsGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('total_ratings', value);
    return this;
  }
  
  /// Filter total_ratings less than
  ProfessionalProfilesModelQueryBuilder whereTotalRatingsLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('total_ratings', value);
    return this;
  }
  
  /// Filter total_ratings less than or equal
  ProfessionalProfilesModelQueryBuilder whereTotalRatingsLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('total_ratings', value);
    return this;
  }
  
  /// Filter total_ratings between two values
  ProfessionalProfilesModelQueryBuilder whereTotalRatingsBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('total_ratings', min).lte('total_ratings', max);
    return this;
  }

  /// Filter by total_jobs_completed
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompleted(int? value) {
    _queryBuilder = _queryBuilder.eq('total_jobs_completed', value);
    return this;
  }
  
  /// Filter by total_jobs_completed with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompletedIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_jobs_completed', values);
    return this;
  }
  
    /// Filter total_jobs_completed greater than
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompletedGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('total_jobs_completed', value);
    return this;
  }
  
  /// Filter total_jobs_completed greater than or equal
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompletedGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('total_jobs_completed', value);
    return this;
  }
  
  /// Filter total_jobs_completed less than
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompletedLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('total_jobs_completed', value);
    return this;
  }
  
  /// Filter total_jobs_completed less than or equal
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompletedLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('total_jobs_completed', value);
    return this;
  }
  
  /// Filter total_jobs_completed between two values
  ProfessionalProfilesModelQueryBuilder whereTotalJobsCompletedBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('total_jobs_completed', min).lte('total_jobs_completed', max);
    return this;
  }

  /// Filter by acceptance_rate
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRate(double? value) {
    _queryBuilder = _queryBuilder.eq('acceptance_rate', value);
    return this;
  }
  
  /// Filter by acceptance_rate with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRateIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('acceptance_rate', values);
    return this;
  }
  
    /// Filter acceptance_rate greater than
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRateGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('acceptance_rate', value);
    return this;
  }
  
  /// Filter acceptance_rate greater than or equal
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRateGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('acceptance_rate', value);
    return this;
  }
  
  /// Filter acceptance_rate less than
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRateLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('acceptance_rate', value);
    return this;
  }
  
  /// Filter acceptance_rate less than or equal
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRateLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('acceptance_rate', value);
    return this;
  }
  
  /// Filter acceptance_rate between two values
  ProfessionalProfilesModelQueryBuilder whereAcceptanceRateBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('acceptance_rate', min).lte('acceptance_rate', max);
    return this;
  }

  /// Filter by active_status
  ProfessionalProfilesModelQueryBuilder whereActiveStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('active_status', value);
    return this;
  }
  
  /// Filter by active_status with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereActiveStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('active_status', values);
    return this;
  }
  
  

  /// Filter by created_at
  ProfessionalProfilesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  ProfessionalProfilesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  ProfessionalProfilesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  ProfessionalProfilesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  ProfessionalProfilesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  ProfessionalProfilesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  ProfessionalProfilesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  ProfessionalProfilesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  ProfessionalProfilesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  ProfessionalProfilesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  ProfessionalProfilesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  ProfessionalProfilesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by is_online
  ProfessionalProfilesModelQueryBuilder whereIsOnline(bool value) {
    _queryBuilder = _queryBuilder.eq('is_online', value);
    return this;
  }
  
  /// Filter by is_online with multiple values (IN operator)
  ProfessionalProfilesModelQueryBuilder whereIsOnlineIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_online', values);
    return this;
  }
  
  
  
  /// Order by professional_id in ascending order
  ProfessionalProfilesModelQueryBuilder orderByProfessionalIdAsc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: true);
    return this;
  }
  
  /// Order by professional_id in descending order
  ProfessionalProfilesModelQueryBuilder orderByProfessionalIdDesc() {
    _queryBuilder = _queryBuilder.order('professional_id', ascending: false);
    return this;
  }

  /// Order by bio in ascending order
  ProfessionalProfilesModelQueryBuilder orderByBioAsc() {
    _queryBuilder = _queryBuilder.order('bio', ascending: true);
    return this;
  }
  
  /// Order by bio in descending order
  ProfessionalProfilesModelQueryBuilder orderByBioDesc() {
    _queryBuilder = _queryBuilder.order('bio', ascending: false);
    return this;
  }

  /// Order by business_name in ascending order
  ProfessionalProfilesModelQueryBuilder orderByBusinessNameAsc() {
    _queryBuilder = _queryBuilder.order('business_name', ascending: true);
    return this;
  }
  
  /// Order by business_name in descending order
  ProfessionalProfilesModelQueryBuilder orderByBusinessNameDesc() {
    _queryBuilder = _queryBuilder.order('business_name', ascending: false);
    return this;
  }

  /// Order by license_number in ascending order
  ProfessionalProfilesModelQueryBuilder orderByLicenseNumberAsc() {
    _queryBuilder = _queryBuilder.order('license_number', ascending: true);
    return this;
  }
  
  /// Order by license_number in descending order
  ProfessionalProfilesModelQueryBuilder orderByLicenseNumberDesc() {
    _queryBuilder = _queryBuilder.order('license_number', ascending: false);
    return this;
  }

  /// Order by license_type in ascending order
  ProfessionalProfilesModelQueryBuilder orderByLicenseTypeAsc() {
    _queryBuilder = _queryBuilder.order('license_type', ascending: true);
    return this;
  }
  
  /// Order by license_type in descending order
  ProfessionalProfilesModelQueryBuilder orderByLicenseTypeDesc() {
    _queryBuilder = _queryBuilder.order('license_type', ascending: false);
    return this;
  }

  /// Order by license_verified in ascending order
  ProfessionalProfilesModelQueryBuilder orderByLicenseVerifiedAsc() {
    _queryBuilder = _queryBuilder.order('license_verified', ascending: true);
    return this;
  }
  
  /// Order by license_verified in descending order
  ProfessionalProfilesModelQueryBuilder orderByLicenseVerifiedDesc() {
    _queryBuilder = _queryBuilder.order('license_verified', ascending: false);
    return this;
  }

  /// Order by verification_status in ascending order
  ProfessionalProfilesModelQueryBuilder orderByVerificationStatusAsc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: true);
    return this;
  }
  
  /// Order by verification_status in descending order
  ProfessionalProfilesModelQueryBuilder orderByVerificationStatusDesc() {
    _queryBuilder = _queryBuilder.order('verification_status', ascending: false);
    return this;
  }

  /// Order by verified_at in ascending order
  ProfessionalProfilesModelQueryBuilder orderByVerifiedAtAsc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: true);
    return this;
  }
  
  /// Order by verified_at in descending order
  ProfessionalProfilesModelQueryBuilder orderByVerifiedAtDesc() {
    _queryBuilder = _queryBuilder.order('verified_at', ascending: false);
    return this;
  }

  /// Order by years_experience in ascending order
  ProfessionalProfilesModelQueryBuilder orderByYearsExperienceAsc() {
    _queryBuilder = _queryBuilder.order('years_experience', ascending: true);
    return this;
  }
  
  /// Order by years_experience in descending order
  ProfessionalProfilesModelQueryBuilder orderByYearsExperienceDesc() {
    _queryBuilder = _queryBuilder.order('years_experience', ascending: false);
    return this;
  }

  /// Order by experience_years in ascending order
  ProfessionalProfilesModelQueryBuilder orderByExperienceYearsAsc() {
    _queryBuilder = _queryBuilder.order('experience_years', ascending: true);
    return this;
  }
  
  /// Order by experience_years in descending order
  ProfessionalProfilesModelQueryBuilder orderByExperienceYearsDesc() {
    _queryBuilder = _queryBuilder.order('experience_years', ascending: false);
    return this;
  }

  /// Order by radius_miles in ascending order
  ProfessionalProfilesModelQueryBuilder orderByRadiusMilesAsc() {
    _queryBuilder = _queryBuilder.order('radius_miles', ascending: true);
    return this;
  }
  
  /// Order by radius_miles in descending order
  ProfessionalProfilesModelQueryBuilder orderByRadiusMilesDesc() {
    _queryBuilder = _queryBuilder.order('radius_miles', ascending: false);
    return this;
  }

  /// Order by service_radius in ascending order
  ProfessionalProfilesModelQueryBuilder orderByServiceRadiusAsc() {
    _queryBuilder = _queryBuilder.order('service_radius', ascending: true);
    return this;
  }
  
  /// Order by service_radius in descending order
  ProfessionalProfilesModelQueryBuilder orderByServiceRadiusDesc() {
    _queryBuilder = _queryBuilder.order('service_radius', ascending: false);
    return this;
  }

  /// Order by availability in ascending order
  ProfessionalProfilesModelQueryBuilder orderByAvailabilityAsc() {
    _queryBuilder = _queryBuilder.order('availability', ascending: true);
    return this;
  }
  
  /// Order by availability in descending order
  ProfessionalProfilesModelQueryBuilder orderByAvailabilityDesc() {
    _queryBuilder = _queryBuilder.order('availability', ascending: false);
    return this;
  }

  /// Order by availability_status in ascending order
  ProfessionalProfilesModelQueryBuilder orderByAvailabilityStatusAsc() {
    _queryBuilder = _queryBuilder.order('availability_status', ascending: true);
    return this;
  }
  
  /// Order by availability_status in descending order
  ProfessionalProfilesModelQueryBuilder orderByAvailabilityStatusDesc() {
    _queryBuilder = _queryBuilder.order('availability_status', ascending: false);
    return this;
  }

  /// Order by base_location_lat in ascending order
  ProfessionalProfilesModelQueryBuilder orderByBaseLocationLatAsc() {
    _queryBuilder = _queryBuilder.order('base_location_lat', ascending: true);
    return this;
  }
  
  /// Order by base_location_lat in descending order
  ProfessionalProfilesModelQueryBuilder orderByBaseLocationLatDesc() {
    _queryBuilder = _queryBuilder.order('base_location_lat', ascending: false);
    return this;
  }

  /// Order by base_location_lng in ascending order
  ProfessionalProfilesModelQueryBuilder orderByBaseLocationLngAsc() {
    _queryBuilder = _queryBuilder.order('base_location_lng', ascending: true);
    return this;
  }
  
  /// Order by base_location_lng in descending order
  ProfessionalProfilesModelQueryBuilder orderByBaseLocationLngDesc() {
    _queryBuilder = _queryBuilder.order('base_location_lng', ascending: false);
    return this;
  }

  /// Order by current_location_lat in ascending order
  ProfessionalProfilesModelQueryBuilder orderByCurrentLocationLatAsc() {
    _queryBuilder = _queryBuilder.order('current_location_lat', ascending: true);
    return this;
  }
  
  /// Order by current_location_lat in descending order
  ProfessionalProfilesModelQueryBuilder orderByCurrentLocationLatDesc() {
    _queryBuilder = _queryBuilder.order('current_location_lat', ascending: false);
    return this;
  }

  /// Order by current_location_lng in ascending order
  ProfessionalProfilesModelQueryBuilder orderByCurrentLocationLngAsc() {
    _queryBuilder = _queryBuilder.order('current_location_lng', ascending: true);
    return this;
  }
  
  /// Order by current_location_lng in descending order
  ProfessionalProfilesModelQueryBuilder orderByCurrentLocationLngDesc() {
    _queryBuilder = _queryBuilder.order('current_location_lng', ascending: false);
    return this;
  }

  /// Order by rating in ascending order
  ProfessionalProfilesModelQueryBuilder orderByRatingAsc() {
    _queryBuilder = _queryBuilder.order('rating', ascending: true);
    return this;
  }
  
  /// Order by rating in descending order
  ProfessionalProfilesModelQueryBuilder orderByRatingDesc() {
    _queryBuilder = _queryBuilder.order('rating', ascending: false);
    return this;
  }

  /// Order by total_ratings in ascending order
  ProfessionalProfilesModelQueryBuilder orderByTotalRatingsAsc() {
    _queryBuilder = _queryBuilder.order('total_ratings', ascending: true);
    return this;
  }
  
  /// Order by total_ratings in descending order
  ProfessionalProfilesModelQueryBuilder orderByTotalRatingsDesc() {
    _queryBuilder = _queryBuilder.order('total_ratings', ascending: false);
    return this;
  }

  /// Order by total_jobs_completed in ascending order
  ProfessionalProfilesModelQueryBuilder orderByTotalJobsCompletedAsc() {
    _queryBuilder = _queryBuilder.order('total_jobs_completed', ascending: true);
    return this;
  }
  
  /// Order by total_jobs_completed in descending order
  ProfessionalProfilesModelQueryBuilder orderByTotalJobsCompletedDesc() {
    _queryBuilder = _queryBuilder.order('total_jobs_completed', ascending: false);
    return this;
  }

  /// Order by acceptance_rate in ascending order
  ProfessionalProfilesModelQueryBuilder orderByAcceptanceRateAsc() {
    _queryBuilder = _queryBuilder.order('acceptance_rate', ascending: true);
    return this;
  }
  
  /// Order by acceptance_rate in descending order
  ProfessionalProfilesModelQueryBuilder orderByAcceptanceRateDesc() {
    _queryBuilder = _queryBuilder.order('acceptance_rate', ascending: false);
    return this;
  }

  /// Order by active_status in ascending order
  ProfessionalProfilesModelQueryBuilder orderByActiveStatusAsc() {
    _queryBuilder = _queryBuilder.order('active_status', ascending: true);
    return this;
  }
  
  /// Order by active_status in descending order
  ProfessionalProfilesModelQueryBuilder orderByActiveStatusDesc() {
    _queryBuilder = _queryBuilder.order('active_status', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  ProfessionalProfilesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  ProfessionalProfilesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  ProfessionalProfilesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  ProfessionalProfilesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by is_online in ascending order
  ProfessionalProfilesModelQueryBuilder orderByIsOnlineAsc() {
    _queryBuilder = _queryBuilder.order('is_online', ascending: true);
    return this;
  }
  
  /// Order by is_online in descending order
  ProfessionalProfilesModelQueryBuilder orderByIsOnlineDesc() {
    _queryBuilder = _queryBuilder.order('is_online', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of ProfessionalProfilesModel
  Future<List<ProfessionalProfilesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => ProfessionalProfilesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<ProfessionalProfilesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return ProfessionalProfilesModel.fromJson(response.first as Map<String, dynamic>);
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
