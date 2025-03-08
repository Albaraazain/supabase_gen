import 'package:supabase_flutter/supabase_flutter.dart';

/// Base repository class that all generated repositories extend
abstract class BaseRepository<T> {
  final SupabaseClient client;
  final String tableName;

  const BaseRepository(this.client, this.tableName);

  /// Get the base query builder for this table
  SupabaseQueryBuilder get query => client.from(tableName);

  /// Convert a JSON map to a model instance
  T fromJson(Map<String, dynamic> json);
}
