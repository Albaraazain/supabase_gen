import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/bookings_query_builder.dart';


class BookingsRepository extends BaseRepository<BookingsModel> {
  BookingsRepository(SupabaseClient client) : super(client, 'bookings', primaryKeyColumn: 'id');
  
  @override
  BookingsModel fromJson(Map<String, dynamic> json) {
    return BookingsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(BookingsModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_bookings_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  
  /// Create a type-safe query builder for bookings
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
  BookingsModelQueryBuilder createQueryBuilder() {
    return BookingsModelQueryBuilder(client);
  }
  
  /// Get a BookingsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<BookingsModel?> getById(String id) async {
    final result = await client
        .from('bookings')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return BookingsModel.fromJson(result);
  }

  /// Get a BookingsModel by ride_request_id
  /// 
  /// This method looks up a record using a ride_request_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<BookingsModel?> getByRideRequestId(String rideRequestId) async {
    final result = await client
        .from('bookings')
        .select().eq('ride_request_id', rideRequestId)
        .maybeSingle();
    
    if (result == null) return null;
    return BookingsModel.fromJson(result);
  }

  /// Get List<BookingsModel> by cancelled_by
  /// 
  /// This method looks up records using the cancelled_by field.
  /// It returns a list of matching records.
  Future<List<BookingsModel>> getByCancelledBy(String cancelledBy) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('cancelled_by', cancelledBy);
    
