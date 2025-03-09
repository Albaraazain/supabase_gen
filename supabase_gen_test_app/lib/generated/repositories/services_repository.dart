import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/services_model.dart';
import '../models/service_categories_model.dart';
import 'base_repository.dart';

/// Repository for the services table
class ServicesRepository extends BaseRepository<ServicesModel> {
  const ServicesRepository(SupabaseClient client) : super(client, 'services');

  @override
  ServicesModel fromJson(Map<String, dynamic> json) => ServicesModel.fromJson(json);

  /// Find a record by its primary key
  Future<ServicesModel?> find(String serviceId) async {
    final response = await query.select()
        .eq('service_id', serviceId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<ServicesModel>> findAll({
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
  Future<ServicesModel> insert(ServicesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<ServicesModel?> update(ServicesModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('service_id', model.serviceId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<ServicesModel> upsert(ServicesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String serviceId) async {
    final queryBuilder = query.delete()
        .eq('service_id', serviceId)
        ;
    await queryBuilder;
  }

  /// Find related service_categories records
  /// based on the category_id foreign key
  Future<List<ServiceCategoriesModel>> findByCategoryId(String categoryId) async {
    final queryBuilder = client
        .from('service_categories')
        .select()
        .eq('category_id', categoryId);

    final response = await queryBuilder;
    return (response as List).map((json) => ServiceCategoriesModel.fromJson(json)).toList();
  }

}
