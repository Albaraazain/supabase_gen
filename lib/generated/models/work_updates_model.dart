
/// Generated model class for table work_updates
class WorkUpdatesModel {
  /// Primary key field
  /// Non-nullable field
  final String updateId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String message;
  /// Non-nullable field
  final String updateType;
  final String? priority;
  final bool? requiresAttention;
  final String? createdBy;
  final DateTime? createdAt;

  WorkUpdatesModel({this.updateId = "", required this.jobId, required this.message, required this.updateType, this.priority, this.requiresAttention, this.createdBy, this.createdAt})
      : assert(() { assert(updateId != null, "update_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(message != null, "message constraint violation"); assert(updateType != null, "update_type constraint violation"); return true; }());

  factory WorkUpdatesModel.fromJson(Map<String, dynamic> json) {
    return WorkUpdatesModel(
      updateId: json['update_id'] ?? '',
      jobId: json['job_id'] ?? '',
      message: json['message'] ?? '',
      updateType: json['update_type'] ?? '',
      priority: json['priority'],
      requiresAttention: json['requires_attention'],
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'update_id': updateId,
      'job_id': jobId,
      'message': message,
      'update_type': updateType,
      'priority': priority,
      'requires_attention': requiresAttention,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkUpdatesModel && other.updateId == updateId && other.jobId == jobId && other.message == message && other.updateType == updateType && other.priority == priority && other.requiresAttention == requiresAttention && other.createdBy == createdBy && other.createdAt == createdAt;
  }

  @override
  int get hashCode => updateId.hashCode ^ jobId.hashCode ^ message.hashCode ^ updateType.hashCode ^ priority.hashCode ^ requiresAttention.hashCode ^ createdBy.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'WorkUpdatesModel(updateId: $updateId, jobId: $jobId, message: $message, updateType: $updateType, priority: $priority, requiresAttention: $requiresAttention, createdBy: $createdBy, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => updateId;
}


