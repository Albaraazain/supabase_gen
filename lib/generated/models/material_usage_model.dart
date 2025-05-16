import '../utils/geo_json.dart';

/// Generated model class for table material_usage
class MaterialUsageModel {
  /// Primary key field
  /// Non-nullable field
  final String usageId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String materialName;
  /// Non-nullable field
  final double quantity;
  final String? unit;
  final double? unitCost;
  final double? totalCost;
  final DateTime? usedAt;
  final String? recordedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MaterialUsageModel({this.usageId = "", required this.jobId, required this.materialName, required this.quantity, this.unit, this.unitCost, this.totalCost, this.usedAt, this.recordedBy, this.createdAt, this.updatedAt})
      : assert(() { assert(usageId != null, "usage_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(materialName != null, "material_name constraint violation"); assert(quantity != null, "quantity constraint violation"); return true; }());

  factory MaterialUsageModel.fromJson(Map<String, dynamic> json) {
    return MaterialUsageModel(
      usageId: json['usage_id'] ?? '',
      jobId: json['job_id'] ?? '',
      materialName: json['material_name'] ?? '',
      quantity: _toDouble(json['quantity']) ?? 0.0,
      unit: json['unit'],
      unitCost: json['unit_cost'] != null ? _toDouble(json['unit_cost']) : null,
      totalCost: json['total_cost'] != null ? _toDouble(json['total_cost']) : null,
      usedAt: json['used_at'] != null ? DateTime.parse(json['used_at'].toString()) : null,
      recordedBy: json['recorded_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usage_id': usageId,
      'job_id': jobId,
      'material_name': materialName,
      'quantity': quantity,
      'unit': unit,
      'unit_cost': unitCost,
      'total_cost': totalCost,
      'used_at': usedAt?.toIso8601String(),
      'recorded_by': recordedBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MaterialUsageModel && other.usageId == usageId && other.jobId == jobId && other.materialName == materialName && other.quantity == quantity && other.unit == unit && other.unitCost == unitCost && other.totalCost == totalCost && other.usedAt == usedAt && other.recordedBy == recordedBy && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => usageId.hashCode ^ jobId.hashCode ^ materialName.hashCode ^ quantity.hashCode ^ unit.hashCode ^ unitCost.hashCode ^ totalCost.hashCode ^ usedAt.hashCode ^ recordedBy.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'MaterialUsageModel(usageId: $usageId, jobId: $jobId, materialName: $materialName, quantity: $quantity, unit: $unit, unitCost: $unitCost, totalCost: $totalCost, usedAt: $usedAt, recordedBy: $recordedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => usageId;
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
