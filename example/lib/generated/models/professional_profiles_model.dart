
class ProfessionalProfilesModel {
  final double? acceptanceRate;
  final String? activeStatus;
  final String? availability;
  final String? availabilityStatus;
  final double? baseLocationLat;
  final double? baseLocationLng;
  final String? bio;
  final String? businessName;
  final DateTime? createdAt;
  final double? currentLocationLat;
  final double? currentLocationLng;
  final int? experienceYears;
  final String? licenseNumber;
  final String? licenseType;
  final bool? licenseVerified;
  final String? professionalId;
  final int? radiusMiles;
  final double? rating;
  final int? serviceRadius;
  final int? totalJobsCompleted;
  final int? totalRatings;
  final DateTime? updatedAt;
  final String? verificationStatus;
  final DateTime? verifiedAt;
  final int? yearsExperience;

  ProfessionalProfilesModel({
    this.acceptanceRate,
    this.activeStatus,
    this.availability,
    this.availabilityStatus,
    this.baseLocationLat,
    this.baseLocationLng,
    this.bio,
    this.businessName,
    this.createdAt,
    this.currentLocationLat,
    this.currentLocationLng,
    this.experienceYears,
    this.licenseNumber,
    this.licenseType,
    this.licenseVerified,
    this.professionalId,
    this.radiusMiles,
    this.rating,
    this.serviceRadius,
    this.totalJobsCompleted,
    this.totalRatings,
    this.updatedAt,
    this.verificationStatus,
    this.verifiedAt,
    this.yearsExperience,
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

  factory ProfessionalProfilesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalProfilesModel(
      acceptanceRate: json['acceptance_rate'] != null ? _toDouble(json['acceptance_rate']) : null,
      activeStatus: json['active_status'],
      availability: json['availability'],
      availabilityStatus: json['availability_status'],
      baseLocationLat: json['base_location_lat'] != null ? _toDouble(json['base_location_lat']) : null,
      baseLocationLng: json['base_location_lng'] != null ? _toDouble(json['base_location_lng']) : null,
      bio: json['bio'],
      businessName: json['business_name'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      currentLocationLat: json['current_location_lat'] != null ? _toDouble(json['current_location_lat']) : null,
      currentLocationLng: json['current_location_lng'] != null ? _toDouble(json['current_location_lng']) : null,
      experienceYears: json['experience_years'],
      licenseNumber: json['license_number'],
      licenseType: json['license_type'],
      licenseVerified: json['license_verified'],
      professionalId: json['professional_id'],
      radiusMiles: json['radius_miles'],
      rating: json['rating'] != null ? _toDouble(json['rating']) : null,
      serviceRadius: json['service_radius'],
      totalJobsCompleted: json['total_jobs_completed'],
      totalRatings: json['total_ratings'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      verificationStatus: json['verification_status'],
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      yearsExperience: json['years_experience'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (acceptanceRate != null) {
      json['acceptance_rate'] = acceptanceRate;
    }
    if (activeStatus != null) {
      json['active_status'] = activeStatus;
    }
    if (availability != null) {
      json['availability'] = availability;
    }
    if (availabilityStatus != null) {
      json['availability_status'] = availabilityStatus;
    }
    if (baseLocationLat != null) {
      json['base_location_lat'] = baseLocationLat;
    }
    if (baseLocationLng != null) {
      json['base_location_lng'] = baseLocationLng;
    }
    if (bio != null) {
      json['bio'] = bio;
    }
    if (businessName != null) {
      json['business_name'] = businessName;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (currentLocationLat != null) {
      json['current_location_lat'] = currentLocationLat;
    }
    if (currentLocationLng != null) {
      json['current_location_lng'] = currentLocationLng;
    }
    if (experienceYears != null) {
      json['experience_years'] = experienceYears;
    }
    if (licenseNumber != null) {
      json['license_number'] = licenseNumber;
    }
    if (licenseType != null) {
      json['license_type'] = licenseType;
    }
    if (licenseVerified != null) {
      json['license_verified'] = licenseVerified;
    }
    if (professionalId != null) {
      json['professional_id'] = professionalId;
    }
    if (radiusMiles != null) {
      json['radius_miles'] = radiusMiles;
    }
    if (rating != null) {
      json['rating'] = rating;
    }
    if (serviceRadius != null) {
      json['service_radius'] = serviceRadius;
    }
    if (totalJobsCompleted != null) {
      json['total_jobs_completed'] = totalJobsCompleted;
    }
    if (totalRatings != null) {
      json['total_ratings'] = totalRatings;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (verificationStatus != null) {
      json['verification_status'] = verificationStatus;
    }
    if (verifiedAt != null) {
      json['verified_at'] = verifiedAt!.toIso8601String();
    }
    if (yearsExperience != null) {
      json['years_experience'] = yearsExperience;
    }
    return json;
  }

  ProfessionalProfilesModel copyWith({
    double? acceptanceRate,
    String? activeStatus,
    String? availability,
    String? availabilityStatus,
    double? baseLocationLat,
    double? baseLocationLng,
    String? bio,
    String? businessName,
    DateTime? createdAt,
    double? currentLocationLat,
    double? currentLocationLng,
    int? experienceYears,
    String? licenseNumber,
    String? licenseType,
    bool? licenseVerified,
    String? professionalId,
    int? radiusMiles,
    double? rating,
    int? serviceRadius,
    int? totalJobsCompleted,
    int? totalRatings,
    DateTime? updatedAt,
    String? verificationStatus,
    DateTime? verifiedAt,
    int? yearsExperience,
  }) {
    return ProfessionalProfilesModel(
      acceptanceRate: acceptanceRate ?? this.acceptanceRate,
      activeStatus: activeStatus ?? this.activeStatus,
      availability: availability ?? this.availability,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      baseLocationLat: baseLocationLat ?? this.baseLocationLat,
      baseLocationLng: baseLocationLng ?? this.baseLocationLng,
      bio: bio ?? this.bio,
      businessName: businessName ?? this.businessName,
      createdAt: createdAt ?? this.createdAt,
      currentLocationLat: currentLocationLat ?? this.currentLocationLat,
      currentLocationLng: currentLocationLng ?? this.currentLocationLng,
      experienceYears: experienceYears ?? this.experienceYears,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseType: licenseType ?? this.licenseType,
      licenseVerified: licenseVerified ?? this.licenseVerified,
      professionalId: professionalId ?? this.professionalId,
      radiusMiles: radiusMiles ?? this.radiusMiles,
      rating: rating ?? this.rating,
      serviceRadius: serviceRadius ?? this.serviceRadius,
      totalJobsCompleted: totalJobsCompleted ?? this.totalJobsCompleted,
      totalRatings: totalRatings ?? this.totalRatings,
      updatedAt: updatedAt ?? this.updatedAt,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      verifiedAt: verifiedAt ?? this.verifiedAt,
      yearsExperience: yearsExperience ?? this.yearsExperience,
    );
  }
}
