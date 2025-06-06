import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/user_preferences_query_builder.dart';


class UserPreferencesRepository extends BaseRepository<UserPreferencesModel> {
  UserPreferencesRepository(SupabaseClient client) : super(client, 'user_preferences', primaryKeyColumn: 'id');
  
  @override
  UserPreferencesModel fromJson(Map<String, dynamic> json) {
    return UserPreferencesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(UserPreferencesModel model) {
    return model.id;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_user_preferences_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
  ///   Signature: update_updated_at_column() RETURNS trigger
  ///   Language: plpgsql
  ///   Description: No description available
  ///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
  
  /// Create a type-safe query builder for user_preferences
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
  UserPreferencesModelQueryBuilder createQueryBuilder() {
    return UserPreferencesModelQueryBuilder(client);
  }
  
  /// Get a UserPreferencesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<UserPreferencesModel?> getById(String id) async {
    final result = await client
        .from('user_preferences')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return UserPreferencesModel.fromJson(result);
  }

  /// Get a UserPreferencesModel by user_id
  /// 
  /// This method looks up a record using a user_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<UserPreferencesModel?> getByUserId(String userId) async {
    final result = await client
        .from('user_preferences')
        .select().eq('user_id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return UserPreferencesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(UserPreferencesModel model) {
    // Validate check constraints
    // 2200_18682_1_not_null: Database CHECK constraint
    // 2200_18682_2_not_null: Database CHECK constraint
    // user_preferences_auto_accept_threshold_check: Database CHECK constraint
    // user_preferences_max_detour_km_check: Database CHECK constraint
    // user_preferences_min_rating_threshold_check: Database CHECK constraint
    // user_preferences_preferred_gender_driver_check: Database CHECK constraint
    // user_preferences_preferred_gender_passenger_check: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the user record associated with this user_preferences
  /// 
  /// This retrieves the parent user record for this user_preferences.
  /// It represents a foreign key relationship from user_preferences.user_id to profiles.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ProfilesModel?> getUser(String userId) async {
    final result = await client
        .from('profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfilesModel.fromJson(result);
  }
  
  /// Check if the user record exists for this user_preferences
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.userExists(message.userId);
  /// ```
  Future<bool> userExists(String userId) async {
    final result = await client
        .from('profiles')
        .select('id')
        .eq('id', userId)
        .maybeSingle();
    
    return result != null;
  }
}
