
class SafetyChecksModel {
  final String? checkId;
  final String checkName;
  final DateTime? createdAt;
  final String jobId;
  final String? notes;
  final DateTime? performedAt;
  final String? performedBy;
  final String status;
  final DateTime? updatedAt;

  SafetyChecksModel({
    this.checkId,
    required this.checkName,
    this.createdAt,
    required this.jobId,
    this.notes,
    this.performedAt,
    this.performedBy,
    required this.status,
    this.updatedAt,
  });

  factory SafetyChecksModel.fromJson(Map<String, dynamic> json) {
    return SafetyChecksModel(
      checkId: json['check_id'],
      checkName: json['check_name'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      jobId: json['job_id'] ?? '',
      notes: json['notes'],
      performedAt: json['performed_at'] != null ? DateTime.parse(json['performed_at'].toString()) : null,
      performedBy: json['performed_by'],
      status: json['status'] ?? '',
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (checkId != null) {
      json['check_id'] = checkId;
    }
    json['check_name'] = checkName;
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    json['job_id'] = jobId;
    if (notes != null) {
      json['notes'] = notes;
    }
    if (performedAt != null) {
      json['performed_at'] = performedAt!.toIso8601String();
    }
    if (performedBy != null) {
      json['performed_by'] = performedBy;
    }
    json['status'] = status;
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  SafetyChecksModel copyWith({
    String? checkId,
    String? checkName,
    DateTime? createdAt,
    String? jobId,
    String? notes,
    DateTime? performedAt,
    String? performedBy,
    String? status,
    DateTime? updatedAt,
  }) {
    return SafetyChecksModel(
      checkId: checkId ?? this.checkId,
      checkName: checkName ?? this.checkName,
      createdAt: createdAt ?? this.createdAt,
      jobId: jobId ?? this.jobId,
      notes: notes ?? this.notes,
      performedAt: performedAt ?? this.performedAt,
      performedBy: performedBy ?? this.performedBy,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
