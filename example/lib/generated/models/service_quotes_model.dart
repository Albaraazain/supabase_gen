
class ServiceQuotesModel {
  final DateTime? createdAt;
  final String? createdBy;
  final String jobId;
  final String? notes;
  final String? quoteId;
  final String? status;
  final double totalAmount;
  final DateTime? updatedAt;
  final DateTime? validUntil;

  ServiceQuotesModel({
    this.createdAt,
    this.createdBy,
    required this.jobId,
    this.notes,
    this.quoteId,
    this.status,
    required this.totalAmount,
    this.updatedAt,
    this.validUntil,
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
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      createdBy: json['created_by'],
      jobId: json['job_id'] ?? '',
      notes: json['notes'],
      quoteId: json['quote_id'],
      status: json['status'],
      totalAmount: _toDouble(json['total_amount']) ?? 0.0,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      validUntil: json['valid_until'] != null ? DateTime.parse(json['valid_until'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (createdBy != null) {
      json['created_by'] = createdBy;
    }
    json['job_id'] = jobId;
    if (notes != null) {
      json['notes'] = notes;
    }
    if (quoteId != null) {
      json['quote_id'] = quoteId;
    }
    if (status != null) {
      json['status'] = status;
    }
    json['total_amount'] = totalAmount;
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (validUntil != null) {
      json['valid_until'] = validUntil!.toIso8601String();
    }
    return json;
  }

  ServiceQuotesModel copyWith({
    DateTime? createdAt,
    String? createdBy,
    String? jobId,
    String? notes,
    String? quoteId,
    String? status,
    double? totalAmount,
    DateTime? updatedAt,
    DateTime? validUntil,
  }) {
    return ServiceQuotesModel(
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      jobId: jobId ?? this.jobId,
      notes: notes ?? this.notes,
      quoteId: quoteId ?? this.quoteId,
      status: status ?? this.status,
      totalAmount: totalAmount ?? this.totalAmount,
      updatedAt: updatedAt ?? this.updatedAt,
      validUntil: validUntil ?? this.validUntil,
    );
  }
}
