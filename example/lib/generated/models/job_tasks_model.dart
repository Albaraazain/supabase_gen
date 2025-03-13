
class JobTasksModel {
  final DateTime? completedAt;
  final DateTime? createdAt;
  final String? createdBy;
  final String? description;
  final String jobId;
  final String? status;
  final String? taskId;
  final String title;
  final DateTime? updatedAt;

  JobTasksModel({
    this.completedAt,
    this.createdAt,
    this.createdBy,
    this.description,
    required this.jobId,
    this.status,
    this.taskId,
    required this.title,
    this.updatedAt,
  });

  factory JobTasksModel.fromJson(Map<String, dynamic> json) {
    return JobTasksModel(
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      createdBy: json['created_by'],
      description: json['description'],
      jobId: json['job_id'] ?? '',
      status: json['status'],
      taskId: json['task_id'],
      title: json['title'] ?? '',
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (completedAt != null) {
      json['completed_at'] = completedAt!.toIso8601String();
    }
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (createdBy != null) {
      json['created_by'] = createdBy;
    }
    if (description != null) {
      json['description'] = description;
    }
    json['job_id'] = jobId;
    if (status != null) {
      json['status'] = status;
    }
    if (taskId != null) {
      json['task_id'] = taskId;
    }
    json['title'] = title;
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  JobTasksModel copyWith({
    DateTime? completedAt,
    DateTime? createdAt,
    String? createdBy,
    String? description,
    String? jobId,
    String? status,
    String? taskId,
    String? title,
    DateTime? updatedAt,
  }) {
    return JobTasksModel(
      completedAt: completedAt ?? this.completedAt,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      description: description ?? this.description,
      jobId: jobId ?? this.jobId,
      status: status ?? this.status,
      taskId: taskId ?? this.taskId,
      title: title ?? this.title,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
