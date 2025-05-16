import '../utils/geo_json.dart';

/// Generated model class for table service_quotes
class ServiceQuotesModel {
  /// Primary key field
  /// Non-nullable field
  final String quoteId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final double totalAmount;
  final String? status;
  final DateTime? validUntil;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;
  final DateTime? acceptedAt;
  final String? acceptedBy;
  final String? rejectionReason;
  final String? rejectionNotes;
  /// Non-nullable field
  final double taxRate;
  /// Non-nullable field
  final double taxAmount;
  /// Non-nullable field
  final double subtotal;

  ServiceQuotesModel({this.quoteId = "", required this.jobId, required this.totalAmount, this.status, this.validUntil, this.notes, this.createdAt, this.updatedAt, this.createdBy, this.acceptedAt, this.acceptedBy, this.rejectionReason, this.rejectionNotes, this.taxRate = 0.08, this.taxAmount = 0.0, this.subtotal = 0.0})
      : assert(() { assert(quoteId != null, "quote_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(totalAmount != null, "total_amount constraint violation"); assert(taxRate != null, "tax_rate constraint violation"); assert(taxAmount != null, "tax_amount constraint violation"); assert(subtotal != null, "subtotal constraint violation"); return true; }());

  factory ServiceQuotesModel.fromJson(Map<String, dynamic> json) {
    return ServiceQuotesModel(
      quoteId: json['quote_id'] ?? '',
      jobId: json['job_id'] ?? '',
      totalAmount: _toDouble(json['total_amount']) ?? 0.0,
      status: json['status'],
      validUntil: json['valid_until'] != null ? DateTime.parse(json['valid_until'].toString()) : null,
      notes: json['notes'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      createdBy: json['created_by'],
      acceptedAt: json['accepted_at'] != null ? DateTime.parse(json['accepted_at'].toString()) : null,
      acceptedBy: json['accepted_by'],
      rejectionReason: json['rejection_reason'],
      rejectionNotes: json['rejection_notes'],
      taxRate: _toDouble(json['tax_rate']) ?? 0.0,
      taxAmount: _toDouble(json['tax_amount']) ?? 0.0,
      subtotal: _toDouble(json['subtotal']) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quote_id': quoteId,
      'job_id': jobId,
      'total_amount': totalAmount,
      'status': status,
      'valid_until': validUntil?.toIso8601String(),
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'created_by': createdBy,
      'accepted_at': acceptedAt?.toIso8601String(),
      'accepted_by': acceptedBy,
      'rejection_reason': rejectionReason,
      'rejection_notes': rejectionNotes,
      'tax_rate': taxRate,
      'tax_amount': taxAmount,
      'subtotal': subtotal,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServiceQuotesModel && other.quoteId == quoteId && other.jobId == jobId && other.totalAmount == totalAmount && other.status == status && other.validUntil == validUntil && other.notes == notes && other.createdAt == createdAt && other.updatedAt == updatedAt && other.createdBy == createdBy && other.acceptedAt == acceptedAt && other.acceptedBy == acceptedBy && other.rejectionReason == rejectionReason && other.rejectionNotes == rejectionNotes && other.taxRate == taxRate && other.taxAmount == taxAmount && other.subtotal == subtotal;
  }

  @override
  int get hashCode => quoteId.hashCode ^ jobId.hashCode ^ totalAmount.hashCode ^ status.hashCode ^ validUntil.hashCode ^ notes.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ createdBy.hashCode ^ acceptedAt.hashCode ^ acceptedBy.hashCode ^ rejectionReason.hashCode ^ rejectionNotes.hashCode ^ taxRate.hashCode ^ taxAmount.hashCode ^ subtotal.hashCode;

  @override
  String toString() {
    return 'ServiceQuotesModel(quoteId: $quoteId, jobId: $jobId, totalAmount: $totalAmount, status: $status, validUntil: $validUntil, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, acceptedAt: $acceptedAt, acceptedBy: $acceptedBy, rejectionReason: $rejectionReason, rejectionNotes: $rejectionNotes, taxRate: $taxRate, taxAmount: $taxAmount, subtotal: $subtotal)';
  }
  /// Get the primary identifier for this record
  String get id => quoteId;
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
