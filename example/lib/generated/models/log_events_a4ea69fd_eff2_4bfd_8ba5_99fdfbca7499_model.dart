import 'dart:convert';

class LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model {
  final Map<String, dynamic>? body;
  final String? eventMessage;
  final String id;
  final DateTime? timestamp;

  LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model({
    this.body,
    this.eventMessage,
    required this.id,
    this.timestamp,
  });

  factory LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model.fromJson(Map<String, dynamic> json) {
    return LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model(
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

  LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model copyWith({
    Map<String, dynamic>? body,
    String? eventMessage,
    String? id,
    DateTime? timestamp,
  }) {
    return LogEventsA4ea69fdEff24bfd8ba599fdfbca7499Model(
      body: body ?? this.body,
      eventMessage: eventMessage ?? this.eventMessage,
      id: id ?? this.id,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
