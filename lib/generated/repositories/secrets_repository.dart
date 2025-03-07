import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/secrets_model.dart';
import 'base_repository.dart';

/// Repository for Table with encrypted `secret` column for storing sensitive information on disk.
class SecretsRepository extends BaseRepository {
  const SecretsRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'secrets';

  /// Get all records from this table
  Future<List<SecretsModel>> findAll({
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
    return response.map((json) => SecretsModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SecretsModel> insert(SecretsModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SecretsModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SecretsModel> upsert(SecretsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SecretsModel.fromJson(response);
  }

}
