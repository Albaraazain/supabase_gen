import 'dart:convert';

/// Auth: Manages SAML Identity Provider connections.
class SamlProvidersModel {
  final String id;
  final String ssoProviderId;
  final String entityId;
  final String metadataXml;
  final String? metadataUrl;
  final Map<String, dynamic>? attributeMapping;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? nameIdFormat;

  const SamlProvidersModel({
    required this.id,
    required this.ssoProviderId,
    required this.entityId,
    required this.metadataXml,
    this.metadataUrl,
    this.attributeMapping,
    this.createdAt,
    this.updatedAt,
    this.nameIdFormat,
  });

  factory SamlProvidersModel.fromJson(Map<String, dynamic> json) {
    return SamlProvidersModel(
      id: json['id'] ?? '',
      ssoProviderId: json['sso_provider_id'] ?? '',
      entityId: json['entity_id'] ?? '',
      metadataXml: json['metadata_xml'] ?? '',
      metadataUrl: json['metadata_url'],
      attributeMapping: json['attribute_mapping'] != null ? json['attribute_mapping'] is String ? jsonDecode(json['attribute_mapping']) : json['attribute_mapping'] : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      nameIdFormat: json['name_id_format'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sso_provider_id': ssoProviderId,
      'entity_id': entityId,
      'metadata_xml': metadataXml,
      'metadata_url': metadataUrl,
      'attribute_mapping': attributeMapping,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'name_id_format': nameIdFormat,
    };
  }

  SamlProvidersModel copyWith({
    String? id,
    String? ssoProviderId,
    String? entityId,
    String? metadataXml,
    String? metadataUrl,
    Map<String, dynamic>? attributeMapping,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? nameIdFormat,
  }) {
    return SamlProvidersModel(
      id: id ?? this.id,
      ssoProviderId: ssoProviderId ?? this.ssoProviderId,
      entityId: entityId ?? this.entityId,
      metadataXml: metadataXml ?? this.metadataXml,
      metadataUrl: metadataUrl ?? this.metadataUrl,
      attributeMapping: attributeMapping ?? this.attributeMapping,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      nameIdFormat: nameIdFormat ?? this.nameIdFormat,
    );
  }
}
