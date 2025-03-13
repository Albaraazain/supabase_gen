
class ProfessionalServicesModel {
  final DateTime? createdAt;
  final String? id;
  final bool? isActive;
  final bool? isAvailable;
  final double? priceAdjustment;
  final double? priceRate;
  final String? professionalId;
  final String? serviceId;
  final DateTime? updatedAt;

  ProfessionalServicesModel({
    this.createdAt,
    this.id,
    this.isActive,
    this.isAvailable,
    this.priceAdjustment,
    this.priceRate,
    this.professionalId,
    this.serviceId,
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

  factory ProfessionalServicesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalServicesModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      id: json['id'],
      isActive: json['is_active'],
      isAvailable: json['is_available'],
      priceAdjustment: json['price_adjustment'] != null ? _toDouble(json['price_adjustment']) : null,
      priceRate: json['price_rate'] != null ? _toDouble(json['price_rate']) : null,
      professionalId: json['professional_id'],
      serviceId: json['service_id'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (id != null) {
      json['id'] = id;
    }
    if (isActive != null) {
      json['is_active'] = isActive;
    }
    if (isAvailable != null) {
      json['is_available'] = isAvailable;
    }
    if (priceAdjustment != null) {
      json['price_adjustment'] = priceAdjustment;
    }
    if (priceRate != null) {
      json['price_rate'] = priceRate;
    }
    if (professionalId != null) {
      json['professional_id'] = professionalId;
    }
    if (serviceId != null) {
      json['service_id'] = serviceId;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  ProfessionalServicesModel copyWith({
    DateTime? createdAt,
    String? id,
    bool? isActive,
    bool? isAvailable,
    double? priceAdjustment,
    double? priceRate,
    String? professionalId,
    String? serviceId,
    DateTime? updatedAt,
  }) {
    return ProfessionalServicesModel(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      isAvailable: isAvailable ?? this.isAvailable,
      priceAdjustment: priceAdjustment ?? this.priceAdjustment,
      priceRate: priceRate ?? this.priceRate,
      professionalId: professionalId ?? this.professionalId,
      serviceId: serviceId ?? this.serviceId,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
