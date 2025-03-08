
class UsersModel {
  final String userId;
  final String userId2;
  final String email;
  final String email2;
  final String fullName;
  final String fullName2;
  final String? phone;
  final String? phone2;
  final String? profileImageUrl;
  final String? profileImageUrl2;
  final String userType;
  final String userType2;
  final DateTime? createdAt;
  final DateTime? createdAt2;
  final DateTime? updatedAt;
  final DateTime? updatedAt2;
  final String? status;
  final String? status2;

  const UsersModel({
    required this.userId,
    required this.userId2,
    required this.email,
    required this.email2,
    required this.fullName,
    required this.fullName2,
    this.phone,
    this.phone2,
    this.profileImageUrl,
    this.profileImageUrl2,
    required this.userType,
    required this.userType2,
    this.createdAt,
    this.createdAt2,
    this.updatedAt,
    this.updatedAt2,
    this.status,
    this.status2,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      userId: json['user_id'] ?? '',
      userId2: json['user_id'] ?? '',
      email: json['email'] ?? '',
      email2: json['email'] ?? '',
      fullName: json['full_name'] ?? '',
      fullName2: json['full_name'] ?? '',
      phone: json['phone'],
      phone2: json['phone'],
      profileImageUrl: json['profile_image_url'],
      profileImageUrl2: json['profile_image_url'],
      userType: json['user_type'] ?? '',
      userType2: json['user_type'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      createdAt2: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      updatedAt2: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      status: json['status'],
      status2: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_id_2': userId2,
      'email': email,
      'email_2': email2,
      'full_name': fullName,
      'full_name_2': fullName2,
      'phone': phone,
      'phone_2': phone2,
      'profile_image_url': profileImageUrl,
      'profile_image_url_2': profileImageUrl2,
      'user_type': userType,
      'user_type_2': userType2,
      'created_at': createdAt?.toIso8601String(),
      'created_at_2': createdAt2?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'updated_at_2': updatedAt2?.toIso8601String(),
      'status': status,
      'status_2': status2,
    };
  }

  UsersModel copyWith({
    String? userId,
    String? userId2,
    String? email,
    String? email2,
    String? fullName,
    String? fullName2,
    String? phone,
    String? phone2,
    String? profileImageUrl,
    String? profileImageUrl2,
    String? userType,
    String? userType2,
    DateTime? createdAt,
    DateTime? createdAt2,
    DateTime? updatedAt,
    DateTime? updatedAt2,
    String? status,
    String? status2,
  }) {
    return UsersModel(
      userId: userId ?? this.userId,
      userId2: userId2 ?? this.userId2,
      email: email ?? this.email,
      email2: email2 ?? this.email2,
      fullName: fullName ?? this.fullName,
      fullName2: fullName2 ?? this.fullName2,
      phone: phone ?? this.phone,
      phone2: phone2 ?? this.phone2,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      profileImageUrl2: profileImageUrl2 ?? this.profileImageUrl2,
      userType: userType ?? this.userType,
      userType2: userType2 ?? this.userType2,
      createdAt: createdAt ?? this.createdAt,
      createdAt2: createdAt2 ?? this.createdAt2,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedAt2: updatedAt2 ?? this.updatedAt2,
      status: status ?? this.status,
      status2: status2 ?? this.status2,
    );
  }
}
