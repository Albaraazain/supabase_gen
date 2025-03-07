import 'dart:convert';

class BucketsModel {
  final String id;
  final String name;
/// Field is deprecated, use owner_id instead
  final String? owner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? public;
  final bool? avifAutodetection;
  final int? fileSizeLimit;
  final String? allowedMimeTypes;
  final String? ownerId;

  const BucketsModel({
    required this.id,
    required this.name,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.public,
    this.avifAutodetection,
    this.fileSizeLimit,
    this.allowedMimeTypes,
    this.ownerId,
  });

  factory BucketsModel.fromJson(Map<String, dynamic> json) {
    return BucketsModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      owner: json['owner'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      public: json['public'],
      avifAutodetection: json['avif_autodetection'],
      fileSizeLimit: json['file_size_limit'],
      allowedMimeTypes: json['allowed_mime_types'],
      ownerId: json['owner_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'owner': owner,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'public': public,
      'avif_autodetection': avifAutodetection,
      'file_size_limit': fileSizeLimit,
      'allowed_mime_types': allowedMimeTypes,
      'owner_id': ownerId,
    };
  }

  BucketsModel copyWith({
    String? id,
    String? name,
    String? owner,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? public,
    bool? avifAutodetection,
    int? fileSizeLimit,
    String? allowedMimeTypes,
    String? ownerId,
  }) {
    return BucketsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      public: public ?? this.public,
      avifAutodetection: avifAutodetection ?? this.avifAutodetection,
      fileSizeLimit: fileSizeLimit ?? this.fileSizeLimit,
      allowedMimeTypes: allowedMimeTypes ?? this.allowedMimeTypes,
      ownerId: ownerId ?? this.ownerId,
    );
  }
}
