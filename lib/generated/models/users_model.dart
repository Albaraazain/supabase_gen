
class UsersModel {
  final String id;
  final String username;
  final String fullName;
  final String? bio;
  final String? avatarUrl;
  final int skillLevel;
  final int gamesHosted;
  final int gamesJoined;
  final int wins;
  final int losses;
  final int draws;
  final int mvpCount;
  final String createdAt;
  final String updatedAt;

  UsersModel({
    required this.id,
    required this.username,
    required this.fullName,
    this.bio,
    this.avatarUrl,
    required this.skillLevel,
    required this.gamesHosted,
    required this.gamesJoined,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.mvpCount,
    required this.createdAt,
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

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      fullName: json['full_name'] ?? '',
      bio: json['bio'],
      avatarUrl: json['avatar_url'],
      skillLevel: json['skill_level'] ?? 0,
      gamesHosted: json['games_hosted'] ?? 0,
      gamesJoined: json['games_joined'] ?? 0,
      wins: json['wins'] ?? 0,
      losses: json['losses'] ?? 0,
      draws: json['draws'] ?? 0,
      mvpCount: json['mvp_count'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['username'] = username;
    json['full_name'] = fullName;
    if (bio != null) {
      json['bio'] = bio;
    }
    if (avatarUrl != null) {
      json['avatar_url'] = avatarUrl;
    }
    json['skill_level'] = skillLevel;
    json['games_hosted'] = gamesHosted;
    json['games_joined'] = gamesJoined;
    json['wins'] = wins;
    json['losses'] = losses;
    json['draws'] = draws;
    json['mvp_count'] = mvpCount;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    return json;
  }

  UsersModel copyWith({
    String? id,
    String? username,
    String? fullName,
    String? bio,
    String? avatarUrl,
    int? skillLevel,
    int? gamesHosted,
    int? gamesJoined,
    int? wins,
    int? losses,
    int? draws,
    int? mvpCount,
    String? createdAt,
    String? updatedAt,
  }) {
    return UsersModel(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      bio: bio ?? this.bio,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      skillLevel: skillLevel ?? this.skillLevel,
      gamesHosted: gamesHosted ?? this.gamesHosted,
      gamesJoined: gamesJoined ?? this.gamesJoined,
      wins: wins ?? this.wins,
      losses: losses ?? this.losses,
      draws: draws ?? this.draws,
      mvpCount: mvpCount ?? this.mvpCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
