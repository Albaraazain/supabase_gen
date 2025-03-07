import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/http_response_model.dart';
import 'base_repository.dart';

/// Repository for the _http_response table
class HttpResponseRepository extends BaseRepository {
  const HttpResponseRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => '_http_response';

  /// Get all records from this table
  Future<List<HttpResponseModel>> findAll({
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
    return response.map((json) => HttpResponseModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<HttpResponseModel> insert(HttpResponseModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return HttpResponseModel.fromJson(response);
  }

  /// Insert or update a record
  Future<HttpResponseModel> upsert(HttpResponseModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return HttpResponseModel.fromJson(response);
  }

}
