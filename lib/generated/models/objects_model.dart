import 'dart:convert';

class ObjectsModel {
  final String id;
  final String? bucketId;
  final String? name;
/// Field is deprecated, use owner_id instead
  final String? owner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastAccessedAt;
  final Map<String, dynamic>? metadata;
  final String? pathTokens;
  final String? version;
  final String? ownerId;
  final Map<String, dynamic>? userMetadata;

  const ObjectsModel({
    required this.id,
    this.bucketId,
    this.name,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.lastAccessedAt,
    this.metadata,
    this.pathTokens,
    this.version,
    this.ownerId,
    this.userMetadata,
  });

  factory ObjectsModel.fromJson(Map<String, dynamic> json) {
    return ObjectsModel(
      id: json['id'] ?? '',
      bucketId: json['bucket_id'],
      name: json['name'],
      owner: json['owner'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      lastAccessedAt: json['last_accessed_at'] != null ? DateTime.parse(json['last_accessed_at'].toString()) : null,
      metadata: json['metadata'] != null ? json['metadata'] is String ? jsonDecode(json['metadata']) : json['metadata'] : null,
      pathTokens: json['path_tokens'],
      version: json['version'],
      ownerId: json['owner_id'],
      userMetadata: json['user_metadata'] != null ? json['user_metadata'] is String ? jsonDecode(json['user_metadata']) : json['user_metadata'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bucket_id': bucketId,
      'name': name,
      'owner': owner,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_accessed_at': lastAccessedAt?.toIso8601String(),
      'metadata': metadata,
      'path_tokens': pathTokens,
      'version': version,
      'owner_id': ownerId,
      'user_metadata': userMetadata,
    };
  }

  ObjectsModel copyWith({
    String? id,
    String? bucketId,
    String? name,
    String? owner,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastAccessedAt,
    Map<String, dynamic>? metadata,
    String? pathTokens,
    String? version,
    String? ownerId,
    Map<String, dynamic>? userMetadata,
  }) {
    return ObjectsModel(
      id: id ?? this.id,
      bucketId: bucketId ?? this.bucketId,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastAccessedAt: lastAccessedAt ?? this.lastAccessedAt,
      metadata: metadata ?? this.metadata,
      pathTokens: pathTokens ?? this.pathTokens,
      version: version ?? this.version,
      ownerId: ownerId ?? this.ownerId,
      userMetadata: userMetadata ?? this.userMetadata,
    );
  }
}
