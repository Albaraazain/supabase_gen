import 'dart:convert';

class LogEvents2219633e4d474eceA00aCde9b30d69cdModel {
  final Map<String, dynamic>? body;
  final String? eventMessage;
  final String id;
  final DateTime? timestamp;

  LogEvents2219633e4d474eceA00aCde9b30d69cdModel({
    this.body,
    this.eventMessage,
    required this.id,
    this.timestamp,
  });

  factory LogEvents2219633e4d474eceA00aCde9b30d69cdModel.fromJson(Map<String, dynamic> json) {
    return LogEvents2219633e4d474eceA00aCde9b30d69cdModel(
      body: json['body'] != null ? (json['body'] is String ? jsonDecode(json['body']) : json['body']) : null,
      eventMessage: json['event_message'],
      id: json['id'] ?? '',
      timestamp: json['timestamp'] != null ? DateTime.parse(json['timestamp'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (body != null) {
      json['body'] = body;
    }
    if (eventMessage != null) {
      json['event_message'] = eventMessage;
    }
    json['id'] = id;
    if (timestamp != null) {
      json['timestamp'] = timestamp!.toIso8601String();
    }
    return json;
  }

  LogEvents2219633e4d474eceA00aCde9b30d69cdModel copyWith({
    Map<String, dynamic>? body,
    String? eventMessage,
    String? id,
    DateTime? timestamp,
  }) {
    return LogEvents2219633e4d474eceA00aCde9b30d69cdModel(
      body: body ?? this.body,
      eventMessage: eventMessage ?? this.eventMessage,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
