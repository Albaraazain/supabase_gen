import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/trip_searches_model.dart';

/// A type-safe query builder for TripSearchesModel
class TripSearchesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  TripSearchesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('trip_searches').select();
  }
  
  /// Set the fields to select
  TripSearchesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('trip_searches').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  TripSearchesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  TripSearchesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  TripSearchesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by searcher_id
  TripSearchesModelQueryBuilder whereSearcherId(String? value) {
    _queryBuilder = _queryBuilder.eq('searcher_id', value);
    return this;
  }
  
  /// Filter by searcher_id with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereSearcherIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('searcher_id', values);
    return this;
  }
  
  

  /// Filter by origin_address
  TripSearchesModelQueryBuilder whereOriginAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('origin_address', value);
    return this;
  }
  
  /// Filter by origin_address with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereOriginAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_address', values);
    return this;
  }
  
  

  /// Filter by origin_lat
  TripSearchesModelQueryBuilder whereOriginLat(double? value) {
    _queryBuilder = _queryBuilder.eq('origin_lat', value);
    return this;
  }
  
  /// Filter by origin_lat with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereOriginLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_lat', values);
    return this;
  }
  
    /// Filter origin_lat greater than
  TripSearchesModelQueryBuilder whereOriginLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat greater than or equal
  TripSearchesModelQueryBuilder whereOriginLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat less than
  TripSearchesModelQueryBuilder whereOriginLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat less than or equal
  TripSearchesModelQueryBuilder whereOriginLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('origin_lat', value);
    return this;
  }
  
  /// Filter origin_lat between two values
  TripSearchesModelQueryBuilder whereOriginLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('origin_lat', min).lte('origin_lat', max);
    return this;
  }

  /// Filter by origin_lng
  TripSearchesModelQueryBuilder whereOriginLng(double? value) {
    _queryBuilder = _queryBuilder.eq('origin_lng', value);
    return this;
  }
  
  /// Filter by origin_lng with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereOriginLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_lng', values);
    return this;
  }
  
    /// Filter origin_lng greater than
  TripSearchesModelQueryBuilder whereOriginLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng greater than or equal
  TripSearchesModelQueryBuilder whereOriginLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng less than
  TripSearchesModelQueryBuilder whereOriginLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng less than or equal
  TripSearchesModelQueryBuilder whereOriginLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('origin_lng', value);
    return this;
  }
  
  /// Filter origin_lng between two values
  TripSearchesModelQueryBuilder whereOriginLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('origin_lng', min).lte('origin_lng', max);
    return this;
  }

  /// Filter by origin_point
  TripSearchesModelQueryBuilder whereOriginPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('origin_point', value);
    return this;
  }
  
  /// Filter by origin_point with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereOriginPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('origin_point', values);
    return this;
  }
  
  

  /// Filter by destination_address
  TripSearchesModelQueryBuilder whereDestinationAddress(String? value) {
    _queryBuilder = _queryBuilder.eq('destination_address', value);
    return this;
  }
  
  /// Filter by destination_address with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereDestinationAddressIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_address', values);
    return this;
  }
  
  

  /// Filter by destination_lat
  TripSearchesModelQueryBuilder whereDestinationLat(double? value) {
    _queryBuilder = _queryBuilder.eq('destination_lat', value);
    return this;
  }
  
  /// Filter by destination_lat with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereDestinationLatIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_lat', values);
    return this;
  }
  
    /// Filter destination_lat greater than
  TripSearchesModelQueryBuilder whereDestinationLatGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat greater than or equal
  TripSearchesModelQueryBuilder whereDestinationLatGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat less than
  TripSearchesModelQueryBuilder whereDestinationLatLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat less than or equal
  TripSearchesModelQueryBuilder whereDestinationLatLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('destination_lat', value);
    return this;
  }
  
  /// Filter destination_lat between two values
  TripSearchesModelQueryBuilder whereDestinationLatBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('destination_lat', min).lte('destination_lat', max);
    return this;
  }

  /// Filter by destination_lng
  TripSearchesModelQueryBuilder whereDestinationLng(double? value) {
    _queryBuilder = _queryBuilder.eq('destination_lng', value);
    return this;
  }
  
  /// Filter by destination_lng with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereDestinationLngIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_lng', values);
    return this;
  }
  
    /// Filter destination_lng greater than
  TripSearchesModelQueryBuilder whereDestinationLngGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng greater than or equal
  TripSearchesModelQueryBuilder whereDestinationLngGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng less than
  TripSearchesModelQueryBuilder whereDestinationLngLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng less than or equal
  TripSearchesModelQueryBuilder whereDestinationLngLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('destination_lng', value);
    return this;
  }
  
  /// Filter destination_lng between two values
  TripSearchesModelQueryBuilder whereDestinationLngBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('destination_lng', min).lte('destination_lng', max);
    return this;
  }

  /// Filter by destination_point
  TripSearchesModelQueryBuilder whereDestinationPoint(String? value) {
    _queryBuilder = _queryBuilder.eq('destination_point', value);
    return this;
  }
  
  /// Filter by destination_point with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereDestinationPointIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('destination_point', values);
    return this;
  }
  
  

  /// Filter by search_date
  TripSearchesModelQueryBuilder whereSearchDate(DateTime value) {
    _queryBuilder = _queryBuilder.eq('search_date', value);
    return this;
  }
  
  /// Filter by search_date with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereSearchDateIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('search_date', values);
    return this;
  }
  
    /// Filter search_date greater than
  TripSearchesModelQueryBuilder whereSearchDateGreaterThan(DateTime value) {
    _queryBuilder = _queryBuilder.gt('search_date', value);
    return this;
  }
  
  /// Filter search_date greater than or equal
  TripSearchesModelQueryBuilder whereSearchDateGreaterThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.gte('search_date', value);
    return this;
  }
  
  /// Filter search_date less than
  TripSearchesModelQueryBuilder whereSearchDateLessThan(DateTime value) {
    _queryBuilder = _queryBuilder.lt('search_date', value);
    return this;
  }
  
  /// Filter search_date less than or equal
  TripSearchesModelQueryBuilder whereSearchDateLessThanOrEqual(DateTime value) {
    _queryBuilder = _queryBuilder.lte('search_date', value);
    return this;
  }
  
  /// Filter search_date between two values
  TripSearchesModelQueryBuilder whereSearchDateBetween(DateTime min, DateTime max) {
    _queryBuilder = _queryBuilder.gte('search_date', min).lte('search_date', max);
    return this;
  }

  /// Filter by search_time
  TripSearchesModelQueryBuilder whereSearchTime(String value) {
    _queryBuilder = _queryBuilder.eq('search_time', value);
    return this;
  }
  
  /// Filter by search_time with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereSearchTimeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('search_time', values);
    return this;
  }
  
  

  /// Filter by max_price_willing
  TripSearchesModelQueryBuilder whereMaxPriceWilling(double? value) {
    _queryBuilder = _queryBuilder.eq('max_price_willing', value);
    return this;
  }
  
  /// Filter by max_price_willing with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereMaxPriceWillingIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('max_price_willing', values);
    return this;
  }
  
    /// Filter max_price_willing greater than
  TripSearchesModelQueryBuilder whereMaxPriceWillingGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('max_price_willing', value);
    return this;
  }
  
  /// Filter max_price_willing greater than or equal
  TripSearchesModelQueryBuilder whereMaxPriceWillingGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('max_price_willing', value);
    return this;
  }
  
  /// Filter max_price_willing less than
  TripSearchesModelQueryBuilder whereMaxPriceWillingLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('max_price_willing', value);
    return this;
  }
  
  /// Filter max_price_willing less than or equal
  TripSearchesModelQueryBuilder whereMaxPriceWillingLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('max_price_willing', value);
    return this;
  }
  
  /// Filter max_price_willing between two values
  TripSearchesModelQueryBuilder whereMaxPriceWillingBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('max_price_willing', min).lte('max_price_willing', max);
    return this;
  }

  /// Filter by max_detour_km
  TripSearchesModelQueryBuilder whereMaxDetourKm(int? value) {
    _queryBuilder = _queryBuilder.eq('max_detour_km', value);
    return this;
  }
  
  /// Filter by max_detour_km with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereMaxDetourKmIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('max_detour_km', values);
    return this;
  }
  
    /// Filter max_detour_km greater than
  TripSearchesModelQueryBuilder whereMaxDetourKmGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km greater than or equal
  TripSearchesModelQueryBuilder whereMaxDetourKmGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km less than
  TripSearchesModelQueryBuilder whereMaxDetourKmLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km less than or equal
  TripSearchesModelQueryBuilder whereMaxDetourKmLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('max_detour_km', value);
    return this;
  }
  
  /// Filter max_detour_km between two values
  TripSearchesModelQueryBuilder whereMaxDetourKmBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('max_detour_km', min).lte('max_detour_km', max);
    return this;
  }

  /// Filter by results_count
  TripSearchesModelQueryBuilder whereResultsCount(int? value) {
    _queryBuilder = _queryBuilder.eq('results_count', value);
    return this;
  }
  
  /// Filter by results_count with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereResultsCountIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('results_count', values);
    return this;
  }
  
    /// Filter results_count greater than
  TripSearchesModelQueryBuilder whereResultsCountGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('results_count', value);
    return this;
  }
  
  /// Filter results_count greater than or equal
  TripSearchesModelQueryBuilder whereResultsCountGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('results_count', value);
    return this;
  }
  
  /// Filter results_count less than
  TripSearchesModelQueryBuilder whereResultsCountLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('results_count', value);
    return this;
  }
  
  /// Filter results_count less than or equal
  TripSearchesModelQueryBuilder whereResultsCountLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('results_count', value);
    return this;
  }
  
  /// Filter results_count between two values
  TripSearchesModelQueryBuilder whereResultsCountBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('results_count', min).lte('results_count', max);
    return this;
  }

  /// Filter by selected_trip_id
  TripSearchesModelQueryBuilder whereSelectedTripId(String? value) {
    _queryBuilder = _queryBuilder.eq('selected_trip_id', value);
    return this;
  }
  
  /// Filter by selected_trip_id with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereSelectedTripIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('selected_trip_id', values);
    return this;
  }
  
  

  /// Filter by made_request
  TripSearchesModelQueryBuilder whereMadeRequest(bool? value) {
    _queryBuilder = _queryBuilder.eq('made_request', value);
    return this;
  }
  
  /// Filter by made_request with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereMadeRequestIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('made_request', values);
    return this;
  }
  
  

  /// Filter by created_at
  TripSearchesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  TripSearchesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  TripSearchesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  TripSearchesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  TripSearchesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  TripSearchesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  TripSearchesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  TripSearchesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  TripSearchesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by searcher_id in ascending order
  TripSearchesModelQueryBuilder orderBySearcherIdAsc() {
    _queryBuilder = _queryBuilder.order('searcher_id', ascending: true);
    return this;
  }
  
  /// Order by searcher_id in descending order
  TripSearchesModelQueryBuilder orderBySearcherIdDesc() {
    _queryBuilder = _queryBuilder.order('searcher_id', ascending: false);
    return this;
  }

  /// Order by origin_address in ascending order
  TripSearchesModelQueryBuilder orderByOriginAddressAsc() {
    _queryBuilder = _queryBuilder.order('origin_address', ascending: true);
    return this;
  }
  
  /// Order by origin_address in descending order
  TripSearchesModelQueryBuilder orderByOriginAddressDesc() {
    _queryBuilder = _queryBuilder.order('origin_address', ascending: false);
    return this;
  }

  /// Order by origin_lat in ascending order
  TripSearchesModelQueryBuilder orderByOriginLatAsc() {
    _queryBuilder = _queryBuilder.order('origin_lat', ascending: true);
    return this;
  }
  
  /// Order by origin_lat in descending order
  TripSearchesModelQueryBuilder orderByOriginLatDesc() {
    _queryBuilder = _queryBuilder.order('origin_lat', ascending: false);
    return this;
  }

  /// Order by origin_lng in ascending order
  TripSearchesModelQueryBuilder orderByOriginLngAsc() {
    _queryBuilder = _queryBuilder.order('origin_lng', ascending: true);
    return this;
  }
  
  /// Order by origin_lng in descending order
  TripSearchesModelQueryBuilder orderByOriginLngDesc() {
    _queryBuilder = _queryBuilder.order('origin_lng', ascending: false);
    return this;
  }

  /// Order by origin_point in ascending order
  TripSearchesModelQueryBuilder orderByOriginPointAsc() {
    _queryBuilder = _queryBuilder.order('origin_point', ascending: true);
    return this;
  }
  
  /// Order by origin_point in descending order
  TripSearchesModelQueryBuilder orderByOriginPointDesc() {
    _queryBuilder = _queryBuilder.order('origin_point', ascending: false);
    return this;
  }

  /// Order by destination_address in ascending order
  TripSearchesModelQueryBuilder orderByDestinationAddressAsc() {
    _queryBuilder = _queryBuilder.order('destination_address', ascending: true);
    return this;
  }
  
  /// Order by destination_address in descending order
  TripSearchesModelQueryBuilder orderByDestinationAddressDesc() {
    _queryBuilder = _queryBuilder.order('destination_address', ascending: false);
    return this;
  }

  /// Order by destination_lat in ascending order
  TripSearchesModelQueryBuilder orderByDestinationLatAsc() {
    _queryBuilder = _queryBuilder.order('destination_lat', ascending: true);
    return this;
  }
  
  /// Order by destination_lat in descending order
  TripSearchesModelQueryBuilder orderByDestinationLatDesc() {
    _queryBuilder = _queryBuilder.order('destination_lat', ascending: false);
    return this;
  }

  /// Order by destination_lng in ascending order
  TripSearchesModelQueryBuilder orderByDestinationLngAsc() {
    _queryBuilder = _queryBuilder.order('destination_lng', ascending: true);
    return this;
  }
  
  /// Order by destination_lng in descending order
  TripSearchesModelQueryBuilder orderByDestinationLngDesc() {
    _queryBuilder = _queryBuilder.order('destination_lng', ascending: false);
    return this;
  }

  /// Order by destination_point in ascending order
  TripSearchesModelQueryBuilder orderByDestinationPointAsc() {
    _queryBuilder = _queryBuilder.order('destination_point', ascending: true);
    return this;
  }
  
  /// Order by destination_point in descending order
  TripSearchesModelQueryBuilder orderByDestinationPointDesc() {
    _queryBuilder = _queryBuilder.order('destination_point', ascending: false);
    return this;
  }

  /// Order by search_date in ascending order
  TripSearchesModelQueryBuilder orderBySearchDateAsc() {
    _queryBuilder = _queryBuilder.order('search_date', ascending: true);
    return this;
  }
  
  /// Order by search_date in descending order
  TripSearchesModelQueryBuilder orderBySearchDateDesc() {
    _queryBuilder = _queryBuilder.order('search_date', ascending: false);
    return this;
  }

  /// Order by search_time in ascending order
  TripSearchesModelQueryBuilder orderBySearchTimeAsc() {
    _queryBuilder = _queryBuilder.order('search_time', ascending: true);
    return this;
  }
  
  /// Order by search_time in descending order
  TripSearchesModelQueryBuilder orderBySearchTimeDesc() {
    _queryBuilder = _queryBuilder.order('search_time', ascending: false);
    return this;
  }

  /// Order by max_price_willing in ascending order
  TripSearchesModelQueryBuilder orderByMaxPriceWillingAsc() {
    _queryBuilder = _queryBuilder.order('max_price_willing', ascending: true);
    return this;
  }
  
  /// Order by max_price_willing in descending order
  TripSearchesModelQueryBuilder orderByMaxPriceWillingDesc() {
    _queryBuilder = _queryBuilder.order('max_price_willing', ascending: false);
    return this;
  }

  /// Order by max_detour_km in ascending order
  TripSearchesModelQueryBuilder orderByMaxDetourKmAsc() {
    _queryBuilder = _queryBuilder.order('max_detour_km', ascending: true);
    return this;
  }
  
  /// Order by max_detour_km in descending order
  TripSearchesModelQueryBuilder orderByMaxDetourKmDesc() {
    _queryBuilder = _queryBuilder.order('max_detour_km', ascending: false);
    return this;
  }

  /// Order by results_count in ascending order
  TripSearchesModelQueryBuilder orderByResultsCountAsc() {
    _queryBuilder = _queryBuilder.order('results_count', ascending: true);
    return this;
  }
  
  /// Order by results_count in descending order
  TripSearchesModelQueryBuilder orderByResultsCountDesc() {
    _queryBuilder = _queryBuilder.order('results_count', ascending: false);
    return this;
  }

  /// Order by selected_trip_id in ascending order
  TripSearchesModelQueryBuilder orderBySelectedTripIdAsc() {
    _queryBuilder = _queryBuilder.order('selected_trip_id', ascending: true);
    return this;
  }
  
  /// Order by selected_trip_id in descending order
  TripSearchesModelQueryBuilder orderBySelectedTripIdDesc() {
    _queryBuilder = _queryBuilder.order('selected_trip_id', ascending: false);
    return this;
  }

  /// Order by made_request in ascending order
  TripSearchesModelQueryBuilder orderByMadeRequestAsc() {
    _queryBuilder = _queryBuilder.order('made_request', ascending: true);
    return this;
  }
  
  /// Order by made_request in descending order
  TripSearchesModelQueryBuilder orderByMadeRequestDesc() {
    _queryBuilder = _queryBuilder.order('made_request', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  TripSearchesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  TripSearchesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of TripSearchesModel
  Future<List<TripSearchesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => TripSearchesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<TripSearchesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return TripSearchesModel.fromJson(response.first as Map<String, dynamic>);
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
