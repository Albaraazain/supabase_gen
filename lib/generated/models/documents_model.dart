import 'dart:convert';

class DocumentsModel {
  final DateTime createdAt;
  final String? id;
  final Map<String, dynamic>? metadata;
  final String name;
  final String path;
  final String? referenceNumber;
  final int? size;
  final String type;
  final DateTime updatedAt;
  final String url;

  DocumentsModel({
    required this.createdAt,
    this.id,
    this.metadata,
    required this.name,
    required this.path,
    this.referenceNumber,
    this.size,
    required this.type,
    required this.updatedAt,
    required this.url,
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

  factory DocumentsModel.fromJson(Map<String, dynamic> json) {
    return DocumentsModel(
      createdAt: DateTime.parse(json['created_at'].toString()),
      id: json['id'],
      metadata: json['metadata'] != null ? (json['metadata'] is String ? jsonDecode(json['metadata']) : json['metadata']) : null,
      name: json['name'] ?? '',
      path: json['path'] ?? '',
      referenceNumber: json['reference_number'],
      size: json['size'],
      type: json['type'] ?? '',
      updatedAt: DateTime.parse(json['updated_at'].toString()),
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['created_at'] = createdAt.toIso8601String();
    if (id != null) {
      json['id'] = id;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }
    json['name'] = name;
    json['path'] = path;
    if (referenceNumber != null) {
      json['reference_number'] = referenceNumber;
    }
    if (size != null) {
      json['size'] = size;
    }
    json['type'] = type;
    json['updated_at'] = updatedAt.toIso8601String();
    json['url'] = url;
    return json;
  }

  DocumentsModel copyWith({
    DateTime? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? name,
    String? path,
    String? referenceNumber,
    int? size,
    String? type,
    DateTime? updatedAt,
    String? url,
  }) {
    return DocumentsModel(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      metadata: metadata ?? this.metadata,
      name: name ?? this.name,
      path: path ?? this.path,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      size: size ?? this.size,
      type: type ?? this.type,
      updatedAt: updatedAt ?? this.updatedAt,
      url: url ?? this.url,
    );
  }
}
