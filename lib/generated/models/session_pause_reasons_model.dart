
/// Generated model class for table session_pause_reasons
class SessionPauseReasonsModel {
  /// Primary key field
  /// Non-nullable field
  final String pauseId;
  /// Non-nullable field
  final String sessionId;
  /// Non-nullable field
  final String reason;
  final String? details;
  /// Non-nullable field
  final DateTime startedAt;
  final DateTime? endedAt;
  final String? createdBy;
  final DateTime? createdAt;

  SessionPauseReasonsModel({this.pauseId = "", required this.sessionId, required this.reason, this.details, DateTime? startedAt, this.endedAt, this.createdBy, this.createdAt})
      : assert(() { assert(pauseId != null, "pause_id constraint violation"); assert(sessionId != null, "session_id constraint violation"); assert(reason != null, "reason constraint violation"); assert(startedAt != null, "started_at constraint violation"); return true; }()),
        startedAt = startedAt ?? DateTime.now();

  factory SessionPauseReasonsModel.fromJson(Map<String, dynamic> json) {
    return SessionPauseReasonsModel(
      pauseId: json['pause_id'] ?? '',
      sessionId: json['session_id'] ?? '',
      reason: json['reason'] ?? '',
      details: json['details'],
      startedAt: json['started_at'] != null ? DateTime.parse(json['started_at'].toString()) : DateTime.now(),
      endedAt: json['ended_at'] != null ? DateTime.parse(json['ended_at'].toString()) : null,
      createdBy: json['created_by'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pause_id': pauseId,
      'session_id': sessionId,
      'reason': reason,
      'details': details,
      'started_at': startedAt.toIso8601String(),
      'ended_at': endedAt?.toIso8601String(),
      'created_by': createdBy,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SessionPauseReasonsModel && other.pauseId == pauseId && other.sessionId == sessionId && other.reason == reason && other.details == details && other.startedAt == startedAt && other.endedAt == endedAt && other.createdBy == createdBy && other.createdAt == createdAt;
  }

  @override
  int get hashCode => pauseId.hashCode ^ sessionId.hashCode ^ reason.hashCode ^ details.hashCode ^ startedAt.hashCode ^ endedAt.hashCode ^ createdBy.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'SessionPauseReasonsModel(pauseId: $pauseId, sessionId: $sessionId, reason: $reason, details: $details, startedAt: $startedAt, endedAt: $endedAt, createdBy: $createdBy, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => pauseId;
}


