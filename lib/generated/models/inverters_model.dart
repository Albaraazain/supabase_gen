
class InvertersModel {
  final bool? availability;
  final String brand;
  final DateTime createdAt;
  final String? id;
  final double power;
  final double price;
  final DateTime updatedAt;

  InvertersModel({
    this.availability,
    required this.brand,
    required this.createdAt,
    this.id,
    required this.power,
    required this.price,
    required this.updatedAt,
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

  factory InvertersModel.fromJson(Map<String, dynamic> json) {
    return InvertersModel(
      availability: json['availability'],
      brand: json['brand'] ?? '',
      createdAt: DateTime.parse(json['created_at'].toString()),
      id: json['id'],
      power: _toDouble(json['power']) ?? 0.0,
      price: _toDouble(json['price']) ?? 0.0,
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (availability != null) {
      json['availability'] = availability;
    }
    json['brand'] = brand;
    json['created_at'] = createdAt.toIso8601String();
    if (id != null) {
      json['id'] = id;
    }
    json['power'] = power;
    json['price'] = price;
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  InvertersModel copyWith({
    bool? availability,
    String? brand,
    DateTime? createdAt,
    String? id,
    double? power,
    double? price,
    DateTime? updatedAt,
  }) {
    return InvertersModel(
      availability: availability ?? this.availability,
      brand: brand ?? this.brand,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      power: power ?? this.power,
      price: price ?? this.price,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
