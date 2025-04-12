import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/variable_costs_model.dart';
import 'base_repository.dart';

/// Repository for the variable_costs table
class VariableCostsRepository extends BaseRepository<VariableCostsModel> {
  const VariableCostsRepository(SupabaseClient client) : super(client, 'variable_costs');

  @override
  VariableCostsModel fromJson(Map<String, dynamic> json) => VariableCostsModel.fromJson(json);

  @override
  Future<List<VariableCostsModel>> findAll({
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
  Future<VariableCostsModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<VariableCostsModel> insert(VariableCostsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<VariableCostsModel?> update(VariableCostsModel model) async {
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
  Future<VariableCostsModel> upsert(VariableCostsModel model) async {
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
