import 'dart:convert';

class UsersModel {
  final String userId;
  final String userId;
  final String email;
  final String email;
  final String fullName;
  final String fullName;
  final String? phone;
  final String? phone;
  final String? profileImageUrl;
  final String? profileImageUrl;
  final String userType;
  final String userType;
  final DateTime? createdAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? updatedAt;
  final String? status;
  final String? status;

  const UsersModel({
    required this.userId,
    required this.userId,
    required this.email,
    required this.email,
    required this.fullName,
    required this.fullName,
    this.phone,
    this.phone,
    this.profileImageUrl,
    this.profileImageUrl,
    required this.userType,
    required this.userType,
    this.createdAt,
    this.createdAt,
    this.updatedAt,
    this.updatedAt,
    this.status,
    this.status,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      userId: json['user_id'] ?? '',
      userId: json['user_id'] ?? '',
      email: json['email'] ?? '',
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      fullName: json['full_name'] ?? '',
      phone: json['phone'],
      phone: json['phone'],
      profileImageUrl: json['profile_image_url'],
      profileImageUrl: json['profile_image_url'],
      userType: json['user_type'] ?? '',
      userType: json['user_type'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      status: json['status'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_id': userId,
      'email': email,
      'email': email,
      'full_name': fullName,
      'full_name': fullName,
      'phone': phone,
      'phone': phone,
      'profile_image_url': profileImageUrl,
      'profile_image_url': profileImageUrl,
      'user_type': userType,
      'user_type': userType,
      'created_at': createdAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'status': status,
      'status': status,
    };
  }

  UsersModel copyWith({
    String? userId,
    String? userId,
    String? email,
    String? email,
    String? fullName,
    String? fullName,
    String? phone,
    String? phone,
    String? profileImageUrl,
    String? profileImageUrl,
    String? userType,
    String? userType,
    DateTime? createdAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? updatedAt,
    String? status,
    String? status,
  }) {
    return UsersModel(
      userId: userId ?? this.userId,
      userId: userId ?? this.userId,
      email: email ?? this.email,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      userType: userType ?? this.userType,
      userType: userType ?? this.userType,
      createdAt: createdAt ?? this.createdAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      status: status ?? this.status,
    );
  }
}
