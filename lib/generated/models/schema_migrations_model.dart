import 'dart:convert';

/// Auth: Manages updates to the auth system.
class SchemaMigrationsModel {
  final int version;
  final int version;
  final int version;
  final DateTime? insertedAt;
  final DateTime? insertedAt;
  final DateTime? insertedAt;

  const SchemaMigrationsModel({
    required this.version,
    required this.version,
    required this.version,
    this.insertedAt,
    this.insertedAt,
    this.insertedAt,
  });

  factory SchemaMigrationsModel.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsModel(
      version: json['version'] ?? 0,
      version: json['version'] ?? 0,
      version: json['version'] ?? 0,
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : null,
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : null,
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'version': version,
      'version': version,
      'inserted_at': insertedAt?.toIso8601String(),
      'inserted_at': insertedAt?.toIso8601String(),
      'inserted_at': insertedAt?.toIso8601String(),
    };
  }

  SchemaMigrationsModel copyWith({
    int? version,
    int? version,
    int? version,
    DateTime? insertedAt,
    DateTime? insertedAt,
    DateTime? insertedAt,
  }) {
    return SchemaMigrationsModel(
      version: version ?? this.version,
      version: version ?? this.version,
      version: version ?? this.version,
      insertedAt: insertedAt ?? this.insertedAt,
      insertedAt: insertedAt ?? this.insertedAt,
      insertedAt: insertedAt ?? this.insertedAt,
    );
  }
}
