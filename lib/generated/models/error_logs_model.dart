import 'dart:convert';

class ErrorLogsModel {
  final int id;
  final String? errorCode;
  final String? errorMessage;
  final String? functionName;
  final Map<String, dynamic>? parameters;
  final DateTime? timestamp;
  final String? appVersion;
  final String? environment;
  final String? operation;

  const ErrorLogsModel({
    required this.id,
    this.errorCode,
    this.errorMessage,
    this.functionName,
    this.parameters,
    this.timestamp,
    this.appVersion,
    this.environment,
    this.operation,
  });

  factory ErrorLogsModel.fromJson(Map<String, dynamic> json) {
    return ErrorLogsModel(
      id: json['id'] ?? 0,
      errorCode: json['error_code'],
      errorMessage: json['error_message'],
      functionName: json['function_name'],
      parameters: json['parameters'] != null ? json['parameters'] is String ? jsonDecode(json['parameters']) : json['parameters'] : null,
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'].toString()) : null,
      appVersion: json['app_version'],
      environment: json['environment'],
      operation: json['operation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'error_code': errorCode,
      'error_message': errorMessage,
      'function_name': functionName,
      'parameters': parameters,
      'timestamp': timestamp?.toIso8601String(),
      'app_version': appVersion,
      'environment': environment,
      'operation': operation,
    };
  }

  ErrorLogsModel copyWith({
    int? id,
    String? errorCode,
    String? errorMessage,
    String? functionName,
    Map<String, dynamic>? parameters,
    DateTime? timestamp,
    String? appVersion,
    String? environment,
    String? operation,
  }) {
    return ErrorLogsModel(
      id: id ?? this.id,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      functionName: functionName ?? this.functionName,
      parameters: parameters ?? this.parameters,
      timestamp: timestamp ?? this.timestamp,
      appVersion: appVersion ?? this.appVersion,
      environment: environment ?? this.environment,
      operation: operation ?? this.operation,
    );
  }
}
