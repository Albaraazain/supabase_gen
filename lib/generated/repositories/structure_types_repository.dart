import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/structure_types_model.dart';
import 'base_repository.dart';

/// Repository for the structure_types table
class StructureTypesRepository extends BaseRepository<StructureTypesModel> {
  const StructureTypesRepository(SupabaseClient client) : super(client, 'structure_types');

  @override
  StructureTypesModel fromJson(Map<String, dynamic> json) => StructureTypesModel.fromJson(json);

  @override
  Future<List<StructureTypesModel>> findAll({
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
  Future<StructureTypesModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<StructureTypesModel> insert(StructureTypesModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<StructureTypesModel?> update(StructureTypesModel model) async {
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
  Future<StructureTypesModel> upsert(StructureTypesModel model) async {
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
