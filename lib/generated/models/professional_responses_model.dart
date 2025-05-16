import '../utils/geo_json.dart';

/// Generated model class for table professional_responses
class ProfessionalResponsesModel {
  /// Primary key field
  /// Non-nullable field
  final String responseId;
  final String? broadcastId;
  final String? professionalId;
  final double? price;
  final DateTime? arrivalWindowStart;
  final DateTime? arrivalWindowEnd;
  final int? estimatedDuration;
  final String? notes;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfessionalResponsesModel({this.responseId = "", this.broadcastId, this.professionalId, this.price, this.arrivalWindowStart, this.arrivalWindowEnd, this.estimatedDuration, this.notes, this.status, this.createdAt, this.updatedAt})
      : assert(() { assert(responseId != null, "response_id constraint violation"); return true; }());

  factory ProfessionalResponsesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalResponsesModel(
      responseId: json['response_id'] ?? '',
      broadcastId: json['broadcast_id'],
      professionalId: json['professional_id'],
      price: json['price'] != null ? _toDouble(json['price']) : null,
      arrivalWindowStart: json['arrival_window_start'] != null ? DateTime.parse(json['arrival_window_start'].toString()) : null,
      arrivalWindowEnd: json['arrival_window_end'] != null ? DateTime.parse(json['arrival_window_end'].toString()) : null,
      estimatedDuration: json['estimated_duration'],
      notes: json['notes'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_id': responseId,
      'broadcast_id': broadcastId,
      'professional_id': professionalId,
      'price': price,
      'arrival_window_start': arrivalWindowStart?.toIso8601String(),
      'arrival_window_end': arrivalWindowEnd?.toIso8601String(),
      'estimated_duration': estimatedDuration,
      'notes': notes,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfessionalResponsesModel && other.responseId == responseId && other.broadcastId == broadcastId && other.professionalId == professionalId && other.price == price && other.arrivalWindowStart == arrivalWindowStart && other.arrivalWindowEnd == arrivalWindowEnd && other.estimatedDuration == estimatedDuration && other.notes == notes && other.status == status && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => responseId.hashCode ^ broadcastId.hashCode ^ professionalId.hashCode ^ price.hashCode ^ arrivalWindowStart.hashCode ^ arrivalWindowEnd.hashCode ^ estimatedDuration.hashCode ^ notes.hashCode ^ status.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ProfessionalResponsesModel(responseId: $responseId, broadcastId: $broadcastId, professionalId: $professionalId, price: $price, arrivalWindowStart: $arrivalWindowStart, arrivalWindowEnd: $arrivalWindowEnd, estimatedDuration: $estimatedDuration, notes: $notes, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => responseId;
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
