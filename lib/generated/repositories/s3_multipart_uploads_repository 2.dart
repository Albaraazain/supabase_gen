import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/s3_multipart_uploads_model.dart';
import 'base_repository.dart';

/// Repository for the s3_multipart_uploads table
class S3MultipartUploadsRepository extends BaseRepository {
  const S3MultipartUploadsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 's3_multipart_uploads';

  /// Find a record by its primary key
  Future<S3MultipartUploadsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return S3MultipartUploadsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<S3MultipartUploadsModel>> findAll({
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
    return response.map((json) => S3MultipartUploadsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<S3MultipartUploadsModel> insert(S3MultipartUploadsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return S3MultipartUploadsModel.fromJson(response);
  }

  /// Update an existing record
  Future<S3MultipartUploadsModel?> update(S3MultipartUploadsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return S3MultipartUploadsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<S3MultipartUploadsModel> upsert(S3MultipartUploadsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return S3MultipartUploadsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related storage.buckets records
  /// based on the bucket_id foreign key
  Future<List<BucketsModel>> findByBucketId(String bucketId) async {
    final response = await client
        .from('buckets')
        .select()
        .eq('id', bucketId);

    return response.map((json) => BucketsModel.fromJson(json)).toList();
  }

}
