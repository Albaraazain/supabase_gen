import 'dart:convert';

class MigrationsModel {
  final String version;
  final String version;
  final DateTime insertedAt;
  final DateTime insertedAt;

  const MigrationsModel({
    required this.version,
    required this.version,
    required this.insertedAt,
    required this.insertedAt,
  });

  factory MigrationsModel.fromJson(Map<String, dynamic> json) {
    return MigrationsModel(
      version: json['version'] ?? '',
      version: json['version'] ?? '',
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : DateTime.now(),
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'version': version,
      'inserted_at': insertedAt.toIso8601String(),
      'inserted_at': insertedAt.toIso8601String(),
    };
  }

  MigrationsModel copyWith({
    String? version,
    String? version,
    DateTime? insertedAt,
    DateTime? insertedAt,
  }) {
    return MigrationsModel(
      version: version ?? this.version,
      version: version ?? this.version,
      insertedAt: insertedAt ?? this.insertedAt,
      insertedAt: insertedAt ?? this.insertedAt,
    );
  }
}
