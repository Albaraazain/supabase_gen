import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/driver_availability_query_builder.dart';


class DriverAvailabilityRepository extends BaseRepository<DriverAvailabilityModel> {
  DriverAvailabilityRepository(SupabaseClient client) : super(client, 'driver_availability', primaryKeyColumn: 'id');
  
  @override
  DriverAvailabilityModel fromJson(Map<String, dynamic> json) {
    return DriverAvailabilityModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(DriverAvailabilityModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - driver_availability_updated_at_trigger: UPDATE BEFORE - EXECUTE FUNCTION update_driver_availability_updated_at()
  ///   Signature: update_driver_availability_updated_at() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
  /// - driver_availability_validation_trigger: INSERT BEFORE - EXECUTE FUNCTION validate_driver_availability()
  ///   Signature: validate_driver_availability() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     -- Validate coordinates if provided     IF NEW.current_location_lat IS NOT NULL AND NEW.current_location_l...
  /// - driver_availability_validation_trigger: UPDATE BEFORE - EXECUTE FUNCTION validate_driver_availability()
  ///   Signature: validate_driver_availability() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     -- Validate coordinates if provided     IF NEW.current_location_lat IS NOT NULL AND NEW.current_location_l...
  
  /// Create a type-safe query builder for driver_availability
  /// 
  /// The query builder provides a fluent interface to build complex queries
  /// with type safety for filtering, ordering and pagination.
  /// 
  /// Example:
  /// ```dart
  /// final users = await userRepository
  ///   .createQueryBuilder()
  ///   .whereNameEquals("John")
  ///   .whereAgeGreaterThan(18)
  ///   .orderByCreatedAtDesc()
  ///   .limit(10)
  ///   .get();
  /// ```
  DriverAvailabilityModelQueryBuilder createQueryBuilder() {
    return DriverAvailabilityModelQueryBuilder(client);
  }
  
  /// Get a DriverAvailabilityModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<DriverAvailabilityModel?> getById(String id) async {
    final result = await client
        .from('driver_availability')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return DriverAvailabilityModel.fromJson(result);
  }

  /// Get a DriverAvailabilityModel by driver_id
  /// 
  /// This method looks up a record using a driver_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<DriverAvailabilityModel?> getByDriverId(String driverId) async {
    final result = await client
        .from('driver_availability')
        .select().eq('driver_id', driverId)
        .maybeSingle();
    
    if (result == null) return null;
    return DriverAvailabilityModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(DriverAvailabilityModel model) {
    // Validate check constraints
    // 2200_21260_1_not_null: Database CHECK constraint
    // 2200_21260_2_not_null: Database CHECK constraint
    // driver_availability_battery_level_check: Database CHECK constraint
    // driver_availability_fuel_level_percent_check: Database CHECK constraint
    // driver_availability_heading_check: Database CHECK constraint
    // driver_availability_max_pickup_distance_km_check: Database CHECK constraint
    // driver_availability_maximum_passengers_check: Database CHECK constraint
    // driver_availability_minimum_fare_check: Database CHECK constraint
    // driver_availability_speed_kmh_check: Database CHECK constraint
    // driver_availability_surge_multiplier_threshold_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the driver record associated with this driver_availability
  /// 
  /// This retrieves the parent driver record for this driver_availability.
  /// It represents a foreign key relationship from driver_availability.driver_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getDriver(String driverId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', driverId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the driver record exists for this driver_availability
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.driverExists(message.userId);
  /// ```
  Future<bool> driverExists(String driverId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', driverId)
        .maybeSingle();
    
    return result != null;
  }
}
