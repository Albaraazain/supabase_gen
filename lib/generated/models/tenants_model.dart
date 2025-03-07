import 'dart:convert';

class TenantsModel {
  final String id;
  final String? name;
  final String? externalId;
  final String? jwtSecret;
  final int maxConcurrentUsers;
  final DateTime insertedAt;
  final DateTime updatedAt;
  final int maxEventsPerSecond;
  final String? postgresCdcDefault;
  final int maxBytesPerSecond;
  final int maxChannelsPerClient;
  final int maxJoinsPerSecond;
  final bool? suspend;
  final Map<String, dynamic>? jwtJwks;
  final bool? notifyPrivateAlpha;
  final bool privateOnly;

  const TenantsModel({
    required this.id,
    this.name,
    this.externalId,
    this.jwtSecret,
    required this.maxConcurrentUsers,
    required this.insertedAt,
    required this.updatedAt,
    required this.maxEventsPerSecond,
    this.postgresCdcDefault,
    required this.maxBytesPerSecond,
    required this.maxChannelsPerClient,
    required this.maxJoinsPerSecond,
    this.suspend,
    this.jwtJwks,
    this.notifyPrivateAlpha,
    required this.privateOnly,
  });

  factory TenantsModel.fromJson(Map<String, dynamic> json) {
    return TenantsModel(
      id: json['id'] ?? '',
      name: json['name'],
      externalId: json['external_id'],
      jwtSecret: json['jwt_secret'],
      maxConcurrentUsers: json['max_concurrent_users'] ?? 0,
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
      maxEventsPerSecond: json['max_events_per_second'] ?? 0,
      postgresCdcDefault: json['postgres_cdc_default'],
      maxBytesPerSecond: json['max_bytes_per_second'] ?? 0,
      maxChannelsPerClient: json['max_channels_per_client'] ?? 0,
      maxJoinsPerSecond: json['max_joins_per_second'] ?? 0,
      suspend: json['suspend'],
      jwtJwks: json['jwt_jwks'] != null ? json['jwt_jwks'] is String ? jsonDecode(json['jwt_jwks']) : json['jwt_jwks'] : null,
      notifyPrivateAlpha: json['notify_private_alpha'],
      privateOnly: json['private_only'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'external_id': externalId,
      'jwt_secret': jwtSecret,
      'max_concurrent_users': maxConcurrentUsers,
      'inserted_at': insertedAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'max_events_per_second': maxEventsPerSecond,
      'postgres_cdc_default': postgresCdcDefault,
      'max_bytes_per_second': maxBytesPerSecond,
      'max_channels_per_client': maxChannelsPerClient,
      'max_joins_per_second': maxJoinsPerSecond,
      'suspend': suspend,
      'jwt_jwks': jwtJwks,
      'notify_private_alpha': notifyPrivateAlpha,
      'private_only': privateOnly,
    };
  }

  TenantsModel copyWith({
    String? id,
    String? name,
    String? externalId,
    String? jwtSecret,
    int? maxConcurrentUsers,
    DateTime? insertedAt,
    DateTime? updatedAt,
    int? maxEventsPerSecond,
    String? postgresCdcDefault,
    int? maxBytesPerSecond,
    int? maxChannelsPerClient,
    int? maxJoinsPerSecond,
    bool? suspend,
    Map<String, dynamic>? jwtJwks,
    bool? notifyPrivateAlpha,
    bool? privateOnly,
  }) {
    return TenantsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      externalId: externalId ?? this.externalId,
      jwtSecret: jwtSecret ?? this.jwtSecret,
      maxConcurrentUsers: maxConcurrentUsers ?? this.maxConcurrentUsers,
      insertedAt: insertedAt ?? this.insertedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      maxEventsPerSecond: maxEventsPerSecond ?? this.maxEventsPerSecond,
      postgresCdcDefault: postgresCdcDefault ?? this.postgresCdcDefault,
      maxBytesPerSecond: maxBytesPerSecond ?? this.maxBytesPerSecond,
      maxChannelsPerClient: maxChannelsPerClient ?? this.maxChannelsPerClient,
      maxJoinsPerSecond: maxJoinsPerSecond ?? this.maxJoinsPerSecond,
      suspend: suspend ?? this.suspend,
      jwtJwks: jwtJwks ?? this.jwtJwks,
      notifyPrivateAlpha: notifyPrivateAlpha ?? this.notifyPrivateAlpha,
      privateOnly: privateOnly ?? this.privateOnly,
    );
  }
}
