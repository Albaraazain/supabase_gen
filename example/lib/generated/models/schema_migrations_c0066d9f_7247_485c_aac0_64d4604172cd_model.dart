
class SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel {
  final DateTime? insertedAt;
  final int version;

  SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel({
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

  factory SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel(
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

  SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel copyWith({
    DateTime? insertedAt,
    int? version,
  }) {
    return SchemaMigrationsC0066d9f7247485cAac064d4604172cdModel(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
