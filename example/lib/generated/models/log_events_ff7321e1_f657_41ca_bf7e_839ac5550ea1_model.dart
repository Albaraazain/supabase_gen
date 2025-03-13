import 'dart:convert';

class LogEventsFf7321e1F65741caBf7e839ac5550ea1Model {
  final Map<String, dynamic>? body;
  final String? eventMessage;
  final String id;
  final DateTime? timestamp;

  LogEventsFf7321e1F65741caBf7e839ac5550ea1Model({
    this.body,
    this.eventMessage,
    required this.id,
    this.timestamp,
  });

  factory LogEventsFf7321e1F65741caBf7e839ac5550ea1Model.fromJson(Map<String, dynamic> json) {
    return LogEventsFf7321e1F65741caBf7e839ac5550ea1Model(
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

  LogEventsFf7321e1F65741caBf7e839ac5550ea1Model copyWith({
    Map<String, dynamic>? body,
    String? eventMessage,
    String? id,
    DateTime? timestamp,
  }) {
    return LogEventsFf7321e1F65741caBf7e839ac5550ea1Model(
      body: body ?? this.body,
      eventMessage: eventMessage ?? this.eventMessage,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
