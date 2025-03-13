import 'dart:convert';

class LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model {
  final Map<String, dynamic>? body;
  final String? eventMessage;
  final String id;
  final DateTime? timestamp;

  LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model({
    this.body,
    this.eventMessage,
    required this.id,
    this.timestamp,
  });

  factory LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model.fromJson(Map<String, dynamic> json) {
    return LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model(
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

  LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model copyWith({
    Map<String, dynamic>? body,
    String? eventMessage,
    String? id,
    DateTime? timestamp,
  }) {
    return LogEventsC7ae36f9828145e0897a05c2eb4a9c45Model(
      body: body ?? this.body,
      eventMessage: eventMessage ?? this.eventMessage,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
