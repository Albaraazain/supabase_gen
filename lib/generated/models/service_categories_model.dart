import '../utils/geo_json.dart';

/// Generated model class for table service_categories
class ServiceCategoriesModel {
  /// Primary key field
  /// Non-nullable field
  final String categoryId;
  /// Non-nullable field
  final String name;
  final String? description;
  final String? iconUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? basePrice;
  final String? priceUnit;
  final int? estimatedDuration;

  ServiceCategoriesModel({this.categoryId = "", required this.name, this.description, this.iconUrl, this.createdAt, this.updatedAt, this.basePrice, this.priceUnit, this.estimatedDuration})
      : assert(() { assert(categoryId != null, "category_id constraint violation"); assert(name != null, "name constraint violation"); return true; }());

  factory ServiceCategoriesModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoriesModel(
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      iconUrl: json['icon_url'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      basePrice: json['base_price'] != null ? _toDouble(json['base_price']) : null,
      priceUnit: json['price_unit'],
      estimatedDuration: json['estimated_duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'name': name,
      'description': description,
      'icon_url': iconUrl,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'base_price': basePrice,
      'price_unit': priceUnit,
      'estimated_duration': estimatedDuration,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServiceCategoriesModel && other.categoryId == categoryId && other.name == name && other.description == description && other.iconUrl == iconUrl && other.createdAt == createdAt && other.updatedAt == updatedAt && other.basePrice == basePrice && other.priceUnit == priceUnit && other.estimatedDuration == estimatedDuration;
  }

  @override
  int get hashCode => categoryId.hashCode ^ name.hashCode ^ description.hashCode ^ iconUrl.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ basePrice.hashCode ^ priceUnit.hashCode ^ estimatedDuration.hashCode;

  @override
  String toString() {
    return 'ServiceCategoriesModel(categoryId: $categoryId, name: $name, description: $description, iconUrl: $iconUrl, createdAt: $createdAt, updatedAt: $updatedAt, basePrice: $basePrice, priceUnit: $priceUnit, estimatedDuration: $estimatedDuration)';
  }
  /// Get the primary identifier for this record
  String get id => categoryId;
}

  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
