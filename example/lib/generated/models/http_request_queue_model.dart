import 'dart:convert';
import 'dart:typed_data';

class HttpRequestQueueModel {
  final Uint8List? body;
  final Map<String, dynamic> headers;
  final int id;
  final String method;
  final int timeoutMilliseconds;
  final String url;

  HttpRequestQueueModel({
    this.body,
    required this.headers,
    required this.id,
    required this.method,
    required this.timeoutMilliseconds,
    required this.url,
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

  factory HttpRequestQueueModel.fromJson(Map<String, dynamic> json) {
    return HttpRequestQueueModel(
      body: json['body'] != null ? Uint8List.fromList(List<int>.from(json['body'])) : null,
      headers: json['headers'] != null ? (json['headers'] is String ? jsonDecode(json['headers']) : json['headers']) : {},
      id: (json['id'] is String ? int.parse(json['id']) : json['id'] as int) ?? 0,
      method: json['method'] ?? '',
      timeoutMilliseconds: json['timeout_milliseconds'] ?? 0,
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (body != null) {
      json['body'] = body;
    }
    json['headers'] = headers;
    json['id'] = id;
    json['method'] = method;
    json['timeout_milliseconds'] = timeoutMilliseconds;
    json['url'] = url;
    return json;
  }

  HttpRequestQueueModel copyWith({
    Uint8List? body,
    Map<String, dynamic>? headers,
    int? id,
    String? method,
    int? timeoutMilliseconds,
    String? url,
  }) {
    return HttpRequestQueueModel(
      body: body ?? this.body,
      headers: headers ?? this.headers,
      id: id ?? this.id,
      method: method ?? this.method,
      timeoutMilliseconds: timeoutMilliseconds ?? this.timeoutMilliseconds,
      url: url ?? this.url,
    );
  }
}
