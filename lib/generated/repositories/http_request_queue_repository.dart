import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/http_request_queue_model.dart';
import 'base_repository.dart';

/// Repository for the http_request_queue table
class HttpRequestQueueRepository extends BaseRepository {
  const HttpRequestQueueRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'http_request_queue';

  /// Get all records from this table
  Future<List<HttpRequestQueueModel>> findAll({
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
    return response.map((json) => HttpRequestQueueModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<HttpRequestQueueModel> insert(HttpRequestQueueModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return HttpRequestQueueModel.fromJson(response);
  }

  /// Insert or update a record
  Future<HttpRequestQueueModel> upsert(HttpRequestQueueModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return HttpRequestQueueModel.fromJson(response);
  }

}
