
class JobStageHistoryModel {
  final String? changedBy;
  final DateTime? createdAt;
  final String? fromStage;
  final String? historyId;
  final String jobId;
  final String? notes;
  final String toStage;

  JobStageHistoryModel({
    this.changedBy,
    this.createdAt,
    this.fromStage,
    this.historyId,
    required this.jobId,
    this.notes,
    required this.toStage,
  });

  factory JobStageHistoryModel.fromJson(Map<String, dynamic> json) {
    return JobStageHistoryModel(
      changedBy: json['changed_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      fromStage: json['from_stage'],
      historyId: json['history_id'],
      jobId: json['job_id'] ?? '',
      notes: json['notes'],
      toStage: json['to_stage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (changedBy != null) {
      json['changed_by'] = changedBy;
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (fromStage != null) {
      json['from_stage'] = fromStage;
    }
    if (historyId != null) {
      json['history_id'] = historyId;
    }
    json['job_id'] = jobId;
    if (notes != null) {
      json['notes'] = notes;
    }
    json['to_stage'] = toStage;
    return json;
  }

  JobStageHistoryModel copyWith({
    String? changedBy,
    DateTime? createdAt,
    String? fromStage,
    String? historyId,
    String? jobId,
    String? notes,
    String? toStage,
  }) {
    return JobStageHistoryModel(
      changedBy: changedBy ?? this.changedBy,
      createdAt: createdAt ?? this.createdAt,
      fromStage: fromStage ?? this.fromStage,
      historyId: historyId ?? this.historyId,
      jobId: jobId ?? this.jobId,
      notes: notes ?? this.notes,
      toStage: toStage ?? this.toStage,
    );
  }
}
