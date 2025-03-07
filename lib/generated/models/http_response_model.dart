import 'dart:convert';

class HttpResponseModel {
  final int? id;
  final int? statusCode;
  final String? contentType;
  final Map<String, dynamic>? headers;
  final String? content;
  final bool? timedOut;
  final String? errorMsg;
  final DateTime created;

  const HttpResponseModel({
    this.id,
    this.statusCode,
    this.contentType,
    this.headers,
    this.content,
    this.timedOut,
    this.errorMsg,
    required this.created,
  });

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) {
    return HttpResponseModel(
      id: json['id'],
      statusCode: json['status_code'],
      contentType: json['content_type'],
      headers: json['headers'] != null ? json['headers'] is String ? jsonDecode(json['headers']) : json['headers'] : null,
      content: json['content'],
      timedOut: json['timed_out'],
      errorMsg: json['error_msg'],
      created: json['created'] != null ? DateTime.parse(json['created'].toString()) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status_code': statusCode,
      'content_type': contentType,
      'headers': headers,
      'content': content,
      'timed_out': timedOut,
      'error_msg': errorMsg,
      'created': created.toIso8601String(),
    };
  }

  HttpResponseModel copyWith({
    int? id,
    int? statusCode,
    String? contentType,
    Map<String, dynamic>? headers,
    String? content,
    bool? timedOut,
    String? errorMsg,
    DateTime? created,
  }) {
    return HttpResponseModel(
      id: id ?? this.id,
      statusCode: statusCode ?? this.statusCode,
      contentType: contentType ?? this.contentType,
      headers: headers ?? this.headers,
      content: content ?? this.content,
      timedOut: timedOut ?? this.timedOut,
      errorMsg: errorMsg ?? this.errorMsg,
      created: created ?? this.created,
    );
  }
}
