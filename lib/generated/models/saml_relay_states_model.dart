import 'dart:convert';

/// Auth: Contains SAML Relay State information for each Service Provider initiated login.
class SamlRelayStatesModel {
  final String id;
  final String ssoProviderId;
  final String requestId;
  final String? forEmail;
  final String? redirectTo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? flowStateId;

  const SamlRelayStatesModel({
    required this.id,
    required this.ssoProviderId,
    required this.requestId,
    this.forEmail,
    this.redirectTo,
    this.createdAt,
    this.updatedAt,
    this.flowStateId,
  });

  factory SamlRelayStatesModel.fromJson(Map<String, dynamic> json) {
    return SamlRelayStatesModel(
      id: json['id'] ?? '',
      ssoProviderId: json['sso_provider_id'] ?? '',
      requestId: json['request_id'] ?? '',
      forEmail: json['for_email'],
      redirectTo: json['redirect_to'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      flowStateId: json['flow_state_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sso_provider_id': ssoProviderId,
      'request_id': requestId,
      'for_email': forEmail,
      'redirect_to': redirectTo,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'flow_state_id': flowStateId,
    };
  }

  SamlRelayStatesModel copyWith({
    String? id,
    String? ssoProviderId,
    String? requestId,
    String? forEmail,
    String? redirectTo,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? flowStateId,
  }) {
    return SamlRelayStatesModel(
      id: id ?? this.id,
      ssoProviderId: ssoProviderId ?? this.ssoProviderId,
      requestId: requestId ?? this.requestId,
      forEmail: forEmail ?? this.forEmail,
      redirectTo: redirectTo ?? this.redirectTo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      flowStateId: flowStateId ?? this.flowStateId,
    );
  }
}
