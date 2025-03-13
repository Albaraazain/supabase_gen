
class UsersModel {
  final DateTime? createdAt;
  final String email;
  final String fullName;
  final String? phone;
  final String? profileImageUrl;
  final String? status;
  final DateTime? updatedAt;
  final String? userId;
  final String userType;

  UsersModel({
    this.createdAt,
    required this.email,
    required this.fullName,
    this.phone,
    this.profileImageUrl,
    this.status,
    this.updatedAt,
    this.userId,
    required this.userType,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'],
      profileImageUrl: json['profile_image_url'],
      status: json['status'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      userId: json['user_id'],
      userType: json['user_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    json['email'] = email;
    json['full_name'] = fullName;
    if (phone != null) {
      json['phone'] = phone;
    }
    if (profileImageUrl != null) {
      json['profile_image_url'] = profileImageUrl;
    }
    if (status != null) {
      json['status'] = status;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (userId != null) {
      json['user_id'] = userId;
    }
    json['user_type'] = userType;
    return json;
  }

  UsersModel copyWith({
    DateTime? createdAt,
    String? email,
    String? fullName,
    String? phone,
    String? profileImageUrl,
    String? status,
    DateTime? updatedAt,
    String? userId,
    String? userType,
  }) {
    return UsersModel(
      createdAt: createdAt ?? this.createdAt,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
    );
  }
}
