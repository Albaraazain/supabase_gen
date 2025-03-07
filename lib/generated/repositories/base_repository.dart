import 'package:supabase_flutter/supabase_flutter.dart';

/// Base repository class that all generated repositories extend
abstract class BaseRepository {
  final SupabaseClient client;

  const BaseRepository(this.client);

  /// Get the table name for this repository
  String get tableName;

  /// Get a query builder for this table
  PostgrestQueryBuilder get query => client.from(tableName);
}
