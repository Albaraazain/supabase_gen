import '../utils/geo_json.dart';

/// Generated model class for table professional_profiles
/// Database triggers associated with this table:
/// - set_default_business_name: INSERT BEFORE - EXECUTE FUNCTION handle_business_name_default()
///   Signature: handle_business_name_default() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for handle_business_name_default>
/// - set_default_business_name: UPDATE BEFORE - EXECUTE FUNCTION handle_business_name_default()
///   Signature: handle_business_name_default() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for handle_business_name_default>
///
class ProfessionalProfilesModel {
  /// Primary key field
  /// Non-nullable field
  final String professionalId;
  final String? bio;
  final String? businessName;
  final String? licenseNumber;
  final String? licenseType;
  final bool? licenseVerified;
  final String? verificationStatus;
  final DateTime? verifiedAt;
  final int? yearsExperience;
  final int? experienceYears;
  final int? radiusMiles;
  final int? serviceRadius;
  final String? availability;
  final String? availabilityStatus;
  final double? baseLocationLat;
  final double? baseLocationLng;
  final double? currentLocationLat;
  final double? currentLocationLng;
  final double? rating;
  final int? totalRatings;
  final int? totalJobsCompleted;
  final double? acceptanceRate;
  final String? activeStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  /// Non-nullable field
  final bool isOnline;

  ProfessionalProfilesModel({required this.professionalId, this.bio, this.businessName, this.licenseNumber, this.licenseType, this.licenseVerified, this.verificationStatus, this.verifiedAt, this.yearsExperience, this.experienceYears, this.radiusMiles, this.serviceRadius, this.availability, this.availabilityStatus, this.baseLocationLat, this.baseLocationLng, this.currentLocationLat, this.currentLocationLng, this.rating, this.totalRatings, this.totalJobsCompleted, this.acceptanceRate, this.activeStatus, this.createdAt, this.updatedAt, this.isOnline = true})
      : assert(() { assert(professionalId != null, "professional_id constraint violation"); assert(isOnline != null, "is_online constraint violation"); return true; }());

  factory ProfessionalProfilesModel.fromJson(Map<String, dynamic> json) {
    return ProfessionalProfilesModel(
      professionalId: json['professional_id'] ?? '',
      bio: json['bio'],
      businessName: json['business_name'],
      licenseNumber: json['license_number'],
      licenseType: json['license_type'],
      licenseVerified: json['license_verified'],
      verificationStatus: json['verification_status'],
      verifiedAt: json['verified_at'] != null ? DateTime.parse(json['verified_at'].toString()) : null,
      yearsExperience: json['years_experience'],
      experienceYears: json['experience_years'],
      radiusMiles: json['radius_miles'],
      serviceRadius: json['service_radius'],
      availability: json['availability'],
      availabilityStatus: json['availability_status'],
      baseLocationLat: json['base_location_lat'] != null ? _toDouble(json['base_location_lat']) : null,
      baseLocationLng: json['base_location_lng'] != null ? _toDouble(json['base_location_lng']) : null,
      currentLocationLat: json['current_location_lat'] != null ? _toDouble(json['current_location_lat']) : null,
      currentLocationLng: json['current_location_lng'] != null ? _toDouble(json['current_location_lng']) : null,
      rating: json['rating'] != null ? _toDouble(json['rating']) : null,
      totalRatings: json['total_ratings'],
      totalJobsCompleted: json['total_jobs_completed'],
      acceptanceRate: json['acceptance_rate'] != null ? _toDouble(json['acceptance_rate']) : null,
      activeStatus: json['active_status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      isOnline: json['is_online'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'professional_id': professionalId,
      'bio': bio,
      'business_name': businessName,
      'license_number': licenseNumber,
      'license_type': licenseType,
      'license_verified': licenseVerified,
      'verification_status': verificationStatus,
      'verified_at': verifiedAt?.toIso8601String(),
      'years_experience': yearsExperience,
      'experience_years': experienceYears,
      'radius_miles': radiusMiles,
      'service_radius': serviceRadius,
      'availability': availability,
      'availability_status': availabilityStatus,
      'base_location_lat': baseLocationLat,
      'base_location_lng': baseLocationLng,
      'current_location_lat': currentLocationLat,
      'current_location_lng': currentLocationLng,
      'rating': rating,
      'total_ratings': totalRatings,
      'total_jobs_completed': totalJobsCompleted,
      'acceptance_rate': acceptanceRate,
      'active_status': activeStatus,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'is_online': isOnline,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfessionalProfilesModel && other.professionalId == professionalId && other.bio == bio && other.businessName == businessName && other.licenseNumber == licenseNumber && other.licenseType == licenseType && other.licenseVerified == licenseVerified && other.verificationStatus == verificationStatus && other.verifiedAt == verifiedAt && other.yearsExperience == yearsExperience && other.experienceYears == experienceYears && other.radiusMiles == radiusMiles && other.serviceRadius == serviceRadius && other.availability == availability && other.availabilityStatus == availabilityStatus && other.baseLocationLat == baseLocationLat && other.baseLocationLng == baseLocationLng && other.currentLocationLat == currentLocationLat && other.currentLocationLng == currentLocationLng && other.rating == rating && other.totalRatings == totalRatings && other.totalJobsCompleted == totalJobsCompleted && other.acceptanceRate == acceptanceRate && other.activeStatus == activeStatus && other.createdAt == createdAt && other.updatedAt == updatedAt && other.isOnline == isOnline;
  }

  @override
  int get hashCode => professionalId.hashCode ^ bio.hashCode ^ businessName.hashCode ^ licenseNumber.hashCode ^ licenseType.hashCode ^ licenseVerified.hashCode ^ verificationStatus.hashCode ^ verifiedAt.hashCode ^ yearsExperience.hashCode ^ experienceYears.hashCode ^ radiusMiles.hashCode ^ serviceRadius.hashCode ^ availability.hashCode ^ availabilityStatus.hashCode ^ baseLocationLat.hashCode ^ baseLocationLng.hashCode ^ currentLocationLat.hashCode ^ currentLocationLng.hashCode ^ rating.hashCode ^ totalRatings.hashCode ^ totalJobsCompleted.hashCode ^ acceptanceRate.hashCode ^ activeStatus.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ isOnline.hashCode;

  @override
  String toString() {
    return 'ProfessionalProfilesModel(professionalId: $professionalId, bio: $bio, businessName: $businessName, licenseNumber: $licenseNumber, licenseType: $licenseType, licenseVerified: $licenseVerified, verificationStatus: $verificationStatus, verifiedAt: $verifiedAt, yearsExperience: $yearsExperience, experienceYears: $experienceYears, radiusMiles: $radiusMiles, serviceRadius: $serviceRadius, availability: $availability, availabilityStatus: $availabilityStatus, baseLocationLat: $baseLocationLat, baseLocationLng: $baseLocationLng, currentLocationLat: $currentLocationLat, currentLocationLng: $currentLocationLng, rating: $rating, totalRatings: $totalRatings, totalJobsCompleted: $totalJobsCompleted, acceptanceRate: $acceptanceRate, activeStatus: $activeStatus, createdAt: $createdAt, updatedAt: $updatedAt, isOnline: $isOnline)';
  }
  /// Get the primary identifier for this record
  String get id => professionalId;
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
