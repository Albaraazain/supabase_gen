import '../utils/geo_json.dart';

/// Generated model class for table services
class ServicesModel {
  /// Primary key field
  /// Non-nullable field
  final String serviceId;
  final String? categoryId;
  /// Non-nullable field
  final String name;
  final String? description;
  final double? basePrice;
  final String? priceUnit;
  final int? estimatedDuration;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ServicesModel({this.serviceId = "", this.categoryId, required this.name, this.description, this.basePrice, this.priceUnit, this.estimatedDuration, this.createdAt, this.updatedAt})
      : assert(() { assert(serviceId != null, "service_id constraint violation"); assert(name != null, "name constraint violation"); return true; }());

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      serviceId: json['service_id'] ?? '',
      categoryId: json['category_id'],
      name: json['name'] ?? '',
      description: json['description'],
      basePrice: json['base_price'] != null ? _toDouble(json['base_price']) : null,
      priceUnit: json['price_unit'],
      estimatedDuration: json['estimated_duration'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'category_id': categoryId,
      'name': name,
      'description': description,
      'base_price': basePrice,
      'price_unit': priceUnit,
      'estimated_duration': estimatedDuration,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServicesModel && other.serviceId == serviceId && other.categoryId == categoryId && other.name == name && other.description == description && other.basePrice == basePrice && other.priceUnit == priceUnit && other.estimatedDuration == estimatedDuration && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => serviceId.hashCode ^ categoryId.hashCode ^ name.hashCode ^ description.hashCode ^ basePrice.hashCode ^ priceUnit.hashCode ^ estimatedDuration.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ServicesModel(serviceId: $serviceId, categoryId: $categoryId, name: $name, description: $description, basePrice: $basePrice, priceUnit: $priceUnit, estimatedDuration: $estimatedDuration, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => serviceId;
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
