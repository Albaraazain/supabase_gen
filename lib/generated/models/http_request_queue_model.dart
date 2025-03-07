import 'dart:convert';
import 'dart:typed_data';

class HttpRequestQueueModel {
  final int id;
  final String method;
  final String url;
  final Map<String, dynamic> headers;
  final Uint8List? body;
  final int timeoutMilliseconds;

  const HttpRequestQueueModel({
    required this.id,
    required this.method,
    required this.url,
    required this.headers,
    this.body,
    required this.timeoutMilliseconds,
  });

  factory HttpRequestQueueModel.fromJson(Map<String, dynamic> json) {
    return HttpRequestQueueModel(
      id: json['id'] ?? 0,
      method: json['method'] ?? '',
      url: json['url'] ?? '',
      headers: json['headers'] != null ? json['headers'] is String ? jsonDecode(json['headers']) : json['headers'] : {},
      body: json['body'] != null ? Uint8List.fromList(List<int>.from(json['body'])) : null,
      timeoutMilliseconds: json['timeout_milliseconds'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'method': method,
      'url': url,
      'headers': headers,
      'body': body,
      'timeout_milliseconds': timeoutMilliseconds,
    };
  }

  HttpRequestQueueModel copyWith({
    int? id,
    String? method,
    String? url,
    Map<String, dynamic>? headers,
    Uint8List? body,
    int? timeoutMilliseconds,
  }) {
    return HttpRequestQueueModel(
      id: id ?? this.id,
      method: method ?? this.method,
      url: url ?? this.url,
      headers: headers ?? this.headers,
      body: body ?? this.body,
      timeoutMilliseconds: timeoutMilliseconds ?? this.timeoutMilliseconds,
    );
  }
}
