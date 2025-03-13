import 'dart:convert';

class LogEventsAea4b3e758bc40db90551a6d8c9ad761Model {
  final Map<String, dynamic>? body;
  final String? eventMessage;
  final String id;
  final DateTime? timestamp;

  LogEventsAea4b3e758bc40db90551a6d8c9ad761Model({
    this.body,
    this.eventMessage,
    required this.id,
    this.timestamp,
  });

  factory LogEventsAea4b3e758bc40db90551a6d8c9ad761Model.fromJson(Map<String, dynamic> json) {
    return LogEventsAea4b3e758bc40db90551a6d8c9ad761Model(
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

  LogEventsAea4b3e758bc40db90551a6d8c9ad761Model copyWith({
    Map<String, dynamic>? body,
    String? eventMessage,
    String? id,
    DateTime? timestamp,
  }) {
    return LogEventsAea4b3e758bc40db90551a6d8c9ad761Model(
      body: body ?? this.body,
      eventMessage: eventMessage ?? this.eventMessage,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
