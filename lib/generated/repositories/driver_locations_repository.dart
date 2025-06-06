import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/driver_locations_query_builder.dart';


class DriverLocationsRepository extends BaseRepository<DriverLocationsModel> {
  DriverLocationsRepository(SupabaseClient client) : super(client, 'driver_locations', primaryKeyColumn: 'id');
  
  @override
  DriverLocationsModel fromJson(Map<String, dynamic> json) {
    return DriverLocationsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(DriverLocationsModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - trigger_update_driver_locations_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_driver_location_updated_at()
  ///   Signature: update_driver_location_updated_at() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
  
  /// Create a type-safe query builder for driver_locations
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
  DriverLocationsModelQueryBuilder createQueryBuilder() {
    return DriverLocationsModelQueryBuilder(client);
  }
  
  /// Get a DriverLocationsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<DriverLocationsModel?> getById(String id) async {
    final result = await client
        .from('driver_locations')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return DriverLocationsModel.fromJson(result);
  }

  /// Get List<DriverLocationsModel> by current_trip_id
  /// 
  /// This method looks up records using the current_trip_id field.
  /// It returns a list of matching records.
  Future<List<DriverLocationsModel>> getByCurrentTripId(String currentTripId) async {
    final result = await client
        .from('driver_locations')
        .select()
        .eq('current_trip_id', currentTripId);
    
    return (result as List<dynamic>)
        .map((item) => DriverLocationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<DriverLocationsModel> by driver_id
  /// 
  /// This method looks up records using the driver_id field.
  /// It returns a list of matching records.
  Future<List<DriverLocationsModel>> getByDriverId(String driverId) async {
    final result = await client
        .from('driver_locations')
        .select()
        .eq('driver_id', driverId);
    
    return (result as List<dynamic>)
        .map((item) => DriverLocationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(DriverLocationsModel model) {
    // Validate check constraints
    // 2200_19937_1_not_null: Database CHECK constraint
    // 2200_19937_2_not_null: Database CHECK constraint
    // 2200_19937_3_not_null: Database CHECK constraint
    // 2200_19937_4_not_null: Database CHECK constraint
    // 2200_19937_8_not_null: Database CHECK constraint
    // 2200_19937_9_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the driver record associated with this driver_locations
  /// 
  /// This retrieves the parent driver record for this driver_locations.
  /// It represents a foreign key relationship from driver_locations.driver_id to profiles.id
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
  
  /// Check if the driver record exists for this driver_locations
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

  /// Get the current_trip record associated with this driver_locations
  /// 
  /// This retrieves the parent current_trip record for this driver_locations.
  /// It represents a foreign key relationship from driver_locations.current_trip_id to trips.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<TripsModel?> getCurrentTrip(String currentTripId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('id', currentTripId)
        .maybeSingle();
    
    if (result == null) return null;
    return TripsModel.fromJson(result);
  }
  
  /// Check if the current_trip record exists for this driver_locations
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.current_tripExists(message.userId);
  /// ```
  Future<bool> current_tripExists(String currentTripId) async {
    final result = await client
        .from('trips')
        .select('id')
        .eq('id', currentTripId)
        .maybeSingle();
    
    return result != null;
  }
}
