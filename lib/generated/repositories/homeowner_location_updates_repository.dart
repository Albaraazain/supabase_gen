import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/homeowner_location_updates_query_builder.dart';


class HomeownerLocationUpdatesRepository extends BaseRepository<HomeownerLocationUpdatesModel> {
  HomeownerLocationUpdatesRepository(SupabaseClient client) : super(client, 'homeowner_location_updates', primaryKeyColumn: 'id');
  
  @override
  HomeownerLocationUpdatesModel fromJson(Map<String, dynamic> json) {
    return HomeownerLocationUpdatesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(HomeownerLocationUpdatesModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for homeowner_location_updates
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
  HomeownerLocationUpdatesModelQueryBuilder createQueryBuilder() {
    return HomeownerLocationUpdatesModelQueryBuilder(client);
  }
  
  /// Get a HomeownerLocationUpdatesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<HomeownerLocationUpdatesModel?> getById(String id) async {
    final result = await client
        .from('homeowner_location_updates')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return HomeownerLocationUpdatesModel.fromJson(result);
  }

  /// Get a HomeownerLocationUpdatesModel by homeowner_id
  /// 
  /// This method looks up a record using a homeowner_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<HomeownerLocationUpdatesModel?> getByHomeownerId(String homeownerId) async {
    final result = await client
        .from('homeowner_location_updates')
        .select().eq('homeowner_id', homeownerId)
        .maybeSingle();
    
    if (result == null) return null;
    return HomeownerLocationUpdatesModel.fromJson(result);
  }

  /// Get a HomeownerLocationUpdatesModel by created_at
  /// 
  /// This method looks up a record using a created_at field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<HomeownerLocationUpdatesModel?> getByCreatedAt(String createdAt) async {
    final result = await client
        .from('homeowner_location_updates')
        .select().eq('created_at', createdAt)
        .maybeSingle();
    
    if (result == null) return null;
    return HomeownerLocationUpdatesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(HomeownerLocationUpdatesModel model) {
    // Validate check constraints
    // 2200_17699_1_not_null: Database CHECK constraint
    // 2200_17699_2_not_null: Database CHECK constraint
    // 2200_17699_3_not_null: Database CHECK constraint
    // 2200_17699_4_not_null: Database CHECK constraint
    // 2200_17699_5_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
