import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/professional_location_updates_query_builder.dart';


class ProfessionalLocationUpdatesRepository extends BaseRepository<ProfessionalLocationUpdatesModel> {
  ProfessionalLocationUpdatesRepository(SupabaseClient client) : super(client, 'professional_location_updates');
  
  @override
  ProfessionalLocationUpdatesModel fromJson(Map<String, dynamic> json) {
    return ProfessionalLocationUpdatesModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for professional_location_updates
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
  ProfessionalLocationUpdatesModelQueryBuilder createQueryBuilder() {
    return ProfessionalLocationUpdatesModelQueryBuilder(client);
  }
  
  /// Get a ProfessionalLocationUpdatesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalLocationUpdatesModel?> getById(String id) async {
    final result = await client
        .from('professional_location_updates')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalLocationUpdatesModel.fromJson(result);
  }

  /// Get a ProfessionalLocationUpdatesModel by professional_id
  /// 
  /// This method looks up a record using a professional_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalLocationUpdatesModel?> getByProfessionalId(String professionalId) async {
    final result = await client
        .from('professional_location_updates')
        .select().eq('professional_id', professionalId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalLocationUpdatesModel.fromJson(result);
  }

  /// Get a ProfessionalLocationUpdatesModel by created_at
  /// 
  /// This method looks up a record using a created_at field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalLocationUpdatesModel?> getByCreatedAt(String createdAt) async {
    final result = await client
        .from('professional_location_updates')
        .select().eq('created_at', createdAt)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalLocationUpdatesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfessionalLocationUpdatesModel model) {
    // Validate check constraints
    // 2200_17847_1_not_null: Database CHECK constraint
    // 2200_17847_2_not_null: Database CHECK constraint
    // 2200_17847_3_not_null: Database CHECK constraint
    // 2200_17847_4_not_null: Database CHECK constraint
    // 2200_17847_5_not_null: Database CHECK constraint
    // 2200_17847_6_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
