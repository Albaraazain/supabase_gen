import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service_categories_model.dart';
import 'base_repository.dart';

/// Repository for the service_categories table
class ServiceCategoriesRepository extends BaseRepository<ServiceCategoriesModel> {
  const ServiceCategoriesRepository(SupabaseClient client) : super(client, 'service_categories');

  @override
  ServiceCategoriesModel fromJson(Map<String, dynamic> json) => ServiceCategoriesModel.fromJson(json);

  /// Find a record by its primary key
  Future<ServiceCategoriesModel?> find(String categoryId) async {
    final response = await query.select()
        .eq('category_id', categoryId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ServiceCategoriesModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    dynamic queryBuilder = query.select();

    if (orderBy != null) {
      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      queryBuilder = queryBuilder.limit(limit);
    }

    if (offset != null) {
      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await queryBuilder;
    return (response as List).map((json) => fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ServiceCategoriesModel> insert(ServiceCategoriesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ServiceCategoriesModel?> update(ServiceCategoriesModel model) async {
    if (model.categoryId == null) {
      throw ArgumentError("Primary key category_id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('category_id', model.categoryId!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ServiceCategoriesModel> upsert(ServiceCategoriesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String categoryId) async {
    final queryBuilder = query.delete()
        .eq('category_id', categoryId)
        ;
    await queryBuilder;
  }

}