    return (result as List<dynamic>)
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<BookingsModel> by driver_id
  /// 
  /// This method looks up records using the driver_id field.
  /// It returns a list of matching records.
  Future<List<BookingsModel>> getByDriverId(String driverId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('driver_id', driverId);
    
    return (result as List<dynamic>)
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<BookingsModel> by passenger_id
  /// 
  /// This method looks up records using the passenger_id field.
  /// It returns a list of matching records.
  Future<List<BookingsModel>> getByPassengerId(String passengerId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('passenger_id', passengerId);
    
    return (result as List<dynamic>)
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<BookingsModel> by trip_id
  /// 
  /// This method looks up records using the trip_id field.
  /// It returns a list of matching records.
  Future<List<BookingsModel>> getByTripId(String tripId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('trip_id', tripId);
    
    return (result as List<dynamic>)
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(BookingsModel model) {
    // Validate check constraints
    // 2200_18483_1_not_null: Database CHECK constraint
    // 2200_18483_2_not_null: Database CHECK constraint
    // 2200_18483_3_not_null: Database CHECK constraint
    // 2200_18483_4_not_null: Database CHECK constraint
    // 2200_18483_5_not_null: Database CHECK constraint
    // 2200_18483_6_not_null: Database CHECK constraint
    // 2200_18483_7_not_null: Database CHECK constraint
    // bookings_booking_status_check: Database CHECK constraint
    // bookings_final_price_check: Database CHECK constraint
    // bookings_payment_method_check: Database CHECK constraint
    // bookings_payment_status_check: Database CHECK constraint
    // bookings_seats_booked_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the trip record associated with this bookings
  /// 
  /// This retrieves the parent trip record for this bookings.
  /// It represents a foreign key relationship from bookings.trip_id to trips.id
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
  
  /// Check if the trip record exists for this bookings
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

  /// Get the ride_request record associated with this bookings
  /// 
  /// This retrieves the parent ride_request record for this bookings.
  /// It represents a foreign key relationship from bookings.ride_request_id to ride_requests.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<RideRequestsModel?> getRideRequest(String rideRequestId) async {
    final result = await client
        .from('ride_requests')
        .select()
        .eq('id', rideRequestId)
        .maybeSingle();
    
    if (result == null) return null;
    return RideRequestsModel.fromJson(result);
  }
  
  /// Check if the ride_request record exists for this bookings
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.ride_requestExists(message.userId);
  /// ```
  Future<bool> ride_requestExists(String rideRequestId) async {
    final result = await client
        .from('ride_requests')
        .select('id')
        .eq('id', rideRequestId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the passenger record associated with this bookings
  /// 
  /// This retrieves the parent passenger record for this bookings.
  /// It represents a foreign key relationship from bookings.passenger_id to profiles.id
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
  
  /// Check if the passenger record exists for this bookings
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

  /// Get the driver record associated with this bookings
  /// 
  /// This retrieves the parent driver record for this bookings.
  /// It represents a foreign key relationship from bookings.driver_id to profiles.id
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
  
  /// Check if the driver record exists for this bookings
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

  /// Get the cancelled_by record associated with this bookings
  /// 
  /// This retrieves the parent cancelled_by record for this bookings.
  /// It represents a foreign key relationship from bookings.cancelled_by to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getCancelledBy(String cancelledById) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', cancelledById)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the cancelled_by record exists for this bookings
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.cancelled_byExists(message.userId);
  /// ```
  Future<bool> cancelled_byExists(String cancelledById) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', cancelledById)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all reviews associated with this bookings
  /// 
  /// This is a one-to-many relationship where a bookings has many reviews.
  /// It will return all reviews linked to the given bookingsId via
  /// the booking_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getReviews(roomId);
  /// ```
  Future<List<ReviewsModel>> getReviews(String bookingsId) async {
    final result = await client
        .from('reviews')
        .select()
        .eq('booking_id', bookingsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ReviewsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all reviews associated with this bookings with pagination and sorting
  /// 
  /// This is an enhanced version of getReviews that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findReviews(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<ReviewsModel>> findReviews(
    String bookingsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('reviews').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('booking_id', bookingsId);
    
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
    return (response as List<dynamic>).map((json) => ReviewsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of reviews associated with this bookings
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countReviews(roomId);
  /// ```
  Future<int> countReviews(String bookingsId) async {
    final result = await client
        .from('reviews')
        .select()
        .eq('booking_id', bookingsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all transactions associated with this bookings
  /// 
  /// This is a one-to-many relationship where a bookings has many transactions.
  /// It will return all transactions linked to the given bookingsId via
  /// the booking_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTransactions(roomId);
  /// ```
  Future<List<TransactionsModel>> getTransactions(String bookingsId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('booking_id', bookingsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all transactions associated with this bookings with pagination and sorting
  /// 
  /// This is an enhanced version of getTransactions that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findTransactions(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<TransactionsModel>> findTransactions(
    String bookingsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('transactions').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('booking_id', bookingsId);
    
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
    return (response as List<dynamic>).map((json) => TransactionsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of transactions associated with this bookings
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTransactions(roomId);
  /// ```
  Future<int> countTransactions(String bookingsId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('booking_id', bookingsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all notifications associated with this bookings
  /// 
  /// This is a one-to-many relationship where a bookings has many notifications.
  /// It will return all notifications linked to the given bookingsId via
  /// the booking_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getNotifications(roomId);
  /// ```
  Future<List<NotificationsModel>> getNotifications(String bookingsId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('booking_id', bookingsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => NotificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all notifications associated with this bookings with pagination and sorting
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
    String bookingsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('notifications').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('booking_id', bookingsId);
    
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
  
  /// Count the number of notifications associated with this bookings
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countNotifications(roomId);
  /// ```
  Future<int> countNotifications(String bookingsId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('booking_id', bookingsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all messages associated with this bookings
  /// 
  /// This is a one-to-many relationship where a bookings has many messages.
  /// It will return all messages linked to the given bookingsId via
  /// the booking_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getMessages(roomId);
  /// ```
  Future<List<MessagesModel>> getMessages(String bookingsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('booking_id', bookingsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all messages associated with this bookings with pagination and sorting
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
    String bookingsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('messages').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('booking_id', bookingsId);
    
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
  
  /// Count the number of messages associated with this bookings
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countMessages(roomId);
  /// ```
  Future<int> countMessages(String bookingsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('booking_id', bookingsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
