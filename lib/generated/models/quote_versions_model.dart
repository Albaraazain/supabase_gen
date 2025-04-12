import 'dart:convert';

class QuoteVersionsModel {
  final Map<String, dynamic> calculations;
  final DateTime? createdAt;
  final String? id;
  final String quoteId;

  QuoteVersionsModel({
    required this.calculations,
    this.createdAt,
    this.id,
    required this.quoteId,
  });

  factory QuoteVersionsModel.fromJson(Map<String, dynamic> json) {
    return QuoteVersionsModel(
      calculations: json['calculations'] != null ? (json['calculations'] is String ? jsonDecode(json['calculations']) : json['calculations']) : {},
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      id: json['id'],
      quoteId: json['quote_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['calculations'] = calculations;
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    if (id != null) {
      json['id'] = id;
    }
    json['quote_id'] = quoteId;
    return json;
  }

  QuoteVersionsModel copyWith({
    Map<String, dynamic>? calculations,
    DateTime? createdAt,
    String? id,
    String? quoteId,
  }) {
    return QuoteVersionsModel(
      calculations: calculations ?? this.calculations,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      quoteId: quoteId ?? this.quoteId,
    );
  }
}
