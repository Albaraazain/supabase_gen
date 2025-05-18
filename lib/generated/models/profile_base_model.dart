
/// Generated model class for table profile_base
class ProfileBaseModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Unique field
  /// Non-nullable field
  final String email;
  /// Non-nullable field
  final String fullName;
  final String? phone;
  final String? profileImageUrl;
  /// Non-nullable field
  final String userType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? status;

  ProfileBaseModel({this.id = "", required this.email, required this.fullName, this.phone, this.profileImageUrl, required this.userType, this.createdAt, this.updatedAt, this.status})
      : assert(() { assert(id != null, "id constraint violation"); assert(email != null, "email constraint violation"); assert(fullName != null, "full_name constraint violation"); assert(userType != null, "user_type constraint violation"); return true; }());

  factory ProfileBaseModel.fromJson(Map<String, dynamic> json) {
    return ProfileBaseModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'],
      profileImageUrl: json['profile_image_url'],
      userType: json['user_type'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'profile_image_url': profileImageUrl,
      'user_type': userType,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'status': status,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileBaseModel && other.id == id && other.email == email && other.fullName == fullName && other.phone == phone && other.profileImageUrl == profileImageUrl && other.userType == userType && other.createdAt == createdAt && other.updatedAt == updatedAt && other.status == status;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ fullName.hashCode ^ phone.hashCode ^ profileImageUrl.hashCode ^ userType.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'ProfileBaseModel(id: $id, email: $email, fullName: $fullName, phone: $phone, profileImageUrl: $profileImageUrl, userType: $userType, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
  }
  // Primary identifier is already defined as a field
}


