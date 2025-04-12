
class BillsModel {
  final double amount;
  final DateTime createdAt;
  final String? customerId;
  final String customerName;
  final DateTime dueDate;
  final String? id;
  final DateTime issueDate;
  final String referenceNumber;
  final int unitsConsumed;
  final DateTime updatedAt;

  BillsModel({
    required this.amount,
    required this.createdAt,
    this.customerId,
    required this.customerName,
    required this.dueDate,
    this.id,
    required this.issueDate,
    required this.referenceNumber,
    required this.unitsConsumed,
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

  factory BillsModel.fromJson(Map<String, dynamic> json) {
    return BillsModel(
      amount: _toDouble(json['amount']) ?? 0.0,
      createdAt: DateTime.parse(json['created_at'].toString()),
      customerId: json['customer_id'],
      customerName: json['customer_name'] ?? '',
      dueDate: DateTime.parse(json['due_date'].toString()),
      id: json['id'],
      issueDate: DateTime.parse(json['issue_date'].toString()),
      referenceNumber: json['reference_number'] ?? '',
      unitsConsumed: json['units_consumed'] ?? 0,
      updatedAt: DateTime.parse(json['updated_at'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['amount'] = amount;
    json['created_at'] = createdAt.toIso8601String();
    if (customerId != null) {
      json['customer_id'] = customerId;
    }
    json['customer_name'] = customerName;
    json['due_date'] = dueDate.toIso8601String();
    if (id != null) {
      json['id'] = id;
    }
    json['issue_date'] = issueDate.toIso8601String();
    json['reference_number'] = referenceNumber;
    json['units_consumed'] = unitsConsumed;
    json['updated_at'] = updatedAt.toIso8601String();
    return json;
  }

  BillsModel copyWith({
    double? amount,
    DateTime? createdAt,
    String? customerId,
    String? customerName,
    DateTime? dueDate,
    String? id,
    DateTime? issueDate,
    String? referenceNumber,
    int? unitsConsumed,
    DateTime? updatedAt,
  }) {
    return BillsModel(
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      customerId: customerId ?? this.customerId,
      customerName: customerName ?? this.customerName,
      dueDate: dueDate ?? this.dueDate,
      id: id ?? this.id,
      issueDate: issueDate ?? this.issueDate,
      referenceNumber: referenceNumber ?? this.referenceNumber,
      unitsConsumed: unitsConsumed ?? this.unitsConsumed,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
