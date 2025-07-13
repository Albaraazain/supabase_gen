import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/payment_notifications_query_builder.dart';


class PaymentNotificationsRepository extends BaseRepository<PaymentNotificationsModel> {
  PaymentNotificationsRepository(SupabaseClient client) : super(client, 'payment_notifications', primaryKeyColumn: 'id');
  
  @override
  PaymentNotificationsModel fromJson(Map<String, dynamic> json) {
    return PaymentNotificationsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(PaymentNotificationsModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for payment_notifications
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
  PaymentNotificationsModelQueryBuilder createQueryBuilder() {
    return PaymentNotificationsModelQueryBuilder(client);
  }
  
  /// Get a PaymentNotificationsModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<PaymentNotificationsModel?> getById(String id) async {
    final result = await client
        .from('payment_notifications')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return PaymentNotificationsModel.fromJson(result);
  }

}
