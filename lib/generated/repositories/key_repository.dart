import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/key_model.dart';
import 'base_repository.dart';

/// Repository for This table holds metadata for derived keys given a key_id and key_context. The raw key is never stored.
class KeyRepository extends BaseRepository {
  const KeyRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'key';

  /// Get all records from this table
  Future<List<KeyModel>> findAll({
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
    return response.map((json) => KeyModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<KeyModel> insert(KeyModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return KeyModel.fromJson(response);
  }

  /// Insert or update a record
  Future<KeyModel> upsert(KeyModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return KeyModel.fromJson(response);
  }

}
