import '../utils/geo_json.dart';

/// Generated model class for table professional_earnings
class ProfessionalEarningsModel {
  /// Primary key field
  /// Non-nullable field
  final String earningId;
  /// Non-nullable field
  final String professionalId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final double amount;
  final DateTime? earningsDate;
  final String? status;
  final DateTime? payoutDate;
  final String? transactionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfessionalEarningsModel({this.earningId = "", required this.professionalId, required this.jobId, required this.amount, this.earningsDate, this.status, this.payoutDate, this.transactionId, this.createdAt, this.updatedAt})
      : assert(() { assert(earningId != null, "earning_id constraint violation"); assert(professionalId != null, "professional_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(amount != null, "amount constraint violation"); return true; }());

  factory ProfessionalEarningsModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalEarningsModel(
      earningId: json['earning_id'] ?? '',
      professionalId: json['professional_id'] ?? '',
      jobId: json['job_id'] ?? '',
      amount: _toDouble(json['amount']) ?? 0.0,
      earningsDate: json['earnings_date'] != null ? DateTime.parse(json['earnings_date'].toString()) : null,
      status: json['status'],
      payoutDate: json['payout_date'] != null ? DateTime.parse(json['payout_date'].toString()) : null,
      transactionId: json['transaction_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'earning_id': earningId,
      'professional_id': professionalId,
      'job_id': jobId,
      'amount': amount,
      'earnings_date': earningsDate?.toIso8601String(),
      'status': status,
      'payout_date': payoutDate?.toIso8601String(),
      'transaction_id': transactionId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfessionalEarningsModel && other.earningId == earningId && other.professionalId == professionalId && other.jobId == jobId && other.amount == amount && other.earningsDate == earningsDate && other.status == status && other.payoutDate == payoutDate && other.transactionId == transactionId && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => earningId.hashCode ^ professionalId.hashCode ^ jobId.hashCode ^ amount.hashCode ^ earningsDate.hashCode ^ status.hashCode ^ payoutDate.hashCode ^ transactionId.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ProfessionalEarningsModel(earningId: $earningId, professionalId: $professionalId, jobId: $jobId, amount: $amount, earningsDate: $earningsDate, status: $status, payoutDate: $payoutDate, transactionId: $transactionId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => earningId;
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
