import '../utils/geo_json.dart';

/// Generated model class for table transactions
class TransactionsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// References bookings(id)
  final String? bookingId;
  /// Non-nullable field
  /// References profiles(id)
  final String payerId;
  /// Non-nullable field
  /// References profiles(id)
  final String payeeId;
  /// Non-nullable field
  final double amount;
  final String? currency;
  final String? transactionType;
  final String? paymentMethod;
  final String? status;
  final String? externalPaymentId;
  final double? feeAmount;
  final DateTime? createdAt;
  final DateTime? completedAt;
  /// References instant_ride_requests(id)
  final String? instantRideRequestId;

  TransactionsModel({this.id = "", this.bookingId, required this.payerId, required this.payeeId, required this.amount, this.currency, this.transactionType, this.paymentMethod, this.status, this.externalPaymentId, this.feeAmount, this.createdAt, this.completedAt, this.instantRideRequestId})
      : assert(() { assert(id != null, "id constraint violation"); assert(payerId != null, "payer_id constraint violation"); assert(payeeId != null, "payee_id constraint violation"); assert(amount != null, "amount constraint violation"); return true; }());

  factory TransactionsModel.fromJson(Map<String, dynamic> json) {
    return TransactionsModel(
      id: json['id'] ?? '',
      bookingId: json['booking_id'],
      payerId: json['payer_id'] ?? '',
      payeeId: json['payee_id'] ?? '',
      amount: _toDouble(json['amount']) ?? 0.0,
      currency: json['currency'],
      transactionType: json['transaction_type'],
      paymentMethod: json['payment_method'],
      status: json['status'],
      externalPaymentId: json['external_payment_id'],
      feeAmount: json['fee_amount'] != null ? _toDouble(json['fee_amount']) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      completedAt: json['completed_at'] != null ? DateTime.parse(json['completed_at'].toString()) : null,
      instantRideRequestId: json['instant_ride_request_id'],
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'booking_id': bookingId,
      'payer_id': payerId,
      'payee_id': payeeId,
      'amount': amount,
      'currency': currency,
      'transaction_type': transactionType,
      'payment_method': paymentMethod,
      'status': status,
      'external_payment_id': externalPaymentId,
      'fee_amount': feeAmount,
      'created_at': createdAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'instant_ride_request_id': instantRideRequestId,
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'booking_id': bookingId,
      'payer_id': payerId,
      'payee_id': payeeId,
      'amount': amount,
      'currency': currency,
      'transaction_type': transactionType,
      'payment_method': paymentMethod,
      'status': status,
      'external_payment_id': externalPaymentId,
      'fee_amount': feeAmount,
      'completed_at': completedAt?.toIso8601String(),
      'instant_ride_request_id': instantRideRequestId,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'booking_id': bookingId,
      'payer_id': payerId,
      'payee_id': payeeId,
      'amount': amount,
      'currency': currency,
      'transaction_type': transactionType,
      'payment_method': paymentMethod,
      'status': status,
      'external_payment_id': externalPaymentId,
      'fee_amount': feeAmount,
      'created_at': createdAt?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'instant_ride_request_id': instantRideRequestId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TransactionsModel && other.id == id && other.bookingId == bookingId && other.payerId == payerId && other.payeeId == payeeId && other.amount == amount && other.currency == currency && other.transactionType == transactionType && other.paymentMethod == paymentMethod && other.status == status && other.externalPaymentId == externalPaymentId && other.feeAmount == feeAmount && other.createdAt == createdAt && other.completedAt == completedAt && other.instantRideRequestId == instantRideRequestId;
  }

  @override
  int get hashCode => id.hashCode ^ bookingId.hashCode ^ payerId.hashCode ^ payeeId.hashCode ^ amount.hashCode ^ currency.hashCode ^ transactionType.hashCode ^ paymentMethod.hashCode ^ status.hashCode ^ externalPaymentId.hashCode ^ feeAmount.hashCode ^ createdAt.hashCode ^ completedAt.hashCode ^ instantRideRequestId.hashCode;

  @override
  String toString() {
    return 'TransactionsModel(id: $id, bookingId: $bookingId, payerId: $payerId, payeeId: $payeeId, amount: $amount, currency: $currency, transactionType: $transactionType, paymentMethod: $paymentMethod, status: $status, externalPaymentId: $externalPaymentId, feeAmount: $feeAmount, createdAt: $createdAt, completedAt: $completedAt, instantRideRequestId: $instantRideRequestId)';
  }
  // Primary identifier is already defined as a field
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
