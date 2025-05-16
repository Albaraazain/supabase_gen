
/// Generated model class for table pause_periods
class PausePeriodsModel {
  /// Primary key field
  /// Non-nullable field
  final String pauseId;
  /// Non-nullable field
  final String sessionId;
  /// Non-nullable field
  final DateTime startTime;
  final DateTime? endTime;
  /// Non-nullable field
  final String reason;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PausePeriodsModel({this.pauseId = "", required this.sessionId, DateTime? startTime, this.endTime, required this.reason, this.createdAt, this.updatedAt})
      : assert(() { assert(pauseId != null, "pause_id constraint violation"); assert(sessionId != null, "session_id constraint violation"); assert(startTime != null, "start_time constraint violation"); assert(reason != null, "reason constraint violation"); return true; }()),
        startTime = startTime ?? DateTime.now();

  factory PausePeriodsModel.fromJson(Map<String, dynamic> json) {
    return PausePeriodsModel(
      pauseId: json['pause_id'] ?? '',
      sessionId: json['session_id'] ?? '',
      startTime: json['start_time'] != null ? DateTime.parse(json['start_time'].toString()) : DateTime.now(),
      endTime: json['end_time'] != null ? DateTime.parse(json['end_time'].toString()) : null,
      reason: json['reason'] ?? '',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pause_id': pauseId,
      'session_id': sessionId,
      'start_time': startTime.toIso8601String(),
      'end_time': endTime?.toIso8601String(),
      'reason': reason,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PausePeriodsModel && other.pauseId == pauseId && other.sessionId == sessionId && other.startTime == startTime && other.endTime == endTime && other.reason == reason && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => pauseId.hashCode ^ sessionId.hashCode ^ startTime.hashCode ^ endTime.hashCode ^ reason.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'PausePeriodsModel(pauseId: $pauseId, sessionId: $sessionId, startTime: $startTime, endTime: $endTime, reason: $reason, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => pauseId;
}


