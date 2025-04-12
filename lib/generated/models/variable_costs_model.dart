
class VariableCostsModel {
  final double cost;
  final String costName;
  final DateTime createdAt;
  final String? id;
  final DateTime updatedAt;

  VariableCostsModel({
    required this.cost,
    required this.costName,
    required this.createdAt,
    this.id,
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

  factory VariableCostsModel.fromJson(Map<String, dynamic> json) {
    return VariableCostsModel(
      cost: _toDouble(json['cost']) ?? 0.0,
      costName: json['cost_name'] ?? '',
      createdAt: DateTime.parse(json['created_at'].toString()),
      id: json['id'],
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['cost'] = cost;
    json['cost_name'] = costName;
    json['created_at'] = createdAt.toIso8601String();
    if (id != null) {
      json['id'] = id;
    }
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  VariableCostsModel copyWith({
    double? cost,
    String? costName,
    DateTime? createdAt,
    String? id,
    DateTime? updatedAt,
  }) {
    return VariableCostsModel(
      cost: cost ?? this.cost,
      costName: costName ?? this.costName,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
