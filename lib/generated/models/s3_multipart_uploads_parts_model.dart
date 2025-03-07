import 'dart:convert';

class S3MultipartUploadsPartsModel {
  final String id;
  final String uploadId;
  final int size;
  final int partNumber;
  final String bucketId;
  final String key;
  final String etag;
  final String? ownerId;
  final String version;
  final DateTime createdAt;

  const S3MultipartUploadsPartsModel({
    required this.id,
    required this.uploadId,
    required this.size,
    required this.partNumber,
    required this.bucketId,
    required this.key,
    required this.etag,
    this.ownerId,
    required this.version,
    required this.createdAt,
  });

  factory S3MultipartUploadsPartsModel.fromJson(Map<String, dynamic> json) {
    return S3MultipartUploadsPartsModel(
      id: json['id'] ?? '',
      uploadId: json['upload_id'] ?? '',
      size: json['size'] ?? 0,
      partNumber: json['part_number'] ?? 0,
      bucketId: json['bucket_id'] ?? '',
      key: json['key'] ?? '',
      etag: json['etag'] ?? '',
      ownerId: json['owner_id'],
      version: json['version'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'upload_id': uploadId,
      'size': size,
      'part_number': partNumber,
      'bucket_id': bucketId,
      'key': key,
      'etag': etag,
      'owner_id': ownerId,
      'version': version,
      'created_at': createdAt.toIso8601String(),
    };
  }

  S3MultipartUploadsPartsModel copyWith({
    String? id,
    String? uploadId,
    int? size,
    int? partNumber,
    String? bucketId,
    String? key,
    String? etag,
    String? ownerId,
    String? version,
    DateTime? createdAt,
  }) {
    return S3MultipartUploadsPartsModel(
      id: id ?? this.id,
      uploadId: uploadId ?? this.uploadId,
      size: size ?? this.size,
      partNumber: partNumber ?? this.partNumber,
      bucketId: bucketId ?? this.bucketId,
      key: key ?? this.key,
      etag: etag ?? this.etag,
      ownerId: ownerId ?? this.ownerId,
      version: version ?? this.version,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
