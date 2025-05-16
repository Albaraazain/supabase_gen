
/// Generated model class for table diagnosis_phase
class DiagnosisPhaseModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final DateTime diagnosisStartedAt;
  final DateTime? diagnosisEndedAt;
  final String? findingsSummary;
  final String? recommendedActions;

  DiagnosisPhaseModel({required this.jobId, DateTime? diagnosisStartedAt, this.diagnosisEndedAt, this.findingsSummary, this.recommendedActions})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(diagnosisStartedAt != null, "diagnosis_started_at constraint violation"); return true; }()),
        diagnosisStartedAt = diagnosisStartedAt ?? DateTime.now();

  factory DiagnosisPhaseModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisPhaseModel(
      jobId: json['job_id'] ?? '',
      diagnosisStartedAt: json['diagnosis_started_at'] != null ? DateTime.parse(json['diagnosis_started_at'].toString()) : DateTime.now(),
      diagnosisEndedAt: json['diagnosis_ended_at'] != null ? DateTime.parse(json['diagnosis_ended_at'].toString()) : null,
      findingsSummary: json['findings_summary'],
      recommendedActions: json['recommended_actions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'diagnosis_started_at': diagnosisStartedAt.toIso8601String(),
      'diagnosis_ended_at': diagnosisEndedAt?.toIso8601String(),
      'findings_summary': findingsSummary,
      'recommended_actions': recommendedActions,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DiagnosisPhaseModel && other.jobId == jobId && other.diagnosisStartedAt == diagnosisStartedAt && other.diagnosisEndedAt == diagnosisEndedAt && other.findingsSummary == findingsSummary && other.recommendedActions == recommendedActions;
  }

  @override
  int get hashCode => jobId.hashCode ^ diagnosisStartedAt.hashCode ^ diagnosisEndedAt.hashCode ^ findingsSummary.hashCode ^ recommendedActions.hashCode;

  @override
  String toString() {
    return 'DiagnosisPhaseModel(jobId: $jobId, diagnosisStartedAt: $diagnosisStartedAt, diagnosisEndedAt: $diagnosisEndedAt, findingsSummary: $findingsSummary, recommendedActions: $recommendedActions)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
}


