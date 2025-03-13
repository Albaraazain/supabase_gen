
class JobsModel {
  final String? broadcastId;
  final DateTime? createdAt;
  final String? currentSessionId;
  final String currentStage;
  final int? estimatedDuration;
  final String homeownerId;
  final String? jobId;
  final String? lastUpdatedBy;
  final String professionalId;
  final DateTime? scheduledTime;
  final String serviceId;
  final DateTime? stageUpdatedAt;
  final String? totalPauseDuration;
  final DateTime? updatedAt;
  final DateTime? workPausedAt;
  final DateTime? workStartedAt;

  JobsModel({
    this.broadcastId,
    this.createdAt,
    this.currentSessionId,
    required this.currentStage,
    this.estimatedDuration,
    required this.homeownerId,
    this.jobId,
    this.lastUpdatedBy,
    required this.professionalId,
    this.scheduledTime,
    required this.serviceId,
    this.stageUpdatedAt,
    this.totalPauseDuration,
    this.updatedAt,
    this.workPausedAt,
    this.workStartedAt,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory JobsModel.fromJson(Map<String, dynamic> json) {
    return JobsModel(
      broadcastId: json['broadcast_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      currentSessionId: json['current_session_id'],
      currentStage: json['current_stage'] ?? '',
      estimatedDuration: json['estimated_duration'],
      homeownerId: json['homeowner_id'] ?? '',
      jobId: json['job_id'],
      lastUpdatedBy: json['last_updated_by'],
      professionalId: json['professional_id'] ?? '',
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      serviceId: json['service_id'] ?? '',
      stageUpdatedAt: json['stage_updated_at'] != null ? DateTime.parse(json['stage_updated_at'].toString()) : null,
      totalPauseDuration: json['total_pause_duration'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      workPausedAt: json['work_paused_at'] != null ? DateTime.parse(json['work_paused_at'].toString()) : null,
      workStartedAt: json['work_started_at'] != null ? DateTime.parse(json['work_started_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (broadcastId != null) {
      json['broadcast_id'] = broadcastId;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (currentSessionId != null) {
      json['current_session_id'] = currentSessionId;
    }
    json['current_stage'] = currentStage;
    if (estimatedDuration != null) {
      json['estimated_duration'] = estimatedDuration;
    }
    json['homeowner_id'] = homeownerId;
    if (jobId != null) {
      json['job_id'] = jobId;
    }
    if (lastUpdatedBy != null) {
      json['last_updated_by'] = lastUpdatedBy;
    }
    json['professional_id'] = professionalId;
    if (scheduledTime != null) {
      json['scheduled_time'] = scheduledTime!.toIso8601String();
    }
    json['service_id'] = serviceId;
    if (stageUpdatedAt != null) {
      json['stage_updated_at'] = stageUpdatedAt!.toIso8601String();
    }
    if (totalPauseDuration != null) {
      json['total_pause_duration'] = totalPauseDuration;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    if (workPausedAt != null) {
      json['work_paused_at'] = workPausedAt!.toIso8601String();
    }
    if (workStartedAt != null) {
      json['work_started_at'] = workStartedAt!.toIso8601String();
    }
    return json;
  }

  JobsModel copyWith({
    String? broadcastId,
    DateTime? createdAt,
    String? currentSessionId,
    String? currentStage,
    int? estimatedDuration,
    String? homeownerId,
    String? jobId,
    String? lastUpdatedBy,
    String? professionalId,
    DateTime? scheduledTime,
    String? serviceId,
    DateTime? stageUpdatedAt,
    String? totalPauseDuration,
    DateTime? updatedAt,
    DateTime? workPausedAt,
    DateTime? workStartedAt,
  }) {
    return JobsModel(
      broadcastId: broadcastId ?? this.broadcastId,
      createdAt: createdAt ?? this.createdAt,
      currentSessionId: currentSessionId ?? this.currentSessionId,
      currentStage: currentStage ?? this.currentStage,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      homeownerId: homeownerId ?? this.homeownerId,
      jobId: jobId ?? this.jobId,
      lastUpdatedBy: lastUpdatedBy ?? this.lastUpdatedBy,
      professionalId: professionalId ?? this.professionalId,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      serviceId: serviceId ?? this.serviceId,
      stageUpdatedAt: stageUpdatedAt ?? this.stageUpdatedAt,
      totalPauseDuration: totalPauseDuration ?? this.totalPauseDuration,
      updatedAt: updatedAt ?? this.updatedAt,
      workPausedAt: workPausedAt ?? this.workPausedAt,
      workStartedAt: workStartedAt ?? this.workStartedAt,
    );
  }
}
