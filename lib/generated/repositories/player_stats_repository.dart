import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/player_stats_model.dart';
import 'base_repository.dart';

/// Repository for the player_stats table
class PlayerStatsRepository extends BaseRepository<PlayerStatsModel> {
  const PlayerStatsRepository(SupabaseClient client) : super(client, 'player_stats');

  @override
  PlayerStatsModel fromJson(Map<String, dynamic> json) => PlayerStatsModel.fromJson(json);

  @override
  Future<List<PlayerStatsModel>> findAll({
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
  Future<PlayerStatsModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<PlayerStatsModel> insert(PlayerStatsModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<PlayerStatsModel?> update(PlayerStatsModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<PlayerStatsModel> upsert(PlayerStatsModel model) async {
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
