import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/payment_methods_query_builder.dart';


class PaymentMethodsRepository extends BaseRepository<PaymentMethodsModel> {
  PaymentMethodsRepository(SupabaseClient client) : super(client, 'payment_methods', primaryKeyColumn: 'id');
  
  @override
  PaymentMethodsModel fromJson(Map<String, dynamic> json) {
    return PaymentMethodsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(PaymentMethodsModel model) {
    return model.id;
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

}
