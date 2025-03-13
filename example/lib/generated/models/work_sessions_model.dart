
class WorkSessionsModel {
  final DateTime? createdAt;
  final DateTime? endedAt;
  final bool? isPaused;
  final String jobId;
  final String? pauseDuration;
  final DateTime? pauseStartTime;
  final String professionalId;
  final String? sessionId;
  final DateTime startedAt;
  final String? totalDuration;
  final DateTime? updatedAt;

  WorkSessionsModel({
    this.createdAt,
    this.endedAt,
    this.isPaused,
    required this.jobId,
    this.pauseDuration,
    this.pauseStartTime,
    required this.professionalId,
    this.sessionId,
    required this.startedAt,
    this.totalDuration,
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

  factory WorkSessionsModel.fromJson(Map<String, dynamic> json) {
    return WorkSessionsModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      endedAt: json['ended_at'] != null ? DateTime.parse(json['ended_at'].toString()) : null,
      isPaused: json['is_paused'],
      jobId: json['job_id'] ?? '',
      pauseDuration: json['pause_duration'],
      pauseStartTime: json['pause_start_time'] != null ? DateTime.parse(json['pause_start_time'].toString()) : null,
      professionalId: json['professional_id'] ?? '',
      sessionId: json['session_id'],
      startedAt: DateTime.parse(json['started_at'].toString()),
      totalDuration: json['total_duration'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (endedAt != null) {
      json['ended_at'] = endedAt!.toIso8601String();
    }
    if (isPaused != null) {
      json['is_paused'] = isPaused;
    }
    json['job_id'] = jobId;
    if (pauseDuration != null) {
      json['pause_duration'] = pauseDuration;
    }
    if (pauseStartTime != null) {
      json['pause_start_time'] = pauseStartTime!.toIso8601String();
    }
    json['professional_id'] = professionalId;
    if (sessionId != null) {
      json['session_id'] = sessionId;
    }
    json['started_at'] = startedAt.toIso8601String();
    if (totalDuration != null) {
      json['total_duration'] = totalDuration;
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  WorkSessionsModel copyWith({
    DateTime? createdAt,
    DateTime? endedAt,
    bool? isPaused,
    String? jobId,
    String? pauseDuration,
    DateTime? pauseStartTime,
    String? professionalId,
    String? sessionId,
    DateTime? startedAt,
    String? totalDuration,
    DateTime? updatedAt,
  }) {
    return WorkSessionsModel(
      createdAt: createdAt ?? this.createdAt,
      endedAt: endedAt ?? this.endedAt,
      isPaused: isPaused ?? this.isPaused,
      jobId: jobId ?? this.jobId,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      pauseStartTime: pauseStartTime ?? this.pauseStartTime,
      professionalId: professionalId ?? this.professionalId,
      sessionId: sessionId ?? this.sessionId,
      startedAt: startedAt ?? this.startedAt,
      totalDuration: totalDuration ?? this.totalDuration,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
