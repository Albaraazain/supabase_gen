import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/messages_query_builder.dart';


class MessagesRepository extends BaseRepository<MessagesModel> {
  MessagesRepository(SupabaseClient client) : super(client, 'messages', primaryKeyColumn: 'id');
  
  @override
  MessagesModel fromJson(Map<String, dynamic> json) {
    return MessagesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(MessagesModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - mark_message_read_trigger: UPDATE BEFORE - EXECUTE FUNCTION mark_message_as_read()
  ///   Signature: mark_message_as_read() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   IF NEW.is_read = TRUE AND OLD.is_read = FALSE THEN     NEW.read_at = NOW();   END IF;   RETURN NEW; END; 
  
  /// Create a type-safe query builder for messages
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
  MessagesModelQueryBuilder createQueryBuilder() {
    return MessagesModelQueryBuilder(client);
  }
  
  /// Get a MessagesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<MessagesModel?> getById(String id) async {
    final result = await client
        .from('messages')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return MessagesModel.fromJson(result);
  }

  /// Get List<MessagesModel> by booking_id
  /// 
  /// This method looks up records using the booking_id field.
  /// It returns a list of matching records.
  Future<List<MessagesModel>> getByBookingId(String bookingId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('booking_id', bookingId);
    
    return (result as List<dynamic>)
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<MessagesModel> by recipient_id
  /// 
  /// This method looks up records using the recipient_id field.
  /// It returns a list of matching records.
  Future<List<MessagesModel>> getByRecipientId(String recipientId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('recipient_id', recipientId);
    
    return (result as List<dynamic>)
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<MessagesModel> by sender_id
  /// 
  /// This method looks up records using the sender_id field.
  /// It returns a list of matching records.
  Future<List<MessagesModel>> getBySenderId(String senderId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('sender_id', senderId);
    
    return (result as List<dynamic>)
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<MessagesModel> by trip_id
  /// 
  /// This method looks up records using the trip_id field.
  /// It returns a list of matching records.
  Future<List<MessagesModel>> getByTripId(String tripId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('trip_id', tripId);
    
    return (result as List<dynamic>)
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(MessagesModel model) {
    // Validate check constraints
    // 2200_18578_1_not_null: Database CHECK constraint
    // 2200_18578_2_not_null: Database CHECK constraint
    // 2200_18578_3_not_null: Database CHECK constraint
    // 2200_18578_4_not_null: Database CHECK constraint
    // 2200_18578_7_not_null: Database CHECK constraint
    // messages_check: Database CHECK constraint
    // messages_check: Database CHECK constraint
    // messages_message_type_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the trip record associated with this messages
  /// 
  /// This retrieves the parent trip record for this messages.
  /// It represents a foreign key relationship from messages.trip_id to trips.id
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
  
  /// Check if the trip record exists for this messages
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

  /// Get the sender record associated with this messages
  /// 
  /// This retrieves the parent sender record for this messages.
  /// It represents a foreign key relationship from messages.sender_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getSender(String senderId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', senderId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the sender record exists for this messages
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.senderExists(message.userId);
  /// ```
  Future<bool> senderExists(String senderId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', senderId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the recipient record associated with this messages
  /// 
  /// This retrieves the parent recipient record for this messages.
  /// It represents a foreign key relationship from messages.recipient_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getRecipient(String recipientId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', recipientId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the recipient record exists for this messages
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.recipientExists(message.userId);
  /// ```
  Future<bool> recipientExists(String recipientId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', recipientId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the booking record associated with this messages
  /// 
  /// This retrieves the parent booking record for this messages.
  /// It represents a foreign key relationship from messages.booking_id to bookings.id
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
  
  /// Check if the booking record exists for this messages
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
