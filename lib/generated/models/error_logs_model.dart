
/// Generated model class for table error_logs
class ErrorLogsModel {
  /// Primary key field
  /// Non-nullable field
  final String logId;
  /// Non-nullable field
  final String errorMessage;
  final String? errorDetails;
  final String? source;
  final String? userId;
  final DateTime? createdAt;

  ErrorLogsModel({this.logId = "", required this.errorMessage, this.errorDetails, this.source, this.userId, this.createdAt})
      : assert(() { assert(logId != null, "log_id constraint violation"); assert(errorMessage != null, "error_message constraint violation"); return true; }());

  factory ErrorLogsModel.fromJson(Map<String, dynamic> json) {
    return ErrorLogsModel(
      logId: json['log_id'] ?? '',
      errorMessage: json['error_message'] ?? '',
      errorDetails: json['error_details'],
      source: json['source'],
      userId: json['user_id'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'log_id': logId,
      'error_message': errorMessage,
      'error_details': errorDetails,
      'source': source,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorLogsModel && other.logId == logId && other.errorMessage == errorMessage && other.errorDetails == errorDetails && other.source == source && other.userId == userId && other.createdAt == createdAt;
  }

  @override
  int get hashCode => logId.hashCode ^ errorMessage.hashCode ^ errorDetails.hashCode ^ source.hashCode ^ userId.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'ErrorLogsModel(logId: $logId, errorMessage: $errorMessage, errorDetails: $errorDetails, source: $source, userId: $userId, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => logId;
}


