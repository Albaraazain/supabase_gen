import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/ride_requests_query_builder.dart';


class RideRequestsRepository extends BaseRepository<RideRequestsModel> {
  RideRequestsRepository(SupabaseClient client) : super(client, 'ride_requests', primaryKeyColumn: 'id');
  
  @override
  RideRequestsModel fromJson(Map<String, dynamic> json) {
    return RideRequestsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(RideRequestsModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for ride_requests
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
  RideRequestsModelQueryBuilder createQueryBuilder() {
    return RideRequestsModelQueryBuilder(client);
  }
  
  /// Get a RideRequestsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<RideRequestsModel?> getById(String id) async {
    final result = await client
        .from('ride_requests')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return RideRequestsModel.fromJson(result);
  }

  /// Get a RideRequestsModel by trip_id
  /// 
  /// This method looks up a record using a trip_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<RideRequestsModel?> getByTripId(String tripId) async {
    final result = await client
        .from('ride_requests')
        .select().eq('trip_id', tripId)
        .maybeSingle();
    
    if (result == null) return null;
    return RideRequestsModel.fromJson(result);
  }

  /// Get a RideRequestsModel by passenger_id
  /// 
  /// This method looks up a record using a passenger_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<RideRequestsModel?> getByPassengerId(String passengerId) async {
    final result = await client
        .from('ride_requests')
        .select().eq('passenger_id', passengerId)
        .maybeSingle();
    
    if (result == null) return null;
    return RideRequestsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(RideRequestsModel model) {
    // Validate check constraints
    // 2200_18442_13_not_null: Database CHECK constraint
    // 2200_18442_1_not_null: Database CHECK constraint
    // 2200_18442_2_not_null: Database CHECK constraint
    // 2200_18442_3_not_null: Database CHECK constraint
    // 2200_18442_4_not_null: Database CHECK constraint
    // ride_requests_dropoff_lat_check: Database CHECK constraint
    // ride_requests_dropoff_lng_check: Database CHECK constraint
    // ride_requests_offered_price_per_seat_check: Database CHECK constraint
    // ride_requests_pickup_lat_check: Database CHECK constraint
    // ride_requests_pickup_lng_check: Database CHECK constraint
    // ride_requests_seats_requested_check: Database CHECK constraint
    // ride_requests_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the trip record associated with this ride_requests
  /// 
  /// This retrieves the parent trip record for this ride_requests.
  /// It represents a foreign key relationship from ride_requests.trip_id to trips.id
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
  
  /// Check if the trip record exists for this ride_requests
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

  /// Get the passenger record associated with this ride_requests
  /// 
  /// This retrieves the parent passenger record for this ride_requests.
  /// It represents a foreign key relationship from ride_requests.passenger_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getPassenger(String passengerId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', passengerId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the passenger record exists for this ride_requests
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.passengerExists(message.userId);
  /// ```
  Future<bool> passengerExists(String passengerId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', passengerId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all bookings associated with this ride_requests
  /// 
  /// This is a one-to-many relationship where a ride_requests has many bookings.
  /// It will return all bookings linked to the given ride_requestsId via
  /// the ride_request_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getBookings(roomId);
  /// ```
  Future<List<BookingsModel>> getBookings(String rideRequestsId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('ride_request_id', rideRequestsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all bookings associated with this ride_requests with pagination and sorting
  /// 
  /// This is an enhanced version of getBookings that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findBookings(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<BookingsModel>> findBookings(
    String rideRequestsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('bookings').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('ride_request_id', rideRequestsId);
    
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
    return (response as List<dynamic>).map((json) => BookingsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of bookings associated with this ride_requests
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countBookings(roomId);
  /// ```
  Future<int> countBookings(String rideRequestsId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('ride_request_id', rideRequestsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
