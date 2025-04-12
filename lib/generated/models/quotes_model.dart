import 'dart:convert';

class QuotesModel {
  final String billId;
  final Map<String, dynamic> calculations;
  final DateTime createdAt;
  final String customerEmail;
  final String? id;
  final double systemSize;
  final double totalCost;
  final DateTime updatedAt;

  QuotesModel({
    required this.billId,
    required this.calculations,
    required this.createdAt,
    required this.customerEmail,
    this.id,
    required this.systemSize,
    required this.totalCost,
    required this.updatedAt,
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

  factory QuotesModel.fromJson(Map<String, dynamic> json) {
    return QuotesModel(
      billId: json['bill_id'] ?? '',
      calculations: json['calculations'] != null ? (json['calculations'] is String ? jsonDecode(json['calculations']) : json['calculations']) : {},
      createdAt: DateTime.parse(json['created_at'].toString()),
      customerEmail: json['customer_email'] ?? '',
      id: json['id'],
      systemSize: _toDouble(json['system_size']) ?? 0.0,
      totalCost: _toDouble(json['total_cost']) ?? 0.0,
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['bill_id'] = billId;
    json['calculations'] = calculations;
    json['created_at'] = createdAt.toIso8601String();
    json['customer_email'] = customerEmail;
    if (id != null) {
      json['id'] = id;
    }
    json['system_size'] = systemSize;
    json['total_cost'] = totalCost;
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  QuotesModel copyWith({
    String? billId,
    Map<String, dynamic>? calculations,
    DateTime? createdAt,
    String? customerEmail,
    String? id,
    double? systemSize,
    double? totalCost,
    DateTime? updatedAt,
  }) {
    return QuotesModel(
      billId: billId ?? this.billId,
      calculations: calculations ?? this.calculations,
      createdAt: createdAt ?? this.createdAt,
      customerEmail: customerEmail ?? this.customerEmail,
      id: id ?? this.id,
      systemSize: systemSize ?? this.systemSize,
      totalCost: totalCost ?? this.totalCost,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
