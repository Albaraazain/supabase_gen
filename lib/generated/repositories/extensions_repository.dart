import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/extensions_model.dart';
import 'base_repository.dart';

/// Repository for the extensions table
class ExtensionsRepository extends BaseRepository {
  const ExtensionsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'extensions';

  /// Get all records from this table
  Future<List<ExtensionsModel>> findAll({
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
    return response.map((json) => ExtensionsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ExtensionsModel> insert(ExtensionsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ExtensionsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ExtensionsModel> upsert(ExtensionsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ExtensionsModel.fromJson(response);
  }

}
