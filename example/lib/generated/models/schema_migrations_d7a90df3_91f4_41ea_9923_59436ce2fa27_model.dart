
class SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model {
  final DateTime? insertedAt;
  final int version;

  SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model({
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

  factory SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model(
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

  SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model copyWith({
    DateTime? insertedAt,
    int? version,
  }) {
    return SchemaMigrationsD7a90df391f441ea992359436ce2fa27Model(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
