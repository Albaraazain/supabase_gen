
/// Generated model class for table payment_methods
class PaymentMethodsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  final String userId;
  /// Non-nullable field
  final String paymentType;
  final String? cardLastFour;
  final String? cardBrand;
  final int? cardExpiryMonth;
  final int? cardExpiryYear;
  final String? bankName;
  final String? bankAccountLastFour;
  final bool? isDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PaymentMethodsModel({this.id = "", required this.userId, required this.paymentType, this.cardLastFour, this.cardBrand, this.cardExpiryMonth, this.cardExpiryYear, this.bankName, this.bankAccountLastFour, this.isDefault, this.createdAt, this.updatedAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(userId != null, "user_id constraint violation"); assert(paymentType != null, "payment_type constraint violation"); return true; }());

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodsModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      paymentType: json['payment_type'] ?? '',
      cardLastFour: json['card_last_four'],
      cardBrand: json['card_brand'],
      cardExpiryMonth: json['card_expiry_month'],
      cardExpiryYear: json['card_expiry_year'],
      bankName: json['bank_name'],
      bankAccountLastFour: json['bank_account_last_four'],
      isDefault: json['is_default'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'payment_type': paymentType,
      'card_last_four': cardLastFour,
      'card_brand': cardBrand,
      'card_expiry_month': cardExpiryMonth,
      'card_expiry_year': cardExpiryYear,
      'bank_name': bankName,
      'bank_account_last_four': bankAccountLastFour,
      'is_default': isDefault,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentMethodsModel && other.id == id && other.userId == userId && other.paymentType == paymentType && other.cardLastFour == cardLastFour && other.cardBrand == cardBrand && other.cardExpiryMonth == cardExpiryMonth && other.cardExpiryYear == cardExpiryYear && other.bankName == bankName && other.bankAccountLastFour == bankAccountLastFour && other.isDefault == isDefault && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ paymentType.hashCode ^ cardLastFour.hashCode ^ cardBrand.hashCode ^ cardExpiryMonth.hashCode ^ cardExpiryYear.hashCode ^ bankName.hashCode ^ bankAccountLastFour.hashCode ^ isDefault.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'PaymentMethodsModel(id: $id, userId: $userId, paymentType: $paymentType, cardLastFour: $cardLastFour, cardBrand: $cardBrand, cardExpiryMonth: $cardExpiryMonth, cardExpiryYear: $cardExpiryYear, bankName: $bankName, bankAccountLastFour: $bankAccountLastFour, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  // Primary identifier is already defined as a field
}


