import '../utils/geo_json.dart';

/// Generated model class for table work_sessions
class WorkSessionsModel {
  /// Primary key field
  /// Non-nullable field
  final String sessionId;
  /// Non-nullable field
  final String jobId;
  /// Non-nullable field
  final String professionalId;
  /// Non-nullable field
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? totalDuration;
  final String? pauseDuration;
  final bool? isPaused;
  final DateTime? pauseStartTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? sessionNotes;
  final Map<String, dynamic>? weatherConditions;
  final double? completionPercentage;
  final String? status;

  WorkSessionsModel({this.sessionId = "", required this.jobId, required this.professionalId, DateTime? startedAt, this.endedAt, this.totalDuration, this.pauseDuration, this.isPaused, this.pauseStartTime, this.createdAt, this.updatedAt, this.sessionNotes, this.weatherConditions, this.completionPercentage, this.status})
      : assert(() { assert(sessionId != null, "session_id constraint violation"); assert(jobId != null, "job_id constraint violation"); assert(professionalId != null, "professional_id constraint violation"); assert(startedAt != null, "started_at constraint violation"); return true; }()),
        startedAt = startedAt ?? DateTime.now();

  factory WorkSessionsModel.fromJson(Map<String, dynamic> json) {
    return WorkSessionsModel(
      sessionId: json['session_id'] ?? '',
      jobId: json['job_id'] ?? '',
      professionalId: json['professional_id'] ?? '',
      startedAt: json['started_at'] != null ? DateTime.parse(json['started_at'].toString()) : DateTime.now(),
      endedAt: json['ended_at'] != null ? DateTime.parse(json['ended_at'].toString()) : null,
      totalDuration: json['total_duration']?.toString(),
      pauseDuration: json['pause_duration']?.toString(),
      isPaused: json['is_paused'],
      pauseStartTime: json['pause_start_time'] != null ? DateTime.parse(json['pause_start_time'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      sessionNotes: json['session_notes'],
      weatherConditions: json['weather_conditions'],
      completionPercentage: json['completion_percentage'] != null ? _toDouble(json['completion_percentage']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'job_id': jobId,
      'professional_id': professionalId,
      'started_at': startedAt.toIso8601String(),
      'ended_at': endedAt?.toIso8601String(),
      'total_duration': totalDuration,
      'pause_duration': pauseDuration,
      'is_paused': isPaused,
      'pause_start_time': pauseStartTime?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'session_notes': sessionNotes,
      'weather_conditions': weatherConditions,
      'completion_percentage': completionPercentage,
      'status': status,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WorkSessionsModel && other.sessionId == sessionId && other.jobId == jobId && other.professionalId == professionalId && other.startedAt == startedAt && other.endedAt == endedAt && other.totalDuration == totalDuration && other.pauseDuration == pauseDuration && other.isPaused == isPaused && other.pauseStartTime == pauseStartTime && other.createdAt == createdAt && other.updatedAt == updatedAt && other.sessionNotes == sessionNotes && other.weatherConditions == weatherConditions && other.completionPercentage == completionPercentage && other.status == status;
  }

  @override
  int get hashCode => sessionId.hashCode ^ jobId.hashCode ^ professionalId.hashCode ^ startedAt.hashCode ^ endedAt.hashCode ^ totalDuration.hashCode ^ pauseDuration.hashCode ^ isPaused.hashCode ^ pauseStartTime.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ sessionNotes.hashCode ^ weatherConditions.hashCode ^ completionPercentage.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'WorkSessionsModel(sessionId: $sessionId, jobId: $jobId, professionalId: $professionalId, startedAt: $startedAt, endedAt: $endedAt, totalDuration: $totalDuration, pauseDuration: $pauseDuration, isPaused: $isPaused, pauseStartTime: $pauseStartTime, createdAt: $createdAt, updatedAt: $updatedAt, sessionNotes: $sessionNotes, weatherConditions: $weatherConditions, completionPercentage: $completionPercentage, status: $status)';
  }
  /// Get the primary identifier for this record
  String get id => sessionId;
}

  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
