import 'dart:convert';

class HttpResponseModel {
  final String? content;
  final String? contentType;
  final DateTime created;
  final String? errorMsg;
  final Map<String, dynamic>? headers;
  final int? id;
  final int? statusCode;
  final bool? timedOut;

  HttpResponseModel({
    this.content,
    this.contentType,
    required this.created,
    this.errorMsg,
    this.headers,
    this.id,
    this.statusCode,
    this.timedOut,
  });

  // Helper method to safely convert numeric values
  static double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {}
    }
    return null;
  }

  factory HttpResponseModel.fromJson(Map<String, dynamic> json) {
    return HttpResponseModel(
      content: json['content'],
      contentType: json['content_type'],
      created: DateTime.parse(json['created'].toString()),
      errorMsg: json['error_msg'],
      headers: json['headers'] != null ? (json['headers'] is String ? jsonDecode(json['headers']) : json['headers']) : null,
      id: json['id'] != null ? (json['id'] is String ? int.parse(json['id']) : json['id'] as int) : null,
      statusCode: json['status_code'],
      timedOut: json['timed_out'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (content != null) {
      json['content'] = content;
    }
    if (contentType != null) {
      json['content_type'] = contentType;
    }
    json['created'] = created.toIso8601String();
    if (errorMsg != null) {
      json['error_msg'] = errorMsg;
    }
    if (headers != null) {
      json['headers'] = headers;
    }
    if (id != null) {
      json['id'] = id;
    }
    if (statusCode != null) {
      json['status_code'] = statusCode;
    }
    if (timedOut != null) {
      json['timed_out'] = timedOut;
    }
    return json;
  }

  HttpResponseModel copyWith({
    String? content,
    String? contentType,
    DateTime? created,
    String? errorMsg,
    Map<String, dynamic>? headers,
    int? id,
    int? statusCode,
    bool? timedOut,
  }) {
    return HttpResponseModel(
      content: content ?? this.content,
      contentType: contentType ?? this.contentType,
      created: created ?? this.created,
      errorMsg: errorMsg ?? this.errorMsg,
      headers: headers ?? this.headers,
      id: id ?? this.id,
      statusCode: statusCode ?? this.statusCode,
      timedOut: timedOut ?? this.timedOut,
    );
  }
}
