import 'dart:convert';

/// Supabase Functions Hooks: Audit trail for triggered hooks.
class HooksModel {
  final int id;
  final int hookTableId;
  final String hookName;
  final DateTime createdAt;
  final int? requestId;

  const HooksModel({
    required this.id,
    required this.hookTableId,
    required this.hookName,
    required this.createdAt,
    this.requestId,
  });

  factory HooksModel.fromJson(Map<String, dynamic> json) {
    return HooksModel(
      id: json['id'] ?? 0,
      hookTableId: json['hook_table_id'] ?? 0,
      hookName: json['hook_name'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      requestId: json['request_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hook_table_id': hookTableId,
      'hook_name': hookName,
      'created_at': createdAt.toIso8601String(),
      'request_id': requestId,
    };
  }

  HooksModel copyWith({
    int? id,
    int? hookTableId,
    String? hookName,
    DateTime? createdAt,
    int? requestId,
  }) {
    return HooksModel(
      id: id ?? this.id,
      hookTableId: hookTableId ?? this.hookTableId,
      hookName: hookName ?? this.hookName,
      createdAt: createdAt ?? this.createdAt,
      requestId: requestId ?? this.requestId,
    );
  }
}
