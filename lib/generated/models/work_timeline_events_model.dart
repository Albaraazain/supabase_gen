import '../utils/geo_json.dart';

/// Generated model class for table work_timeline_events
class WorkTimelineEventsModel {
  /// Primary key field
  /// Non-nullable field
  final String eventId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String eventType;
  final Map<String, dynamic>? eventData;
  final String? taskId;
  final String? createdBy;
  final DateTime? createdAt;

  WorkTimelineEventsModel({this.eventId = "", required this.jobId, required this.eventType, this.eventData, this.taskId, this.createdBy, this.createdAt})
      : assert(() { assert(eventId != null, "event_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(eventType != null, "event_type constraint violation"); return true; }());

  factory WorkTimelineEventsModel.fromJson(Map<String, dynamic> json) {
    return WorkTimelineEventsModel(
      eventId: json['event_id'] ?? '',
      jobId: json['job_id'] ?? '',
      eventType: json['event_type'] ?? '',
      eventData: json['event_data'],
      taskId: json['task_id'],
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event_id': eventId,
      'job_id': jobId,
      'event_type': eventType,
      'event_data': eventData,
      'task_id': taskId,
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkTimelineEventsModel && other.eventId == eventId && other.jobId == jobId && other.eventType == eventType && other.eventData == eventData && other.taskId == taskId && other.createdBy == createdBy && other.createdAt == createdAt;
  }

  @override
  int get hashCode => eventId.hashCode ^ jobId.hashCode ^ eventType.hashCode ^ eventData.hashCode ^ taskId.hashCode ^ createdBy.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'WorkTimelineEventsModel(eventId: $eventId, jobId: $jobId, eventType: $eventType, eventData: $eventData, taskId: $taskId, createdBy: $createdBy, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => eventId;
}


