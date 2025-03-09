
/// Tracks individual tasks within a job
class JobTasksModel {
  final String taskId;
  final String? jobId;
  final String? quoteLineItemId;
  final String title;
  final String? description;
  final String? status;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int? sequenceOrder;
  final bool? isMandatory;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  JobTasksModel({
    required this.taskId,
    this.jobId,
    this.quoteLineItemId,
    required this.title,
    this.description,
    this.status,
    this.startedAt,
    this.completedAt,
    this.sequenceOrder,
    this.isMandatory,
    this.createdAt,
    this.updatedAt,
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

  factory JobTasksModel.fromJson(Map<String, dynamic> json) {
    return JobTasksModel(
      taskId: json['task_id'] ?? '',
      jobId: json['job_id'],
      quoteLineItemId: json['quote_line_item_id'],
      title: json['title'] ?? '',
      description: json['description'],
      status: json['status'],
      startedAt: json['started_at'] != null ? DateTime.parse(json['started_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
      sequenceOrder: json['sequence_order'],
      isMandatory: json['is_mandatory'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'job_id': jobId,
      'quote_line_item_id': quoteLineItemId,
      'title': title,
      'description': description,
      'status': status,
      'started_at': startedAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'sequence_order': sequenceOrder,
      'is_mandatory': isMandatory,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  JobTasksModel copyWith({
    String? taskId,
    String? jobId,
    String? quoteLineItemId,
    String? title,
    String? description,
    String? status,
    DateTime? startedAt,
    DateTime? completedAt,
    int? sequenceOrder,
    bool? isMandatory,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return JobTasksModel(
      taskId: taskId ?? this.taskId,
      jobId: jobId ?? this.jobId,
      quoteLineItemId: quoteLineItemId ?? this.quoteLineItemId,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      sequenceOrder: sequenceOrder ?? this.sequenceOrder,
      isMandatory: isMandatory ?? this.isMandatory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
