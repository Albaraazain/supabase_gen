
class PausePeriodsModel {
  final DateTime? createdAt;
  final DateTime? endTime;
  final String? pauseId;
  final String reason;
  final String sessionId;
  final DateTime startTime;
  final DateTime? updatedAt;

  PausePeriodsModel({
    this.createdAt,
    this.endTime,
    this.pauseId,
    required this.reason,
    required this.sessionId,
    required this.startTime,
    this.updatedAt,
  });

  factory PausePeriodsModel.fromJson(Map<String, dynamic> json) {
    return PausePeriodsModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      endTime: json['end_time'] != null ? DateTime.parse(json['end_time'].toString()) : null,
      pauseId: json['pause_id'],
      reason: json['reason'] ?? '',
      sessionId: json['session_id'] ?? '',
      startTime: DateTime.parse(json['start_time'].toString()),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (endTime != null) {
      json['end_time'] = endTime!.toIso8601String();
    }
    if (pauseId != null) {
      json['pause_id'] = pauseId;
    }
    json['reason'] = reason;
    json['session_id'] = sessionId;
    json['start_time'] = startTime.toIso8601String();
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  PausePeriodsModel copyWith({
    DateTime? createdAt,
    DateTime? endTime,
    String? pauseId,
    String? reason,
    String? sessionId,
    DateTime? startTime,
    DateTime? updatedAt,
  }) {
    return PausePeriodsModel(
      createdAt: createdAt ?? this.createdAt,
      endTime: endTime ?? this.endTime,
      pauseId: pauseId ?? this.pauseId,
      reason: reason ?? this.reason,
      sessionId: sessionId ?? this.sessionId,
      startTime: startTime ?? this.startTime,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
