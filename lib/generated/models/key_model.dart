import 'dart:convert';
import 'dart:typed_data';

/// This table holds metadata for derived keys given a key_id and key_context. The raw key is never stored.
class KeyModel {
  final String id;
  final String? status;
  final DateTime created;
  final DateTime? expires;
  final String? keyType;
  final int? keyId;
  final Uint8List? keyContext;
  final String? name;
  final String? associatedData;
  final Uint8List? rawKey;
  final Uint8List? rawKeyNonce;
  final String? parentKey;
  final String? comment;
  final String? userData;

  const KeyModel({
    required this.id,
    this.status,
    required this.created,
    this.expires,
    this.keyType,
    this.keyId,
    this.keyContext,
    this.name,
    this.associatedData,
    this.rawKey,
    this.rawKeyNonce,
    this.parentKey,
    this.comment,
    this.userData,
  });

  factory KeyModel.fromJson(Map<String, dynamic> json) {
    return KeyModel(
      id: json['id'] ?? '',
      status: json['status'],
      created: json['created'] != null ? DateTime.parse(json['created'].toString()) : DateTime.now(),
      expires: json['expires'] != null ? DateTime.parse(json['expires'].toString()) : null,
      keyType: json['key_type'],
      keyId: json['key_id'],
      keyContext: json['key_context'] != null ? Uint8List.fromList(List<int>.from(json['key_context'])) : null,
      name: json['name'],
      associatedData: json['associated_data'],
      rawKey: json['raw_key'] != null ? Uint8List.fromList(List<int>.from(json['raw_key'])) : null,
      rawKeyNonce: json['raw_key_nonce'] != null ? Uint8List.fromList(List<int>.from(json['raw_key_nonce'])) : null,
      parentKey: json['parent_key'],
      comment: json['comment'],
      userData: json['user_data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'created': created.toIso8601String(),
      'expires': expires?.toIso8601String(),
      'key_type': keyType,
      'key_id': keyId,
      'key_context': keyContext,
      'name': name,
      'associated_data': associatedData,
      'raw_key': rawKey,
      'raw_key_nonce': rawKeyNonce,
      'parent_key': parentKey,
      'comment': comment,
      'user_data': userData,
    };
  }

  KeyModel copyWith({
    String? id,
    String? status,
    DateTime? created,
    DateTime? expires,
    String? keyType,
    int? keyId,
    Uint8List? keyContext,
    String? name,
    String? associatedData,
    Uint8List? rawKey,
    Uint8List? rawKeyNonce,
    String? parentKey,
    String? comment,
    String? userData,
  }) {
    return KeyModel(
      id: id ?? this.id,
      status: status ?? this.status,
      created: created ?? this.created,
      expires: expires ?? this.expires,
      keyType: keyType ?? this.keyType,
      keyId: keyId ?? this.keyId,
      keyContext: keyContext ?? this.keyContext,
      name: name ?? this.name,
      associatedData: associatedData ?? this.associatedData,
      rawKey: rawKey ?? this.rawKey,
      rawKeyNonce: rawKeyNonce ?? this.rawKeyNonce,
      parentKey: parentKey ?? this.parentKey,
      comment: comment ?? this.comment,
      userData: userData ?? this.userData,
    );
  }
}
