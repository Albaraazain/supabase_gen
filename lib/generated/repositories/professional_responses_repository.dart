import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/professional_responses_query_builder.dart';


class ProfessionalResponsesRepository extends BaseRepository<ProfessionalResponsesModel> {
  ProfessionalResponsesRepository(SupabaseClient client) : super(client, 'professional_responses');
  
  @override
  ProfessionalResponsesModel fromJson(Map<String, dynamic> json) {
    return ProfessionalResponsesModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for professional_responses
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
  ProfessionalResponsesModelQueryBuilder createQueryBuilder() {
    return ProfessionalResponsesModelQueryBuilder(client);
  }
  
  /// Get a ProfessionalResponsesModel by response_id
  /// 
  /// This method looks up a record using a response_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalResponsesModel?> getByResponseId(String responseId) async {
    final result = await client
        .from('professional_responses')
        .select().eq('response_id', responseId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalResponsesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfessionalResponsesModel model) {
    // Validate check constraints
    // 2200_17870_1_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
