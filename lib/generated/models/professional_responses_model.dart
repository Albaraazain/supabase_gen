
class ProfessionalResponsesModel {
  final String responseId;
  final String broadcastId;
  final String professionalId;
  final String? status;
  final double proposedPrice;
  final int estimatedDuration;
  final DateTime? earliestStartTime;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfessionalResponsesModel({
    required this.responseId,
    required this.broadcastId,
    required this.professionalId,
    this.status,
    required this.proposedPrice,
    required this.estimatedDuration,
    this.earliestStartTime,
    this.notes,
    this.createdAt,
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

  factory ProfessionalResponsesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalResponsesModel(
      responseId: json['response_id'] ?? '',
      broadcastId: json['broadcast_id'] ?? '',
      professionalId: json['professional_id'] ?? '',
      status: json['status'],
      proposedPrice: _toDouble(json['proposed_price']) ?? 0.0,
      estimatedDuration: json['estimated_duration'] ?? 0,
      earliestStartTime: json['earliest_start_time'] != null ? DateTime.parse(json['earliest_start_time'].toString()) : null,
      notes: json['notes'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'response_id': responseId,
      'broadcast_id': broadcastId,
      'professional_id': professionalId,
      'status': status,
      'proposed_price': proposedPrice,
      'estimated_duration': estimatedDuration,
      'earliest_start_time': earliestStartTime?.toIso8601String(),
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  ProfessionalResponsesModel copyWith({
    String? responseId,
    String? broadcastId,
    String? professionalId,
    String? status,
    double? proposedPrice,
    int? estimatedDuration,
    DateTime? earliestStartTime,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfessionalResponsesModel(
      responseId: responseId ?? this.responseId,
      broadcastId: broadcastId ?? this.broadcastId,
      professionalId: professionalId ?? this.professionalId,
      status: status ?? this.status,
      proposedPrice: proposedPrice ?? this.proposedPrice,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      earliestStartTime: earliestStartTime ?? this.earliestStartTime,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
