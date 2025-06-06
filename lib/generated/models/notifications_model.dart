import '../utils/geo_json.dart';

/// Generated model class for table notifications
class NotificationsModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References profiles(id)
  final String userId;
  /// Non-nullable field
  final String type;
  /// Non-nullable field
  final String title;
  /// Non-nullable field
  final String body;
  final Map<String, dynamic>? data;
  /// References trips(id)
  final String? tripId;
  /// References bookings(id)
  final String? bookingId;
  final bool? isRead;
  final DateTime? readAt;
  final DateTime? createdAt;

  NotificationsModel({this.id = "", required this.userId, required this.type, required this.title, required this.body, this.data, this.tripId, this.bookingId, this.isRead, this.readAt, this.createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(userId != null, "user_id constraint violation"); assert(type != null, "type constraint violation"); assert(title != null, "title constraint violation"); assert(body != null, "body constraint violation"); return true; }());

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      data: json['data'],
      tripId: json['trip_id'],
      bookingId: json['booking_id'],
      isRead: json['is_read'],
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'title': title,
      'body': body,
      'data': data,
      'trip_id': tripId,
      'booking_id': bookingId,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'user_id': userId,
      'type': type,
      'title': title,
      'body': body,
      'data': data,
      'trip_id': tripId,
      'booking_id': bookingId,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'title': title,
      'body': body,
      'data': data,
      'trip_id': tripId,
      'booking_id': bookingId,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationsModel && other.id == id && other.userId == userId && other.type == type && other.title == title && other.body == body && other.data == data && other.tripId == tripId && other.bookingId == bookingId && other.isRead == isRead && other.readAt == readAt && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ userId.hashCode ^ type.hashCode ^ title.hashCode ^ body.hashCode ^ data.hashCode ^ tripId.hashCode ^ bookingId.hashCode ^ isRead.hashCode ^ readAt.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'NotificationsModel(id: $id, userId: $userId, type: $type, title: $title, body: $body, data: $data, tripId: $tripId, bookingId: $bookingId, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
  }
  // Primary identifier is already defined as a field
}


