
class ServicesModel {
  final double? basePrice;
  final String? categoryId;
  final DateTime? createdAt;
  final String? description;
  final int? estimatedDuration;
  final String name;
  final String? priceUnit;
  final String? serviceId;
  final DateTime? updatedAt;

  ServicesModel({
    this.basePrice,
    this.categoryId,
    this.createdAt,
    this.description,
    this.estimatedDuration,
    required this.name,
    this.priceUnit,
    this.serviceId,
    this.updatedAt,
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

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      basePrice: json['base_price'] != null ? _toDouble(json['base_price']) : null,
      categoryId: json['category_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'],
      estimatedDuration: json['estimated_duration'],
      name: json['name'] ?? '',
      priceUnit: json['price_unit'],
      serviceId: json['service_id'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (basePrice != null) {
      json['base_price'] = basePrice;
    }
    if (categoryId != null) {
      json['category_id'] = categoryId;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (description != null) {
      json['description'] = description;
    }
    if (estimatedDuration != null) {
      json['estimated_duration'] = estimatedDuration;
    }
    json['name'] = name;
    if (priceUnit != null) {
      json['price_unit'] = priceUnit;
    }
    if (serviceId != null) {
      json['service_id'] = serviceId;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  ServicesModel copyWith({
    double? basePrice,
    String? categoryId,
    DateTime? createdAt,
    String? description,
    int? estimatedDuration,
    String? name,
    String? priceUnit,
    String? serviceId,
    DateTime? updatedAt,
  }) {
    return ServicesModel(
      basePrice: basePrice ?? this.basePrice,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      name: name ?? this.name,
      priceUnit: priceUnit ?? this.priceUnit,
      serviceId: serviceId ?? this.serviceId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
