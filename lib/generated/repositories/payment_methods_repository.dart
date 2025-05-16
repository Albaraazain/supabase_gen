import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/payment_methods_query_builder.dart';


class PaymentMethodsRepository extends BaseRepository<PaymentMethodsModel> {
  PaymentMethodsRepository(SupabaseClient client) : super(client, 'payment_methods');
  
  @override
  PaymentMethodsModel fromJson(Map<String, dynamic> json) {
    return PaymentMethodsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for payment_methods
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
  PaymentMethodsModelQueryBuilder createQueryBuilder() {
    return PaymentMethodsModelQueryBuilder(client);
  }
  
  /// Get a PaymentMethodsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<PaymentMethodsModel?> getById(String id) async {
    final result = await client
        .from('payment_methods')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return PaymentMethodsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(PaymentMethodsModel model) {
    // Validate check constraints
    // 2200_17819_1_not_null: Database CHECK constraint
    // 2200_17819_2_not_null: Database CHECK constraint
    // 2200_17819_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the user record associated with this payment_methods
  /// 
  /// This retrieves the parent user record for this payment_methods.
  /// It represents a foreign key relationship from payment_methods.user_id to users.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<UsersModel?> getUser(String userId) async {
    final result = await client
        .from('users')
        .select()
        .eq('id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return UsersModel.fromJson(result);
  }
  
  /// Check if the user record exists for this payment_methods
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
        .from('users')
        .select('id')
        .eq('id', userId)
        .maybeSingle();
    
    return result != null;
  }
}
