import 'dart:convert';

class S3MultipartUploadsModel {
  final String id;
  final int inProgressSize;
  final String uploadSignature;
  final String bucketId;
  final String key;
  final String version;
  final String? ownerId;
  final DateTime createdAt;
  final Map<String, dynamic>? userMetadata;

  const S3MultipartUploadsModel({
    required this.id,
    required this.inProgressSize,
    required this.uploadSignature,
    required this.bucketId,
    required this.key,
    required this.version,
    this.ownerId,
    required this.createdAt,
    this.userMetadata,
  });

  factory S3MultipartUploadsModel.fromJson(Map<String, dynamic> json) {
    return S3MultipartUploadsModel(
      id: json['id'] ?? '',
      inProgressSize: json['in_progress_size'] ?? 0,
      uploadSignature: json['upload_signature'] ?? '',
      bucketId: json['bucket_id'] ?? '',
      key: json['key'] ?? '',
      version: json['version'] ?? '',
      ownerId: json['owner_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      userMetadata: json['user_metadata'] != null ? json['user_metadata'] is String ? jsonDecode(json['user_metadata']) : json['user_metadata'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'in_progress_size': inProgressSize,
      'upload_signature': uploadSignature,
      'bucket_id': bucketId,
      'key': key,
      'version': version,
      'owner_id': ownerId,
      'created_at': createdAt.toIso8601String(),
      'user_metadata': userMetadata,
    };
  }

  S3MultipartUploadsModel copyWith({
    String? id,
    int? inProgressSize,
    String? uploadSignature,
    String? bucketId,
    String? key,
    String? version,
    String? ownerId,
    DateTime? createdAt,
    Map<String, dynamic>? userMetadata,
  }) {
    return S3MultipartUploadsModel(
      id: id ?? this.id,
      inProgressSize: inProgressSize ?? this.inProgressSize,
      uploadSignature: uploadSignature ?? this.uploadSignature,
      bucketId: bucketId ?? this.bucketId,
      key: key ?? this.key,
      version: version ?? this.version,
      ownerId: ownerId ?? this.ownerId,
      createdAt: createdAt ?? this.createdAt,
      userMetadata: userMetadata ?? this.userMetadata,
    );
  }
}
