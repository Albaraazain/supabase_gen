import 'dart:typed_data';

/// This table holds metadata for derived keys given a key_id and key_context. The raw key is never stored.
class KeyModel {
  final String? associatedData;
  final String? comment;
  final DateTime created;
  final DateTime? expires;
  final String id;
  final Uint8List? keyContext;
  final int? keyId;
  final String? keyType;
  final String? name;
  final String? parentKey;
  final Uint8List? rawKey;
  final Uint8List? rawKeyNonce;
  final String? status;
  final String? userData;

  KeyModel({
    this.associatedData,
    this.comment,
    required this.created,
    this.expires,
    required this.id,
    this.keyContext,
    this.keyId,
    this.keyType,
    this.name,
    this.parentKey,
    this.rawKey,
    this.rawKeyNonce,
    this.status,
    this.userData,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory KeyModel.fromJson(Map<String, dynamic> json) {
    return KeyModel(
      associatedData: json['associated_data'],
      comment: json['comment'],
      created: DateTime.parse(json['created'].toString()),
      expires: json['expires'] != null ? DateTime.parse(json['expires'].toString()) : null,
      id: json['id'] ?? '',
      keyContext: json['key_context'] != null ? Uint8List.fromList(List<int>.from(json['key_context'])) : null,
      keyId: json['key_id'] != null ? (json['key_id'] is String ? int.parse(json['key_id']) : json['key_id'] as int) : null,
      keyType: json['key_type'],
      name: json['name'],
      parentKey: json['parent_key'],
      rawKey: json['raw_key'] != null ? Uint8List.fromList(List<int>.from(json['raw_key'])) : null,
      rawKeyNonce: json['raw_key_nonce'] != null ? Uint8List.fromList(List<int>.from(json['raw_key_nonce'])) : null,
      status: json['status'],
      userData: json['user_data'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (associatedData != null) {
      json['associated_data'] = associatedData;
    }
    if (comment != null) {
      json['comment'] = comment;
    }
    json['created'] = created.toIso8601String();
    if (expires != null) {
      json['expires'] = expires!.toIso8601String();
    }
    json['id'] = id;
    if (keyContext != null) {
      json['key_context'] = keyContext;
    }
    if (keyId != null) {
      json['key_id'] = keyId;
    }
    if (keyType != null) {
      json['key_type'] = keyType;
    }
    if (name != null) {
      json['name'] = name;
    }
    if (parentKey != null) {
      json['parent_key'] = parentKey;
    }
    if (rawKey != null) {
      json['raw_key'] = rawKey;
    }
    if (rawKeyNonce != null) {
      json['raw_key_nonce'] = rawKeyNonce;
    }
    if (status != null) {
      json['status'] = status;
    }
    if (userData != null) {
      json['user_data'] = userData;
    }
    return json;
  }

  KeyModel copyWith({
    String? associatedData,
    String? comment,
    DateTime? created,
    DateTime? expires,
    String? id,
    Uint8List? keyContext,
    int? keyId,
    String? keyType,
    String? name,
    String? parentKey,
    Uint8List? rawKey,
    Uint8List? rawKeyNonce,
    String? status,
    String? userData,
  }) {
    return KeyModel(
      associatedData: associatedData ?? this.associatedData,
      comment: comment ?? this.comment,
      created: created ?? this.created,
      expires: expires ?? this.expires,
      id: id ?? this.id,
      keyContext: keyContext ?? this.keyContext,
      keyId: keyId ?? this.keyId,
      keyType: keyType ?? this.keyType,
      name: name ?? this.name,
      parentKey: parentKey ?? this.parentKey,
      rawKey: rawKey ?? this.rawKey,
      rawKeyNonce: rawKeyNonce ?? this.rawKeyNonce,
      status: status ?? this.status,
      userData: userData ?? this.userData,
    );
  }
}
