import 'dart:convert';

/// Tracks real-time material usage during job execution
class MaterialUsageModel {
  final String usageId;
  final String? jobId;
  final String? quoteLineItemId;
  final double quantityUsed;
  final String? updatedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const MaterialUsageModel({
    required this.usageId,
    this.jobId,
    this.quoteLineItemId,
    required this.quantityUsed,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory MaterialUsageModel.fromJson(Map<String, dynamic> json) {
    return MaterialUsageModel(
      usageId: json['usage_id'] ?? '',
      jobId: json['job_id'],
      quoteLineItemId: json['quote_line_item_id'],
      quantityUsed: json['quantity_used'] ?? 0.0,
      updatedBy: json['updated_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usage_id': usageId,
      'job_id': jobId,
      'quote_line_item_id': quoteLineItemId,
      'quantity_used': quantityUsed,
      'updated_by': updatedBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  MaterialUsageModel copyWith({
    String? usageId,
    String? jobId,
    String? quoteLineItemId,
    double? quantityUsed,
    String? updatedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return MaterialUsageModel(
      usageId: usageId ?? this.usageId,
      jobId: jobId ?? this.jobId,
      quoteLineItemId: quoteLineItemId ?? this.quoteLineItemId,
      quantityUsed: quantityUsed ?? this.quantityUsed,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
