import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/instant_ride_requests_query_builder.dart';


class InstantRideRequestsRepository extends BaseRepository<InstantRideRequestsModel> {
  InstantRideRequestsRepository(SupabaseClient client) : super(client, 'instant_ride_requests', primaryKeyColumn: 'id');
  
  @override
  InstantRideRequestsModel fromJson(Map<String, dynamic> json) {
    return InstantRideRequestsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(InstantRideRequestsModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - instant_ride_auto_booking_trigger: UPDATE AFTER - EXECUTE FUNCTION auto_create_ride_on_acceptance()
  ///   Signature: auto_create_ride_on_acceptance() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  DECLARE   booking_result JSON; BEGIN   -- Only proceed if status changed to 'accepted'   IF NEW.status = 'accepted' ...
  /// - instant_ride_request_validation_trigger: INSERT BEFORE - EXECUTE FUNCTION validate_instant_ride_request()
  ///   Signature: validate_instant_ride_request() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     -- Validate coordinates are reasonable (basic sanity check)     IF NEW.pickup_lat < -90 OR NEW.pickup_lat ...
  /// - instant_ride_request_validation_trigger: UPDATE BEFORE - EXECUTE FUNCTION validate_instant_ride_request()
  ///   Signature: validate_instant_ride_request() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     -- Validate coordinates are reasonable (basic sanity check)     IF NEW.pickup_lat < -90 OR NEW.pickup_lat ...
  /// - instant_ride_requests_updated_at_trigger: UPDATE BEFORE - EXECUTE FUNCTION update_instant_ride_requests_updated_at()
  ///   Signature: update_instant_ride_requests_updated_at() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN     NEW.updated_at = NOW();     RETURN NEW; END; 
  
  /// Create a type-safe query builder for instant_ride_requests
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
  InstantRideRequestsModelQueryBuilder createQueryBuilder() {
    return InstantRideRequestsModelQueryBuilder(client);
  }
  
  /// Get a InstantRideRequestsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<InstantRideRequestsModel?> getById(String id) async {
    final result = await client
        .from('instant_ride_requests')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return InstantRideRequestsModel.fromJson(result);
  }

  /// Get List<InstantRideRequestsModel> by matched_driver_id
  /// 
  /// This method looks up records using the matched_driver_id field.
  /// It returns a list of matching records.
  Future<List<InstantRideRequestsModel>> getByMatchedDriverId(String matchedDriverId) async {
    final result = await client
        .from('instant_ride_requests')
        .select()
        .eq('matched_driver_id', matchedDriverId);
    
    return (result as List<dynamic>)
        .map((item) => InstantRideRequestsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<InstantRideRequestsModel> by passenger_id
  /// 
  /// This method looks up records using the passenger_id field.
  /// It returns a list of matching records.
  Future<List<InstantRideRequestsModel>> getByPassengerId(String passengerId) async {
    final result = await client
        .from('instant_ride_requests')
        .select()
        .eq('passenger_id', passengerId);
    
    return (result as List<dynamic>)
        .map((item) => InstantRideRequestsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(InstantRideRequestsModel model) {
    // Validate check constraints
    // 2200_21163_13_not_null: Database CHECK constraint
    // 2200_21163_1_not_null: Database CHECK constraint
    // 2200_21163_2_not_null: Database CHECK constraint
    // 2200_21163_3_not_null: Database CHECK constraint
    // 2200_21163_4_not_null: Database CHECK constraint
    // 2200_21163_5_not_null: Database CHECK constraint
    // 2200_21163_7_not_null: Database CHECK constraint
    // 2200_21163_8_not_null: Database CHECK constraint
    // 2200_21163_9_not_null: Database CHECK constraint
    // instant_ride_requests_cancellation_by_check: Database CHECK constraint
    // instant_ride_requests_check: Database CHECK constraint
    // instant_ride_requests_check: Database CHECK constraint
    // instant_ride_requests_offered_fare_check: Database CHECK constraint
    // instant_ride_requests_search_radius_km_check: Database CHECK constraint
    // instant_ride_requests_seats_requested_check: Database CHECK constraint
    // instant_ride_requests_status_check: Database CHECK constraint
    // instant_ride_requests_surge_multiplier_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the passenger record associated with this instant_ride_requests
  /// 
  /// This retrieves the parent passenger record for this instant_ride_requests.
  /// It represents a foreign key relationship from instant_ride_requests.passenger_id to profiles.id
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
  
  /// Check if the passenger record exists for this instant_ride_requests
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

  /// Get the matched_driver record associated with this instant_ride_requests
  /// 
  /// This retrieves the parent matched_driver record for this instant_ride_requests.
  /// It represents a foreign key relationship from instant_ride_requests.matched_driver_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getMatchedDriver(String matchedDriverId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', matchedDriverId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the matched_driver record exists for this instant_ride_requests
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.matched_driverExists(message.userId);
  /// ```
  Future<bool> matched_driverExists(String matchedDriverId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', matchedDriverId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all transactions associated with this instant_ride_requests
  /// 
  /// This is a one-to-many relationship where a instant_ride_requests has many transactions.
  /// It will return all transactions linked to the given instant_ride_requestsId via
  /// the instant_ride_request_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTransactions(roomId);
  /// ```
  Future<List<TransactionsModel>> getTransactions(String instantRideRequestsId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('instant_ride_request_id', instantRideRequestsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all transactions associated with this instant_ride_requests with pagination and sorting
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
    String instantRideRequestsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('transactions').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('instant_ride_request_id', instantRideRequestsId);
    
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
  
  /// Count the number of transactions associated with this instant_ride_requests
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTransactions(roomId);
  /// ```
  Future<int> countTransactions(String instantRideRequestsId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('instant_ride_request_id', instantRideRequestsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
