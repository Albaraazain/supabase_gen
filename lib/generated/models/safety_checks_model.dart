
class SafetyChecksModel {
  final String checkId;
  final String? jobId;
  final String checkType;
  final String title;
  final String? description;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SafetyChecksModel({
    required this.checkId,
    this.jobId,
    required this.checkType,
    required this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SafetyChecksModel.fromJson(Map<String, dynamic> json) {
    return SafetyChecksModel(
      checkId: json['check_id'] ?? '',
      jobId: json['job_id'],
      checkType: json['check_type'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      status: json['status'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'check_id': checkId,
      'job_id': jobId,
      'check_type': checkType,
      'title': title,
      'description': description,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  SafetyChecksModel copyWith({
    String? checkId,
    String? jobId,
    String? checkType,
    String? title,
    String? description,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SafetyChecksModel(
      checkId: checkId ?? this.checkId,
      jobId: jobId ?? this.jobId,
      checkType: checkType ?? this.checkType,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
