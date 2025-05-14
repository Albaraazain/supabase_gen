
class GamePlayersModel {
  final String id;
  final String gameId;
  final String userId;
  final String team;
  final String? position;
  final String status;
  final String joinedAt;
  final String? positionData;

  GamePlayersModel({
    required this.id,
    required this.gameId,
    required this.userId,
    required this.team,
    this.position,
    required this.status,
    required this.joinedAt,
    this.positionData,
  });

  factory GamePlayersModel.fromJson(Map<String, dynamic> json) {
    return GamePlayersModel(
      id: json['id'] ?? '',
      gameId: json['game_id'] ?? '',
      userId: json['user_id'] ?? '',
      team: json['team'] ?? '',
      position: json['position'],
      status: json['status'] ?? '',
      joinedAt: json['joined_at'] ?? '',
      positionData: json['position_data'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['game_id'] = gameId;
    json['user_id'] = userId;
    json['team'] = team;
    if (position != null) {
      json['position'] = position;
    }
    json['status'] = status;
    json['joined_at'] = joinedAt;
    if (positionData != null) {
      json['position_data'] = positionData;
    }
    return json;
  }

  GamePlayersModel copyWith({
    String? id,
    String? gameId,
    String? userId,
    String? team,
    String? position,
    String? status,
    String? joinedAt,
    String? positionData,
  }) {
    return GamePlayersModel(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      userId: userId ?? this.userId,
      team: team ?? this.team,
      position: position ?? this.position,
      status: status ?? this.status,
      joinedAt: joinedAt ?? this.joinedAt,
      positionData: positionData ?? this.positionData,
    );
  }
}
