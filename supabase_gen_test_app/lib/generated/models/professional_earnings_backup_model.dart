
class ProfessionalEarningsBackupModel {
  final int? id;
  final String? professionalId;
  final String? jobId;
  final double? amount;
  final DateTime? earningsDate;
  final String? serviceCategoryId;

  ProfessionalEarningsBackupModel({
    this.id,
    this.professionalId,
    this.jobId,
    this.amount,
    this.earningsDate,
    this.serviceCategoryId,
  });

  factory ProfessionalEarningsBackupModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalEarningsBackupModel(
      id: json['id'],
      professionalId: json['professional_id'],
      jobId: json['job_id'],
      amount: json['amount'],
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

  ProfessionalEarningsBackupModel copyWith({
    int? id,
    String? professionalId,
    String? jobId,
    double? amount,
    DateTime? earningsDate,
    String? serviceCategoryId,
  }) {
    return ProfessionalEarningsBackupModel(
      id: id ?? this.id,
      professionalId: professionalId ?? this.professionalId,
      jobId: jobId ?? this.jobId,
      amount: amount ?? this.amount,
      earningsDate: earningsDate ?? this.earningsDate,
      serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
    );
  }
}
