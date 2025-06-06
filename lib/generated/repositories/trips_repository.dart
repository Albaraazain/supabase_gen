import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/trips_query_builder.dart';


class TripsRepository extends BaseRepository<TripsModel> {
  TripsRepository(SupabaseClient client) : super(client, 'trips', primaryKeyColumn: 'id');
  
  @override
  TripsModel fromJson(Map<String, dynamic> json) {
    return TripsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(TripsModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_trips_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  
  /// Create a type-safe query builder for trips
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
  TripsModelQueryBuilder createQueryBuilder() {
    return TripsModelQueryBuilder(client);
  }
  
  /// Get a TripsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TripsModel?> getById(String id) async {
    final result = await client
        .from('trips')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return TripsModel.fromJson(result);
  }

  /// Get List<TripsModel> by driver_id
  /// 
  /// This method looks up records using the driver_id field.
  /// It returns a list of matching records.
  Future<List<TripsModel>> getByDriverId(String driverId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('driver_id', driverId);
    
    return (result as List<dynamic>)
        .map((item) => TripsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<TripsModel> by vehicle_id
  /// 
  /// This method looks up records using the vehicle_id field.
  /// It returns a list of matching records.
  Future<List<TripsModel>> getByVehicleId(String vehicleId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('vehicle_id', vehicleId);
    
    return (result as List<dynamic>)
        .map((item) => TripsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(TripsModel model) {
    // Validate check constraints
    // 2200_18364_10_not_null: Database CHECK constraint
    // 2200_18364_12_not_null: Database CHECK constraint
    // 2200_18364_14_not_null: Database CHECK constraint
    // 2200_18364_16_not_null: Database CHECK constraint
    // 2200_18364_1_not_null: Database CHECK constraint
    // 2200_18364_2_not_null: Database CHECK constraint
    // 2200_18364_3_not_null: Database CHECK constraint
    // 2200_18364_4_not_null: Database CHECK constraint
    // 2200_18364_5_not_null: Database CHECK constraint
    // 2200_18364_6_not_null: Database CHECK constraint
    // 2200_18364_8_not_null: Database CHECK constraint
    // 2200_18364_9_not_null: Database CHECK constraint
    // trips_available_seats_check: Database CHECK constraint
    // trips_currency_check: Database CHECK constraint
    // trips_destination_lat_check: Database CHECK constraint
    // trips_destination_lng_check: Database CHECK constraint
    // trips_max_luggage_size_check: Database CHECK constraint
    // trips_origin_lat_check: Database CHECK constraint
    // trips_origin_lng_check: Database CHECK constraint
    // trips_price_per_seat_check: Database CHECK constraint
    // trips_total_distance_km_check: Database CHECK constraint
    // trips_trip_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the driver record associated with this trips
  /// 
  /// This retrieves the parent driver record for this trips.
  /// It represents a foreign key relationship from trips.driver_id to profiles.id
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
  
  /// Check if the driver record exists for this trips
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

  /// Get the vehicle record associated with this trips
  /// 
  /// This retrieves the parent vehicle record for this trips.
  /// It represents a foreign key relationship from trips.vehicle_id to vehicles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<VehiclesModel?> getVehicle(String vehicleId) async {
    final result = await client
        .from('vehicles')
        .select()
        .eq('id', vehicleId)
        .maybeSingle();
    
    if (result == null) return null;
    return VehiclesModel.fromJson(result);
  }
  
  /// Check if the vehicle record exists for this trips
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.vehicleExists(message.userId);
  /// ```
  Future<bool> vehicleExists(String vehicleId) async {
    final result = await client
        .from('vehicles')
        .select('id')
        .eq('id', vehicleId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all bookings associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many bookings.
  /// It will return all bookings linked to the given tripsId via
  /// the trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getBookings(roomId);
  /// ```
  Future<List<BookingsModel>> getBookings(String tripsId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all bookings associated with this trips with pagination and sorting
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
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('bookings').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('trip_id', tripsId);
    
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
  
  /// Count the number of bookings associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countBookings(roomId);
  /// ```
  Future<int> countBookings(String tripsId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all trip_waypoints associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many trip_waypoints.
  /// It will return all trip_waypoints linked to the given tripsId via
  /// the trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTripWaypoints(roomId);
  /// ```
  Future<List<TripWaypointsModel>> getTripWaypoints(String tripsId) async {
    final result = await client
        .from('trip_waypoints')
        .select()
        .eq('trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TripWaypointsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all trip_waypoints associated with this trips with pagination and sorting
  /// 
  /// This is an enhanced version of getTripWaypoints that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findTripWaypoints(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<TripWaypointsModel>> findTripWaypoints(
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('trip_waypoints').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('trip_id', tripsId);
    
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
    return (response as List<dynamic>).map((json) => TripWaypointsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of trip_waypoints associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTripWaypoints(roomId);
  /// ```
  Future<int> countTripWaypoints(String tripsId) async {
    final result = await client
        .from('trip_waypoints')
        .select()
        .eq('trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all notifications associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many notifications.
  /// It will return all notifications linked to the given tripsId via
  /// the trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getNotifications(roomId);
  /// ```
  Future<List<NotificationsModel>> getNotifications(String tripsId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => NotificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all notifications associated with this trips with pagination and sorting
  /// 
  /// This is an enhanced version of getNotifications that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findNotifications(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<NotificationsModel>> findNotifications(
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('notifications').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('trip_id', tripsId);
    
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
    return (response as List<dynamic>).map((json) => NotificationsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of notifications associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countNotifications(roomId);
  /// ```
  Future<int> countNotifications(String tripsId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all ride_requests associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many ride_requests.
  /// It will return all ride_requests linked to the given tripsId via
  /// the trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getRideRequests(roomId);
  /// ```
  Future<List<RideRequestsModel>> getRideRequests(String tripsId) async {
    final result = await client
        .from('ride_requests')
        .select()
        .eq('trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => RideRequestsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all ride_requests associated with this trips with pagination and sorting
  /// 
  /// This is an enhanced version of getRideRequests that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findRideRequests(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<RideRequestsModel>> findRideRequests(
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('ride_requests').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('trip_id', tripsId);
    
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
    return (response as List<dynamic>).map((json) => RideRequestsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of ride_requests associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countRideRequests(roomId);
  /// ```
  Future<int> countRideRequests(String tripsId) async {
    final result = await client
        .from('ride_requests')
        .select()
        .eq('trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all messages associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many messages.
  /// It will return all messages linked to the given tripsId via
  /// the trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getMessages(roomId);
  /// ```
  Future<List<MessagesModel>> getMessages(String tripsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all messages associated with this trips with pagination and sorting
  /// 
  /// This is an enhanced version of getMessages that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findMessages(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<MessagesModel>> findMessages(
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('messages').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('trip_id', tripsId);
    
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
    return (response as List<dynamic>).map((json) => MessagesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of messages associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countMessages(roomId);
  /// ```
  Future<int> countMessages(String tripsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all trip_searches associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many trip_searches.
  /// It will return all trip_searches linked to the given tripsId via
  /// the selected_trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTripSearches(roomId);
  /// ```
  Future<List<TripSearchesModel>> getTripSearches(String tripsId) async {
    final result = await client
        .from('trip_searches')
        .select()
        .eq('selected_trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TripSearchesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all trip_searches associated with this trips with pagination and sorting
  /// 
  /// This is an enhanced version of getTripSearches that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findTripSearches(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<TripSearchesModel>> findTripSearches(
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('trip_searches').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('selected_trip_id', tripsId);
    
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
    return (response as List<dynamic>).map((json) => TripSearchesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of trip_searches associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTripSearches(roomId);
  /// ```
  Future<int> countTripSearches(String tripsId) async {
    final result = await client
        .from('trip_searches')
        .select()
        .eq('selected_trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all driver_locations associated with this trips
  /// 
  /// This is a one-to-many relationship where a trips has many driver_locations.
  /// It will return all driver_locations linked to the given tripsId via
  /// the current_trip_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getDriverLocations(roomId);
  /// ```
  Future<List<DriverLocationsModel>> getDriverLocations(String tripsId) async {
    final result = await client
        .from('driver_locations')
        .select()
        .eq('current_trip_id', tripsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => DriverLocationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all driver_locations associated with this trips with pagination and sorting
  /// 
  /// This is an enhanced version of getDriverLocations that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findDriverLocations(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<DriverLocationsModel>> findDriverLocations(
    String tripsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('driver_locations').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('current_trip_id', tripsId);
    
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
    return (response as List<dynamic>).map((json) => DriverLocationsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of driver_locations associated with this trips
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countDriverLocations(roomId);
  /// ```
  Future<int> countDriverLocations(String tripsId) async {
    final result = await client
        .from('driver_locations')
        .select()
        .eq('current_trip_id', tripsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
