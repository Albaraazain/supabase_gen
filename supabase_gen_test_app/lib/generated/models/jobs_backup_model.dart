
class JobsBackupModel {
  final String? jobId;
  final String? broadcastId;
  final String? homeownerId;
  final String? professionalId;
  final String? serviceId;
  final DateTime? stageUpdatedAt;
  final DateTime? scheduledTime;
  final int? estimatedDuration;
  final String? currentStage;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? lastUpdatedBy;
  final DateTime? workStartedAt;
  final DateTime? workPausedAt;
  final String? totalPauseDuration;

  JobsBackupModel({
    this.jobId,
    this.broadcastId,
    this.homeownerId,
    this.professionalId,
    this.serviceId,
    this.stageUpdatedAt,
    this.scheduledTime,
    this.estimatedDuration,
    this.currentStage,
    this.createdAt,
    this.updatedAt,
    this.lastUpdatedBy,
    this.workStartedAt,
    this.workPausedAt,
    this.totalPauseDuration,
  });

  factory JobsBackupModel.fromJson(Map<String, dynamic> json) {
    return JobsBackupModel(
      jobId: json['job_id'],
      broadcastId: json['broadcast_id'],
      homeownerId: json['homeowner_id'],
      professionalId: json['professional_id'],
      serviceId: json['service_id'],
      stageUpdatedAt: json['stage_updated_at'] != null ? DateTime.parse(json['stage_updated_at'].toString()) : null,
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      estimatedDuration: json['estimated_duration'],
      currentStage: json['current_stage'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      lastUpdatedBy: json['last_updated_by'],
      workStartedAt: json['work_started_at'] != null ? DateTime.parse(json['work_started_at'].toString()) : null,
      workPausedAt: json['work_paused_at'] != null ? DateTime.parse(json['work_paused_at'].toString()) : null,
      totalPauseDuration: json['total_pause_duration'],
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
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'last_updated_by': lastUpdatedBy,
      'work_started_at': workStartedAt?.toIso8601String(),
      'work_paused_at': workPausedAt?.toIso8601String(),
      'total_pause_duration': totalPauseDuration,
    };
  }

  JobsBackupModel copyWith({
    String? jobId,
    String? broadcastId,
    String? homeownerId,
    String? professionalId,
    String? serviceId,
    DateTime? stageUpdatedAt,
    DateTime? scheduledTime,
    int? estimatedDuration,
    String? currentStage,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? lastUpdatedBy,
    DateTime? workStartedAt,
    DateTime? workPausedAt,
    String? totalPauseDuration,
  }) {
    return JobsBackupModel(
      jobId: jobId ?? this.jobId,
      broadcastId: broadcastId ?? this.broadcastId,
      homeownerId: homeownerId ?? this.homeownerId,
      professionalId: professionalId ?? this.professionalId,
      serviceId: serviceId ?? this.serviceId,
      stageUpdatedAt: stageUpdatedAt ?? this.stageUpdatedAt,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      currentStage: currentStage ?? this.currentStage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
      workStartedAt: workStartedAt ?? this.workStartedAt,
      workPausedAt: workPausedAt ?? this.workPausedAt,
      totalPauseDuration: totalPauseDuration ?? this.totalPauseDuration,
    );
  }
}
