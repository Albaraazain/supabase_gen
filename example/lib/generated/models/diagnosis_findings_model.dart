
class DiagnosisFindingsModel {
  final DateTime? createdAt;
  final String description;
  final String? findingId;
  final String jobId;
  final String? recommendedAction;
  final String? recordedBy;
  final String? severity;
  final DateTime? updatedAt;

  DiagnosisFindingsModel({
    this.createdAt,
    required this.description,
    this.findingId,
    required this.jobId,
    this.recommendedAction,
    this.recordedBy,
    this.severity,
    this.updatedAt,
  });

  factory DiagnosisFindingsModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisFindingsModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'] ?? '',
      findingId: json['finding_id'],
      jobId: json['job_id'] ?? '',
      recommendedAction: json['recommended_action'],
      recordedBy: json['recorded_by'],
      severity: json['severity'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    json['description'] = description;
    if (findingId != null) {
      json['finding_id'] = findingId;
    }
    json['job_id'] = jobId;
    if (recommendedAction != null) {
      json['recommended_action'] = recommendedAction;
    }
    if (recordedBy != null) {
      json['recorded_by'] = recordedBy;
    }
    if (severity != null) {
      json['severity'] = severity;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  DiagnosisFindingsModel copyWith({
    DateTime? createdAt,
    String? description,
    String? findingId,
    String? jobId,
    String? recommendedAction,
    String? recordedBy,
    String? severity,
    DateTime? updatedAt,
  }) {
    return DiagnosisFindingsModel(
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      findingId: findingId ?? this.findingId,
      jobId: jobId ?? this.jobId,
      recommendedAction: recommendedAction ?? this.recommendedAction,
      recordedBy: recordedBy ?? this.recordedBy,
      severity: severity ?? this.severity,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
