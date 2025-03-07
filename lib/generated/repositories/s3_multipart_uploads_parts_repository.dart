import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/s3_multipart_uploads_parts_model.dart';
import 'base_repository.dart';

/// Repository for the s3_multipart_uploads_parts table
class S3MultipartUploadsPartsRepository extends BaseRepository {
  const S3MultipartUploadsPartsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 's3_multipart_uploads_parts';

  /// Find a record by its primary key
  Future<S3MultipartUploadsPartsModel?> find(String id) async {
    final response = await query
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return S3MultipartUploadsPartsModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<S3MultipartUploadsPartsModel>> findAll({
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
    return response.map((json) => S3MultipartUploadsPartsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<S3MultipartUploadsPartsModel> insert(S3MultipartUploadsPartsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return S3MultipartUploadsPartsModel.fromJson(response);
  }

  /// Update an existing record
  Future<S3MultipartUploadsPartsModel?> update(S3MultipartUploadsPartsModel model) async {
    final response = await query
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return S3MultipartUploadsPartsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<S3MultipartUploadsPartsModel> upsert(S3MultipartUploadsPartsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return S3MultipartUploadsPartsModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    await query
        .eq('id', id)
        .delete();
  }

  /// Find related storage.s3_multipart_uploads records
  /// based on the upload_id foreign key
  Future<List<S3MultipartUploadsModel>> findByUploadId(String uploadId) async {
    final response = await client
        .from('s3_multipart_uploads')
        .select()
        .eq('id', uploadId);

    return response.map((json) => S3MultipartUploadsModel.fromJson(json)).toList();
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
