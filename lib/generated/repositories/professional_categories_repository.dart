import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/professional_categories_query_builder.dart';


class ProfessionalCategoriesRepository extends BaseRepository<ProfessionalCategoriesModel> {
  ProfessionalCategoriesRepository(SupabaseClient client) : super(client, 'professional_categories', primaryKeyColumn: 'id');
  
  @override
  ProfessionalCategoriesModel fromJson(Map<String, dynamic> json) {
    return ProfessionalCategoriesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ProfessionalCategoriesModel model) {
    return model.id;
  }
  
  /// Create a type-safe query builder for professional_categories
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
  ProfessionalCategoriesModelQueryBuilder createQueryBuilder() {
    return ProfessionalCategoriesModelQueryBuilder(client);
  }
  
  /// Get a ProfessionalCategoriesModel by id
  /// 
  /// This method looks up a record using a id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalCategoriesModel?> getById(String id) async {
    final result = await client
        .from('professional_categories')
        .select().eq('id', id)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalCategoriesModel.fromJson(result);
  }

  /// Get a ProfessionalCategoriesModel by professional_id
  /// 
  /// This method looks up a record using a professional_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalCategoriesModel?> getByProfessionalId(String professionalId) async {
    final result = await client
        .from('professional_categories')
        .select().eq('professional_id', professionalId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalCategoriesModel.fromJson(result);
  }

  /// Get a ProfessionalCategoriesModel by category_id
  /// 
  /// This method looks up a record using a category_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ProfessionalCategoriesModel?> getByCategoryId(String categoryId) async {
    final result = await client
        .from('professional_categories')
        .select().eq('category_id', categoryId)
        .maybeSingle();
    
    if (result == null) return null;
    return ProfessionalCategoriesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ProfessionalCategoriesModel model) {
    // Validate check constraints
    // 2200_23208_1_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
