
class BracketCostsModel {
  final double acCable;
  final double accessories;
  final DateTime createdAt;
  final double dcCable;
  final String? id;
  final double maxSize;
  final double minSize;
  final DateTime updatedAt;

  BracketCostsModel({
    required this.acCable,
    required this.accessories,
    required this.createdAt,
    required this.dcCable,
    this.id,
    required this.maxSize,
    required this.minSize,
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

  factory BracketCostsModel.fromJson(Map<String, dynamic> json) {
    return BracketCostsModel(
      acCable: _toDouble(json['ac_cable']) ?? 0.0,
      accessories: _toDouble(json['accessories']) ?? 0.0,
      createdAt: DateTime.parse(json['created_at'].toString()),
      dcCable: _toDouble(json['dc_cable']) ?? 0.0,
      id: json['id'],
      maxSize: _toDouble(json['max_size']) ?? 0.0,
      minSize: _toDouble(json['min_size']) ?? 0.0,
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['ac_cable'] = acCable;
    json['accessories'] = accessories;
    json['created_at'] = createdAt.toIso8601String();
    json['dc_cable'] = dcCable;
    if (id != null) {
      json['id'] = id;
    }
    json['max_size'] = maxSize;
    json['min_size'] = minSize;
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  BracketCostsModel copyWith({
    double? acCable,
    double? accessories,
    DateTime? createdAt,
    double? dcCable,
    String? id,
    double? maxSize,
    double? minSize,
    DateTime? updatedAt,
  }) {
    return BracketCostsModel(
      acCable: acCable ?? this.acCable,
      accessories: accessories ?? this.accessories,
      createdAt: createdAt ?? this.createdAt,
      dcCable: dcCable ?? this.dcCable,
      id: id ?? this.id,
      maxSize: maxSize ?? this.maxSize,
      minSize: minSize ?? this.minSize,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
