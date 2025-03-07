import 'dart:convert';

class OneTimeTokensModel {
  final String id;
  final String userId;
  final String tokenType;
  final String tokenHash;
  final String relatesTo;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OneTimeTokensModel({
    required this.id,
    required this.userId,
    required this.tokenType,
    required this.tokenHash,
    required this.relatesTo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OneTimeTokensModel.fromJson(Map<String, dynamic> json) {
    return OneTimeTokensModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      tokenType: json['token_type'] ?? '',
      tokenHash: json['token_hash'] ?? '',
      relatesTo: json['relates_to'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'token_type': tokenType,
      'token_hash': tokenHash,
      'relates_to': relatesTo,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  OneTimeTokensModel copyWith({
    String? id,
    String? userId,
    String? tokenType,
    String? tokenHash,
    String? relatesTo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OneTimeTokensModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      tokenType: tokenType ?? this.tokenType,
      tokenHash: tokenHash ?? this.tokenHash,
      relatesTo: relatesTo ?? this.relatesTo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
