
class SchemaMigrations67ec852539954b7496cc091a8c66a236Model {
  final DateTime? insertedAt;
  final int version;

  SchemaMigrations67ec852539954b7496cc091a8c66a236Model({
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

  factory SchemaMigrations67ec852539954b7496cc091a8c66a236Model.fromJson(Map<String, dynamic> json) {
    return SchemaMigrations67ec852539954b7496cc091a8c66a236Model(
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

  SchemaMigrations67ec852539954b7496cc091a8c66a236Model copyWith({
    DateTime? insertedAt,
    int? version,
  }) {
    return SchemaMigrations67ec852539954b7496cc091a8c66a236Model(
      insertedAt: insertedAt ?? this.insertedAt,
      version: version ?? this.version,
    );
  }
}
