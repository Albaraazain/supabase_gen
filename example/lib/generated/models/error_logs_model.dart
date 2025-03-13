
class ErrorLogsModel {
  final DateTime? createdAt;
  final String? errorDetails;
  final String errorMessage;
  final String? logId;
  final String? source;
  final String? userId;

  ErrorLogsModel({
    this.createdAt,
    this.errorDetails,
    required this.errorMessage,
    this.logId,
    this.source,
    this.userId,
  });

  factory ErrorLogsModel.fromJson(Map<String, dynamic> json) {
    return ErrorLogsModel(
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      errorDetails: json['error_details'],
      errorMessage: json['error_message'] ?? '',
      logId: json['log_id'],
      source: json['source'],
      userId: json['user_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (errorDetails != null) {
      json['error_details'] = errorDetails;
    }
    json['error_message'] = errorMessage;
    if (logId != null) {
      json['log_id'] = logId;
    }
    if (source != null) {
      json['source'] = source;
    }
    if (userId != null) {
      json['user_id'] = userId;
    }
    return json;
  }

  ErrorLogsModel copyWith({
    DateTime? createdAt,
    String? errorDetails,
    String? errorMessage,
    String? logId,
    String? source,
    String? userId,
  }) {
    return ErrorLogsModel(
      createdAt: createdAt ?? this.createdAt,
      errorDetails: errorDetails ?? this.errorDetails,
      errorMessage: errorMessage ?? this.errorMessage,
      logId: logId ?? this.logId,
      source: source ?? this.source,
      userId: userId ?? this.userId,
    );
  }
}
