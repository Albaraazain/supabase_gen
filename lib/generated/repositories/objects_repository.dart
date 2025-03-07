import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/objects_model.dart';
import 'base_repository.dart';

/// Repository for the objects table
class ObjectsRepository extends BaseRepository {
  const ObjectsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'objects';

  /// Find a record by its primary key
  Future<ObjectsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return ObjectsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<ObjectsModel>> findAll({
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
    return response.map((json) => ObjectsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<ObjectsModel> insert(ObjectsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return ObjectsModel.fromJson(response);
  }

  /// Update an existing record
  Future<ObjectsModel?> update(ObjectsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return ObjectsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<ObjectsModel> upsert(ObjectsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return ObjectsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related storage.buckets records
  /// based on the bucket_id foreign key
  Future<List<BucketsModel>> findByBucketId(String? bucketId) async {
    final response = await client
        .from('buckets')
        .select()
        .eq('id', bucketId);

    return response.map((json) => BucketsModel.fromJson(json)).toList();
  }

}
