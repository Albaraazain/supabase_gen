import 'dart:convert';

/// Auth: Audit trail for user actions.
class AuditLogEntriesModel {
  final String? instanceId;
  final String id;
  final Map<String, dynamic>? payload;
  final DateTime? createdAt;
  final String ipAddress;

  const AuditLogEntriesModel({
    this.instanceId,
    required this.id,
    this.payload,
    this.createdAt,
    required this.ipAddress,
  });

  factory AuditLogEntriesModel.fromJson(Map<String, dynamic> json) {
    return AuditLogEntriesModel(
      instanceId: json['instance_id'],
      id: json['id'] ?? '',
      payload: json['payload'] != null ? json['payload'] is String ? jsonDecode(json['payload']) : json['payload'] : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      ipAddress: json['ip_address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instance_id': instanceId,
      'id': id,
      'payload': payload,
      'created_at': createdAt?.toIso8601String(),
      'ip_address': ipAddress,
    };
  }

  AuditLogEntriesModel copyWith({
    String? instanceId,
    String? id,
    Map<String, dynamic>? payload,
    DateTime? createdAt,
    String? ipAddress,
  }) {
    return AuditLogEntriesModel(
      instanceId: instanceId ?? this.instanceId,
      id: id ?? this.id,
      payload: payload ?? this.payload,
      createdAt: createdAt ?? this.createdAt,
      ipAddress: ipAddress ?? this.ipAddress,
    );
  }
}
