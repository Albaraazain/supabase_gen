import '../utils/geo_json.dart';

/// Generated model class for table jobs
class JobsModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  final String? broadcastId;
  /// Non-nullable field
  final String homeownerId;
  final String? professionalId;
  /// Non-nullable field
  final String currentStage;
  /// Non-nullable field
  final DateTime createdAt;
  /// Non-nullable field
  final DateTime updatedAt;
  final DateTime? stageUpdatedAt;
  final DateTime? scheduledTime;
  final int? estimatedDuration;
  final DateTime? workStartedAt;
  final DateTime? workPausedAt;
  final String? totalPauseDuration;
  final String? lastUpdatedBy;
  final String? currentSessionId;
  final Map<String, dynamic>? metadata;
  final String? stageNotes;
  final Map<String, dynamic>? stageMetadata;
  /// Non-nullable field
  final bool isActive;
  /// Non-nullable field
  final String categoryId;

  JobsModel({required this.jobId, this.broadcastId, required this.homeownerId, this.professionalId, required this.currentStage, DateTime? createdAt, DateTime? updatedAt, this.stageUpdatedAt, this.scheduledTime, this.estimatedDuration, this.workStartedAt, this.workPausedAt, this.totalPauseDuration, this.lastUpdatedBy, this.currentSessionId, this.metadata, this.stageNotes, this.stageMetadata, this.isActive = true, required this.categoryId})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(homeownerId != null, "homeowner_id constraint violation"); assert(currentStage != null, "current_stage constraint violation"); assert(createdAt != null, "created_at constraint violation"); assert(updatedAt != null, "updated_at constraint violation"); assert(isActive != null, "is_active constraint violation"); assert(categoryId != null, "category_id constraint violation"); return true; }()),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory JobsModel.fromJson(Map<String, dynamic> json) {
    return JobsModel(
      jobId: json['job_id'] ?? '',
      broadcastId: json['broadcast_id'],
      homeownerId: json['homeowner_id'] ?? '',
      professionalId: json['professional_id'],
      currentStage: json['current_stage'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
      stageUpdatedAt: json['stage_updated_at'] != null ? DateTime.parse(json['stage_updated_at'].toString()) : null,
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      estimatedDuration: json['estimated_duration'],
      workStartedAt: json['work_started_at'] != null ? DateTime.parse(json['work_started_at'].toString()) : null,
      workPausedAt: json['work_paused_at'] != null ? DateTime.parse(json['work_paused_at'].toString()) : null,
      totalPauseDuration: json['total_pause_duration'],
      lastUpdatedBy: json['last_updated_by'],
      currentSessionId: json['current_session_id'],
      metadata: json['metadata'],
      stageNotes: json['stage_notes'],
      stageMetadata: json['stage_metadata'],
      isActive: json['is_active'] ?? false,
      categoryId: json['category_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'broadcast_id': broadcastId,
      'homeowner_id': homeownerId,
      'professional_id': professionalId,
      'current_stage': currentStage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'stage_updated_at': stageUpdatedAt?.toIso8601String(),
      'scheduled_time': scheduledTime?.toIso8601String(),
      'estimated_duration': estimatedDuration,
      'work_started_at': workStartedAt?.toIso8601String(),
      'work_paused_at': workPausedAt?.toIso8601String(),
      'total_pause_duration': totalPauseDuration,
      'last_updated_by': lastUpdatedBy,
      'current_session_id': currentSessionId,
      'metadata': metadata,
      'stage_notes': stageNotes,
      'stage_metadata': stageMetadata,
      'is_active': isActive,
      'category_id': categoryId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobsModel && other.jobId == jobId && other.broadcastId == broadcastId && other.homeownerId == homeownerId && other.professionalId == professionalId && other.currentStage == currentStage && other.createdAt == createdAt && other.updatedAt == updatedAt && other.stageUpdatedAt == stageUpdatedAt && other.scheduledTime == scheduledTime && other.estimatedDuration == estimatedDuration && other.workStartedAt == workStartedAt && other.workPausedAt == workPausedAt && other.totalPauseDuration == totalPauseDuration && other.lastUpdatedBy == lastUpdatedBy && other.currentSessionId == currentSessionId && other.metadata == metadata && other.stageNotes == stageNotes && other.stageMetadata == stageMetadata && other.isActive == isActive && other.categoryId == categoryId;
  }

  @override
  int get hashCode => jobId.hashCode ^ broadcastId.hashCode ^ homeownerId.hashCode ^ professionalId.hashCode ^ currentStage.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ stageUpdatedAt.hashCode ^ scheduledTime.hashCode ^ estimatedDuration.hashCode ^ workStartedAt.hashCode ^ workPausedAt.hashCode ^ totalPauseDuration.hashCode ^ lastUpdatedBy.hashCode ^ currentSessionId.hashCode ^ metadata.hashCode ^ stageNotes.hashCode ^ stageMetadata.hashCode ^ isActive.hashCode ^ categoryId.hashCode;

  @override
  String toString() {
    return 'JobsModel(jobId: $jobId, broadcastId: $broadcastId, homeownerId: $homeownerId, professionalId: $professionalId, currentStage: $currentStage, createdAt: $createdAt, updatedAt: $updatedAt, stageUpdatedAt: $stageUpdatedAt, scheduledTime: $scheduledTime, estimatedDuration: $estimatedDuration, workStartedAt: $workStartedAt, workPausedAt: $workPausedAt, totalPauseDuration: $totalPauseDuration, lastUpdatedBy: $lastUpdatedBy, currentSessionId: $currentSessionId, metadata: $metadata, stageNotes: $stageNotes, stageMetadata: $stageMetadata, isActive: $isActive, categoryId: $categoryId)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
}


