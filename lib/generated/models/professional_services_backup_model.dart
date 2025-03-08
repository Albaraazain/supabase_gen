
class ProfessionalServicesBackupModel {
  final String? id;
  final String? professionalId;
  final String? serviceId;
  final double? priceRate;
  final bool? isAvailable;

  const ProfessionalServicesBackupModel({
    this.id,
    this.professionalId,
    this.serviceId,
    this.priceRate,
    this.isAvailable,
  });

  factory ProfessionalServicesBackupModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalServicesBackupModel(
      id: json['id'],
      professionalId: json['professional_id'],
      serviceId: json['service_id'],
      priceRate: json['price_rate'],
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
