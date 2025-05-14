
class PlayerStatsModel {
  final String id;
  final String userId;
  final int totalGames;
  final int wins;
  final int draws;
  final int losses;
  final int goals;
  final int assists;
  final int yellowCards;
  final int redCards;
  final int mvpCount;
  final String updatedAt;

  PlayerStatsModel({
    required this.id,
    required this.userId,
    required this.totalGames,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.goals,
    required this.assists,
    required this.yellowCards,
    required this.redCards,
    required this.mvpCount,
    required this.updatedAt,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory PlayerStatsModel.fromJson(Map<String, dynamic> json) {
    return PlayerStatsModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      totalGames: json['total_games'] ?? 0,
      wins: json['wins'] ?? 0,
      draws: json['draws'] ?? 0,
      losses: json['losses'] ?? 0,
      goals: json['goals'] ?? 0,
      assists: json['assists'] ?? 0,
      yellowCards: json['yellow_cards'] ?? 0,
      redCards: json['red_cards'] ?? 0,
      mvpCount: json['mvp_count'] ?? 0,
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['user_id'] = userId;
    json['total_games'] = totalGames;
    json['wins'] = wins;
    json['draws'] = draws;
    json['losses'] = losses;
    json['goals'] = goals;
    json['assists'] = assists;
    json['yellow_cards'] = yellowCards;
    json['red_cards'] = redCards;
    json['mvp_count'] = mvpCount;
    json['updated_at'] = updatedAt;
    return json;
  }

  PlayerStatsModel copyWith({
    String? id,
    String? userId,
    int? totalGames,
    int? wins,
    int? draws,
    int? losses,
    int? goals,
    int? assists,
    int? yellowCards,
    int? redCards,
    int? mvpCount,
    String? updatedAt,
  }) {
    return PlayerStatsModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      totalGames: totalGames ?? this.totalGames,
      wins: wins ?? this.wins,
      draws: draws ?? this.draws,
      losses: losses ?? this.losses,
      goals: goals ?? this.goals,
      assists: assists ?? this.assists,
      yellowCards: yellowCards ?? this.yellowCards,
      redCards: redCards ?? this.redCards,
      mvpCount: mvpCount ?? this.mvpCount,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
