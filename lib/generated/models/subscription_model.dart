import 'dart:convert';

class SubscriptionModel {
  final int id;
  final String subscriptionId;
  final String entity;
  final String filters;
  final Map<String, dynamic> claims;
  final String claimsRole;
  final DateTime createdAt;

  const SubscriptionModel({
    required this.id,
    required this.subscriptionId,
    required this.entity,
    required this.filters,
    required this.claims,
    required this.claimsRole,
    required this.createdAt,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      id: json['id'] ?? 0,
      subscriptionId: json['subscription_id'] ?? '',
      entity: json['entity'] ?? '',
      filters: json['filters'] ?? '',
      claims: json['claims'] != null ? json['claims'] is String ? jsonDecode(json['claims']) : json['claims'] : {},
      claimsRole: json['claims_role'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subscription_id': subscriptionId,
      'entity': entity,
      'filters': filters,
      'claims': claims,
      'claims_role': claimsRole,
      'created_at': createdAt.toIso8601String(),
    };
  }

  SubscriptionModel copyWith({
    int? id,
    String? subscriptionId,
    String? entity,
    String? filters,
    Map<String, dynamic>? claims,
    String? claimsRole,
    DateTime? createdAt,
  }) {
    return SubscriptionModel(
      id: id ?? this.id,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      entity: entity ?? this.entity,
      filters: filters ?? this.filters,
      claims: claims ?? this.claims,
      claimsRole: claimsRole ?? this.claimsRole,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
