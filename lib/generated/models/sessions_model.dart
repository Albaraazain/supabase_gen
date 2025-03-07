import 'dart:convert';

/// Auth: Stores session data associated to a user.
class SessionsModel {
  final String id;
  final String userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? factorId;
  final String? aal;
/// Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.
  final DateTime? notAfter;
  final DateTime? refreshedAt;
  final String? userAgent;
  final String? ip;
  final String? tag;

  const SessionsModel({
    required this.id,
    required this.userId,
    this.createdAt,
    this.updatedAt,
    this.factorId,
    this.aal,
    this.notAfter,
    this.refreshedAt,
    this.userAgent,
    this.ip,
    this.tag,
  });

  factory SessionsModel.fromJson(Map<String, dynamic> json) {
    return SessionsModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      factorId: json['factor_id'],
      aal: json['aal'],
      notAfter: json['not_after'] != null ? DateTime.parse(json['not_after'].toString()) : null,
      refreshedAt: json['refreshed_at'] != null ? DateTime.parse(json['refreshed_at'].toString()) : null,
      userAgent: json['user_agent'],
      ip: json['ip'],
      tag: json['tag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'factor_id': factorId,
      'aal': aal,
      'not_after': notAfter?.toIso8601String(),
      'refreshed_at': refreshedAt?.toIso8601String(),
      'user_agent': userAgent,
      'ip': ip,
      'tag': tag,
    };
  }

  SessionsModel copyWith({
    String? id,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? factorId,
    String? aal,
    DateTime? notAfter,
    DateTime? refreshedAt,
    String? userAgent,
    String? ip,
    String? tag,
  }) {
    return SessionsModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      factorId: factorId ?? this.factorId,
      aal: aal ?? this.aal,
      notAfter: notAfter ?? this.notAfter,
      refreshedAt: refreshedAt ?? this.refreshedAt,
      userAgent: userAgent ?? this.userAgent,
      ip: ip ?? this.ip,
      tag: tag ?? this.tag,
    );
  }
}
