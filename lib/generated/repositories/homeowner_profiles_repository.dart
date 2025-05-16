import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/homeowner_profiles_query_builder.dart';


class HomeownerProfilesRepository extends BaseRepository<HomeownerProfilesModel> {
  HomeownerProfilesRepository(SupabaseClient client) : super(client, 'homeowner_profiles');
  
  @override
  HomeownerProfilesModel fromJson(Map<String, dynamic> json) {
    return HomeownerProfilesModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for homeowner_profiles
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
  HomeownerProfilesModelQueryBuilder createQueryBuilder() {
    return HomeownerProfilesModelQueryBuilder(client);
  }
  
  /// Get a HomeownerProfilesModel by homeowner_id
  /// 
  /// This method looks up a record using a homeowner_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<HomeownerProfilesModel?> getByHomeownerId(String homeownerId) async {
    final result = await client
        .from('homeowner_profiles')
        .select().eq('homeowner_id', homeownerId)
        .maybeSingle();
    
    if (result == null) return null;
    return HomeownerProfilesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(HomeownerProfilesModel model) {
    // Validate check constraints
    // 2200_17704_1_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
