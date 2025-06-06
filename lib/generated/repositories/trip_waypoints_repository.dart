import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/trip_waypoints_query_builder.dart';


class TripWaypointsRepository extends BaseRepository<TripWaypointsModel> {
  TripWaypointsRepository(SupabaseClient client) : super(client, 'trip_waypoints', primaryKeyColumn: 'id');
  
  @override
  TripWaypointsModel fromJson(Map<String, dynamic> json) {
    return TripWaypointsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(TripWaypointsModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for trip_waypoints
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
  TripWaypointsModelQueryBuilder createQueryBuilder() {
    return TripWaypointsModelQueryBuilder(client);
  }
  
  /// Get a TripWaypointsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TripWaypointsModel?> getById(String id) async {
    final result = await client
        .from('trip_waypoints')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return TripWaypointsModel.fromJson(result);
  }

  /// Get a TripWaypointsModel by trip_id
  /// 
  /// This method looks up a record using a trip_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TripWaypointsModel?> getByTripId(String tripId) async {
    final result = await client
        .from('trip_waypoints')
        .select().eq('trip_id', tripId)
        .maybeSingle();
    
    if (result == null) return null;
    return TripWaypointsModel.fromJson(result);
  }

  /// Get a TripWaypointsModel by order_index
  /// 
  /// This method looks up a record using a order_index field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TripWaypointsModel?> getByOrderIndex(String orderIndex) async {
    final result = await client
        .from('trip_waypoints')
        .select().eq('order_index', orderIndex)
        .maybeSingle();
    
    if (result == null) return null;
    return TripWaypointsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(TripWaypointsModel model) {
    // Validate check constraints
    // 2200_18411_1_not_null: Database CHECK constraint
    // 2200_18411_2_not_null: Database CHECK constraint
    // 2200_18411_3_not_null: Database CHECK constraint
    // 2200_18411_4_not_null: Database CHECK constraint
    // 2200_18411_5_not_null: Database CHECK constraint
    // 2200_18411_7_not_null: Database CHECK constraint
    // trip_waypoints_lat_check: Database CHECK constraint
    // trip_waypoints_lng_check: Database CHECK constraint
    // trip_waypoints_order_index_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the trip record associated with this trip_waypoints
  /// 
  /// This retrieves the parent trip record for this trip_waypoints.
  /// It represents a foreign key relationship from trip_waypoints.trip_id to trips.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<TripsModel?> getTrip(String tripId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('id', tripId)
        .maybeSingle();
    
    if (result == null) return null;
    return TripsModel.fromJson(result);
  }
  
  /// Check if the trip record exists for this trip_waypoints
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.tripExists(message.userId);
  /// ```
  Future<bool> tripExists(String tripId) async {
    final result = await client
        .from('trips')
        .select('id')
        .eq('id', tripId)
        .maybeSingle();
    
    return result != null;
  }
}
