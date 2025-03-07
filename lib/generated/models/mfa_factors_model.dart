import 'dart:convert';

/// auth: stores metadata about factors
class MfaFactorsModel {
  final String id;
  final String userId;
  final String? friendlyName;
  final String factorType;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? secret;
  final String? phone;
  final DateTime? lastChallengedAt;
  final Map<String, dynamic>? webAuthnCredential;
  final String? webAuthnAaguid;

  const MfaFactorsModel({
    required this.id,
    required this.userId,
    this.friendlyName,
    required this.factorType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.secret,
    this.phone,
    this.lastChallengedAt,
    this.webAuthnCredential,
    this.webAuthnAaguid,
  });

  factory MfaFactorsModel.fromJson(Map<String, dynamic> json) {
    return MfaFactorsModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      friendlyName: json['friendly_name'],
      factorType: json['factor_type'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
      secret: json['secret'],
      phone: json['phone'],
      lastChallengedAt: json['last_challenged_at'] != null ? DateTime.parse(json['last_challenged_at'].toString()) : null,
      webAuthnCredential: json['web_authn_credential'] != null ? json['web_authn_credential'] is String ? jsonDecode(json['web_authn_credential']) : json['web_authn_credential'] : null,
      webAuthnAaguid: json['web_authn_aaguid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'friendly_name': friendlyName,
      'factor_type': factorType,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'secret': secret,
      'phone': phone,
      'last_challenged_at': lastChallengedAt?.toIso8601String(),
      'web_authn_credential': webAuthnCredential,
      'web_authn_aaguid': webAuthnAaguid,
    };
  }

  MfaFactorsModel copyWith({
    String? id,
    String? userId,
    String? friendlyName,
    String? factorType,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? secret,
    String? phone,
    DateTime? lastChallengedAt,
    Map<String, dynamic>? webAuthnCredential,
    String? webAuthnAaguid,
  }) {
    return MfaFactorsModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      friendlyName: friendlyName ?? this.friendlyName,
      factorType: factorType ?? this.factorType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      secret: secret ?? this.secret,
      phone: phone ?? this.phone,
      lastChallengedAt: lastChallengedAt ?? this.lastChallengedAt,
      webAuthnCredential: webAuthnCredential ?? this.webAuthnCredential,
      webAuthnAaguid: webAuthnAaguid ?? this.webAuthnAaguid,
    );
  }
}
