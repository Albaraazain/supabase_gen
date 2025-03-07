import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/buckets_model.dart';
import 'base_repository.dart';

/// Repository for the buckets table
class BucketsRepository extends BaseRepository {
  const BucketsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'buckets';

  /// Find a record by its primary key
  Future<BucketsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return BucketsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<BucketsModel>> findAll({
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
    return response.map((json) => BucketsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<BucketsModel> insert(BucketsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return BucketsModel.fromJson(response);
  }

  /// Update an existing record
  Future<BucketsModel?> update(BucketsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return BucketsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<BucketsModel> upsert(BucketsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return BucketsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

}
