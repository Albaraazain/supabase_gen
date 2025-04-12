import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/bills_model.dart';
import '../models/customers_model.dart';
import 'base_repository.dart';

/// Repository for the bills table
class BillsRepository extends BaseRepository<BillsModel> {
  const BillsRepository(SupabaseClient client) : super(client, 'bills');

  @override
  BillsModel fromJson(Map<String, dynamic> json) => BillsModel.fromJson(json);

  @override
  Future<List<BillsModel>> findAll({
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
  Future<BillsModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<BillsModel> insert(BillsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<BillsModel?> update(BillsModel model) async {
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
  Future<BillsModel> upsert(BillsModel model) async {
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

  /// Find related customers records
  /// based on the customer_id foreign key
  Future<List<CustomersModel>> findByCustomerId(String? customerId) async {
    final queryBuilder = client
        .from('customers')
        .select()
        .eq('id', customerId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => CustomersModel.fromJson(json)).toList();
  }

  /// Find bills records by customer_id
  /// with support for pagination, sorting, and additional filters
  Future<List<BillsModel>> findByCustomerIdField(
    String? customerId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    var filters = <String, dynamic>{
      'customer_id': customerId,
    };

    if (additionalFilters != null) {
      filters.addAll(additionalFilters);
    }

    return findAll(
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      ascending: ascending,
      filters: filters,
    );
  }

}
