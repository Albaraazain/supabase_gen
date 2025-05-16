import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/job_broadcasts_model.dart';

/// A type-safe query builder for JobBroadcastsModel
class JobBroadcastsModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  JobBroadcastsModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('job_broadcasts').select();
  }
  
  /// Set the fields to select
  JobBroadcastsModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('job_broadcasts').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  JobBroadcastsModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  JobBroadcastsModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by broadcast_id
  JobBroadcastsModelQueryBuilder whereBroadcastId(String value) {
    _queryBuilder = _queryBuilder.eq('broadcast_id', value);
    return this;
  }
  
  /// Filter by broadcast_id with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereBroadcastIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('broadcast_id', values);
    return this;
  }
  
  

  /// Filter by homeowner_id
  JobBroadcastsModelQueryBuilder whereHomeownerId(String? value) {
    _queryBuilder = _queryBuilder.eq('homeowner_id', value);
    return this;
  }
  
  /// Filter by homeowner_id with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereHomeownerIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('homeowner_id', values);
    return this;
  }
  
  

  /// Filter by service_id
  JobBroadcastsModelQueryBuilder whereServiceId(String? value) {
    _queryBuilder = _queryBuilder.eq('service_id', value);
    return this;
  }
  
  /// Filter by service_id with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereServiceIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('service_id', values);
    return this;
  }
  
  

  /// Filter by title
  JobBroadcastsModelQueryBuilder whereTitle(String value) {
    _queryBuilder = _queryBuilder.eq('title', value);
    return this;
  }
  
  /// Filter by title with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereTitleIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('title', values);
    return this;
  }
  
  

  /// Filter by description
  JobBroadcastsModelQueryBuilder whereDescription(String? value) {
    _queryBuilder = _queryBuilder.eq('description', value);
    return this;
  }
  
  /// Filter by description with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereDescriptionIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('description', values);
    return this;
  }
  
  

  /// Filter by address
  JobBroadcastsModelQueryBuilder whereAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('address', value);
    return this;
  }
  
  /// Filter by address with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('address', values);
    return this;
  }
  
  

  /// Filter by city
  JobBroadcastsModelQueryBuilder whereCity(String? value) {
    _queryBuilder = _queryBuilder.eq('city', value);
    return this;
  }
  
  /// Filter by city with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereCityIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('city', values);
    return this;
  }
  
  

  /// Filter by state
  JobBroadcastsModelQueryBuilder whereState(String? value) {
    _queryBuilder = _queryBuilder.eq('state', value);
    return this;
  }
  
  /// Filter by state with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereStateIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('state', values);
    return this;
  }
  
  

  /// Filter by zip_code
  JobBroadcastsModelQueryBuilder whereZipCode(String? value) {
    _queryBuilder = _queryBuilder.eq('zip_code', value);
    return this;
  }
  
  /// Filter by zip_code with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereZipCodeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('zip_code', values);
    return this;
  }
  
  

  /// Filter by latitude
  JobBroadcastsModelQueryBuilder whereLatitude(double? value) {
    _queryBuilder = _queryBuilder.eq('latitude', value);
    return this;
  }
  
  /// Filter by latitude with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereLatitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('latitude', values);
    return this;
  }
  
    /// Filter latitude greater than
  JobBroadcastsModelQueryBuilder whereLatitudeGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('latitude', value);
    return this;
  }
  
  /// Filter latitude greater than or equal
  JobBroadcastsModelQueryBuilder whereLatitudeGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('latitude', value);
    return this;
  }
  
  /// Filter latitude less than
  JobBroadcastsModelQueryBuilder whereLatitudeLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('latitude', value);
    return this;
  }
  
  /// Filter latitude less than or equal
  JobBroadcastsModelQueryBuilder whereLatitudeLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('latitude', value);
    return this;
  }
  
  /// Filter latitude between two values
  JobBroadcastsModelQueryBuilder whereLatitudeBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('latitude', min).lte('latitude', max);
    return this;
  }

  /// Filter by longitude
  JobBroadcastsModelQueryBuilder whereLongitude(double? value) {
    _queryBuilder = _queryBuilder.eq('longitude', value);
    return this;
  }
  
  /// Filter by longitude with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereLongitudeIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('longitude', values);
    return this;
  }
  
    /// Filter longitude greater than
  JobBroadcastsModelQueryBuilder whereLongitudeGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('longitude', value);
    return this;
  }
  
  /// Filter longitude greater than or equal
  JobBroadcastsModelQueryBuilder whereLongitudeGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('longitude', value);
    return this;
  }
  
  /// Filter longitude less than
  JobBroadcastsModelQueryBuilder whereLongitudeLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('longitude', value);
    return this;
  }
  
  /// Filter longitude less than or equal
  JobBroadcastsModelQueryBuilder whereLongitudeLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('longitude', value);
    return this;
  }
  
  /// Filter longitude between two values
  JobBroadcastsModelQueryBuilder whereLongitudeBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('longitude', min).lte('longitude', max);
    return this;
  }

  /// Filter by location_address
  JobBroadcastsModelQueryBuilder whereLocationAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('location_address', value);
    return this;
  }
  
  /// Filter by location_address with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereLocationAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('location_address', values);
    return this;
  }
  
  

  /// Filter by scheduled_time
  JobBroadcastsModelQueryBuilder whereScheduledTime(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('scheduled_time', value);
    return this;
  }
  
  /// Filter by scheduled_time with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereScheduledTimeIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('scheduled_time', values);
    return this;
  }
  
    /// Filter scheduled_time greater than
  JobBroadcastsModelQueryBuilder whereScheduledTimeGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time greater than or equal
  JobBroadcastsModelQueryBuilder whereScheduledTimeGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than
  JobBroadcastsModelQueryBuilder whereScheduledTimeLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time less than or equal
  JobBroadcastsModelQueryBuilder whereScheduledTimeLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('scheduled_time', value);
    return this;
  }
  
  /// Filter scheduled_time between two values
  JobBroadcastsModelQueryBuilder whereScheduledTimeBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('scheduled_time', min).lte('scheduled_time', max);
    return this;
  }

  /// Filter by price_range_min
  JobBroadcastsModelQueryBuilder wherePriceRangeMin(double? value) {
    _queryBuilder = _queryBuilder.eq('price_range_min', value);
    return this;
  }
  
  /// Filter by price_range_min with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder wherePriceRangeMinIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_range_min', values);
    return this;
  }
  
    /// Filter price_range_min greater than
  JobBroadcastsModelQueryBuilder wherePriceRangeMinGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price_range_min', value);
    return this;
  }
  
  /// Filter price_range_min greater than or equal
  JobBroadcastsModelQueryBuilder wherePriceRangeMinGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price_range_min', value);
    return this;
  }
  
  /// Filter price_range_min less than
  JobBroadcastsModelQueryBuilder wherePriceRangeMinLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price_range_min', value);
    return this;
  }
  
  /// Filter price_range_min less than or equal
  JobBroadcastsModelQueryBuilder wherePriceRangeMinLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price_range_min', value);
    return this;
  }
  
  /// Filter price_range_min between two values
  JobBroadcastsModelQueryBuilder wherePriceRangeMinBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price_range_min', min).lte('price_range_min', max);
    return this;
  }

  /// Filter by price_range_max
  JobBroadcastsModelQueryBuilder wherePriceRangeMax(double? value) {
    _queryBuilder = _queryBuilder.eq('price_range_max', value);
    return this;
  }
  
  /// Filter by price_range_max with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder wherePriceRangeMaxIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('price_range_max', values);
    return this;
  }
  
    /// Filter price_range_max greater than
  JobBroadcastsModelQueryBuilder wherePriceRangeMaxGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('price_range_max', value);
    return this;
  }
  
  /// Filter price_range_max greater than or equal
  JobBroadcastsModelQueryBuilder wherePriceRangeMaxGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('price_range_max', value);
    return this;
  }
  
  /// Filter price_range_max less than
  JobBroadcastsModelQueryBuilder wherePriceRangeMaxLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('price_range_max', value);
    return this;
  }
  
  /// Filter price_range_max less than or equal
  JobBroadcastsModelQueryBuilder wherePriceRangeMaxLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('price_range_max', value);
    return this;
  }
  
  /// Filter price_range_max between two values
  JobBroadcastsModelQueryBuilder wherePriceRangeMaxBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('price_range_max', min).lte('price_range_max', max);
    return this;
  }

  /// Filter by status
  JobBroadcastsModelQueryBuilder whereStatus(String? value) {
    _queryBuilder = _queryBuilder.eq('status', value);
    return this;
  }
  
  /// Filter by status with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereStatusIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('status', values);
    return this;
  }
  
  

  /// Filter by urgency_level
  JobBroadcastsModelQueryBuilder whereUrgencyLevel(String? value) {
    _queryBuilder = _queryBuilder.eq('urgency_level', value);
    return this;
  }
  
  /// Filter by urgency_level with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereUrgencyLevelIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('urgency_level', values);
    return this;
  }
  
  

  /// Filter by created_at
  JobBroadcastsModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  JobBroadcastsModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  JobBroadcastsModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  JobBroadcastsModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  JobBroadcastsModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  JobBroadcastsModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  JobBroadcastsModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  JobBroadcastsModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  JobBroadcastsModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  JobBroadcastsModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  JobBroadcastsModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  JobBroadcastsModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }

  /// Filter by expires_at
  JobBroadcastsModelQueryBuilder whereExpiresAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('expires_at', value);
    return this;
  }
  
  /// Filter by expires_at with multiple values (IN operator)
  JobBroadcastsModelQueryBuilder whereExpiresAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('expires_at', values);
    return this;
  }
  
    /// Filter expires_at greater than
  JobBroadcastsModelQueryBuilder whereExpiresAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at greater than or equal
  JobBroadcastsModelQueryBuilder whereExpiresAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than
  JobBroadcastsModelQueryBuilder whereExpiresAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('expires_at', value);
    return this;
  }
  
  /// Filter expires_at less than or equal
  JobBroadcastsModelQueryBuilder whereExpiresAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('expires_at', value);
    return this;
  }
  
  /// Filter expires_at between two values
  JobBroadcastsModelQueryBuilder whereExpiresAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('expires_at', min).lte('expires_at', max);
    return this;
  }
  
  /// Order by broadcast_id in ascending order
  JobBroadcastsModelQueryBuilder orderByBroadcastIdAsc() {
    _queryBuilder = _queryBuilder.order('broadcast_id', ascending: true);
    return this;
  }
  
  /// Order by broadcast_id in descending order
  JobBroadcastsModelQueryBuilder orderByBroadcastIdDesc() {
    _queryBuilder = _queryBuilder.order('broadcast_id', ascending: false);
    return this;
  }

  /// Order by homeowner_id in ascending order
  JobBroadcastsModelQueryBuilder orderByHomeownerIdAsc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: true);
    return this;
  }
  
  /// Order by homeowner_id in descending order
  JobBroadcastsModelQueryBuilder orderByHomeownerIdDesc() {
    _queryBuilder = _queryBuilder.order('homeowner_id', ascending: false);
    return this;
  }

  /// Order by service_id in ascending order
  JobBroadcastsModelQueryBuilder orderByServiceIdAsc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: true);
    return this;
  }
  
  /// Order by service_id in descending order
  JobBroadcastsModelQueryBuilder orderByServiceIdDesc() {
    _queryBuilder = _queryBuilder.order('service_id', ascending: false);
    return this;
  }

  /// Order by title in ascending order
  JobBroadcastsModelQueryBuilder orderByTitleAsc() {
    _queryBuilder = _queryBuilder.order('title', ascending: true);
    return this;
  }
  
  /// Order by title in descending order
  JobBroadcastsModelQueryBuilder orderByTitleDesc() {
    _queryBuilder = _queryBuilder.order('title', ascending: false);
    return this;
  }

  /// Order by description in ascending order
  JobBroadcastsModelQueryBuilder orderByDescriptionAsc() {
    _queryBuilder = _queryBuilder.order('description', ascending: true);
    return this;
  }
  
  /// Order by description in descending order
  JobBroadcastsModelQueryBuilder orderByDescriptionDesc() {
    _queryBuilder = _queryBuilder.order('description', ascending: false);
    return this;
  }

  /// Order by address in ascending order
  JobBroadcastsModelQueryBuilder orderByAddressAsc() {
    _queryBuilder = _queryBuilder.order('address', ascending: true);
    return this;
  }
  
  /// Order by address in descending order
  JobBroadcastsModelQueryBuilder orderByAddressDesc() {
    _queryBuilder = _queryBuilder.order('address', ascending: false);
    return this;
  }

  /// Order by city in ascending order
  JobBroadcastsModelQueryBuilder orderByCityAsc() {
    _queryBuilder = _queryBuilder.order('city', ascending: true);
    return this;
  }
  
  /// Order by city in descending order
  JobBroadcastsModelQueryBuilder orderByCityDesc() {
    _queryBuilder = _queryBuilder.order('city', ascending: false);
    return this;
  }

  /// Order by state in ascending order
  JobBroadcastsModelQueryBuilder orderByStateAsc() {
    _queryBuilder = _queryBuilder.order('state', ascending: true);
    return this;
  }
  
  /// Order by state in descending order
  JobBroadcastsModelQueryBuilder orderByStateDesc() {
    _queryBuilder = _queryBuilder.order('state', ascending: false);
    return this;
  }

  /// Order by zip_code in ascending order
  JobBroadcastsModelQueryBuilder orderByZipCodeAsc() {
    _queryBuilder = _queryBuilder.order('zip_code', ascending: true);
    return this;
  }
  
  /// Order by zip_code in descending order
  JobBroadcastsModelQueryBuilder orderByZipCodeDesc() {
    _queryBuilder = _queryBuilder.order('zip_code', ascending: false);
    return this;
  }

  /// Order by latitude in ascending order
  JobBroadcastsModelQueryBuilder orderByLatitudeAsc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: true);
    return this;
  }
  
  /// Order by latitude in descending order
  JobBroadcastsModelQueryBuilder orderByLatitudeDesc() {
    _queryBuilder = _queryBuilder.order('latitude', ascending: false);
    return this;
  }

  /// Order by longitude in ascending order
  JobBroadcastsModelQueryBuilder orderByLongitudeAsc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: true);
    return this;
  }
  
  /// Order by longitude in descending order
  JobBroadcastsModelQueryBuilder orderByLongitudeDesc() {
    _queryBuilder = _queryBuilder.order('longitude', ascending: false);
    return this;
  }

  /// Order by location_address in ascending order
  JobBroadcastsModelQueryBuilder orderByLocationAddressAsc() {
    _queryBuilder = _queryBuilder.order('location_address', ascending: true);
    return this;
  }
  
  /// Order by location_address in descending order
  JobBroadcastsModelQueryBuilder orderByLocationAddressDesc() {
    _queryBuilder = _queryBuilder.order('location_address', ascending: false);
    return this;
  }

  /// Order by scheduled_time in ascending order
  JobBroadcastsModelQueryBuilder orderByScheduledTimeAsc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: true);
    return this;
  }
  
  /// Order by scheduled_time in descending order
  JobBroadcastsModelQueryBuilder orderByScheduledTimeDesc() {
    _queryBuilder = _queryBuilder.order('scheduled_time', ascending: false);
    return this;
  }

  /// Order by price_range_min in ascending order
  JobBroadcastsModelQueryBuilder orderByPriceRangeMinAsc() {
    _queryBuilder = _queryBuilder.order('price_range_min', ascending: true);
    return this;
  }
  
  /// Order by price_range_min in descending order
  JobBroadcastsModelQueryBuilder orderByPriceRangeMinDesc() {
    _queryBuilder = _queryBuilder.order('price_range_min', ascending: false);
    return this;
  }

  /// Order by price_range_max in ascending order
  JobBroadcastsModelQueryBuilder orderByPriceRangeMaxAsc() {
    _queryBuilder = _queryBuilder.order('price_range_max', ascending: true);
    return this;
  }
  
  /// Order by price_range_max in descending order
  JobBroadcastsModelQueryBuilder orderByPriceRangeMaxDesc() {
    _queryBuilder = _queryBuilder.order('price_range_max', ascending: false);
    return this;
  }

  /// Order by status in ascending order
  JobBroadcastsModelQueryBuilder orderByStatusAsc() {
    _queryBuilder = _queryBuilder.order('status', ascending: true);
    return this;
  }
  
  /// Order by status in descending order
  JobBroadcastsModelQueryBuilder orderByStatusDesc() {
    _queryBuilder = _queryBuilder.order('status', ascending: false);
    return this;
  }

  /// Order by urgency_level in ascending order
  JobBroadcastsModelQueryBuilder orderByUrgencyLevelAsc() {
    _queryBuilder = _queryBuilder.order('urgency_level', ascending: true);
    return this;
  }
  
  /// Order by urgency_level in descending order
  JobBroadcastsModelQueryBuilder orderByUrgencyLevelDesc() {
    _queryBuilder = _queryBuilder.order('urgency_level', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  JobBroadcastsModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  JobBroadcastsModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  JobBroadcastsModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  JobBroadcastsModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }

  /// Order by expires_at in ascending order
  JobBroadcastsModelQueryBuilder orderByExpiresAtAsc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: true);
    return this;
  }
  
  /// Order by expires_at in descending order
  JobBroadcastsModelQueryBuilder orderByExpiresAtDesc() {
    _queryBuilder = _queryBuilder.order('expires_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of JobBroadcastsModel
  Future<List<JobBroadcastsModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => JobBroadcastsModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<JobBroadcastsModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return JobBroadcastsModel.fromJson(response.first as Map<String, dynamic>);
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
