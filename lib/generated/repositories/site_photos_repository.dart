import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/site_photos_model.dart';
import '../models/jobs_model.dart';
import 'base_repository.dart';

/// Repository for the site_photos table
class SitePhotosRepository extends BaseRepository<SitePhotosModel> {
  const SitePhotosRepository(SupabaseClient client) : super(client, 'site_photos');

  @override
  SitePhotosModel fromJson(Map<String, dynamic> json) => SitePhotosModel.fromJson(json);

  /// Find a record by its primary key
  Future<SitePhotosModel?> find(String photoId) async {
    final response = await query.select()
        .eq('photo_id', photoId)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<SitePhotosModel>> findAll({
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
  Future<SitePhotosModel> insert(SitePhotosModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<SitePhotosModel?> update(SitePhotosModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('photo_id', model.photoId)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SitePhotosModel> upsert(SitePhotosModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String photoId) async {
    final queryBuilder = query.delete()
        .eq('photo_id', photoId)
        ;
    await queryBuilder;
  }

  /// Find related jobs records
  /// based on the job_id foreign key
  Future<List<JobsModel>> findByJobId(String? jobId) async {
    final queryBuilder = client
        .from('jobs')
        .select()
        .eq('job_id', jobId as Object);

    final response = await queryBuilder;
    return (response as List).map((json) => JobsModel.fromJson(json)).toList();
  }

}
