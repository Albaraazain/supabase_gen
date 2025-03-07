import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/service_categories_model.dart';
import 'base_repository.dart';

/// Repository for the service_categories table
class ServiceCategoriesRepository extends BaseRepository {
  const ServiceCategoriesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'service_categories';

  /// Find a record by its primary key
  Future<ServiceCategoriesModel?> find(String categoryId) async {
    final response = await query
        .eq('category_id', categoryId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ServiceCategoriesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ServiceCategoriesModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1);
    }

    final response = await query;
    return response.map((json) => ServiceCategoriesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ServiceCategoriesModel> insert(ServiceCategoriesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ServiceCategoriesModel.fromJson(response);
  }

  /// Update an existing record
  Future<ServiceCategoriesModel?> update(ServiceCategoriesModel model) async {
    final response = await query
        .eq('category_id', model.categoryId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ServiceCategoriesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ServiceCategoriesModel> upsert(ServiceCategoriesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ServiceCategoriesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String categoryId) async {
    await query
        .eq('category_id', categoryId)
        .delete();
  }

}
