import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/vehicles_query_builder.dart';


class VehiclesRepository extends BaseRepository<VehiclesModel> {
  VehiclesRepository(SupabaseClient client) : super(client, 'vehicles', primaryKeyColumn: 'id');
  
  @override
  VehiclesModel fromJson(Map<String, dynamic> json) {
    return VehiclesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(VehiclesModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_vehicles_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  
  /// Create a type-safe query builder for vehicles
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
  VehiclesModelQueryBuilder createQueryBuilder() {
    return VehiclesModelQueryBuilder(client);
  }
  
  /// Get a VehiclesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<VehiclesModel?> getById(String id) async {
    final result = await client
        .from('vehicles')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return VehiclesModel.fromJson(result);
  }

  /// Get a VehiclesModel by license_plate
  /// 
  /// This method looks up a record using a license_plate field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<VehiclesModel?> getByLicensePlate(String licensePlate) async {
    final result = await client
        .from('vehicles')
        .select().eq('license_plate', licensePlate)
        .maybeSingle();
    
    if (result == null) return null;
    return VehiclesModel.fromJson(result);
  }

  /// Get List<VehiclesModel> by user_id
  /// 
  /// This method looks up records using the user_id field.
  /// It returns a list of matching records.
  Future<List<VehiclesModel>> getByUserId(String userId) async {
    final result = await client
        .from('vehicles')
        .select()
        .eq('user_id', userId);
    
    return (result as List<dynamic>)
        .map((item) => VehiclesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(VehiclesModel model) {
    // Validate check constraints
    // 2200_17289_1_not_null: Database CHECK constraint
    // 2200_17289_2_not_null: Database CHECK constraint
    // 2200_17289_3_not_null: Database CHECK constraint
    // 2200_17289_4_not_null: Database CHECK constraint
    // 2200_17289_8_not_null: Database CHECK constraint
    // vehicles_fuel_consumption_per_100km_check: Database CHECK constraint
    // vehicles_fuel_type_check: Database CHECK constraint
    // vehicles_total_seats_check: Database CHECK constraint
    // vehicles_vehicle_type_check: Database CHECK constraint
    // vehicles_year_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the user record associated with this vehicles
  /// 
  /// This retrieves the parent user record for this vehicles.
  /// It represents a foreign key relationship from vehicles.user_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getUser(String userId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the user record exists for this vehicles
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.userExists(message.userId);
  /// ```
  Future<bool> userExists(String userId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', userId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all trips associated with this vehicles
  /// 
  /// This is a one-to-many relationship where a vehicles has many trips.
  /// It will return all trips linked to the given vehiclesId via
  /// the vehicle_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTrips(roomId);
  /// ```
  Future<List<TripsModel>> getTrips(String vehiclesId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('vehicle_id', vehiclesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TripsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all trips associated with this vehicles with pagination and sorting
  /// 
  /// This is an enhanced version of getTrips that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findTrips(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<TripsModel>> findTrips(
    String vehiclesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('trips').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('vehicle_id', vehiclesId);
    
    // Apply additional filters if provided
    if (additionalFilters != null) {
      additionalFilters.forEach((key, value) {
        if (value != null) {
          queryBuilder = queryBuilder.eq(key, value);
        }
      });
    }
    
    // Apply ordering if provided
    if (orderBy != null) {
      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);
    }
    
    // Apply limit if provided
    if (limit != null) {
      queryBuilder = queryBuilder.limit(limit);
    }
    
    // Apply pagination range if provided
    if (offset != null) {
      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);
    }
    
    // Execute the query
    final response = await queryBuilder;
    
    // Convert the response to model instances
    return (response as List<dynamic>).map((json) => TripsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of trips associated with this vehicles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTrips(roomId);
  /// ```
  Future<int> countTrips(String vehiclesId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('vehicle_id', vehiclesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
