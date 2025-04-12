import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/documents_model.dart';
import 'base_repository.dart';

/// Repository for the documents table
class DocumentsRepository extends BaseRepository<DocumentsModel> {
  const DocumentsRepository(SupabaseClient client) : super(client, 'documents');

  @override
  DocumentsModel fromJson(Map<String, dynamic> json) => DocumentsModel.fromJson(json);

  @override
  Future<List<DocumentsModel>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
  }) async {
    return super.findAll(
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      ascending: ascending,
      filters: filters,
    );
  }

  /// Find a record by its primary key
  Future<DocumentsModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<DocumentsModel> insert(DocumentsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<DocumentsModel?> update(DocumentsModel model) async {
    if (model.id == null) {
      throw ArgumentError("Primary key id cannot be null for update operation");
    }
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id!)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<DocumentsModel> upsert(DocumentsModel model) async {
    final response = await query
        .upsert(model.toJson())
        .select()
        .single();

    return fromJson(response);
  }

  /// Delete a record by its primary key
  Future<void> delete(String id) async {
    final queryBuilder = query.delete()
        .eq('id', id)
        ;
    await queryBuilder;
  }

}
