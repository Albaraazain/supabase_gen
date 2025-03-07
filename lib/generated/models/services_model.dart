import 'dart:convert';

class ServicesModel {
  final String serviceId;
  final String categoryId;
  final String name;
  final String? description;
  final double basePrice;
  final int estimatedDuration;
  final String? status;
  final String priceType;

  const ServicesModel({
    required this.serviceId,
    required this.categoryId,
    required this.name,
    this.description,
    required this.basePrice,
    required this.estimatedDuration,
    this.status,
    required this.priceType,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    return ServicesModel(
      serviceId: json['service_id'] ?? '',
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      basePrice: json['base_price'] ?? 0.0,
      estimatedDuration: json['estimated_duration'] ?? 0,
      status: json['status'],
      priceType: json['price_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'category_id': categoryId,
      'name': name,
      'description': description,
      'base_price': basePrice,
      'estimated_duration': estimatedDuration,
      'status': status,
      'price_type': priceType,
    };
  }

  ServicesModel copyWith({
    String? serviceId,
    String? categoryId,
    String? name,
    String? description,
    double? basePrice,
    int? estimatedDuration,
    String? status,
    String? priceType,
  }) {
    return ServicesModel(
      serviceId: serviceId ?? this.serviceId,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      status: status ?? this.status,
      priceType: priceType ?? this.priceType,
    );
  }
}
