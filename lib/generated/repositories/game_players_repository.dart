import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/game_players_model.dart';
import 'base_repository.dart';

/// Repository for the game_players table
class GamePlayersRepository extends BaseRepository<GamePlayersModel> {
  const GamePlayersRepository(SupabaseClient client) : super(client, 'game_players');

  @override
  GamePlayersModel fromJson(Map<String, dynamic> json) => GamePlayersModel.fromJson(json);

  @override
  Future<List<GamePlayersModel>> findAll({
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
  Future<GamePlayersModel?> find(String id) async {
    final response = await query.select()
        .eq('id', id)
        .maybeSingle();

    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert a new record
  Future<GamePlayersModel> insert(GamePlayersModel model) async {
    final response = await query.insert(model.toJson()).select().single();
    return fromJson(response);
  }

  /// Update an existing record
  Future<GamePlayersModel?> update(GamePlayersModel model) async {
    final queryBuilder = query.update(model.toJson())
        .eq('id', model.id)
        .select()
        .maybeSingle();

    final response = await queryBuilder;
    if (response == null) return null;
    return fromJson(response);
  }

  /// Insert or update a record
  Future<GamePlayersModel> upsert(GamePlayersModel model) async {
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
