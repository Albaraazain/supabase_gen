
/// Generated model class for table work_tasks
class WorkTasksModel {
  /// Primary key field
  /// Non-nullable field
  final String taskId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String title;
  final String? description;
  /// Non-nullable field
  final String status;
  final String? estimatedDuration;
  final String? actualDuration;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int? sequenceNumber;
  final String? createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WorkTasksModel({this.taskId = "", required this.jobId, required this.title, this.description, this.status = 'not_started', this.estimatedDuration, this.actualDuration, this.startedAt, this.completedAt, this.sequenceNumber, this.createdBy, this.createdAt, this.updatedAt})
      : assert(() { assert(taskId != null, "task_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(title != null, "title constraint violation"); assert(status != null, "status constraint violation"); return true; }());

  factory WorkTasksModel.fromJson(Map<String, dynamic> json) {
    return WorkTasksModel(
      taskId: json['task_id'] ?? '',
      jobId: json['job_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      status: json['status'] ?? '',
      estimatedDuration: json['estimated_duration']?.toString(),
      actualDuration: json['actual_duration']?.toString(),
      startedAt: json['started_at'] != null ? DateTime.parse(json['started_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
      sequenceNumber: json['sequence_number'],
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'job_id': jobId,
      'title': title,
      'description': description,
      'status': status,
      'estimated_duration': estimatedDuration,
      'actual_duration': actualDuration,
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'sequence_number': sequenceNumber,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkTasksModel && other.taskId == taskId && other.jobId == jobId && other.title == title && other.description == description && other.status == status && other.estimatedDuration == estimatedDuration && other.actualDuration == actualDuration && other.startedAt == startedAt && other.completedAt == completedAt && other.sequenceNumber == sequenceNumber && other.createdBy == createdBy && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => taskId.hashCode ^ jobId.hashCode ^ title.hashCode ^ description.hashCode ^ status.hashCode ^ estimatedDuration.hashCode ^ actualDuration.hashCode ^ startedAt.hashCode ^ completedAt.hashCode ^ sequenceNumber.hashCode ^ createdBy.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'WorkTasksModel(taskId: $taskId, jobId: $jobId, title: $title, description: $description, status: $status, estimatedDuration: $estimatedDuration, actualDuration: $actualDuration, startedAt: $startedAt, completedAt: $completedAt, sequenceNumber: $sequenceNumber, createdBy: $createdBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => taskId;
}


