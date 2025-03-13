
class SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model {
  final DateTime? insertedAt;
  final int version;

  SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model({
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

  factory SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model.fromJson(Map<String, dynamic> json) {
    return SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model(
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

  SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model copyWith({
    DateTime? insertedAt,
    int? version,
  }) {
    return SchemaMigrationsFf7321e1F65741caBf7e839ac5550ea1Model(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
