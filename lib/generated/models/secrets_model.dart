import 'dart:convert';
import 'dart:typed_data';

/// Table with encrypted `secret` column for storing sensitive information on disk.
class SecretsModel {
  final String id;
  final String? name;
  final String description;
  final String secret;
  final String? keyId;
  final Uint8List? nonce;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SecretsModel({
    required this.id,
    this.name,
    required this.description,
    required this.secret,
    this.keyId,
    this.nonce,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SecretsModel.fromJson(Map<String, dynamic> json) {
    return SecretsModel(
      id: json['id'] ?? '',
      name: json['name'],
      description: json['description'] ?? '',
      secret: json['secret'] ?? '',
      keyId: json['key_id'],
      nonce: json['nonce'] != null ? Uint8List.fromList(List<int>.from(json['nonce'])) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'secret': secret,
      'key_id': keyId,
      'nonce': nonce,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  SecretsModel copyWith({
    String? id,
    String? name,
    String? description,
    String? secret,
    String? keyId,
    Uint8List? nonce,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SecretsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      secret: secret ?? this.secret,
      keyId: keyId ?? this.keyId,
      nonce: nonce ?? this.nonce,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
