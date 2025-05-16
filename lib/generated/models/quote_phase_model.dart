import '../utils/geo_json.dart';

/// Generated model class for table quote_phase
class QuotePhaseModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final DateTime quoteCreatedAt;
  final DateTime? quoteSubmittedAt;
  final DateTime? quoteAcceptedAt;
  final double? totalAmount;
  final int? validityDays;

  QuotePhaseModel({required this.jobId, DateTime? quoteCreatedAt, this.quoteSubmittedAt, this.quoteAcceptedAt, this.totalAmount, this.validityDays})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(quoteCreatedAt != null, "quote_created_at constraint violation"); return true; }()),
        quoteCreatedAt = quoteCreatedAt ?? DateTime.now();

  factory QuotePhaseModel.fromJson(Map<String, dynamic> json) {
    return QuotePhaseModel(
      jobId: json['job_id'] ?? '',
      quoteCreatedAt: json['quote_created_at'] != null ? DateTime.parse(json['quote_created_at'].toString()) : DateTime.now(),
      quoteSubmittedAt: json['quote_submitted_at'] != null ? DateTime.parse(json['quote_submitted_at'].toString()) : null,
      quoteAcceptedAt: json['quote_accepted_at'] != null ? DateTime.parse(json['quote_accepted_at'].toString()) : null,
      totalAmount: json['total_amount'] != null ? _toDouble(json['total_amount']) : null,
      validityDays: json['validity_days'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'quote_created_at': quoteCreatedAt.toIso8601String(),
      'quote_submitted_at': quoteSubmittedAt?.toIso8601String(),
      'quote_accepted_at': quoteAcceptedAt?.toIso8601String(),
      'total_amount': totalAmount,
      'validity_days': validityDays,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuotePhaseModel && other.jobId == jobId && other.quoteCreatedAt == quoteCreatedAt && other.quoteSubmittedAt == quoteSubmittedAt && other.quoteAcceptedAt == quoteAcceptedAt && other.totalAmount == totalAmount && other.validityDays == validityDays;
  }

  @override
  int get hashCode => jobId.hashCode ^ quoteCreatedAt.hashCode ^ quoteSubmittedAt.hashCode ^ quoteAcceptedAt.hashCode ^ totalAmount.hashCode ^ validityDays.hashCode;

  @override
  String toString() {
    return 'QuotePhaseModel(jobId: $jobId, quoteCreatedAt: $quoteCreatedAt, quoteSubmittedAt: $quoteSubmittedAt, quoteAcceptedAt: $quoteAcceptedAt, totalAmount: $totalAmount, validityDays: $validityDays)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
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
