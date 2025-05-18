import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/session_pause_reasons_query_builder.dart';


class SessionPauseReasonsRepository extends BaseRepository<SessionPauseReasonsModel> {
  SessionPauseReasonsRepository(SupabaseClient client) : super(client, 'session_pause_reasons', primaryKeyColumn: 'pause_id');
  
  @override
  SessionPauseReasonsModel fromJson(Map<String, dynamic> json) {
    return SessionPauseReasonsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(SessionPauseReasonsModel model) {
    return model.pauseId;
  }
  
  /// Create a type-safe query builder for session_pause_reasons
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
  SessionPauseReasonsModelQueryBuilder createQueryBuilder() {
    return SessionPauseReasonsModelQueryBuilder(client);
  }
  
  /// Get a SessionPauseReasonsModel by pause_id
  /// 
  /// This method looks up a record using a pause_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<SessionPauseReasonsModel?> getByPauseId(String pauseId) async {
    final result = await client
        .from('session_pause_reasons')
        .select().eq('pause_id', pauseId)
        .maybeSingle();
    
    if (result == null) return null;
    return SessionPauseReasonsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(SessionPauseReasonsModel model) {
    // Validate check constraints
    // 2200_17957_1_not_null: Database CHECK constraint
    // 2200_17957_2_not_null: Database CHECK constraint
    // 2200_17957_3_not_null: Database CHECK constraint
    // 2200_17957_5_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
