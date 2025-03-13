
class ProfessionalResponsesModel {
  final DateTime? arrivalWindowEnd;
  final DateTime? arrivalWindowStart;
  final String? broadcastId;
  final DateTime? createdAt;
  final int? estimatedDuration;
  final String? notes;
  final double? price;
  final String? professionalId;
  final String? responseId;
  final String? status;
  final DateTime? updatedAt;

  ProfessionalResponsesModel({
    this.arrivalWindowEnd,
    this.arrivalWindowStart,
    this.broadcastId,
    this.createdAt,
    this.estimatedDuration,
    this.notes,
    this.price,
    this.professionalId,
    this.responseId,
    this.status,
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
      arrivalWindowEnd: json['arrival_window_end'] != null ? DateTime.parse(json['arrival_window_end'].toString()) : null,
      arrivalWindowStart: json['arrival_window_start'] != null ? DateTime.parse(json['arrival_window_start'].toString()) : null,
      broadcastId: json['broadcast_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      estimatedDuration: json['estimated_duration'],
      notes: json['notes'],
      price: json['price'] != null ? _toDouble(json['price']) : null,
      professionalId: json['professional_id'],
      responseId: json['response_id'],
      status: json['status'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (arrivalWindowEnd != null) {
      json['arrival_window_end'] = arrivalWindowEnd!.toIso8601String();
    }
    if (arrivalWindowStart != null) {
      json['arrival_window_start'] = arrivalWindowStart!.toIso8601String();
    }
    if (broadcastId != null) {
      json['broadcast_id'] = broadcastId;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (estimatedDuration != null) {
      json['estimated_duration'] = estimatedDuration;
    }
    if (notes != null) {
      json['notes'] = notes;
    }
    if (price != null) {
      json['price'] = price;
    }
    if (professionalId != null) {
      json['professional_id'] = professionalId;
    }
    if (responseId != null) {
      json['response_id'] = responseId;
    }
    if (status != null) {
      json['status'] = status;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  ProfessionalResponsesModel copyWith({
    DateTime? arrivalWindowEnd,
    DateTime? arrivalWindowStart,
    String? broadcastId,
    DateTime? createdAt,
    int? estimatedDuration,
    String? notes,
    double? price,
    String? professionalId,
    String? responseId,
    String? status,
    DateTime? updatedAt,
  }) {
    return ProfessionalResponsesModel(
      arrivalWindowEnd: arrivalWindowEnd ?? this.arrivalWindowEnd,
      arrivalWindowStart: arrivalWindowStart ?? this.arrivalWindowStart,
      broadcastId: broadcastId ?? this.broadcastId,
      createdAt: createdAt ?? this.createdAt,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      notes: notes ?? this.notes,
      price: price ?? this.price,
      professionalId: professionalId ?? this.professionalId,
      responseId: responseId ?? this.responseId,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
