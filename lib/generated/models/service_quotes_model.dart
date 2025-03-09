
class ServiceQuotesModel {
  final String quoteId;
  final String jobId;
  final double totalAmount;
  final double? materialsCost;
  final double? laborCost;
  final double? taxAmount;
  final double? serviceFee;
  final int? estimatedDuration;
  final int? validityPeriod;
  final DateTime? expiryTime;
  final String? notes;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? taxRate;
  final double? discountAmount;
  final bool? notifyOnExpiry;
  final bool? notifyOnUpdate;
  final String? discountType;

  ServiceQuotesModel({
    required this.quoteId,
    required this.jobId,
    required this.totalAmount,
    this.materialsCost,
    this.laborCost,
    this.taxAmount,
    this.serviceFee,
    this.estimatedDuration,
    this.validityPeriod,
    this.expiryTime,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.taxRate,
    this.discountAmount,
    this.notifyOnExpiry,
    this.notifyOnUpdate,
    this.discountType,
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

  factory ServiceQuotesModel.fromJson(Map<String, dynamic> json) {
    return ServiceQuotesModel(
      quoteId: json['quote_id'] ?? '',
      jobId: json['job_id'] ?? '',
      totalAmount: _toDouble(json['total_amount']) ?? 0.0,
      materialsCost: json['materials_cost'] != null ? _toDouble(json['materials_cost']) : null,
      laborCost: json['labor_cost'] != null ? _toDouble(json['labor_cost']) : null,
      taxAmount: json['tax_amount'] != null ? _toDouble(json['tax_amount']) : null,
      serviceFee: json['service_fee'] != null ? _toDouble(json['service_fee']) : null,
      estimatedDuration: json['estimated_duration'],
      validityPeriod: json['validity_period'],
      expiryTime: json['expiry_time'] != null ? DateTime.parse(json['expiry_time'].toString()) : null,
      notes: json['notes'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      taxRate: json['tax_rate'] != null ? _toDouble(json['tax_rate']) : null,
      discountAmount: json['discount_amount'] != null ? _toDouble(json['discount_amount']) : null,
      notifyOnExpiry: json['notify_on_expiry'],
      notifyOnUpdate: json['notify_on_update'],
      discountType: json['discount_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quote_id': quoteId,
      'job_id': jobId,
      'total_amount': totalAmount,
      'materials_cost': materialsCost,
      'labor_cost': laborCost,
      'tax_amount': taxAmount,
      'service_fee': serviceFee,
      'estimated_duration': estimatedDuration,
      'validity_period': validityPeriod,
      'expiry_time': expiryTime?.toIso8601String(),
      'notes': notes,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'tax_rate': taxRate,
      'discount_amount': discountAmount,
      'notify_on_expiry': notifyOnExpiry,
      'notify_on_update': notifyOnUpdate,
      'discount_type': discountType,
    };
  }

  ServiceQuotesModel copyWith({
    String? quoteId,
    String? jobId,
    double? totalAmount,
    double? materialsCost,
    double? laborCost,
    double? taxAmount,
    double? serviceFee,
    int? estimatedDuration,
    int? validityPeriod,
    DateTime? expiryTime,
    String? notes,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? taxRate,
    double? discountAmount,
    bool? notifyOnExpiry,
    bool? notifyOnUpdate,
    String? discountType,
  }) {
    return ServiceQuotesModel(
      quoteId: quoteId ?? this.quoteId,
      jobId: jobId ?? this.jobId,
      totalAmount: totalAmount ?? this.totalAmount,
      materialsCost: materialsCost ?? this.materialsCost,
      laborCost: laborCost ?? this.laborCost,
      taxAmount: taxAmount ?? this.taxAmount,
      serviceFee: serviceFee ?? this.serviceFee,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      validityPeriod: validityPeriod ?? this.validityPeriod,
      expiryTime: expiryTime ?? this.expiryTime,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      taxRate: taxRate ?? this.taxRate,
      discountAmount: discountAmount ?? this.discountAmount,
      notifyOnExpiry: notifyOnExpiry ?? this.notifyOnExpiry,
      notifyOnUpdate: notifyOnUpdate ?? this.notifyOnUpdate,
      discountType: discountType ?? this.discountType,
    );
  }
}
