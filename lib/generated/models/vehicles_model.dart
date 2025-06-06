import '../utils/geo_json.dart';

/// Generated model class for table vehicles
/// Database triggers associated with this table:
/// - update_vehicles_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
///   Signature: update_updated_at_column() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
///
class VehiclesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References profiles(id)
  final String userId;
  /// Non-nullable field
  final String make;
  /// Non-nullable field
  final String model;
  final int? year;
  final String? color;
  /// Unique field
  final String? licensePlate;
  /// Non-nullable field
  final int totalSeats;
  final String? vehicleType;
  final String? fuelType;
  final double? fuelConsumptionPer100km;
  final bool? isVerified;
  final Map<String, dynamic>? verificationDocuments;
  final bool? isPrimary;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehiclesModel({this.id = "", required this.userId, required this.make, required this.model, this.year, this.color, this.licensePlate, required this.totalSeats, this.vehicleType, this.fuelType, this.fuelConsumptionPer100km, this.isVerified, this.verificationDocuments, this.isPrimary, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(userId != null, "user_id constraint violation"); assert(make != null, "make constraint violation"); assert(model != null, "model constraint violation"); assert(totalSeats != null, "total_seats constraint violation"); return true; }());

  factory VehiclesModel.fromJson(Map<String, dynamic> json) {
    return VehiclesModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      make: json['make'] ?? '',
      model: json['model'] ?? '',
      year: json['year'],
      color: json['color'],
      licensePlate: json['license_plate'],
      totalSeats: json['total_seats'] ?? 0,
      vehicleType: json['vehicle_type'],
      fuelType: json['fuel_type'],
      fuelConsumptionPer100km: json['fuel_consumption_per_100km'] != null ? _toDouble(json['fuel_consumption_per_100km']) : null,
      isVerified: json['is_verified'],
      verificationDocuments: json['verification_documents'],
      isPrimary: json['is_primary'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'make': make,
      'model': model,
      'year': year,
      'color': color,
      'license_plate': licensePlate,
      'total_seats': totalSeats,
      'vehicle_type': vehicleType,
      'fuel_type': fuelType,
      'fuel_consumption_per_100km': fuelConsumptionPer100km,
      'is_verified': isVerified,
      'verification_documents': verificationDocuments,
      'is_primary': isPrimary,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'user_id': userId,
      'make': make,
      'model': model,
      'year': year,
      'color': color,
      'license_plate': licensePlate,
      'total_seats': totalSeats,
      'vehicle_type': vehicleType,
      'fuel_type': fuelType,
      'fuel_consumption_per_100km': fuelConsumptionPer100km,
      'is_verified': isVerified,
      'verification_documents': verificationDocuments,
      'is_primary': isPrimary,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'user_id': userId,
      'make': make,
      'model': model,
      'year': year,
      'color': color,
      'license_plate': licensePlate,
      'total_seats': totalSeats,
      'vehicle_type': vehicleType,
      'fuel_type': fuelType,
      'fuel_consumption_per_100km': fuelConsumptionPer100km,
      'is_verified': isVerified,
      'verification_documents': verificationDocuments,
      'is_primary': isPrimary,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VehiclesModel && other.id == id && other.userId == userId && other.make == make && other.model == model && other.year == year && other.color == color && other.licensePlate == licensePlate && other.totalSeats == totalSeats && other.vehicleType == vehicleType && other.fuelType == fuelType && other.fuelConsumptionPer100km == fuelConsumptionPer100km && other.isVerified == isVerified && other.verificationDocuments == verificationDocuments && other.isPrimary == isPrimary && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ make.hashCode ^ model.hashCode ^ year.hashCode ^ color.hashCode ^ licensePlate.hashCode ^ totalSeats.hashCode ^ vehicleType.hashCode ^ fuelType.hashCode ^ fuelConsumptionPer100km.hashCode ^ isVerified.hashCode ^ verificationDocuments.hashCode ^ isPrimary.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'VehiclesModel(id: $id, userId: $userId, make: $make, model: $model, year: $year, color: $color, licensePlate: $licensePlate, totalSeats: $totalSeats, vehicleType: $vehicleType, fuelType: $fuelType, fuelConsumptionPer100km: $fuelConsumptionPer100km, isVerified: $isVerified, verificationDocuments: $verificationDocuments, isPrimary: $isPrimary, createdAt: $createdAt, updatedAt: $updatedAt)';
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
