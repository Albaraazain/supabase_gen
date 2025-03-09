
class ProfessionalEarningsModel {
  final int id;
  final String professionalId;
  final String jobId;
  final double amount;
  final DateTime? earningsDate;
  final String? serviceCategoryId;

  ProfessionalEarningsModel({
    required this.id,
    required this.professionalId,
    required this.jobId,
    required this.amount,
    this.earningsDate,
    this.serviceCategoryId,
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

  factory ProfessionalEarningsModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalEarningsModel(
      id: json['id'] ?? 0,
      professionalId: json['professional_id'] ?? '',
      jobId: json['job_id'] ?? '',
      amount: _toDouble(json['amount']) ?? 0.0,
      earningsDate: json['earnings_date'] != null ? DateTime.parse(json['earnings_date'].toString()) : null,
      serviceCategoryId: json['service_category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professional_id': professionalId,
      'job_id': jobId,
      'amount': amount,
      'earnings_date': earningsDate?.toIso8601String(),
      'service_category_id': serviceCategoryId,
    };
  }

  ProfessionalEarningsModel copyWith({
    int? id,
    String? professionalId,
    String? jobId,
    double? amount,
    DateTime? earningsDate,
    String? serviceCategoryId,
  }) {
    return ProfessionalEarningsModel(
      id: id ?? this.id,
      professionalId: professionalId ?? this.professionalId,
      jobId: jobId ?? this.jobId,
      amount: amount ?? this.amount,
      earningsDate: earningsDate ?? this.earningsDate,
      serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
    );
  }
}
