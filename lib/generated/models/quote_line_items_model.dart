import '../utils/geo_json.dart';

/// Generated model class for table quote_line_items
/// Database triggers associated with this table:
/// - line_item_changes: INSERT AFTER - EXECUTE FUNCTION update_quote_on_line_item_change()
///   Signature: update_quote_on_line_item_change() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_quote_on_line_item_change>
/// - line_item_changes: DELETE AFTER - EXECUTE FUNCTION update_quote_on_line_item_change()
///   Signature: update_quote_on_line_item_change() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_quote_on_line_item_change>
/// - line_item_changes: UPDATE AFTER - EXECUTE FUNCTION update_quote_on_line_item_change()
///   Signature: update_quote_on_line_item_change() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_quote_on_line_item_change>
///
class QuoteLineItemsModel {
  /// Primary key field
  /// Non-nullable field
  final String lineItemId;
  /// Non-nullable field
  final String quoteId;
  /// Non-nullable field
  final String description;
  final double? quantity;
  /// Non-nullable field
  final double unitPrice;
  /// Non-nullable field
  final double amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  /// Non-nullable field
  final String itemType;
  final String? category;
  final String? notes;
  final String? unitType;
  final String? referenceId;
  final int? displayOrder;

  QuoteLineItemsModel({this.lineItemId = "", required this.quoteId, required this.description, this.quantity, required this.unitPrice, required this.amount, this.createdAt, this.updatedAt, this.itemType = 'service', this.category, this.notes, this.unitType, this.referenceId, this.displayOrder})
      : assert(() { assert(lineItemId != null, "line_item_id constraint violation"); assert(quoteId != null, "quote_id constraint violation"); assert(description != null, "description constraint violation"); assert(unitPrice != null, "unit_price constraint violation"); assert(amount != null, "amount constraint violation"); assert(itemType != null, "item_type constraint violation"); return true; }());

  factory QuoteLineItemsModel.fromJson(Map<String, dynamic> json) {
    return QuoteLineItemsModel(
      lineItemId: json['line_item_id'] ?? '',
      quoteId: json['quote_id'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] != null ? _toDouble(json['quantity']) : null,
      unitPrice: _toDouble(json['unit_price']) ?? 0.0,
      amount: _toDouble(json['amount']) ?? 0.0,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
      itemType: json['item_type'] ?? '',
      category: json['category'],
      notes: json['notes'],
      unitType: json['unit_type'],
      referenceId: json['reference_id'],
      displayOrder: json['display_order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'line_item_id': lineItemId,
      'quote_id': quoteId,
      'description': description,
      'quantity': quantity,
      'unit_price': unitPrice,
      'amount': amount,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'item_type': itemType,
      'category': category,
      'notes': notes,
      'unit_type': unitType,
      'reference_id': referenceId,
      'display_order': displayOrder,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuoteLineItemsModel && other.lineItemId == lineItemId && other.quoteId == quoteId && other.description == description && other.quantity == quantity && other.unitPrice == unitPrice && other.amount == amount && other.createdAt == createdAt && other.updatedAt == updatedAt && other.itemType == itemType && other.category == category && other.notes == notes && other.unitType == unitType && other.referenceId == referenceId && other.displayOrder == displayOrder;
  }

  @override
  int get hashCode => lineItemId.hashCode ^ quoteId.hashCode ^ description.hashCode ^ quantity.hashCode ^ unitPrice.hashCode ^ amount.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ itemType.hashCode ^ category.hashCode ^ notes.hashCode ^ unitType.hashCode ^ referenceId.hashCode ^ displayOrder.hashCode;

  @override
  String toString() {
    return 'QuoteLineItemsModel(lineItemId: $lineItemId, quoteId: $quoteId, description: $description, quantity: $quantity, unitPrice: $unitPrice, amount: $amount, createdAt: $createdAt, updatedAt: $updatedAt, itemType: $itemType, category: $category, notes: $notes, unitType: $unitType, referenceId: $referenceId, displayOrder: $displayOrder)';
  }
  /// Get the primary identifier for this record
  String get id => lineItemId;
}

  /// Helper function to convert dynamic values to double
  double? _toDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      try {
        return double.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }
