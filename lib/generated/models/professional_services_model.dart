import '../utils/geo_json.dart';

/// Generated model class for table professional_services
class ProfessionalServicesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  final String? professionalId;
  /// Unique field
  final String? serviceId;
  final double? priceAdjustment;
  final double? priceRate;
  final bool? isActive;
  final bool? isAvailable;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfessionalServicesModel({this.id = "", this.professionalId, this.serviceId, this.priceAdjustment, this.priceRate, this.isActive, this.isAvailable, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); return true; }());

  factory ProfessionalServicesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalServicesModel(
      id: json['id'] ?? '',
      professionalId: json['professional_id'],
      serviceId: json['service_id'],
      priceAdjustment: json['price_adjustment'] != null ? _toDouble(json['price_adjustment']) : null,
      priceRate: json['price_rate'] != null ? _toDouble(json['price_rate']) : null,
      isActive: json['is_active'],
      isAvailable: json['is_available'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professional_id': professionalId,
      'service_id': serviceId,
      'price_adjustment': priceAdjustment,
      'price_rate': priceRate,
      'is_active': isActive,
      'is_available': isAvailable,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfessionalServicesModel && other.id == id && other.professionalId == professionalId && other.serviceId == serviceId && other.priceAdjustment == priceAdjustment && other.priceRate == priceRate && other.isActive == isActive && other.isAvailable == isAvailable && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ professionalId.hashCode ^ serviceId.hashCode ^ priceAdjustment.hashCode ^ priceRate.hashCode ^ isActive.hashCode ^ isAvailable.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ProfessionalServicesModel(id: $id, professionalId: $professionalId, serviceId: $serviceId, priceAdjustment: $priceAdjustment, priceRate: $priceRate, isActive: $isActive, isAvailable: $isAvailable, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  // Primary identifier is already defined as a field
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
