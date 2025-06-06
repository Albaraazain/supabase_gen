import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/profiles_query_builder.dart';


class ProfilesRepository extends BaseRepository<ProfilesModel> {
  ProfilesRepository(SupabaseClient client) : super(client, 'profiles', primaryKeyColumn: 'id');
  
  @override
  ProfilesModel fromJson(Map<String, dynamic> json) {
    return ProfilesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ProfilesModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_profiles_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  
  /// Create a type-safe query builder for profiles
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
  ProfilesModelQueryBuilder createQueryBuilder() {
    return ProfilesModelQueryBuilder(client);
  }
  
  /// Get a ProfilesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfilesModel?> getById(String id) async {
    final result = await client
        .from('profiles')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }

  /// Get a ProfilesModel by email
  /// 
  /// This method looks up a record using a email field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfilesModel?> getByEmail(String email) async {
    final result = await client
        .from('profiles')
        .select().eq('email', email)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }

  /// Get a ProfilesModel by phone
  /// 
  /// This method looks up a record using a phone field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfilesModel?> getByPhone(String phone) async {
    final result = await client
        .from('profiles')
        .select().eq('phone', phone)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfilesModel model) {
    // Validate check constraints
    // 2200_17252_1_not_null: Database CHECK constraint
    // 2200_17252_2_not_null: Database CHECK constraint
    // 2200_17252_4_not_null: Database CHECK constraint
    // profiles_driver_rating_check: Database CHECK constraint
    // profiles_gender_check: Database CHECK constraint
    // profiles_passenger_rating_check: Database CHECK constraint
    // profiles_verification_status_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get all bookings associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many bookings.
  /// It will return all bookings linked to the given profilesId via
  /// the passenger_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getBookings(roomId);
  /// ```
  Future<List<BookingsModel>> getBookings(String profilesId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('passenger_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => BookingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all bookings associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('bookings').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('passenger_id', profilesId);
    
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
  
  /// Count the number of bookings associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countBookings(roomId);
  /// ```
  Future<int> countBookings(String profilesId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('passenger_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all vehicles associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many vehicles.
  /// It will return all vehicles linked to the given profilesId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getVehicles(roomId);
  /// ```
  Future<List<VehiclesModel>> getVehicles(String profilesId) async {
    final result = await client
        .from('vehicles')
        .select()
        .eq('user_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => VehiclesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all vehicles associated with this profiles with pagination and sorting
  /// 
  /// This is an enhanced version of getVehicles that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findVehicles(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<VehiclesModel>> findVehicles(
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('vehicles').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', profilesId);
    
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
    return (response as List<dynamic>).map((json) => VehiclesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of vehicles associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countVehicles(roomId);
  /// ```
  Future<int> countVehicles(String profilesId) async {
    final result = await client
        .from('vehicles')
        .select()
        .eq('user_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all trips associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many trips.
  /// It will return all trips linked to the given profilesId via
  /// the driver_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTrips(roomId);
  /// ```
  Future<List<TripsModel>> getTrips(String profilesId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('driver_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TripsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all trips associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('trips').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('driver_id', profilesId);
    
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
  
  /// Count the number of trips associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTrips(roomId);
  /// ```
  Future<int> countTrips(String profilesId) async {
    final result = await client
        .from('trips')
        .select()
        .eq('driver_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all reviews associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many reviews.
  /// It will return all reviews linked to the given profilesId via
  /// the reviewer_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getReviews(roomId);
  /// ```
  Future<List<ReviewsModel>> getReviews(String profilesId) async {
    final result = await client
        .from('reviews')
        .select()
        .eq('reviewer_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ReviewsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all reviews associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('reviews').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('reviewer_id', profilesId);
    
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
  
  /// Count the number of reviews associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countReviews(roomId);
  /// ```
  Future<int> countReviews(String profilesId) async {
    final result = await client
        .from('reviews')
        .select()
        .eq('reviewer_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all transactions associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many transactions.
  /// It will return all transactions linked to the given profilesId via
  /// the payer_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTransactions(roomId);
  /// ```
  Future<List<TransactionsModel>> getTransactions(String profilesId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('payer_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all transactions associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('transactions').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('payer_id', profilesId);
    
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
  
  /// Count the number of transactions associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTransactions(roomId);
  /// ```
  Future<int> countTransactions(String profilesId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('payer_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all notifications associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many notifications.
  /// It will return all notifications linked to the given profilesId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getNotifications(roomId);
  /// ```
  Future<List<NotificationsModel>> getNotifications(String profilesId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('user_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => NotificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all notifications associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('notifications').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', profilesId);
    
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
  
  /// Count the number of notifications associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countNotifications(roomId);
  /// ```
  Future<int> countNotifications(String profilesId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('user_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all user_preferences associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many user_preferences.
  /// It will return all user_preferences linked to the given profilesId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getUserPreferences(roomId);
  /// ```
  Future<List<UserPreferencesModel>> getUserPreferences(String profilesId) async {
    final result = await client
        .from('user_preferences')
        .select()
        .eq('user_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => UserPreferencesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all user_preferences associated with this profiles with pagination and sorting
  /// 
  /// This is an enhanced version of getUserPreferences that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findUserPreferences(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<UserPreferencesModel>> findUserPreferences(
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('user_preferences').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', profilesId);
    
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
    return (response as List<dynamic>).map((json) => UserPreferencesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of user_preferences associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countUserPreferences(roomId);
  /// ```
  Future<int> countUserPreferences(String profilesId) async {
    final result = await client
        .from('user_preferences')
        .select()
        .eq('user_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all ride_requests associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many ride_requests.
  /// It will return all ride_requests linked to the given profilesId via
  /// the passenger_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getRideRequests(roomId);
  /// ```
  Future<List<RideRequestsModel>> getRideRequests(String profilesId) async {
    final result = await client
        .from('ride_requests')
        .select()
        .eq('passenger_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => RideRequestsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all ride_requests associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('ride_requests').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('passenger_id', profilesId);
    
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
  
  /// Count the number of ride_requests associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countRideRequests(roomId);
  /// ```
  Future<int> countRideRequests(String profilesId) async {
    final result = await client
        .from('ride_requests')
        .select()
        .eq('passenger_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all messages associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many messages.
  /// It will return all messages linked to the given profilesId via
  /// the sender_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getMessages(roomId);
  /// ```
  Future<List<MessagesModel>> getMessages(String profilesId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('sender_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all messages associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('messages').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('sender_id', profilesId);
    
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
  
  /// Count the number of messages associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countMessages(roomId);
  /// ```
  Future<int> countMessages(String profilesId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('sender_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all verification_documents associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many verification_documents.
  /// It will return all verification_documents linked to the given profilesId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getVerificationDocuments(roomId);
  /// ```
  Future<List<VerificationDocumentsModel>> getVerificationDocuments(String profilesId) async {
    final result = await client
        .from('verification_documents')
        .select()
        .eq('user_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => VerificationDocumentsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all verification_documents associated with this profiles with pagination and sorting
  /// 
  /// This is an enhanced version of getVerificationDocuments that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findVerificationDocuments(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<VerificationDocumentsModel>> findVerificationDocuments(
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('verification_documents').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', profilesId);
    
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
    return (response as List<dynamic>).map((json) => VerificationDocumentsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of verification_documents associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countVerificationDocuments(roomId);
  /// ```
  Future<int> countVerificationDocuments(String profilesId) async {
    final result = await client
        .from('verification_documents')
        .select()
        .eq('user_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all trip_searches associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many trip_searches.
  /// It will return all trip_searches linked to the given profilesId via
  /// the searcher_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTripSearches(roomId);
  /// ```
  Future<List<TripSearchesModel>> getTripSearches(String profilesId) async {
    final result = await client
        .from('trip_searches')
        .select()
        .eq('searcher_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TripSearchesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all trip_searches associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('trip_searches').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('searcher_id', profilesId);
    
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
  
  /// Count the number of trip_searches associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTripSearches(roomId);
  /// ```
  Future<int> countTripSearches(String profilesId) async {
    final result = await client
        .from('trip_searches')
        .select()
        .eq('searcher_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all driver_locations associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many driver_locations.
  /// It will return all driver_locations linked to the given profilesId via
  /// the driver_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getDriverLocations(roomId);
  /// ```
  Future<List<DriverLocationsModel>> getDriverLocations(String profilesId) async {
    final result = await client
        .from('driver_locations')
        .select()
        .eq('driver_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => DriverLocationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all driver_locations associated with this profiles with pagination and sorting
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
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('driver_locations').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('driver_id', profilesId);
    
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
  
  /// Count the number of driver_locations associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countDriverLocations(roomId);
  /// ```
  Future<int> countDriverLocations(String profilesId) async {
    final result = await client
        .from('driver_locations')
        .select()
        .eq('driver_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all instant_ride_requests associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many instant_ride_requests.
  /// It will return all instant_ride_requests linked to the given profilesId via
  /// the passenger_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getInstantRideRequests(roomId);
  /// ```
  Future<List<InstantRideRequestsModel>> getInstantRideRequests(String profilesId) async {
    final result = await client
        .from('instant_ride_requests')
        .select()
        .eq('passenger_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => InstantRideRequestsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all instant_ride_requests associated with this profiles with pagination and sorting
  /// 
  /// This is an enhanced version of getInstantRideRequests that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findInstantRideRequests(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<InstantRideRequestsModel>> findInstantRideRequests(
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('instant_ride_requests').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('passenger_id', profilesId);
    
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
    return (response as List<dynamic>).map((json) => InstantRideRequestsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of instant_ride_requests associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countInstantRideRequests(roomId);
  /// ```
  Future<int> countInstantRideRequests(String profilesId) async {
    final result = await client
        .from('instant_ride_requests')
        .select()
        .eq('passenger_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all driver_availabilities associated with this profiles
  /// 
  /// This is a one-to-many relationship where a profiles has many driver_availabilities.
  /// It will return all driver_availabilities linked to the given profilesId via
  /// the driver_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getDriverAvailabilities(roomId);
  /// ```
  Future<List<DriverAvailabilityModel>> getDriverAvailabilities(String profilesId) async {
    final result = await client
        .from('driver_availability')
        .select()
        .eq('driver_id', profilesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => DriverAvailabilityModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all driver_availabilities associated with this profiles with pagination and sorting
  /// 
  /// This is an enhanced version of getDriverAvailabilities that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findDriverAvailabilities(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<DriverAvailabilityModel>> findDriverAvailabilities(
    String profilesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('driver_availability').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('driver_id', profilesId);
    
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
    return (response as List<dynamic>).map((json) => DriverAvailabilityModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of driver_availabilities associated with this profiles
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countDriverAvailabilities(roomId);
  /// ```
  Future<int> countDriverAvailabilities(String profilesId) async {
    final result = await client
        .from('driver_availability')
        .select()
        .eq('driver_id', profilesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
