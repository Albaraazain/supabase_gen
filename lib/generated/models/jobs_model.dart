
/// Generated model class for table jobs
class JobsModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  final String? broadcastId;
  /// Non-nullable field
  final String homeownerId;
  /// Non-nullable field
  final String professionalId;
  /// Non-nullable field
  final String serviceId;
  final DateTime? stageUpdatedAt;
  final DateTime? scheduledTime;
  final int? estimatedDuration;
  /// Non-nullable field
  final String currentStage;
  final DateTime? workStartedAt;
  final DateTime? workPausedAt;
  final String? totalPauseDuration;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? lastUpdatedBy;
  final String? currentSessionId;

  JobsModel({this.jobId = "", this.broadcastId, required this.homeownerId, required this.professionalId, required this.serviceId, this.stageUpdatedAt, this.scheduledTime, this.estimatedDuration, required this.currentStage, this.workStartedAt, this.workPausedAt, this.totalPauseDuration, this.createdAt, this.updatedAt, this.lastUpdatedBy, this.currentSessionId})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(homeownerId != null, "homeowner_id constraint violation"); assert(professionalId != null, "professional_id constraint violation"); assert(serviceId != null, "service_id constraint violation"); assert(currentStage != null, "current_stage constraint violation"); return true; }());

  factory JobsModel.fromJson(Map<String, dynamic> json) {
    return JobsModel(
      jobId: json['job_id'] ?? '',
      broadcastId: json['broadcast_id'],
      homeownerId: json['homeowner_id'] ?? '',
      professionalId: json['professional_id'] ?? '',
      serviceId: json['service_id'] ?? '',
      stageUpdatedAt: json['stage_updated_at'] != null ? DateTime.parse(json['stage_updated_at'].toString()) : null,
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      estimatedDuration: json['estimated_duration'],
      currentStage: json['current_stage'] ?? '',
      workStartedAt: json['work_started_at'] != null ? DateTime.parse(json['work_started_at'].toString()) : null,
      workPausedAt: json['work_paused_at'] != null ? DateTime.parse(json['work_paused_at'].toString()) : null,
      totalPauseDuration: json['total_pause_duration'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      lastUpdatedBy: json['last_updated_by'],
      currentSessionId: json['current_session_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'broadcast_id': broadcastId,
      'homeowner_id': homeownerId,
      'professional_id': professionalId,
      'service_id': serviceId,
      'stage_updated_at': stageUpdatedAt?.toIso8601String(),
      'scheduled_time': scheduledTime?.toIso8601String(),
      'estimated_duration': estimatedDuration,
      'current_stage': currentStage,
      'work_started_at': workStartedAt?.toIso8601String(),
      'work_paused_at': workPausedAt?.toIso8601String(),
      'total_pause_duration': totalPauseDuration,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_updated_by': lastUpdatedBy,
      'current_session_id': currentSessionId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobsModel && other.jobId == jobId && other.broadcastId == broadcastId && other.homeownerId == homeownerId && other.professionalId == professionalId && other.serviceId == serviceId && other.stageUpdatedAt == stageUpdatedAt && other.scheduledTime == scheduledTime && other.estimatedDuration == estimatedDuration && other.currentStage == currentStage && other.workStartedAt == workStartedAt && other.workPausedAt == workPausedAt && other.totalPauseDuration == totalPauseDuration && other.createdAt == createdAt && other.updatedAt == updatedAt && other.lastUpdatedBy == lastUpdatedBy && other.currentSessionId == currentSessionId;
  }

  @override
  int get hashCode => jobId.hashCode ^ broadcastId.hashCode ^ homeownerId.hashCode ^ professionalId.hashCode ^ serviceId.hashCode ^ stageUpdatedAt.hashCode ^ scheduledTime.hashCode ^ estimatedDuration.hashCode ^ currentStage.hashCode ^ workStartedAt.hashCode ^ workPausedAt.hashCode ^ totalPauseDuration.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ lastUpdatedBy.hashCode ^ currentSessionId.hashCode;

  @override
  String toString() {
    return 'JobsModel(jobId: $jobId, broadcastId: $broadcastId, homeownerId: $homeownerId, professionalId: $professionalId, serviceId: $serviceId, stageUpdatedAt: $stageUpdatedAt, scheduledTime: $scheduledTime, estimatedDuration: $estimatedDuration, currentStage: $currentStage, workStartedAt: $workStartedAt, workPausedAt: $workPausedAt, totalPauseDuration: $totalPauseDuration, createdAt: $createdAt, updatedAt: $updatedAt, lastUpdatedBy: $lastUpdatedBy, currentSessionId: $currentSessionId)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
}


