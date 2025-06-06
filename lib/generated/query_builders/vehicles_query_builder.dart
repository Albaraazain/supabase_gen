import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/vehicles_model.dart';

/// A type-safe query builder for VehiclesModel
class VehiclesModelQueryBuilder {
  // PostgrestFilterBuilder<dynamic> will be properly typed when imported
  // in the generated file
  late dynamic _queryBuilder;
  final dynamic _client;
  
  VehiclesModelQueryBuilder(this._client) {
    _queryBuilder = _client.from('vehicles').select();
  }
  
  /// Set the fields to select
  VehiclesModelQueryBuilder select(String fields) {
    _queryBuilder = _client.from('vehicles').select(fields);
    return this;
  }
  
  /// Limit the number of rows returned
  VehiclesModelQueryBuilder limit(int limit) {
    _queryBuilder = _queryBuilder.limit(limit);
    return this;
  }
  
  /// Set the range of rows to return
  VehiclesModelQueryBuilder range(int start, int end) {
    _queryBuilder = _queryBuilder.range(start, end);
    return this;
  }
  
  /// Filter by id
  VehiclesModelQueryBuilder whereId(String value) {
    _queryBuilder = _queryBuilder.eq('id', value);
    return this;
  }
  
  /// Filter by id with multiple values (IN operator)
  VehiclesModelQueryBuilder whereIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('id', values);
    return this;
  }
  
  

  /// Filter by user_id
  VehiclesModelQueryBuilder whereUserId(String value) {
    _queryBuilder = _queryBuilder.eq('user_id', value);
    return this;
  }
  
  /// Filter by user_id with multiple values (IN operator)
  VehiclesModelQueryBuilder whereUserIdIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('user_id', values);
    return this;
  }
  
  

  /// Filter by make
  VehiclesModelQueryBuilder whereMake(String value) {
    _queryBuilder = _queryBuilder.eq('make', value);
    return this;
  }
  
  /// Filter by make with multiple values (IN operator)
  VehiclesModelQueryBuilder whereMakeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('make', values);
    return this;
  }
  
  

  /// Filter by model
  VehiclesModelQueryBuilder whereModel(String value) {
    _queryBuilder = _queryBuilder.eq('model', value);
    return this;
  }
  
  /// Filter by model with multiple values (IN operator)
  VehiclesModelQueryBuilder whereModelIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('model', values);
    return this;
  }
  
  

  /// Filter by year
  VehiclesModelQueryBuilder whereYear(int? value) {
    _queryBuilder = _queryBuilder.eq('year', value);
    return this;
  }
  
  /// Filter by year with multiple values (IN operator)
  VehiclesModelQueryBuilder whereYearIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('year', values);
    return this;
  }
  
    /// Filter year greater than
  VehiclesModelQueryBuilder whereYearGreaterThan(int? value) {
    _queryBuilder = _queryBuilder.gt('year', value);
    return this;
  }
  
  /// Filter year greater than or equal
  VehiclesModelQueryBuilder whereYearGreaterThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.gte('year', value);
    return this;
  }
  
  /// Filter year less than
  VehiclesModelQueryBuilder whereYearLessThan(int? value) {
    _queryBuilder = _queryBuilder.lt('year', value);
    return this;
  }
  
  /// Filter year less than or equal
  VehiclesModelQueryBuilder whereYearLessThanOrEqual(int? value) {
    _queryBuilder = _queryBuilder.lte('year', value);
    return this;
  }
  
  /// Filter year between two values
  VehiclesModelQueryBuilder whereYearBetween(int? min, int? max) {
    _queryBuilder = _queryBuilder.gte('year', min).lte('year', max);
    return this;
  }

  /// Filter by color
  VehiclesModelQueryBuilder whereColor(String? value) {
    _queryBuilder = _queryBuilder.eq('color', value);
    return this;
  }
  
  /// Filter by color with multiple values (IN operator)
  VehiclesModelQueryBuilder whereColorIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('color', values);
    return this;
  }
  
  

  /// Filter by license_plate
  VehiclesModelQueryBuilder whereLicensePlate(String? value) {
    _queryBuilder = _queryBuilder.eq('license_plate', value);
    return this;
  }
  
  /// Filter by license_plate with multiple values (IN operator)
  VehiclesModelQueryBuilder whereLicensePlateIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('license_plate', values);
    return this;
  }
  
  

  /// Filter by total_seats
  VehiclesModelQueryBuilder whereTotalSeats(int value) {
    _queryBuilder = _queryBuilder.eq('total_seats', value);
    return this;
  }
  
  /// Filter by total_seats with multiple values (IN operator)
  VehiclesModelQueryBuilder whereTotalSeatsIn(List<int> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('total_seats', values);
    return this;
  }
  
    /// Filter total_seats greater than
  VehiclesModelQueryBuilder whereTotalSeatsGreaterThan(int value) {
    _queryBuilder = _queryBuilder.gt('total_seats', value);
    return this;
  }
  
  /// Filter total_seats greater than or equal
  VehiclesModelQueryBuilder whereTotalSeatsGreaterThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.gte('total_seats', value);
    return this;
  }
  
  /// Filter total_seats less than
  VehiclesModelQueryBuilder whereTotalSeatsLessThan(int value) {
    _queryBuilder = _queryBuilder.lt('total_seats', value);
    return this;
  }
  
  /// Filter total_seats less than or equal
  VehiclesModelQueryBuilder whereTotalSeatsLessThanOrEqual(int value) {
    _queryBuilder = _queryBuilder.lte('total_seats', value);
    return this;
  }
  
  /// Filter total_seats between two values
  VehiclesModelQueryBuilder whereTotalSeatsBetween(int min, int max) {
    _queryBuilder = _queryBuilder.gte('total_seats', min).lte('total_seats', max);
    return this;
  }

  /// Filter by vehicle_type
  VehiclesModelQueryBuilder whereVehicleType(String? value) {
    _queryBuilder = _queryBuilder.eq('vehicle_type', value);
    return this;
  }
  
  /// Filter by vehicle_type with multiple values (IN operator)
  VehiclesModelQueryBuilder whereVehicleTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('vehicle_type', values);
    return this;
  }
  
  

  /// Filter by fuel_type
  VehiclesModelQueryBuilder whereFuelType(String? value) {
    _queryBuilder = _queryBuilder.eq('fuel_type', value);
    return this;
  }
  
  /// Filter by fuel_type with multiple values (IN operator)
  VehiclesModelQueryBuilder whereFuelTypeIn(List<String> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('fuel_type', values);
    return this;
  }
  
  

  /// Filter by fuel_consumption_per_100km
  VehiclesModelQueryBuilder whereFuelConsumptionPer100km(double? value) {
    _queryBuilder = _queryBuilder.eq('fuel_consumption_per_100km', value);
    return this;
  }
  
  /// Filter by fuel_consumption_per_100km with multiple values (IN operator)
  VehiclesModelQueryBuilder whereFuelConsumptionPer100kmIn(List<double> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('fuel_consumption_per_100km', values);
    return this;
  }
  
    /// Filter fuel_consumption_per_100km greater than
  VehiclesModelQueryBuilder whereFuelConsumptionPer100kmGreaterThan(double? value) {
    _queryBuilder = _queryBuilder.gt('fuel_consumption_per_100km', value);
    return this;
  }
  
  /// Filter fuel_consumption_per_100km greater than or equal
  VehiclesModelQueryBuilder whereFuelConsumptionPer100kmGreaterThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.gte('fuel_consumption_per_100km', value);
    return this;
  }
  
  /// Filter fuel_consumption_per_100km less than
  VehiclesModelQueryBuilder whereFuelConsumptionPer100kmLessThan(double? value) {
    _queryBuilder = _queryBuilder.lt('fuel_consumption_per_100km', value);
    return this;
  }
  
  /// Filter fuel_consumption_per_100km less than or equal
  VehiclesModelQueryBuilder whereFuelConsumptionPer100kmLessThanOrEqual(double? value) {
    _queryBuilder = _queryBuilder.lte('fuel_consumption_per_100km', value);
    return this;
  }
  
  /// Filter fuel_consumption_per_100km between two values
  VehiclesModelQueryBuilder whereFuelConsumptionPer100kmBetween(double? min, double? max) {
    _queryBuilder = _queryBuilder.gte('fuel_consumption_per_100km', min).lte('fuel_consumption_per_100km', max);
    return this;
  }

  /// Filter by is_verified
  VehiclesModelQueryBuilder whereIsVerified(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_verified', value);
    return this;
  }
  
  /// Filter by is_verified with multiple values (IN operator)
  VehiclesModelQueryBuilder whereIsVerifiedIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_verified', values);
    return this;
  }
  
  

  /// Filter by verification_documents
  VehiclesModelQueryBuilder whereVerificationDocuments(Map<String, dynamic>? value) {
    _queryBuilder = _queryBuilder.eq('verification_documents', value);
    return this;
  }
  
  /// Filter by verification_documents with multiple values (IN operator)
  VehiclesModelQueryBuilder whereVerificationDocumentsIn(List<Map<String, dynamic>> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('verification_documents', values);
    return this;
  }
  
  

  /// Filter by is_primary
  VehiclesModelQueryBuilder whereIsPrimary(bool? value) {
    _queryBuilder = _queryBuilder.eq('is_primary', value);
    return this;
  }
  
  /// Filter by is_primary with multiple values (IN operator)
  VehiclesModelQueryBuilder whereIsPrimaryIn(List<bool> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('is_primary', values);
    return this;
  }
  
  

  /// Filter by created_at
  VehiclesModelQueryBuilder whereCreatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('created_at', value);
    return this;
  }
  
  /// Filter by created_at with multiple values (IN operator)
  VehiclesModelQueryBuilder whereCreatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('created_at', values);
    return this;
  }
  
    /// Filter created_at greater than
  VehiclesModelQueryBuilder whereCreatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('created_at', value);
    return this;
  }
  
  /// Filter created_at greater than or equal
  VehiclesModelQueryBuilder whereCreatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('created_at', value);
    return this;
  }
  
  /// Filter created_at less than
  VehiclesModelQueryBuilder whereCreatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('created_at', value);
    return this;
  }
  
  /// Filter created_at less than or equal
  VehiclesModelQueryBuilder whereCreatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('created_at', value);
    return this;
  }
  
  /// Filter created_at between two values
  VehiclesModelQueryBuilder whereCreatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('created_at', min).lte('created_at', max);
    return this;
  }

  /// Filter by updated_at
  VehiclesModelQueryBuilder whereUpdatedAt(DateTime? value) {
    _queryBuilder = _queryBuilder.eq('updated_at', value);
    return this;
  }
  
  /// Filter by updated_at with multiple values (IN operator)
  VehiclesModelQueryBuilder whereUpdatedAtIn(List<DateTime> values) {
    // Use inFilter for Supabase 2.9.0+ compatibility, but keep in_ for backward compatibility
    _queryBuilder = _queryBuilder.inFilter('updated_at', values);
    return this;
  }
  
    /// Filter updated_at greater than
  VehiclesModelQueryBuilder whereUpdatedAtGreaterThan(DateTime? value) {
    _queryBuilder = _queryBuilder.gt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at greater than or equal
  VehiclesModelQueryBuilder whereUpdatedAtGreaterThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.gte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than
  VehiclesModelQueryBuilder whereUpdatedAtLessThan(DateTime? value) {
    _queryBuilder = _queryBuilder.lt('updated_at', value);
    return this;
  }
  
  /// Filter updated_at less than or equal
  VehiclesModelQueryBuilder whereUpdatedAtLessThanOrEqual(DateTime? value) {
    _queryBuilder = _queryBuilder.lte('updated_at', value);
    return this;
  }
  
  /// Filter updated_at between two values
  VehiclesModelQueryBuilder whereUpdatedAtBetween(DateTime? min, DateTime? max) {
    _queryBuilder = _queryBuilder.gte('updated_at', min).lte('updated_at', max);
    return this;
  }
  
  /// Order by id in ascending order
  VehiclesModelQueryBuilder orderByIdAsc() {
    _queryBuilder = _queryBuilder.order('id', ascending: true);
    return this;
  }
  
  /// Order by id in descending order
  VehiclesModelQueryBuilder orderByIdDesc() {
    _queryBuilder = _queryBuilder.order('id', ascending: false);
    return this;
  }

  /// Order by user_id in ascending order
  VehiclesModelQueryBuilder orderByUserIdAsc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: true);
    return this;
  }
  
  /// Order by user_id in descending order
  VehiclesModelQueryBuilder orderByUserIdDesc() {
    _queryBuilder = _queryBuilder.order('user_id', ascending: false);
    return this;
  }

  /// Order by make in ascending order
  VehiclesModelQueryBuilder orderByMakeAsc() {
    _queryBuilder = _queryBuilder.order('make', ascending: true);
    return this;
  }
  
  /// Order by make in descending order
  VehiclesModelQueryBuilder orderByMakeDesc() {
    _queryBuilder = _queryBuilder.order('make', ascending: false);
    return this;
  }

  /// Order by model in ascending order
  VehiclesModelQueryBuilder orderByModelAsc() {
    _queryBuilder = _queryBuilder.order('model', ascending: true);
    return this;
  }
  
  /// Order by model in descending order
  VehiclesModelQueryBuilder orderByModelDesc() {
    _queryBuilder = _queryBuilder.order('model', ascending: false);
    return this;
  }

  /// Order by year in ascending order
  VehiclesModelQueryBuilder orderByYearAsc() {
    _queryBuilder = _queryBuilder.order('year', ascending: true);
    return this;
  }
  
  /// Order by year in descending order
  VehiclesModelQueryBuilder orderByYearDesc() {
    _queryBuilder = _queryBuilder.order('year', ascending: false);
    return this;
  }

  /// Order by color in ascending order
  VehiclesModelQueryBuilder orderByColorAsc() {
    _queryBuilder = _queryBuilder.order('color', ascending: true);
    return this;
  }
  
  /// Order by color in descending order
  VehiclesModelQueryBuilder orderByColorDesc() {
    _queryBuilder = _queryBuilder.order('color', ascending: false);
    return this;
  }

  /// Order by license_plate in ascending order
  VehiclesModelQueryBuilder orderByLicensePlateAsc() {
    _queryBuilder = _queryBuilder.order('license_plate', ascending: true);
    return this;
  }
  
  /// Order by license_plate in descending order
  VehiclesModelQueryBuilder orderByLicensePlateDesc() {
    _queryBuilder = _queryBuilder.order('license_plate', ascending: false);
    return this;
  }

  /// Order by total_seats in ascending order
  VehiclesModelQueryBuilder orderByTotalSeatsAsc() {
    _queryBuilder = _queryBuilder.order('total_seats', ascending: true);
    return this;
  }
  
  /// Order by total_seats in descending order
  VehiclesModelQueryBuilder orderByTotalSeatsDesc() {
    _queryBuilder = _queryBuilder.order('total_seats', ascending: false);
    return this;
  }

  /// Order by vehicle_type in ascending order
  VehiclesModelQueryBuilder orderByVehicleTypeAsc() {
    _queryBuilder = _queryBuilder.order('vehicle_type', ascending: true);
    return this;
  }
  
  /// Order by vehicle_type in descending order
  VehiclesModelQueryBuilder orderByVehicleTypeDesc() {
    _queryBuilder = _queryBuilder.order('vehicle_type', ascending: false);
    return this;
  }

  /// Order by fuel_type in ascending order
  VehiclesModelQueryBuilder orderByFuelTypeAsc() {
    _queryBuilder = _queryBuilder.order('fuel_type', ascending: true);
    return this;
  }
  
  /// Order by fuel_type in descending order
  VehiclesModelQueryBuilder orderByFuelTypeDesc() {
    _queryBuilder = _queryBuilder.order('fuel_type', ascending: false);
    return this;
  }

  /// Order by fuel_consumption_per_100km in ascending order
  VehiclesModelQueryBuilder orderByFuelConsumptionPer100kmAsc() {
    _queryBuilder = _queryBuilder.order('fuel_consumption_per_100km', ascending: true);
    return this;
  }
  
  /// Order by fuel_consumption_per_100km in descending order
  VehiclesModelQueryBuilder orderByFuelConsumptionPer100kmDesc() {
    _queryBuilder = _queryBuilder.order('fuel_consumption_per_100km', ascending: false);
    return this;
  }

  /// Order by is_verified in ascending order
  VehiclesModelQueryBuilder orderByIsVerifiedAsc() {
    _queryBuilder = _queryBuilder.order('is_verified', ascending: true);
    return this;
  }
  
  /// Order by is_verified in descending order
  VehiclesModelQueryBuilder orderByIsVerifiedDesc() {
    _queryBuilder = _queryBuilder.order('is_verified', ascending: false);
    return this;
  }

  /// Order by verification_documents in ascending order
  VehiclesModelQueryBuilder orderByVerificationDocumentsAsc() {
    _queryBuilder = _queryBuilder.order('verification_documents', ascending: true);
    return this;
  }
  
  /// Order by verification_documents in descending order
  VehiclesModelQueryBuilder orderByVerificationDocumentsDesc() {
    _queryBuilder = _queryBuilder.order('verification_documents', ascending: false);
    return this;
  }

  /// Order by is_primary in ascending order
  VehiclesModelQueryBuilder orderByIsPrimaryAsc() {
    _queryBuilder = _queryBuilder.order('is_primary', ascending: true);
    return this;
  }
  
  /// Order by is_primary in descending order
  VehiclesModelQueryBuilder orderByIsPrimaryDesc() {
    _queryBuilder = _queryBuilder.order('is_primary', ascending: false);
    return this;
  }

  /// Order by created_at in ascending order
  VehiclesModelQueryBuilder orderByCreatedAtAsc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: true);
    return this;
  }
  
  /// Order by created_at in descending order
  VehiclesModelQueryBuilder orderByCreatedAtDesc() {
    _queryBuilder = _queryBuilder.order('created_at', ascending: false);
    return this;
  }

  /// Order by updated_at in ascending order
  VehiclesModelQueryBuilder orderByUpdatedAtAsc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: true);
    return this;
  }
  
  /// Order by updated_at in descending order
  VehiclesModelQueryBuilder orderByUpdatedAtDesc() {
    _queryBuilder = _queryBuilder.order('updated_at', ascending: false);
    return this;
  }
  
  /// Execute the query and return the results as a list of VehiclesModel
  Future<List<VehiclesModel>> get() async {
    try {
      final response = await _queryBuilder;
      
      return (response as List<dynamic>)
          .map((json) => VehiclesModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error executing query: $e');
      return [];
    }
  }
  
  /// Execute the query and return a single result or null
  Future<VehiclesModel?> getSingle() async {
    try {
      _queryBuilder = _queryBuilder.limit(1);
      final response = await _queryBuilder;
      
      if (response is List && response.isNotEmpty) {
        return VehiclesModel.fromJson(response.first as Map<String, dynamic>);
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
