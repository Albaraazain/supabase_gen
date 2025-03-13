
class SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model {
  final DateTime? insertedAt;
  final int version;

  SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model({
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

  factory SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model(
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

  SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model copyWith({
    DateTime? insertedAt,
    int? version,
  }) {
    return SchemaMigrationsAea4b3e758bc40db90551a6d8c9ad761Model(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
