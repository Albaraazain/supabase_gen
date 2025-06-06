import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/transactions_query_builder.dart';


class TransactionsRepository extends BaseRepository<TransactionsModel> {
  TransactionsRepository(SupabaseClient client) : super(client, 'transactions', primaryKeyColumn: 'id');
  
  @override
  TransactionsModel fromJson(Map<String, dynamic> json) {
    return TransactionsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(TransactionsModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for transactions
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
  TransactionsModelQueryBuilder createQueryBuilder() {
    return TransactionsModelQueryBuilder(client);
  }
  
  /// Get a TransactionsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<TransactionsModel?> getById(String id) async {
    final result = await client
        .from('transactions')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return TransactionsModel.fromJson(result);
  }

  /// Get List<TransactionsModel> by booking_id
  /// 
  /// This method looks up records using the booking_id field.
  /// It returns a list of matching records.
  Future<List<TransactionsModel>> getByBookingId(String bookingId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('booking_id', bookingId);
    
    return (result as List<dynamic>)
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<TransactionsModel> by instant_ride_request_id
  /// 
  /// This method looks up records using the instant_ride_request_id field.
  /// It returns a list of matching records.
  Future<List<TransactionsModel>> getByInstantRideRequestId(String instantRideRequestId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('instant_ride_request_id', instantRideRequestId);
    
    return (result as List<dynamic>)
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<TransactionsModel> by payee_id
  /// 
  /// This method looks up records using the payee_id field.
  /// It returns a list of matching records.
  Future<List<TransactionsModel>> getByPayeeId(String payeeId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('payee_id', payeeId);
    
    return (result as List<dynamic>)
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Get List<TransactionsModel> by payer_id
  /// 
  /// This method looks up records using the payer_id field.
  /// It returns a list of matching records.
  Future<List<TransactionsModel>> getByPayerId(String payerId) async {
    final result = await client
        .from('transactions')
        .select()
        .eq('payer_id', payerId);
    
    return (result as List<dynamic>)
        .map((item) => TransactionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(TransactionsModel model) {
    // Validate check constraints
    // 2200_18622_1_not_null: Database CHECK constraint
    // 2200_18622_3_not_null: Database CHECK constraint
    // 2200_18622_4_not_null: Database CHECK constraint
    // 2200_18622_5_not_null: Database CHECK constraint
    // transactions_amount_check: Database CHECK constraint
    // transactions_booking_or_instant_ride_check: Database CHECK constraint
    // transactions_booking_or_instant_ride_check: Database CHECK constraint
    // transactions_currency_check: Database CHECK constraint
    // transactions_payment_method_check: Database CHECK constraint
    // transactions_status_check: Database CHECK constraint
    // transactions_transaction_type_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the booking record associated with this transactions
  /// 
  /// This retrieves the parent booking record for this transactions.
  /// It represents a foreign key relationship from transactions.booking_id to bookings.id
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
  
  /// Check if the booking record exists for this transactions
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

  /// Get the payer record associated with this transactions
  /// 
  /// This retrieves the parent payer record for this transactions.
  /// It represents a foreign key relationship from transactions.payer_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getPayer(String payerId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', payerId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the payer record exists for this transactions
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.payerExists(message.userId);
  /// ```
  Future<bool> payerExists(String payerId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', payerId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the payee record associated with this transactions
  /// 
  /// This retrieves the parent payee record for this transactions.
  /// It represents a foreign key relationship from transactions.payee_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getPayee(String payeeId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', payeeId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the payee record exists for this transactions
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.payeeExists(message.userId);
  /// ```
  Future<bool> payeeExists(String payeeId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', payeeId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the instant_ride_request record associated with this transactions
  /// 
  /// This retrieves the parent instant_ride_request record for this transactions.
  /// It represents a foreign key relationship from transactions.instant_ride_request_id to instant_ride_requests.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<InstantRideRequestsModel?> getInstantRideRequest(String instantRideRequestId) async {
    final result = await client
        .from('instant_ride_requests')
        .select()
        .eq('id', instantRideRequestId)
        .maybeSingle();
    
    if (result == null) return null;
    return InstantRideRequestsModel.fromJson(result);
  }
  
  /// Check if the instant_ride_request record exists for this transactions
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.instant_ride_requestExists(message.userId);
  /// ```
  Future<bool> instant_ride_requestExists(String instantRideRequestId) async {
    final result = await client
        .from('instant_ride_requests')
        .select('id')
        .eq('id', instantRideRequestId)
        .maybeSingle();
    
    return result != null;
  }
}
