import 'dart:convert';

/// Auth: Manages SSO identity provider information; see saml_providers for SAML.
class SsoProvidersModel {
  final String id;
/// Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.
  final String? resourceId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SsoProvidersModel({
    required this.id,
    this.resourceId,
    this.createdAt,
    this.updatedAt,
  });

  factory SsoProvidersModel.fromJson(Map<String, dynamic> json) {
    return SsoProvidersModel(
      id: json['id'] ?? '',
      resourceId: json['resource_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resource_id': resourceId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  SsoProvidersModel copyWith({
    String? id,
    String? resourceId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SsoProvidersModel(
      id: id ?? this.id,
      resourceId: resourceId ?? this.resourceId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
