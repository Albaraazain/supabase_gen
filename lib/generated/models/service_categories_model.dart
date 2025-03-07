import 'dart:convert';

class ServiceCategoriesModel {
  final String categoryId;
  final String name;
  final String? description;
  final String? iconUrl;
  final String? status;

  const ServiceCategoriesModel({
    required this.categoryId,
    required this.name,
    this.description,
    this.iconUrl,
    this.status,
  });

  factory ServiceCategoriesModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoriesModel(
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      iconUrl: json['icon_url'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'description': description,
      'icon_url': iconUrl,
      'status': status,
    };
  }

  ServiceCategoriesModel copyWith({
    String? categoryId,
    String? name,
    String? description,
    String? iconUrl,
    String? status,
  }) {
    return ServiceCategoriesModel(
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl ?? this.iconUrl,
      status: status ?? this.status,
    );
  }
}
