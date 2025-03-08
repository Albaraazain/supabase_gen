
class ProfessionalProfilesBackupModel {
  final String? professionalId;
  final String? userId;
  final String? businessName;
  final int? experienceYears;
  final String? licenseNumber;
  final int? serviceRadius;
  final double? currentLocationLat;
  final double? currentLocationLng;
  final double? rating;
  final int? totalJobsCompleted;
  final double? acceptanceRate;
  final String? availabilityStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProfessionalProfilesBackupModel({
    this.professionalId,
    this.userId,
    this.businessName,
    this.experienceYears,
    this.licenseNumber,
    this.serviceRadius,
    this.currentLocationLat,
    this.currentLocationLng,
    this.rating,
    this.totalJobsCompleted,
    this.acceptanceRate,
    this.availabilityStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfessionalProfilesBackupModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalProfilesBackupModel(
      professionalId: json['professional_id'],
      userId: json['user_id'],
      businessName: json['business_name'],
      experienceYears: json['experience_years'],
      licenseNumber: json['license_number'],
      serviceRadius: json['service_radius'],
      currentLocationLat: json['current_location_lat'],
      currentLocationLng: json['current_location_lng'],
      rating: json['rating'],
      totalJobsCompleted: json['total_jobs_completed'],
      acceptanceRate: json['acceptance_rate'],
      availabilityStatus: json['availability_status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'professional_id': professionalId,
      'user_id': userId,
      'business_name': businessName,
      'experience_years': experienceYears,
      'license_number': licenseNumber,
      'service_radius': serviceRadius,
      'current_location_lat': currentLocationLat,
      'current_location_lng': currentLocationLng,
      'rating': rating,
      'total_jobs_completed': totalJobsCompleted,
      'acceptance_rate': acceptanceRate,
      'availability_status': availabilityStatus,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  ProfessionalProfilesBackupModel copyWith({
    String? professionalId,
    String? userId,
    String? businessName,
    int? experienceYears,
    String? licenseNumber,
    int? serviceRadius,
    double? currentLocationLat,
    double? currentLocationLng,
    double? rating,
    int? totalJobsCompleted,
    double? acceptanceRate,
    String? availabilityStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ProfessionalProfilesBackupModel(
      professionalId: professionalId ?? this.professionalId,
      userId: userId ?? this.userId,
      businessName: businessName ?? this.businessName,
      experienceYears: experienceYears ?? this.experienceYears,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      serviceRadius: serviceRadius ?? this.serviceRadius,
      currentLocationLat: currentLocationLat ?? this.currentLocationLat,
      currentLocationLng: currentLocationLng ?? this.currentLocationLng,
      rating: rating ?? this.rating,
      totalJobsCompleted: totalJobsCompleted ?? this.totalJobsCompleted,
      acceptanceRate: acceptanceRate ?? this.acceptanceRate,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
