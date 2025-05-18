import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/professional_profiles_query_builder.dart';


class ProfessionalProfilesRepository extends BaseRepository<ProfessionalProfilesModel> {
  ProfessionalProfilesRepository(SupabaseClient client) : super(client, 'professional_profiles', primaryKeyColumn: 'professional_id');
  
  @override
  ProfessionalProfilesModel fromJson(Map<String, dynamic> json) {
    return ProfessionalProfilesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ProfessionalProfilesModel model) {
    return model.professionalId;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - set_default_business_name: INSERT BEFORE - EXECUTE FUNCTION handle_business_name_default()
  ///   Signature: handle_business_name_default() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for handle_business_name_default>
  /// - set_default_business_name: UPDATE BEFORE - EXECUTE FUNCTION handle_business_name_default()
  ///   Signature: handle_business_name_default() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for handle_business_name_default>
  
  /// Create a type-safe query builder for professional_profiles
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
  ProfessionalProfilesModelQueryBuilder createQueryBuilder() {
    return ProfessionalProfilesModelQueryBuilder(client);
  }
  
  /// Get a ProfessionalProfilesModel by professional_id
  /// 
  /// This method looks up a record using a professional_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalProfilesModel?> getByProfessionalId(String professionalId) async {
    final result = await client
        .from('professional_profiles')
        .select().eq('professional_id', professionalId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalProfilesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfessionalProfilesModel model) {
    // Validate check constraints
    // 2200_17853_1_not_null: Database CHECK constraint
    // 2200_17853_26_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
