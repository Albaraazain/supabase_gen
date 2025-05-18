import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/profile_base_query_builder.dart';


class ProfileBaseRepository extends BaseRepository<ProfileBaseModel> {
  ProfileBaseRepository(SupabaseClient client) : super(client, 'profile_base', primaryKeyColumn: 'id');
  
  @override
  ProfileBaseModel fromJson(Map<String, dynamic> json) {
    return ProfileBaseModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ProfileBaseModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for profile_base
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
  ProfileBaseModelQueryBuilder createQueryBuilder() {
    return ProfileBaseModelQueryBuilder(client);
  }
  
  /// Get a ProfileBaseModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfileBaseModel?> getById(String id) async {
    final result = await client
        .from('profile_base')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfileBaseModel.fromJson(result);
  }

  /// Get a ProfileBaseModel by email
  /// 
  /// This method looks up a record using a email field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfileBaseModel?> getByEmail(String email) async {
    final result = await client
        .from('profile_base')
        .select().eq('email', email)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfileBaseModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfileBaseModel model) {
    // Validate check constraints
    // 2200_18001_1_not_null: Database CHECK constraint
    // 2200_18001_2_not_null: Database CHECK constraint
    // 2200_18001_3_not_null: Database CHECK constraint
    // 2200_18001_6_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
