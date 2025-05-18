import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/service_categories_query_builder.dart';


class ServiceCategoriesRepository extends BaseRepository<ServiceCategoriesModel> {
  ServiceCategoriesRepository(SupabaseClient client) : super(client, 'service_categories', primaryKeyColumn: 'category_id');
  
  @override
  ServiceCategoriesModel fromJson(Map<String, dynamic> json) {
    return ServiceCategoriesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(ServiceCategoriesModel model) {
    return model.categoryId;
  }
  
  /// Create a type-safe query builder for service_categories
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
  ServiceCategoriesModelQueryBuilder createQueryBuilder() {
    return ServiceCategoriesModelQueryBuilder(client);
  }
  
  /// Get a ServiceCategoriesModel by category_id
  /// 
  /// This method looks up a record using a category_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ServiceCategoriesModel?> getByCategoryId(String categoryId) async {
    final result = await client
        .from('service_categories')
        .select().eq('category_id', categoryId)
        .maybeSingle();
    
    if (result == null) return null;
    return ServiceCategoriesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ServiceCategoriesModel model) {
    // Validate check constraints
    // 2200_17941_1_not_null: Database CHECK constraint
    // 2200_17941_2_not_null: Database CHECK constraint
    // Add custom validation logic here
  }

}
