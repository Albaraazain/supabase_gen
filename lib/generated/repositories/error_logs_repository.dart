import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/error_logs_query_builder.dart';


class ErrorLogsRepository extends BaseRepository<ErrorLogsModel> {
  ErrorLogsRepository(SupabaseClient client) : super(client, 'error_logs', primaryKeyColumn: 'log_id');
  
  @override
  ErrorLogsModel fromJson(Map<String, dynamic> json) {
    return ErrorLogsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ErrorLogsModel model) {
    return model.logId;
  }
  
  /// Create a type-safe query builder for error_logs
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
  ErrorLogsModelQueryBuilder createQueryBuilder() {
    return ErrorLogsModelQueryBuilder(client);
  }
  
  /// Get a ErrorLogsModel by log_id
  /// 
  /// This method looks up a record using a log_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ErrorLogsModel?> getByLogId(String logId) async {
    final result = await client
        .from('error_logs')
        .select().eq('log_id', logId)
        .maybeSingle();
    
    if (result == null) return null;
    return ErrorLogsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ErrorLogsModel model) {
    // Validate check constraints
    // 2200_17686_1_not_null: Database CHECK constraint
    // 2200_17686_2_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
