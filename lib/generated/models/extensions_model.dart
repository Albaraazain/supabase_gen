import 'dart:convert';

class ExtensionsModel {
  final String id;
  final String? type;
  final Map<String, dynamic>? settings;
  final String? tenantExternalId;
  final DateTime insertedAt;
  final DateTime updatedAt;

  const ExtensionsModel({
    required this.id,
    this.type,
    this.settings,
    this.tenantExternalId,
    required this.insertedAt,
    required this.updatedAt,
  });

  factory ExtensionsModel.fromJson(Map<String, dynamic> json) {
    return ExtensionsModel(
      id: json['id'] ?? '',
      type: json['type'],
      settings: json['settings'] != null ? json['settings'] is String ? jsonDecode(json['settings']) : json['settings'] : null,
      tenantExternalId: json['tenant_external_id'],
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'settings': settings,
      'tenant_external_id': tenantExternalId,
      'inserted_at': insertedAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  ExtensionsModel copyWith({
    String? id,
    String? type,
    Map<String, dynamic>? settings,
    String? tenantExternalId,
    DateTime? insertedAt,
    DateTime? updatedAt,
  }) {
    return ExtensionsModel(
      id: id ?? this.id,
      type: type ?? this.type,
      settings: settings ?? this.settings,
      tenantExternalId: tenantExternalId ?? this.tenantExternalId,
      insertedAt: insertedAt ?? this.insertedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
