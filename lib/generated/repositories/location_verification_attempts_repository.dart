import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/location_verification_attempts_query_builder.dart';


class LocationVerificationAttemptsRepository extends BaseRepository<LocationVerificationAttemptsModel> {
  LocationVerificationAttemptsRepository(SupabaseClient client) : super(client, 'location_verification_attempts', primaryKeyColumn: 'attempt_id');
  
  @override
  LocationVerificationAttemptsModel fromJson(Map<String, dynamic> json) {
    return LocationVerificationAttemptsModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(LocationVerificationAttemptsModel model) {
    return model.attemptId;
  }
  
  /// Create a type-safe query builder for location_verification_attempts
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
  LocationVerificationAttemptsModelQueryBuilder createQueryBuilder() {
    return LocationVerificationAttemptsModelQueryBuilder(client);
  }
  
  /// Get a LocationVerificationAttemptsModel by attempt_id
  /// 
  /// This method looks up a record using a attempt_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<LocationVerificationAttemptsModel?> getByAttemptId(String attemptId) async {
    final result = await client
        .from('location_verification_attempts')
        .select().eq('attempt_id', attemptId)
        .maybeSingle();
    
    if (result == null) return null;
    return LocationVerificationAttemptsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(LocationVerificationAttemptsModel model) {
    // Validate check constraints
    // 2200_17767_1_not_null: Database CHECK constraint
    // 2200_17767_2_not_null: Database CHECK constraint
    // 2200_17767_3_not_null: Database CHECK constraint
    // 2200_17767_4_not_null: Database CHECK constraint
    // 2200_17767_7_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
