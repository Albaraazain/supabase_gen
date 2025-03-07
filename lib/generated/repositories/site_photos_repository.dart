import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/site_photos_model.dart';
import 'base_repository.dart';

/// Repository for the site_photos table
class SitePhotosRepository extends BaseRepository {
  const SitePhotosRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'site_photos';

  /// Find a record by its primary key
  Future<SitePhotosModel?> find(String photoId) async {
    final response = await query
        .eq('photo_id', photoId)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return SitePhotosModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<SitePhotosModel>> findAll({
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
    return response.map((json) => SitePhotosModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SitePhotosModel> insert(SitePhotosModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SitePhotosModel.fromJson(response);
  }

  /// Update an existing record
  Future<SitePhotosModel?> update(SitePhotosModel model) async {
    final response = await query
        .eq('photo_id', model.photoId)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return SitePhotosModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SitePhotosModel> upsert(SitePhotosModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SitePhotosModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String photoId) async {
    await query
        .eq('photo_id', photoId)
        .delete();
  }

  /// Find related public.jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final response = await client
        .from('jobs')
        .select()
        .eq('job_id', jobId);

    return response.map((json) => JobsModel.fromJson(json)).toList();
  }

}
