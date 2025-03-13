
class SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model {
  final DateTime? insertedAt;
  final int version;

  SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model({
    this.insertedAt,
    required this.version,
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

  factory SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model(
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : null,
      version: (json['version'] is String ? int.parse(json['version']) : json['version'] as int) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (insertedAt != null) {
      json['inserted_at'] = insertedAt!.toIso8601String();
    }
    json['version'] = version;
    return json;
  }

  SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model copyWith({
    DateTime? insertedAt,
    int? version,
  }) {
    return SchemaMigrationsAe8dbf1c57b74d64BaabD8e7c4c95de6Model(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
