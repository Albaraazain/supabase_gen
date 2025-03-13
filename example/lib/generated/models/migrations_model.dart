
class MigrationsModel {
  final DateTime insertedAt;
  final String version;

  MigrationsModel({
    required this.insertedAt,
    required this.version,
  });

  factory MigrationsModel.fromJson(Map<String, dynamic> json) {
    return MigrationsModel(
      insertedAt: DateTime.parse(json['inserted_at'].toString()),
      version: json['version'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['inserted_at'] = insertedAt.toIso8601String();
    json['version'] = version;
    return json;
  }

  MigrationsModel copyWith({
    DateTime? insertedAt,
    String? version,
  }) {
    return MigrationsModel(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
