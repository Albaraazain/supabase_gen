import 'dart:convert';

/// Auth: Store of tokens used to refresh JWT tokens once they expire.
class RefreshTokensModel {
  final String? instanceId;
  final int id;
  final String? token;
  final String? userId;
  final bool? revoked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? parent;
  final String? sessionId;

  const RefreshTokensModel({
    this.instanceId,
    required this.id,
    this.token,
    this.userId,
    this.revoked,
    this.createdAt,
    this.updatedAt,
    this.parent,
    this.sessionId,
  });

  factory RefreshTokensModel.fromJson(Map<String, dynamic> json) {
    return RefreshTokensModel(
      instanceId: json['instance_id'],
      id: json['id'] ?? 0,
      token: json['token'],
      userId: json['user_id'],
      revoked: json['revoked'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      parent: json['parent'],
      sessionId: json['session_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instance_id': instanceId,
      'id': id,
      'token': token,
      'user_id': userId,
      'revoked': revoked,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'parent': parent,
      'session_id': sessionId,
    };
  }

  RefreshTokensModel copyWith({
    String? instanceId,
    int? id,
    String? token,
    String? userId,
    bool? revoked,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? parent,
    String? sessionId,
  }) {
    return RefreshTokensModel(
      instanceId: instanceId ?? this.instanceId,
      id: id ?? this.id,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      revoked: revoked ?? this.revoked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      parent: parent ?? this.parent,
      sessionId: sessionId ?? this.sessionId,
    );
  }
}
