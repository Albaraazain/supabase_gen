import 'dart:typed_data';

/// Table with encrypted `secret` column for storing sensitive information on disk.
class SecretsModel {
  final DateTime createdAt;
  final String description;
  final String id;
  final String? keyId;
  final String? name;
  final Uint8List? nonce;
  final String secret;
  final DateTime updatedAt;

  SecretsModel({
    required this.createdAt,
    required this.description,
    required this.id,
    this.keyId,
    this.name,
    this.nonce,
    required this.secret,
    required this.updatedAt,
  });

  factory SecretsModel.fromJson(Map<String, dynamic> json) {
    return SecretsModel(
      createdAt: DateTime.parse(json['created_at'].toString()),
      description: json['description'] ?? '',
      id: json['id'] ?? '',
      keyId: json['key_id'],
      name: json['name'],
      nonce: json['nonce'] != null ? Uint8List.fromList(List<int>.from(json['nonce'])) : null,
      secret: json['secret'] ?? '',
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['created_at'] = createdAt.toIso8601String();
    json['description'] = description;
    json['id'] = id;
    if (keyId != null) {
      json['key_id'] = keyId;
    }
    if (name != null) {
      json['name'] = name;
    }
    if (nonce != null) {
      json['nonce'] = nonce;
    }
    json['secret'] = secret;
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  SecretsModel copyWith({
    DateTime? createdAt,
    String? description,
    String? id,
    String? keyId,
    String? name,
    Uint8List? nonce,
    String? secret,
    DateTime? updatedAt,
  }) {
    return SecretsModel(
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      id: id ?? this.id,
      keyId: keyId ?? this.keyId,
      name: name ?? this.name,
      nonce: nonce ?? this.nonce,
      secret: secret ?? this.secret,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
