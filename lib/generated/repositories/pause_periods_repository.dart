import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/pause_periods_query_builder.dart';


class PausePeriodsRepository extends BaseRepository<PausePeriodsModel> {
  PausePeriodsRepository(SupabaseClient client) : super(client, 'pause_periods');
  
  @override
  PausePeriodsModel fromJson(Map<String, dynamic> json) {
    return PausePeriodsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for pause_periods
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
  PausePeriodsModelQueryBuilder createQueryBuilder() {
    return PausePeriodsModelQueryBuilder(client);
  }
  
  /// Get a PausePeriodsModel by pause_id
  /// 
  /// This method looks up a record using a pause_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<PausePeriodsModel?> getByPauseId(String pauseId) async {
    final result = await client
        .from('pause_periods')
        .select().eq('pause_id', pauseId)
        .maybeSingle();
    
    if (result == null) return null;
    return PausePeriodsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(PausePeriodsModel model) {
    // Validate check constraints
    // 2200_17811_1_not_null: Database CHECK constraint
    // 2200_17811_2_not_null: Database CHECK constraint
    // 2200_17811_3_not_null: Database CHECK constraint
    // 2200_17811_5_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
