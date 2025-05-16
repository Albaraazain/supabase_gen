
/// Generated model class for table job_tasks
class JobTasksModel {
  /// Primary key field
  /// Non-nullable field
  final String taskId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String title;
  final String? description;
  final String? status;
  final DateTime? completedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? createdBy;

  JobTasksModel({this.taskId = "", required this.jobId, required this.title, this.description, this.status, this.completedAt, this.createdAt, this.updatedAt, this.createdBy})
      : assert(() { assert(taskId != null, "task_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(title != null, "title constraint violation"); return true; }());

  factory JobTasksModel.fromJson(Map<String, dynamic> json) {
    return JobTasksModel(
      taskId: json['task_id'] ?? '',
      jobId: json['job_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      status: json['status'],
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      createdBy: json['created_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'job_id': jobId,
      'title': title,
      'description': description,
      'status': status,
      'completed_at': completedAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'created_by': createdBy,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is JobTasksModel && other.taskId == taskId && other.jobId == jobId && other.title == title && other.description == description && other.status == status && other.completedAt == completedAt && other.createdAt == createdAt && other.updatedAt == updatedAt && other.createdBy == createdBy;
  }

  @override
  int get hashCode => taskId.hashCode ^ jobId.hashCode ^ title.hashCode ^ description.hashCode ^ status.hashCode ^ completedAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ createdBy.hashCode;

  @override
  String toString() {
    return 'JobTasksModel(taskId: $taskId, jobId: $jobId, title: $title, description: $description, status: $status, completedAt: $completedAt, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy)';
  }
  /// Get the primary identifier for this record
  String get id => taskId;
}


