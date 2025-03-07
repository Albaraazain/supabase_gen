import 'dart:convert';

/// stores metadata for pkce logins
class FlowStateModel {
  final String id;
  final String? userId;
  final String authCode;
  final String codeChallengeMethod;
  final String codeChallenge;
  final String providerType;
  final String? providerAccessToken;
  final String? providerRefreshToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String authenticationMethod;
  final DateTime? authCodeIssuedAt;

  const FlowStateModel({
    required this.id,
    this.userId,
    required this.authCode,
    required this.codeChallengeMethod,
    required this.codeChallenge,
    required this.providerType,
    this.providerAccessToken,
    this.providerRefreshToken,
    this.createdAt,
    this.updatedAt,
    required this.authenticationMethod,
    this.authCodeIssuedAt,
  });

  factory FlowStateModel.fromJson(Map<String, dynamic> json) {
    return FlowStateModel(
      id: json['id'] ?? '',
      userId: json['user_id'],
      authCode: json['auth_code'] ?? '',
      codeChallengeMethod: json['code_challenge_method'] ?? '',
      codeChallenge: json['code_challenge'] ?? '',
      providerType: json['provider_type'] ?? '',
      providerAccessToken: json['provider_access_token'],
      providerRefreshToken: json['provider_refresh_token'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      authenticationMethod: json['authentication_method'] ?? '',
      authCodeIssuedAt: json['auth_code_issued_at'] != null ? DateTime.parse(json['auth_code_issued_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'auth_code': authCode,
      'code_challenge_method': codeChallengeMethod,
      'code_challenge': codeChallenge,
      'provider_type': providerType,
      'provider_access_token': providerAccessToken,
      'provider_refresh_token': providerRefreshToken,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'authentication_method': authenticationMethod,
      'auth_code_issued_at': authCodeIssuedAt?.toIso8601String(),
    };
  }

  FlowStateModel copyWith({
    String? id,
    String? userId,
    String? authCode,
    String? codeChallengeMethod,
    String? codeChallenge,
    String? providerType,
    String? providerAccessToken,
    String? providerRefreshToken,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? authenticationMethod,
    DateTime? authCodeIssuedAt,
  }) {
    return FlowStateModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      authCode: authCode ?? this.authCode,
      codeChallengeMethod: codeChallengeMethod ?? this.codeChallengeMethod,
      codeChallenge: codeChallenge ?? this.codeChallenge,
      providerType: providerType ?? this.providerType,
      providerAccessToken: providerAccessToken ?? this.providerAccessToken,
      providerRefreshToken: providerRefreshToken ?? this.providerRefreshToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      authenticationMethod: authenticationMethod ?? this.authenticationMethod,
      authCodeIssuedAt: authCodeIssuedAt ?? this.authCodeIssuedAt,
    );
  }
}
