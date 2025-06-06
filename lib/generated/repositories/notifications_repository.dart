import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/notifications_query_builder.dart';


class NotificationsRepository extends BaseRepository<NotificationsModel> {
  NotificationsRepository(SupabaseClient client) : super(client, 'notifications', primaryKeyColumn: 'id');
  
  @override
  NotificationsModel fromJson(Map<String, dynamic> json) {
    return NotificationsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(NotificationsModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for notifications
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
  NotificationsModelQueryBuilder createQueryBuilder() {
    return NotificationsModelQueryBuilder(client);
  }
  
  /// Get a NotificationsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<NotificationsModel?> getById(String id) async {
    final result = await client
        .from('notifications')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return NotificationsModel.fromJson(result);
  }

  /// Get List<NotificationsModel> by booking_id
  /// 
  /// This method looks up records using the booking_id field.
  /// It returns a list of matching records.
  Future<List<NotificationsModel>> getByBookingId(String bookingId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('booking_id', bookingId);
    
    return (result as List<dynamic>)
        .map((item) => NotificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<NotificationsModel> by trip_id
  /// 
  /// This method looks up records using the trip_id field.
  /// It returns a list of matching records.
  Future<List<NotificationsModel>> getByTripId(String tripId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('trip_id', tripId);
    
    return (result as List<dynamic>)
        .map((item) => NotificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<NotificationsModel> by user_id
  /// 
  /// This method looks up records using the user_id field.
  /// It returns a list of matching records.
  Future<List<NotificationsModel>> getByUserId(String userId) async {
    final result = await client
        .from('notifications')
        .select()
        .eq('user_id', userId);
    
    return (result as List<dynamic>)
        .map((item) => NotificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(NotificationsModel model) {
    // Validate check constraints
    // 2200_18655_1_not_null: Database CHECK constraint
    // 2200_18655_2_not_null: Database CHECK constraint
    // 2200_18655_3_not_null: Database CHECK constraint
    // 2200_18655_4_not_null: Database CHECK constraint
    // 2200_18655_5_not_null: Database CHECK constraint
    // notifications_type_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the user record associated with this notifications
  /// 
  /// This retrieves the parent user record for this notifications.
  /// It represents a foreign key relationship from notifications.user_id to profiles.id
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
  
  /// Check if the user record exists for this notifications
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

  /// Get the trip record associated with this notifications
  /// 
  /// This retrieves the parent trip record for this notifications.
  /// It represents a foreign key relationship from notifications.trip_id to trips.id
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
  
  /// Check if the trip record exists for this notifications
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

  /// Get the booking record associated with this notifications
  /// 
  /// This retrieves the parent booking record for this notifications.
  /// It represents a foreign key relationship from notifications.booking_id to bookings.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<BookingsModel?> getBooking(String bookingId) async {
    final result = await client
        .from('bookings')
        .select()
        .eq('id', bookingId)
        .maybeSingle();
    
    if (result == null) return null;
    return BookingsModel.fromJson(result);
  }
  
  /// Check if the booking record exists for this notifications
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.bookingExists(message.userId);
  /// ```
  Future<bool> bookingExists(String bookingId) async {
    final result = await client
        .from('bookings')
        .select('id')
        .eq('id', bookingId)
        .maybeSingle();
    
    return result != null;
  }
}
