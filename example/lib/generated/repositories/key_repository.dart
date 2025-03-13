import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/key_model.dart';
import 'base_repository.dart';

/// Repository for the key table
class KeyRepository extends BaseRepository<KeyModel> {
  const KeyRepository(SupabaseClient client) : super(client, 'key');

  @override
  KeyModel fromJson(Map<String, dynamic> json) => KeyModel.fromJson(json);

  /// Get all records from this table with pagination and sorting
  Future<List<KeyModel>> findAll({
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
  Future<KeyModel> insert(KeyModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Insert or update a record
  Future<KeyModel> upsert(KeyModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

}
