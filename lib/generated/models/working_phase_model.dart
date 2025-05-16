import '../utils/geo_json.dart';

/// Generated model class for table working_phase
class WorkingPhaseModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final DateTime workStartedAt;
  final DateTime? workPausedAt;
  final String? totalPauseDuration;
  final String? currentSessionId;
  final double? completionPercentage;

  WorkingPhaseModel({required this.jobId, DateTime? workStartedAt, this.workPausedAt, this.totalPauseDuration, this.currentSessionId, this.completionPercentage})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(workStartedAt != null, "work_started_at constraint violation"); return true; }()),
        workStartedAt = workStartedAt ?? DateTime.now();

  factory WorkingPhaseModel.fromJson(Map<String, dynamic> json) {
    return WorkingPhaseModel(
      jobId: json['job_id'] ?? '',
      workStartedAt: json['work_started_at'] != null ? DateTime.parse(json['work_started_at'].toString()) : DateTime.now(),
      workPausedAt: json['work_paused_at'] != null ? DateTime.parse(json['work_paused_at'].toString()) : null,
      totalPauseDuration: json['total_pause_duration']?.toString(),
      currentSessionId: json['current_session_id'],
      completionPercentage: json['completion_percentage'] != null ? _toDouble(json['completion_percentage']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'work_started_at': workStartedAt.toIso8601String(),
      'work_paused_at': workPausedAt?.toIso8601String(),
      'total_pause_duration': totalPauseDuration,
      'current_session_id': currentSessionId,
      'completion_percentage': completionPercentage,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkingPhaseModel && other.jobId == jobId && other.workStartedAt == workStartedAt && other.workPausedAt == workPausedAt && other.totalPauseDuration == totalPauseDuration && other.currentSessionId == currentSessionId && other.completionPercentage == completionPercentage;
  }

  @override
  int get hashCode => jobId.hashCode ^ workStartedAt.hashCode ^ workPausedAt.hashCode ^ totalPauseDuration.hashCode ^ currentSessionId.hashCode ^ completionPercentage.hashCode;

  @override
  String toString() {
    return 'WorkingPhaseModel(jobId: $jobId, workStartedAt: $workStartedAt, workPausedAt: $workPausedAt, totalPauseDuration: $totalPauseDuration, currentSessionId: $currentSessionId, completionPercentage: $completionPercentage)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
}

  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
