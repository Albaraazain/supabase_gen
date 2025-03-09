
class ServiceCategoriesModel {
  final String categoryId;
  final String name;
  final String? description;
  final String? iconUrl;
  final String? status;

  ServiceCategoriesModel({
    required this.categoryId,
    required this.name,
    this.description,
    this.iconUrl,
    this.status,
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
