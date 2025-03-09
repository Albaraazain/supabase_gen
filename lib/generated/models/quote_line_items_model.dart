
class QuoteLineItemsModel {
  final String lineItemId;
  final String quoteId;
  final String itemType;
  final String description;
  final double quantity;
  final double unitPrice;
  final double totalPrice;
  final bool? isMandatory;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String itemName;
  final String? imageUrl;
  final String? category;
  final String? tempItemType;

  QuoteLineItemsModel({
    required this.lineItemId,
    required this.quoteId,
    required this.itemType,
    required this.description,
    required this.quantity,
    required this.unitPrice,
    required this.totalPrice,
    this.isMandatory,
    this.createdAt,
    this.updatedAt,
    required this.itemName,
    this.imageUrl,
    this.category,
    this.tempItemType,
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
      lineItemId: json['line_item_id'] ?? '',
      quoteId: json['quote_id'] ?? '',
      itemType: json['item_type'] ?? '',
      description: json['description'] ?? '',
      quantity: _toDouble(json['quantity']) ?? 0.0,
      unitPrice: _toDouble(json['unit_price']) ?? 0.0,
      totalPrice: _toDouble(json['total_price']) ?? 0.0,
      isMandatory: json['is_mandatory'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      itemName: json['item_name'] ?? '',
      imageUrl: json['image_url'],
      category: json['category'],
      tempItemType: json['temp_item_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'line_item_id': lineItemId,
      'quote_id': quoteId,
      'item_type': itemType,
      'description': description,
      'quantity': quantity,
      'unit_price': unitPrice,
      'total_price': totalPrice,
      'is_mandatory': isMandatory,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'item_name': itemName,
      'image_url': imageUrl,
      'category': category,
      'temp_item_type': tempItemType,
    };
  }

  QuoteLineItemsModel copyWith({
    String? lineItemId,
    String? quoteId,
    String? itemType,
    String? description,
    double? quantity,
    double? unitPrice,
    double? totalPrice,
    bool? isMandatory,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? itemName,
    String? imageUrl,
    String? category,
    String? tempItemType,
  }) {
    return QuoteLineItemsModel(
      lineItemId: lineItemId ?? this.lineItemId,
      quoteId: quoteId ?? this.quoteId,
      itemType: itemType ?? this.itemType,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      totalPrice: totalPrice ?? this.totalPrice,
      isMandatory: isMandatory ?? this.isMandatory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      itemName: itemName ?? this.itemName,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      tempItemType: tempItemType ?? this.tempItemType,
    );
  }
}
