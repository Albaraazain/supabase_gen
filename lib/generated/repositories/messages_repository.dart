import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/messages_model.dart';
import 'base_repository.dart';

/// Repository for the messages table
class MessagesRepository extends BaseRepository {
  const MessagesRepository(SupabaseClient client) : super(client);

  @override
  String get tableName => 'messages';

  /// Find a record by its primary key
  Future<MessagesModel?> find(DateTime insertedAt, String id) async {
    final response = await query
        .eq('inserted_at', insertedAt)
        .eq('id', id)
        .select()
        .limit(1)
        .maybeSingle();

    if (response == null) return null;
    return MessagesModel.fromJson(response);
  }

  /// Get all records from this table
  Future<List<MessagesModel>> findAll({
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
    return response.map((json) => MessagesModel.fromJson(json)).toList();
  }

  /// Insert a new record
  Future<MessagesModel> insert(MessagesModel model) async {
    final response = await query
        .insert(model.toJson())
        .select()
        .single();

    return MessagesModel.fromJson(response);
  }

  /// Update an existing record
  Future<MessagesModel?> update(MessagesModel model) async {
    final response = await query
        .eq('inserted_at', model.insertedAt)
        .eq('id', model.id)
        .update(model.toJson())
        .select()
        .maybeSingle();

    if (response == null) return null;
    return MessagesModel.fromJson(response);
  }

  /// Insert or update a record
  Future<MessagesModel> upsert(MessagesModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return MessagesModel.fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(DateTime insertedAt, String id) async {
    await query
        .eq('inserted_at', insertedAt)
        .eq('id', id)
        .delete();
  }

}
