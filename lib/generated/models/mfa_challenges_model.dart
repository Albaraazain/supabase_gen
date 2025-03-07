import 'dart:convert';

/// auth: stores metadata about challenge requests made
class MfaChallengesModel {
  final String id;
  final String factorId;
  final DateTime createdAt;
  final DateTime? verifiedAt;
  final String ipAddress;
  final String? otpCode;
  final Map<String, dynamic>? webAuthnSessionData;

  const MfaChallengesModel({
    required this.id,
    required this.factorId,
    required this.createdAt,
    this.verifiedAt,
    required this.ipAddress,
    this.otpCode,
    this.webAuthnSessionData,
  });

  factory MfaChallengesModel.fromJson(Map<String, dynamic> json) {
    return MfaChallengesModel(
      id: json['id'] ?? '',
      factorId: json['factor_id'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      ipAddress: json['ip_address'] ?? '',
      otpCode: json['otp_code'],
      webAuthnSessionData: json['web_authn_session_data'] != null ? json['web_authn_session_data'] is String ? jsonDecode(json['web_authn_session_data']) : json['web_authn_session_data'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'factor_id': factorId,
      'created_at': createdAt.toIso8601String(),
      'verified_at': verifiedAt?.toIso8601String(),
      'ip_address': ipAddress,
      'otp_code': otpCode,
      'web_authn_session_data': webAuthnSessionData,
    };
  }

  MfaChallengesModel copyWith({
    String? id,
    String? factorId,
    DateTime? createdAt,
    DateTime? verifiedAt,
    String? ipAddress,
    String? otpCode,
    Map<String, dynamic>? webAuthnSessionData,
  }) {
    return MfaChallengesModel(
      id: id ?? this.id,
      factorId: factorId ?? this.factorId,
      createdAt: createdAt ?? this.createdAt,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      ipAddress: ipAddress ?? this.ipAddress,
      otpCode: otpCode ?? this.otpCode,
      webAuthnSessionData: webAuthnSessionData ?? this.webAuthnSessionData,
    );
  }
}
