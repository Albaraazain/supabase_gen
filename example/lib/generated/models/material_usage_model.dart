
class MaterialUsageModel {
  final DateTime? createdAt;
  final String jobId;
  final String materialName;
  final double quantity;
  final String? recordedBy;
  final double? totalCost;
  final String? unit;
  final double? unitCost;
  final DateTime? updatedAt;
  final String? usageId;
  final DateTime? usedAt;

  MaterialUsageModel({
    this.createdAt,
    required this.jobId,
    required this.materialName,
    required this.quantity,
    this.recordedBy,
    this.totalCost,
    this.unit,
    this.unitCost,
    this.updatedAt,
    this.usageId,
    this.usedAt,
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

  factory MaterialUsageModel.fromJson(Map<String, dynamic> json) {
    return MaterialUsageModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      jobId: json['job_id'] ?? '',
      materialName: json['material_name'] ?? '',
      quantity: _toDouble(json['quantity']) ?? 0.0,
      recordedBy: json['recorded_by'],
      totalCost: json['total_cost'] != null ? _toDouble(json['total_cost']) : null,
      unit: json['unit'],
      unitCost: json['unit_cost'] != null ? _toDouble(json['unit_cost']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      usageId: json['usage_id'],
      usedAt: json['used_at'] != null ? DateTime.parse(json['used_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    json['job_id'] = jobId;
    json['material_name'] = materialName;
    json['quantity'] = quantity;
    if (recordedBy != null) {
      json['recorded_by'] = recordedBy;
    }
    if (totalCost != null) {
      json['total_cost'] = totalCost;
    }
    if (unit != null) {
      json['unit'] = unit;
    }
    if (unitCost != null) {
      json['unit_cost'] = unitCost;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (usageId != null) {
      json['usage_id'] = usageId;
    }
    if (usedAt != null) {
      json['used_at'] = usedAt!.toIso8601String();
    }
    return json;
  }

  MaterialUsageModel copyWith({
    DateTime? createdAt,
    String? jobId,
    String? materialName,
    double? quantity,
    String? recordedBy,
    double? totalCost,
    String? unit,
    double? unitCost,
    DateTime? updatedAt,
    String? usageId,
    DateTime? usedAt,
  }) {
    return MaterialUsageModel(
      createdAt: createdAt ?? this.createdAt,
      jobId: jobId ?? this.jobId,
      materialName: materialName ?? this.materialName,
      quantity: quantity ?? this.quantity,
      recordedBy: recordedBy ?? this.recordedBy,
      totalCost: totalCost ?? this.totalCost,
      unit: unit ?? this.unit,
      unitCost: unitCost ?? this.unitCost,
      updatedAt: updatedAt ?? this.updatedAt,
      usageId: usageId ?? this.usageId,
      usedAt: usedAt ?? this.usedAt,
    );
  }
}
