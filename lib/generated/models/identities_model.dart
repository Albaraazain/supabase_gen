import 'dart:convert';

/// Auth: Stores identities associated to a user.
class IdentitiesModel {
  final String providerId;
  final String userId;
  final Map<String, dynamic> identityData;
  final String provider;
  final DateTime? lastSignInAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
/// Auth: Email is a generated column that references the optional email property in the identity_data
  final String? email;
  final String id;

  const IdentitiesModel({
    required this.providerId,
    required this.userId,
    required this.identityData,
    required this.provider,
    this.lastSignInAt,
    this.createdAt,
    this.updatedAt,
    this.email,
    required this.id,
  });

  factory IdentitiesModel.fromJson(Map<String, dynamic> json) {
    return IdentitiesModel(
      providerId: json['provider_id'] ?? '',
      userId: json['user_id'] ?? '',
      identityData: json['identity_data'] != null ? json['identity_data'] is String ? jsonDecode(json['identity_data']) : json['identity_data'] : {},
      provider: json['provider'] ?? '',
      lastSignInAt: json['last_sign_in_at'] != null ? DateTime.parse(json['last_sign_in_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      email: json['email'],
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'provider_id': providerId,
      'user_id': userId,
      'identity_data': identityData,
      'provider': provider,
      'last_sign_in_at': lastSignInAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'email': email,
      'id': id,
    };
  }

  IdentitiesModel copyWith({
    String? providerId,
    String? userId,
    Map<String, dynamic>? identityData,
    String? provider,
    DateTime? lastSignInAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? email,
    String? id,
  }) {
    return IdentitiesModel(
      providerId: providerId ?? this.providerId,
      userId: userId ?? this.userId,
      identityData: identityData ?? this.identityData,
      provider: provider ?? this.provider,
      lastSignInAt: lastSignInAt ?? this.lastSignInAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }
}
