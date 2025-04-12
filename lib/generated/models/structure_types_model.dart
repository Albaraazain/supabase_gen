
class StructureTypesModel {
  final double absCost;
  final DateTime createdAt;
  final double customCost;
  final String? id;
  final bool? l2;
  final DateTime updatedAt;

  StructureTypesModel({
    required this.absCost,
    required this.createdAt,
    required this.customCost,
    this.id,
    this.l2,
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

  factory StructureTypesModel.fromJson(Map<String, dynamic> json) {
    return StructureTypesModel(
      absCost: _toDouble(json['abs_cost']) ?? 0.0,
      createdAt: DateTime.parse(json['created_at'].toString()),
      customCost: _toDouble(json['custom_cost']) ?? 0.0,
      id: json['id'],
      l2: json['l2'],
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['abs_cost'] = absCost;
    json['created_at'] = createdAt.toIso8601String();
    json['custom_cost'] = customCost;
    if (id != null) {
      json['id'] = id;
    }
    if (l2 != null) {
      json['l2'] = l2;
    }
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  StructureTypesModel copyWith({
    double? absCost,
    DateTime? createdAt,
    double? customCost,
    String? id,
    bool? l2,
    DateTime? updatedAt,
  }) {
    return StructureTypesModel(
      absCost: absCost ?? this.absCost,
      createdAt: createdAt ?? this.createdAt,
      customCost: customCost ?? this.customCost,
      id: id ?? this.id,
      l2: l2 ?? this.l2,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
