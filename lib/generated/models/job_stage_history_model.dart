
class JobStageHistoryModel {
  final String historyId;
  final String jobId;
  final String stage;
  final String? notes;
  final String createdBy;
  final DateTime? timestamp;

  const JobStageHistoryModel({
    required this.historyId,
    required this.jobId,
    required this.stage,
    this.notes,
    required this.createdBy,
    this.timestamp,
  });

  factory JobStageHistoryModel.fromJson(Map<String, dynamic> json) {
    return JobStageHistoryModel(
      historyId: json['history_id'] ?? '',
      jobId: json['job_id'] ?? '',
      stage: json['stage'] ?? '',
      notes: json['notes'],
      createdBy: json['created_by'] ?? '',
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history_id': historyId,
      'job_id': jobId,
      'stage': stage,
      'notes': notes,
      'created_by': createdBy,
      'timestamp': timestamp?.toIso8601String(),
    };
  }

  JobStageHistoryModel copyWith({
    String? historyId,
    String? jobId,
    String? stage,
    String? notes,
    String? createdBy,
    DateTime? timestamp,
  }) {
    return JobStageHistoryModel(
      historyId: historyId ?? this.historyId,
      jobId: jobId ?? this.jobId,
      stage: stage ?? this.stage,
      notes: notes ?? this.notes,
      createdBy: createdBy ?? this.createdBy,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
