
class ProfessionalEarningsModel {
  final double amount;
  final DateTime? createdAt;
  final String? earningId;
  final DateTime? earningsDate;
  final String jobId;
  final DateTime? payoutDate;
  final String professionalId;
  final String? status;
  final String? transactionId;
  final DateTime? updatedAt;

  ProfessionalEarningsModel({
    required this.amount,
    this.createdAt,
    this.earningId,
    this.earningsDate,
    required this.jobId,
    this.payoutDate,
    required this.professionalId,
    this.status,
    this.transactionId,
    this.updatedAt,
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
      amount: _toDouble(json['amount']) ?? 0.0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      earningId: json['earning_id'],
      earningsDate: json['earnings_date'] != null ? DateTime.parse(json['earnings_date'].toString()) : null,
      jobId: json['job_id'] ?? '',
      payoutDate: json['payout_date'] != null ? DateTime.parse(json['payout_date'].toString()) : null,
      professionalId: json['professional_id'] ?? '',
      status: json['status'],
      transactionId: json['transaction_id'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['amount'] = amount;
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (earningId != null) {
      json['earning_id'] = earningId;
    }
    if (earningsDate != null) {
      json['earnings_date'] = earningsDate!.toIso8601String();
    }
    json['job_id'] = jobId;
    if (payoutDate != null) {
      json['payout_date'] = payoutDate!.toIso8601String();
    }
    json['professional_id'] = professionalId;
    if (status != null) {
      json['status'] = status;
    }
    if (transactionId != null) {
      json['transaction_id'] = transactionId;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  ProfessionalEarningsModel copyWith({
    double? amount,
    DateTime? createdAt,
    String? earningId,
    DateTime? earningsDate,
    String? jobId,
    DateTime? payoutDate,
    String? professionalId,
    String? status,
    String? transactionId,
    DateTime? updatedAt,
  }) {
    return ProfessionalEarningsModel(
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      earningId: earningId ?? this.earningId,
      earningsDate: earningsDate ?? this.earningsDate,
      jobId: jobId ?? this.jobId,
      payoutDate: payoutDate ?? this.payoutDate,
      professionalId: professionalId ?? this.professionalId,
      status: status ?? this.status,
      transactionId: transactionId ?? this.transactionId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
