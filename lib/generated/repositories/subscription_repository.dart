import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/subscription_model.dart';
import 'base_repository.dart';

/// Repository for the subscription table
class SubscriptionRepository extends BaseRepository {
  const SubscriptionRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'subscription';

  /// Get all records from this table
  Future<List<SubscriptionModel>> findAll({
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
    return response.map((json) => SubscriptionModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<SubscriptionModel> insert(SubscriptionModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return SubscriptionModel.fromJson(response);
  }

  /// Insert or update a record
  Future<SubscriptionModel> upsert(SubscriptionModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return SubscriptionModel.fromJson(response);
  }

}
