
class GamesModel {
  final String id;
  final String title;
  final String hostId;
  final String gameType;
  final String status;
  final String date;
  final String location;
  final String? locationCoordinates;
  final int maxPlayers;
  final int skillLevel;
  final String description;
  final String createdAt;
  final String updatedAt;
  final String? address;
  final String? latitude;
  final String? longitude;

  GamesModel({
    required this.id,
    required this.title,
    required this.hostId,
    required this.gameType,
    required this.status,
    required this.date,
    required this.location,
    this.locationCoordinates,
    required this.maxPlayers,
    required this.skillLevel,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    this.address,
    this.latitude,
    this.longitude,
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

  factory GamesModel.fromJson(Map<String, dynamic> json) {
    return GamesModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      hostId: json['host_id'] ?? '',
      gameType: json['game_type'] ?? '',
      status: json['status'] ?? '',
      date: json['date'] ?? '',
      location: json['location'] ?? '',
      locationCoordinates: json['location_coordinates'],
      maxPlayers: json['max_players'] ?? 0,
      skillLevel: json['skill_level'] ?? 0,
      description: json['description'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['host_id'] = hostId;
    json['game_type'] = gameType;
    json['status'] = status;
    json['date'] = date;
    json['location'] = location;
    if (locationCoordinates != null) {
      json['location_coordinates'] = locationCoordinates;
    }
    json['max_players'] = maxPlayers;
    json['skill_level'] = skillLevel;
    json['description'] = description;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    if (address != null) {
      json['address'] = address;
    }
    if (latitude != null) {
      json['latitude'] = latitude;
    }
    if (longitude != null) {
      json['longitude'] = longitude;
    }
    return json;
  }

  GamesModel copyWith({
    String? id,
    String? title,
    String? hostId,
    String? gameType,
    String? status,
    String? date,
    String? location,
    String? locationCoordinates,
    int? maxPlayers,
    int? skillLevel,
    String? description,
    String? createdAt,
    String? updatedAt,
    String? address,
    String? latitude,
    String? longitude,
  }) {
    return GamesModel(
      id: id ?? this.id,
      title: title ?? this.title,
      hostId: hostId ?? this.hostId,
      gameType: gameType ?? this.gameType,
      status: status ?? this.status,
      date: date ?? this.date,
      location: location ?? this.location,
      locationCoordinates: locationCoordinates ?? this.locationCoordinates,
      maxPlayers: maxPlayers ?? this.maxPlayers,
      skillLevel: skillLevel ?? this.skillLevel,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
