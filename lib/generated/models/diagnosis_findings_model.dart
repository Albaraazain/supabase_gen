
/// Generated model class for table diagnosis_findings
class DiagnosisFindingsModel {
  /// Primary key field
  /// Non-nullable field
  final String findingId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String description;
  final String? severity;
  final String? recommendedAction;
  final String? recordedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  /// Non-nullable field
  final String title;
  final String? iconType;

  DiagnosisFindingsModel({this.findingId = "", required this.jobId, required this.description, this.severity, this.recommendedAction, this.recordedBy, this.createdAt, this.updatedAt, this.title = 'Issue Found', this.iconType})
      : assert(() { assert(findingId != null, "finding_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(description != null, "description constraint violation"); assert(title != null, "title constraint violation"); return true; }());

  factory DiagnosisFindingsModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisFindingsModel(
      findingId: json['finding_id'] ?? '',
      jobId: json['job_id'] ?? '',
      description: json['description'] ?? '',
      severity: json['severity'],
      recommendedAction: json['recommended_action'],
      recordedBy: json['recorded_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      title: json['title'] ?? '',
      iconType: json['icon_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'finding_id': findingId,
      'job_id': jobId,
      'description': description,
      'severity': severity,
      'recommended_action': recommendedAction,
      'recorded_by': recordedBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'title': title,
      'icon_type': iconType,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DiagnosisFindingsModel && other.findingId == findingId && other.jobId == jobId && other.description == description && other.severity == severity && other.recommendedAction == recommendedAction && other.recordedBy == recordedBy && other.createdAt == createdAt && other.updatedAt == updatedAt && other.title == title && other.iconType == iconType;
  }

  @override
  int get hashCode => findingId.hashCode ^ jobId.hashCode ^ description.hashCode ^ severity.hashCode ^ recommendedAction.hashCode ^ recordedBy.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ title.hashCode ^ iconType.hashCode;

  @override
  String toString() {
    return 'DiagnosisFindingsModel(findingId: $findingId, jobId: $jobId, description: $description, severity: $severity, recommendedAction: $recommendedAction, recordedBy: $recordedBy, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, iconType: $iconType)';
  }
  /// Get the primary identifier for this record
  String get id => findingId;
}


