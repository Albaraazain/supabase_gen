import '../utils/app_time.dart';

/// Generated model class for table payment_notifications
class PaymentNotificationsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  final DateTime createdAt;
  /// Non-nullable field
  final String paymentId;
  /// Non-nullable field
  final String notificationId;

  PaymentNotificationsModel({this.id = "", DateTime? createdAt, required this.paymentId, required this.notificationId})
      : assert(() { assert(id != null, "id constraint violation"); assert(createdAt != null, "created_at constraint violation"); assert(paymentId != null, "payment_id constraint violation"); assert(notificationId != null, "notification_id constraint violation"); return true; }()),
        createdAt = createdAt ?? AppTime.nowUtc();

  factory PaymentNotificationsModel.fromJson(Map<String, dynamic> json) {
    return PaymentNotificationsModel(
      id: json['id'] ?? '',
      createdAt: DateTime.parse(json['created_at'].toString()).toLocal(),
      paymentId: json['payment_id'] ?? '',
      notificationId: json['notification_id'] ?? '',
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toUtc().toIso8601String(),
      'payment_id': paymentId,
      'notification_id': notificationId,
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'payment_id': paymentId,
      'notification_id': notificationId,
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'created_at': createdAt.toUtc().toIso8601String(),
      'payment_id': paymentId,
      'notification_id': notificationId,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PaymentNotificationsModel && other.id == id && other.createdAt == createdAt && other.paymentId == paymentId && other.notificationId == notificationId;
  }

  @override
  int get hashCode => id.hashCode ^ createdAt.hashCode ^ paymentId.hashCode ^ notificationId.hashCode;

  @override
  String toString() {
    return 'PaymentNotificationsModel(id: $id, createdAt: $createdAt, paymentId: $paymentId, notificationId: $notificationId)';
  }
  // Primary identifier is already defined as a field
}


