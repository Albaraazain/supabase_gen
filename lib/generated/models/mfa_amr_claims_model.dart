import 'dart:convert';

/// auth: stores authenticator method reference claims for multi factor authentication
class MfaAmrClaimsModel {
  final String sessionId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String authenticationMethod;
  final String id;

  const MfaAmrClaimsModel({
    required this.sessionId,
    required this.createdAt,
    required this.updatedAt,
    required this.authenticationMethod,
    required this.id,
  });

  factory MfaAmrClaimsModel.fromJson(Map<String, dynamic> json) {
    return MfaAmrClaimsModel(
      sessionId: json['session_id'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
      authenticationMethod: json['authentication_method'] ?? '',
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'authentication_method': authenticationMethod,
      'id': id,
    };
  }

  MfaAmrClaimsModel copyWith({
    String? sessionId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? authenticationMethod,
    String? id,
  }) {
    return MfaAmrClaimsModel(
      sessionId: sessionId ?? this.sessionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      authenticationMethod: authenticationMethod ?? this.authenticationMethod,
      id: id ?? this.id,
    );
  }
}
