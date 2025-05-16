
/// Generated model class for table users
class UsersModel {
  /// Primary key field
  /// Non-nullable field
  final String userId;
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

  UsersModel({this.userId = "", required this.email, required this.fullName, this.phone, this.profileImageUrl, required this.userType, this.createdAt, this.updatedAt, this.status})
      : assert(() { assert(userId != null, "user_id constraint violation"); assert(email != null, "email constraint violation"); assert(fullName != null, "full_name constraint violation"); assert(userType != null, "user_type constraint violation"); return true; }());

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      userId: json['user_id'] ?? '',
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
      'user_id': userId,
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
    return other is UsersModel && other.userId == userId && other.email == email && other.fullName == fullName && other.phone == phone && other.profileImageUrl == profileImageUrl && other.userType == userType && other.createdAt == createdAt && other.updatedAt == updatedAt && other.status == status;
  }

  @override
  int get hashCode => userId.hashCode ^ email.hashCode ^ fullName.hashCode ^ phone.hashCode ^ profileImageUrl.hashCode ^ userType.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'UsersModel(userId: $userId, email: $email, fullName: $fullName, phone: $phone, profileImageUrl: $profileImageUrl, userType: $userType, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
  }
  /// Get the primary identifier for this record
  String get id => userId;
}


