
/// Supabase Functions Hooks: Audit trail for triggered hooks.
class HooksModel {
  final DateTime createdAt;
  final String hookName;
  final int hookTableId;
  final int id;
  final int? requestId;

  HooksModel({
    required this.createdAt,
    required this.hookName,
    required this.hookTableId,
    required this.id,
    this.requestId,
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

  factory HooksModel.fromJson(Map<String, dynamic> json) {
    return HooksModel(
      createdAt: DateTime.parse(json['created_at'].toString()),
      hookName: json['hook_name'] ?? '',
      hookTableId: json['hook_table_id'] ?? 0,
      id: (json['id'] is String ? int.parse(json['id']) : json['id'] as int) ?? 0,
      requestId: json['request_id'] != null ? (json['request_id'] is String ? int.parse(json['request_id']) : json['request_id'] as int) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['created_at'] = createdAt.toIso8601String();
    json['hook_name'] = hookName;
    json['hook_table_id'] = hookTableId;
    json['id'] = id;
    if (requestId != null) {
      json['request_id'] = requestId;
    }
    return json;
  }

  HooksModel copyWith({
    DateTime? createdAt,
    String? hookName,
    int? hookTableId,
    int? id,
    int? requestId,
  }) {
    return HooksModel(
      createdAt: createdAt ?? this.createdAt,
      hookName: hookName ?? this.hookName,
      hookTableId: hookTableId ?? this.hookTableId,
      id: id ?? this.id,
      requestId: requestId ?? this.requestId,
    );
  }
}
