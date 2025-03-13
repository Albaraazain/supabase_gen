
class ServiceCategoriesModel {
  final String? categoryId;
  final DateTime? createdAt;
  final String? description;
  final String? iconUrl;
  final String name;
  final DateTime? updatedAt;

  ServiceCategoriesModel({
    this.categoryId,
    this.createdAt,
    this.description,
    this.iconUrl,
    required this.name,
    this.updatedAt,
  });

  factory ServiceCategoriesModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoriesModel(
      categoryId: json['category_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'],
      iconUrl: json['icon_url'],
      name: json['name'] ?? '',
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (categoryId != null) {
      json['category_id'] = categoryId;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (description != null) {
      json['description'] = description;
    }
    if (iconUrl != null) {
      json['icon_url'] = iconUrl;
    }
    json['name'] = name;
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  ServiceCategoriesModel copyWith({
    String? categoryId,
    DateTime? createdAt,
    String? description,
    String? iconUrl,
    String? name,
    DateTime? updatedAt,
  }) {
    return ServiceCategoriesModel(
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      name: name ?? this.name,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
