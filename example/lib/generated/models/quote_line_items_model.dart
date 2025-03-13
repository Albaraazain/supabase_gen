
class QuoteLineItemsModel {
  final double amount;
  final DateTime? createdAt;
  final String description;
  final String? lineItemId;
  final double? quantity;
  final String quoteId;
  final double unitPrice;
  final DateTime? updatedAt;

  QuoteLineItemsModel({
    required this.amount,
    this.createdAt,
    required this.description,
    this.lineItemId,
    this.quantity,
    required this.quoteId,
    required this.unitPrice,
    this.updatedAt,
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

  factory QuoteLineItemsModel.fromJson(Map<String, dynamic> json) {
    return QuoteLineItemsModel(
      amount: _toDouble(json['amount']) ?? 0.0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      description: json['description'] ?? '',
      lineItemId: json['line_item_id'],
      quantity: json['quantity'] != null ? _toDouble(json['quantity']) : null,
      quoteId: json['quote_id'] ?? '',
      unitPrice: _toDouble(json['unit_price']) ?? 0.0,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['amount'] = amount;
    if (createdAt != null) {
      json['created_at'] = createdAt!.toIso8601String();
    }
    json['description'] = description;
    if (lineItemId != null) {
      json['line_item_id'] = lineItemId;
    }
    if (quantity != null) {
      json['quantity'] = quantity;
    }
    json['quote_id'] = quoteId;
    json['unit_price'] = unitPrice;
    if (updatedAt != null) {
      json['updated_at'] = updatedAt!.toIso8601String();
    }
    return json;
  }

  QuoteLineItemsModel copyWith({
    double? amount,
    DateTime? createdAt,
    String? description,
    String? lineItemId,
    double? quantity,
    String? quoteId,
    double? unitPrice,
    DateTime? updatedAt,
  }) {
    return QuoteLineItemsModel(
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      description: description ?? this.description,
      lineItemId: lineItemId ?? this.lineItemId,
      quantity: quantity ?? this.quantity,
      quoteId: quoteId ?? this.quoteId,
      unitPrice: unitPrice ?? this.unitPrice,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
