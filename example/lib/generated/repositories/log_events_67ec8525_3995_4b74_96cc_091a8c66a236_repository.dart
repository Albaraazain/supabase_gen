import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/log_events_67ec8525_3995_4b74_96cc_091a8c66a236_model.dart';
import 'base_repository.dart';

/// Repository for the log_events_67ec8525_3995_4b74_96cc_091a8c66a236 table
class LogEvents67ec852539954b7496cc091a8c66a236Repository extends BaseRepository<LogEvents67ec852539954b7496cc091a8c66a236Model> {
  const LogEvents67ec852539954b7496cc091a8c66a236Repository(SupabaseClient client) : super(client, 'log_events_67ec8525_3995_4b74_96cc_091a8c66a236');

  @override
  LogEvents67ec852539954b7496cc091a8c66a236Model fromJson(Map<String, dynamic> json) => LogEvents67ec852539954b7496cc091a8c66a236Model.fromJson(json);

  /// Find a record by its primary key
  Future<LogEvents67ec852539954b7496cc091a8c66a236Model?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Get all records from this table with pagination and sorting
  Future<List<LogEvents67ec852539954b7496cc091a8c66a236Model>> findAll({
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
  Future<LogEvents67ec852539954b7496cc091a8c66a236Model> insert(LogEvents67ec852539954b7496cc091a8c66a236Model model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<LogEvents67ec852539954b7496cc091a8c66a236Model?> update(LogEvents67ec852539954b7496cc091a8c66a236Model model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<LogEvents67ec852539954b7496cc091a8c66a236Model> upsert(LogEvents67ec852539954b7496cc091a8c66a236Model model) async {
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
