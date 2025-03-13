import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/secrets_model.dart';
import 'base_repository.dart';

/// Repository for the secrets table
class SecretsRepository extends BaseRepository<SecretsModel> {
  const SecretsRepository(SupabaseClient client) : super(client, 'secrets');

  @override
  SecretsModel fromJson(Map<String, dynamic> json) => SecretsModel.fromJson(json);

  /// Get all records from this table with pagination and sorting
  Future<List<SecretsModel>> findAll({
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
  Future<SecretsModel> insert(SecretsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Insert or update a record
  Future<SecretsModel> upsert(SecretsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

}
