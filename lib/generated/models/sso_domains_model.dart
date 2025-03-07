import 'dart:convert';

/// Auth: Manages SSO email address domain mapping to an SSO Identity Provider.
class SsoDomainsModel {
  final String id;
  final String ssoProviderId;
  final String domain;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SsoDomainsModel({
    required this.id,
    required this.ssoProviderId,
    required this.domain,
    this.createdAt,
    this.updatedAt,
  });

  factory SsoDomainsModel.fromJson(Map<String, dynamic> json) {
    return SsoDomainsModel(
      id: json['id'] ?? '',
      ssoProviderId: json['sso_provider_id'] ?? '',
      domain: json['domain'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sso_provider_id': ssoProviderId,
      'domain': domain,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  SsoDomainsModel copyWith({
    String? id,
    String? ssoProviderId,
    String? domain,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SsoDomainsModel(
      id: id ?? this.id,
      ssoProviderId: ssoProviderId ?? this.ssoProviderId,
      domain: domain ?? this.domain,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
