import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/customers_model.dart';
import 'base_repository.dart';

/// Repository for the customers table
class CustomersRepository extends BaseRepository<CustomersModel> {
  const CustomersRepository(SupabaseClient client) : super(client, 'customers');

  @override
  CustomersModel fromJson(Map<String, dynamic> json) => CustomersModel.fromJson(json);

  @override
  Future<List<CustomersModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
  }) async {
    return super.findAll(
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      ascending: ascending,
      filters: filters,
    );
  }

  /// Find a record by its primary key
  Future<CustomersModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<CustomersModel> insert(CustomersModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<CustomersModel?> update(CustomersModel model) async {
    if (model.id == null) {
      throw ArgumentError("Primary key id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<CustomersModel> upsert(CustomersModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

}
