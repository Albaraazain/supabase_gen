import '../utils/geo_json.dart';

/// Generated model class for table active_jobs_old
/// Database triggers associated with this table:
/// - active_job_stage_change: UPDATE BEFORE - EXECUTE FUNCTION handle_stage_transition()
///   Signature: handle_stage_transition() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for handle_stage_transition>
/// - set_stage_updated_at: UPDATE BEFORE - EXECUTE FUNCTION update_stage_updated_at()
///   Signature: update_stage_updated_at() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_stage_updated_at>
///
class ActiveJobsOldModel {
  /// Primary key field
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String homeownerId;
  final String? professionalId;
  /// Non-nullable field
  final String serviceId;
  /// Non-nullable field
  final String currentStage;
  /// Non-nullable field
  final DateTime createdAt;
  /// Non-nullable field
  final DateTime updatedAt;
  final Map<String, dynamic>? metadata;
  final DateTime? stageUpdatedAt;
  final DateTime? scheduledTime;
  final int? estimatedDuration;
  final String? stageNotes;
  final Map<String, dynamic>? stageMetadata;
  final String? categoryId;

  ActiveJobsOldModel({required this.jobId, required this.homeownerId, this.professionalId, required this.serviceId, required this.currentStage, DateTime? createdAt, DateTime? updatedAt, this.metadata, this.stageUpdatedAt, this.scheduledTime, this.estimatedDuration, this.stageNotes, this.stageMetadata, this.categoryId})
      : assert(() { assert(jobId != null, "job_id constraint violation"); assert(homeownerId != null, "homeowner_id constraint violation"); assert(serviceId != null, "service_id constraint violation"); assert(currentStage != null, "current_stage constraint violation"); assert(createdAt != null, "created_at constraint violation"); assert(updatedAt != null, "updated_at constraint violation"); return true; }()),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory ActiveJobsOldModel.fromJson(Map<String, dynamic> json) {
    return ActiveJobsOldModel(
      jobId: json['job_id'] ?? '',
      homeownerId: json['homeowner_id'] ?? '',
      professionalId: json['professional_id'],
      serviceId: json['service_id'] ?? '',
      currentStage: json['current_stage'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
      metadata: json['metadata'],
      stageUpdatedAt: json['stage_updated_at'] != null ? DateTime.parse(json['stage_updated_at'].toString()) : null,
      scheduledTime: json['scheduled_time'] != null ? DateTime.parse(json['scheduled_time'].toString()) : null,
      estimatedDuration: json['estimated_duration'],
      stageNotes: json['stage_notes'],
      stageMetadata: json['stage_metadata'],
      categoryId: json['category_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_id': jobId,
      'homeowner_id': homeownerId,
      'professional_id': professionalId,
      'service_id': serviceId,
      'current_stage': currentStage,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'metadata': metadata,
      'stage_updated_at': stageUpdatedAt?.toIso8601String(),
      'scheduled_time': scheduledTime?.toIso8601String(),
      'estimated_duration': estimatedDuration,
      'stage_notes': stageNotes,
      'stage_metadata': stageMetadata,
      'category_id': categoryId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActiveJobsOldModel && other.jobId == jobId && other.homeownerId == homeownerId && other.professionalId == professionalId && other.serviceId == serviceId && other.currentStage == currentStage && other.createdAt == createdAt && other.updatedAt == updatedAt && other.metadata == metadata && other.stageUpdatedAt == stageUpdatedAt && other.scheduledTime == scheduledTime && other.estimatedDuration == estimatedDuration && other.stageNotes == stageNotes && other.stageMetadata == stageMetadata && other.categoryId == categoryId;
  }

  @override
  int get hashCode => jobId.hashCode ^ homeownerId.hashCode ^ professionalId.hashCode ^ serviceId.hashCode ^ currentStage.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ metadata.hashCode ^ stageUpdatedAt.hashCode ^ scheduledTime.hashCode ^ estimatedDuration.hashCode ^ stageNotes.hashCode ^ stageMetadata.hashCode ^ categoryId.hashCode;

  @override
  String toString() {
    return 'ActiveJobsOldModel(jobId: $jobId, homeownerId: $homeownerId, professionalId: $professionalId, serviceId: $serviceId, currentStage: $currentStage, createdAt: $createdAt, updatedAt: $updatedAt, metadata: $metadata, stageUpdatedAt: $stageUpdatedAt, scheduledTime: $scheduledTime, estimatedDuration: $estimatedDuration, stageNotes: $stageNotes, stageMetadata: $stageMetadata, categoryId: $categoryId)';
  }
  /// Get the primary identifier for this record
  String get id => jobId;
}


