import 'dart:convert';

class LogEventsC0066d9f7247485cAac064d4604172cdModel {
  final Map<String, dynamic>? body;
  final String? eventMessage;
  final String id;
  final DateTime? timestamp;

  LogEventsC0066d9f7247485cAac064d4604172cdModel({
    this.body,
    this.eventMessage,
    required this.id,
    this.timestamp,
  });

  factory LogEventsC0066d9f7247485cAac064d4604172cdModel.fromJson(Map<String, dynamic> json) {
    return LogEventsC0066d9f7247485cAac064d4604172cdModel(
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

  LogEventsC0066d9f7247485cAac064d4604172cdModel copyWith({
    Map<String, dynamic>? body,
    String? eventMessage,
    String? id,
    DateTime? timestamp,
  }) {
    return LogEventsC0066d9f7247485cAac064d4604172cdModel(
      body: body ?? this.body,
      eventMessage: eventMessage ?? this.eventMessage,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
