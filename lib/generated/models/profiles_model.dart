import '../utils/geo_json.dart';

/// Generated model class for table profiles
/// Database triggers associated with this table:
/// - update_profiles_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_updated_at_column()
///   Signature: update_updated_at_column() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   NEW.updated_at = NOW();   RETURN NEW; END; 
///
class ProfilesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  final String email;
  /// Unique field
  final String? phone;
  /// Non-nullable field
  final String fullName;
  final String? avatarUrl;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? bio;
  final bool? isVerified;
  final String? verificationStatus;
  final double? driverRating;
  final double? passengerRating;
  final int? totalTripsAsDriver;
  final int? totalTripsAsPassenger;
  final String? preferredLanguage;
  final String? emergencyContactName;
  final String? emergencyContactPhone;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? lastActiveAt;
  final bool? isBanned;
  final String? banReason;

  ProfilesModel({required this.id, required this.email, this.phone, required this.fullName, this.avatarUrl, this.dateOfBirth, this.gender, this.bio, this.isVerified, this.verificationStatus, this.driverRating, this.passengerRating, this.totalTripsAsDriver, this.totalTripsAsPassenger, this.preferredLanguage, this.emergencyContactName, this.emergencyContactPhone, this.createdAt, this.updatedAt, this.lastActiveAt, this.isBanned, this.banReason})
      : assert(() { assert(id != null, "id constraint violation"); assert(email != null, "email constraint violation"); assert(fullName != null, "full_name constraint violation"); return true; }());

  factory ProfilesModel.fromJson(Map<String, dynamic> json) {
    return ProfilesModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'],
      fullName: json['full_name'] ?? '',
      avatarUrl: json['avatar_url'],
      dateOfBirth: json['date_of_birth'] != null ? _parseDate(json['date_of_birth'].toString()) : null,
      gender: json['gender'],
      bio: json['bio'],
      isVerified: json['is_verified'],
      verificationStatus: json['verification_status'],
      driverRating: json['driver_rating'] != null ? _toDouble(json['driver_rating']) : null,
      passengerRating: json['passenger_rating'] != null ? _toDouble(json['passenger_rating']) : null,
      totalTripsAsDriver: json['total_trips_as_driver'],
      totalTripsAsPassenger: json['total_trips_as_passenger'],
      preferredLanguage: json['preferred_language'],
      emergencyContactName: json['emergency_contact_name'],
      emergencyContactPhone: json['emergency_contact_phone'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      lastActiveAt: json['last_active_at'] != null ? DateTime.parse(json['last_active_at'].toString()) : null,
      isBanned: json['is_banned'],
      banReason: json['ban_reason'],
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'full_name': fullName,
      'avatar_url': avatarUrl,
      'date_of_birth': dateOfBirth != null ? "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}" : null,
      'gender': gender,
      'bio': bio,
      'is_verified': isVerified,
      'verification_status': verificationStatus,
      'driver_rating': driverRating,
      'passenger_rating': passengerRating,
      'total_trips_as_driver': totalTripsAsDriver,
      'total_trips_as_passenger': totalTripsAsPassenger,
      'preferred_language': preferredLanguage,
      'emergency_contact_name': emergencyContactName,
      'emergency_contact_phone': emergencyContactPhone,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_active_at': lastActiveAt?.toIso8601String(),
      'is_banned': isBanned,
      'ban_reason': banReason,
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'full_name': fullName,
      'avatar_url': avatarUrl,
      'date_of_birth': dateOfBirth != null ? "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}" : null,
      'gender': gender,
      'bio': bio,
      'is_verified': isVerified,
      'verification_status': verificationStatus,
      'driver_rating': driverRating,
      'passenger_rating': passengerRating,
      'total_trips_as_driver': totalTripsAsDriver,
      'total_trips_as_passenger': totalTripsAsPassenger,
      'preferred_language': preferredLanguage,
      'emergency_contact_name': emergencyContactName,
      'emergency_contact_phone': emergencyContactPhone,
      'is_banned': isBanned,
      'ban_reason': banReason,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'full_name': fullName,
      'avatar_url': avatarUrl,
      'date_of_birth': dateOfBirth != null ? "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}" : null,
      'gender': gender,
      'bio': bio,
      'is_verified': isVerified,
      'verification_status': verificationStatus,
      'driver_rating': driverRating,
      'passenger_rating': passengerRating,
      'total_trips_as_driver': totalTripsAsDriver,
      'total_trips_as_passenger': totalTripsAsPassenger,
      'preferred_language': preferredLanguage,
      'emergency_contact_name': emergencyContactName,
      'emergency_contact_phone': emergencyContactPhone,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_active_at': lastActiveAt?.toIso8601String(),
      'is_banned': isBanned,
      'ban_reason': banReason,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfilesModel && other.id == id && other.email == email && other.phone == phone && other.fullName == fullName && other.avatarUrl == avatarUrl && other.dateOfBirth == dateOfBirth && other.gender == gender && other.bio == bio && other.isVerified == isVerified && other.verificationStatus == verificationStatus && other.driverRating == driverRating && other.passengerRating == passengerRating && other.totalTripsAsDriver == totalTripsAsDriver && other.totalTripsAsPassenger == totalTripsAsPassenger && other.preferredLanguage == preferredLanguage && other.emergencyContactName == emergencyContactName && other.emergencyContactPhone == emergencyContactPhone && other.createdAt == createdAt && other.updatedAt == updatedAt && other.lastActiveAt == lastActiveAt && other.isBanned == isBanned && other.banReason == banReason;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ phone.hashCode ^ fullName.hashCode ^ avatarUrl.hashCode ^ dateOfBirth.hashCode ^ gender.hashCode ^ bio.hashCode ^ isVerified.hashCode ^ verificationStatus.hashCode ^ driverRating.hashCode ^ passengerRating.hashCode ^ totalTripsAsDriver.hashCode ^ totalTripsAsPassenger.hashCode ^ preferredLanguage.hashCode ^ emergencyContactName.hashCode ^ emergencyContactPhone.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ lastActiveAt.hashCode ^ isBanned.hashCode ^ banReason.hashCode;

  @override
  String toString() {
    return 'ProfilesModel(id: $id, email: $email, phone: $phone, fullName: $fullName, avatarUrl: $avatarUrl, dateOfBirth: $dateOfBirth, gender: $gender, bio: $bio, isVerified: $isVerified, verificationStatus: $verificationStatus, driverRating: $driverRating, passengerRating: $passengerRating, totalTripsAsDriver: $totalTripsAsDriver, totalTripsAsPassenger: $totalTripsAsPassenger, preferredLanguage: $preferredLanguage, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, createdAt: $createdAt, updatedAt: $updatedAt, lastActiveAt: $lastActiveAt, isBanned: $isBanned, banReason: $banReason)';
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

  /// Helper function to parse DATE format (YYYY-MM-DD)
  DateTime _parseDate(String dateStr) {
    final parts = dateStr.split('-');
    return DateTime(
      int.parse(parts[0]), // year
      int.parse(parts[1]), // month
      int.parse(parts[2])  // day
    );
  }
