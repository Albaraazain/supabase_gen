import 'dart:convert';

class MessagesModel {
  final String topic;
  final String extension;
  final Map<String, dynamic>? payload;
  final String? event;
  final bool? private;
  final DateTime updatedAt;
  final DateTime insertedAt;
  final String id;

  const MessagesModel({
    required this.topic,
    required this.extension,
    this.payload,
    this.event,
    this.private,
    required this.updatedAt,
    required this.insertedAt,
    required this.id,
  });

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(
      topic: json['topic'] ?? '',
      extension: json['extension'] ?? '',
      payload: json['payload'] != null ? json['payload'] is String ? jsonDecode(json['payload']) : json['payload'] : null,
      event: json['event'],
      private: json['private'],
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : DateTime.now(),
      insertedAt: json['inserted_at'] != null ? DateTime.parse(json['inserted_at'].toString()) : DateTime.now(),
      id: json['id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'topic': topic,
      'extension': extension,
      'payload': payload,
      'event': event,
      'private': private,
      'updated_at': updatedAt.toIso8601String(),
      'inserted_at': insertedAt.toIso8601String(),
      'id': id,
    };
  }

  MessagesModel copyWith({
    String? topic,
    String? extension,
    Map<String, dynamic>? payload,
    String? event,
    bool? private,
    DateTime? updatedAt,
    DateTime? insertedAt,
    String? id,
  }) {
    return MessagesModel(
      topic: topic ?? this.topic,
      extension: extension ?? this.extension,
      payload: payload ?? this.payload,
      event: event ?? this.event,
      private: private ?? this.private,
      updatedAt: updatedAt ?? this.updatedAt,
      insertedAt: insertedAt ?? this.insertedAt,
      id: id ?? this.id,
    );
  }
}
