import 'dart:convert';

/// Auth: Manages users across multiple sites.
class InstancesModel {
  final String id;
  final String? uuid;
  final String? rawBaseConfig;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const InstancesModel({
    required this.id,
    this.uuid,
    this.rawBaseConfig,
    this.createdAt,
    this.updatedAt,
  });

  factory InstancesModel.fromJson(Map<String, dynamic> json) {
    return InstancesModel(
      id: json['id'] ?? '',
      uuid: json['uuid'],
      rawBaseConfig: json['raw_base_config'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'raw_base_config': rawBaseConfig,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  InstancesModel copyWith({
    String? id,
    String? uuid,
    String? rawBaseConfig,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return InstancesModel(
      id: id ?? this.id,
      uuid: uuid ?? this.uuid,
      rawBaseConfig: rawBaseConfig ?? this.rawBaseConfig,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
