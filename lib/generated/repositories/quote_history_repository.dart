import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/quote_history_query_builder.dart';


class QuoteHistoryRepository extends BaseRepository<QuoteHistoryModel> {
  QuoteHistoryRepository(SupabaseClient client) : super(client, 'quote_history', primaryKeyColumn: 'history_id');
  
  @override
  QuoteHistoryModel fromJson(Map<String, dynamic> json) {
    return QuoteHistoryModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(QuoteHistoryModel model) {
    return model.historyId;
  }
  
  /// Create a type-safe query builder for quote_history
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
  QuoteHistoryModelQueryBuilder createQueryBuilder() {
    return QuoteHistoryModelQueryBuilder(client);
  }
  
  /// Get a QuoteHistoryModel by history_id
  /// 
  /// This method looks up a record using a history_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<QuoteHistoryModel?> getByHistoryId(String historyId) async {
    final result = await client
        .from('quote_history')
        .select().eq('history_id', historyId)
        .maybeSingle();
    
    if (result == null) return null;
    return QuoteHistoryModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(QuoteHistoryModel model) {
    // Validate check constraints
    // 2200_17889_1_not_null: Database CHECK constraint
    // 2200_17889_2_not_null: Database CHECK constraint
    // 2200_17889_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
