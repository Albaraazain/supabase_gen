
class ProfessionalServicesBackupModel {
  final String? id;
  final String? professionalId;
  final String? serviceId;
  final double? priceRate;
  final bool? isAvailable;

  ProfessionalServicesBackupModel({
    this.id,
    this.professionalId,
    this.serviceId,
    this.priceRate,
    this.isAvailable,
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

  factory ProfessionalServicesBackupModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalServicesBackupModel(
      id: json['id'],
      professionalId: json['professional_id'],
      serviceId: json['service_id'],
      priceRate: json['price_rate'] != null ? _toDouble(json['price_rate']) : null,
      isAvailable: json['is_available'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professional_id': professionalId,
      'service_id': serviceId,
      'price_rate': priceRate,
      'is_available': isAvailable,
    };
  }

  ProfessionalServicesBackupModel copyWith({
    String? id,
    String? professionalId,
    String? serviceId,
    double? priceRate,
    bool? isAvailable,
  }) {
    return ProfessionalServicesBackupModel(
      id: id ?? this.id,
      professionalId: professionalId ?? this.professionalId,
      serviceId: serviceId ?? this.serviceId,
      priceRate: priceRate ?? this.priceRate,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
