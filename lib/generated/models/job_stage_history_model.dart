
/// Generated model class for table job_stage_history
class JobStageHistoryModel {
  /// Primary key field
  /// Non-nullable field
  final String historyId;
  /// Non-nullable field
  final String jobId;
  final String? fromStage;
  /// Non-nullable field
  final String toStage;
  final String? changedBy;
  final String? notes;
  final DateTime? createdAt;

  JobStageHistoryModel({this.historyId = "", required this.jobId, this.fromStage, required this.toStage, this.changedBy, this.notes, this.createdAt})
      : assert(() { assert(historyId != null, "history_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(toStage != null, "to_stage constraint violation"); return true; }());

  factory JobStageHistoryModel.fromJson(Map<String, dynamic> json) {
    return JobStageHistoryModel(
      historyId: json['history_id'] ?? '',
      jobId: json['job_id'] ?? '',
      fromStage: json['from_stage'],
      toStage: json['to_stage'] ?? '',
      changedBy: json['changed_by'],
      notes: json['notes'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history_id': historyId,
      'job_id': jobId,
      'from_stage': fromStage,
      'to_stage': toStage,
      'changed_by': changedBy,
      'notes': notes,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobStageHistoryModel && other.historyId == historyId && other.jobId == jobId && other.fromStage == fromStage && other.toStage == toStage && other.changedBy == changedBy && other.notes == notes && other.createdAt == createdAt;
  }

  @override
  int get hashCode => historyId.hashCode ^ jobId.hashCode ^ fromStage.hashCode ^ toStage.hashCode ^ changedBy.hashCode ^ notes.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'JobStageHistoryModel(historyId: $historyId, jobId: $jobId, fromStage: $fromStage, toStage: $toStage, changedBy: $changedBy, notes: $notes, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => historyId;
}


