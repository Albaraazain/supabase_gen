import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/services_model.dart';
import '../models/service_categories_model.dart';
import 'base_repository.dart';

/// Repository for the services table
class ServicesRepository extends BaseRepository {
  const ServicesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'services';

  /// Find a record by its primary key
  Future<ServicesModel?> find(String serviceId) async {
    final response = await query
        .select()
        .eq('service_id', serviceId)
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ServicesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ServicesModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
  }) async {
    var query = this.query.select();

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (limit != null) {
      query = query.limit(limit) as PostgrestFilterBuilder<PostgrestList>;
    }

    if (offset != null) {
      query = query.range(offset, offset + (limit ?? 10) - 1) as PostgrestFilterBuilder<PostgrestList>;
    }

    final response = await query;
    return response.map((json) => ServicesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ServicesModel> insert(ServicesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ServicesModel.fromJson(response);
  }

  /// Update an existing record
  Future<ServicesModel?> update(ServicesModel model) async {
    final updateQuery = query.update(model.toJson())
        .eq('service_id', model.serviceId)
    ;
    final response = await updateQuery.select().maybeSingle();

    if (response == null) return null;
    return ServicesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ServicesModel> upsert(ServicesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ServicesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String serviceId) async {
    final deleteQuery = query.delete()
        .eq('service_id', serviceId)
    ;
    await deleteQuery;
  }

  /// Find related service_categories records
  /// based on the category_id foreign key
  Future<List<ServiceCategoriesModel>> findByCategoryId(String categoryId) async {
    final response = await client
        .from('service_categories')
        .select()
        .eq('category_id', categoryId as Object);

    return response.map((json) => ServiceCategoriesModel.fromJson(json)).toList();
  }

}
