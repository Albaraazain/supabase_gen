import '../utils/geo_json.dart';

/// Generated model class for table messages
/// Database triggers associated with this table:
/// - mark_message_read_trigger: UPDATE BEFORE - EXECUTE FUNCTION mark_message_as_read()
///   Signature: mark_message_as_read() RETURNS trigger
///   Language: plpgsql
///   Description: No description available
///   Body:  BEGIN   IF NEW.is_read = TRUE AND OLD.is_read = FALSE THEN     NEW.read_at = NOW();   END IF;   RETURN NEW; END; 
///
class MessagesModel {
  /// Primary key field
  /// Non-nullable field
  final String id;
  /// Non-nullable field
  /// References trips(id)
  final String tripId;
  /// Non-nullable field
  /// References profiles(id)
  final String senderId;
  /// Non-nullable field
  /// References profiles(id)
  final String recipientId;
  /// References bookings(id)
  final String? bookingId;
  final String? messageType;
  /// Non-nullable field
  final String content;
  final Map<String, dynamic>? metadata;
  final bool? isRead;
  final DateTime? readAt;
  final DateTime? createdAt;

  MessagesModel({this.id = "", required this.tripId, required this.senderId, required this.recipientId, this.bookingId, this.messageType, required this.content, this.metadata, this.isRead, this.readAt, this.createdAt})
      : assert(() { assert(id != null, "id constraint violation"); assert(tripId != null, "trip_id constraint violation"); assert(senderId != null, "sender_id constraint violation"); assert(recipientId != null, "recipient_id constraint violation"); assert(content != null, "content constraint violation"); return true; }());

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(
      id: json['id'] ?? '',
      tripId: json['trip_id'] ?? '',
      senderId: json['sender_id'] ?? '',
      recipientId: json['recipient_id'] ?? '',
      bookingId: json['booking_id'],
      messageType: json['message_type'],
      content: json['content'] ?? '',
      metadata: json['metadata'],
      isRead: json['is_read'],
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  /// Convert to JSON (includes all fields for reading from database)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trip_id': tripId,
      'sender_id': senderId,
      'recipient_id': recipientId,
      'booking_id': bookingId,
      'message_type': messageType,
      'content': content,
      'metadata': metadata,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for INSERT operations (excludes generated columns and auto-generated fields)
  Map<String, dynamic> toJsonForInsert() {
    return {
      'trip_id': tripId,
      'sender_id': senderId,
      'recipient_id': recipientId,
      'booking_id': bookingId,
      'message_type': messageType,
      'content': content,
      'metadata': metadata,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
    };
  }

  /// Convert to JSON for UPDATE operations (excludes generated columns but keeps ID)
  Map<String, dynamic> toJsonForUpdate() {
    return {
      'id': id,
      'trip_id': tripId,
      'sender_id': senderId,
      'recipient_id': recipientId,
      'booking_id': bookingId,
      'message_type': messageType,
      'content': content,
      'metadata': metadata,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessagesModel && other.id == id && other.tripId == tripId && other.senderId == senderId && other.recipientId == recipientId && other.bookingId == bookingId && other.messageType == messageType && other.content == content && other.metadata == metadata && other.isRead == isRead && other.readAt == readAt && other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ tripId.hashCode ^ senderId.hashCode ^ recipientId.hashCode ^ bookingId.hashCode ^ messageType.hashCode ^ content.hashCode ^ metadata.hashCode ^ isRead.hashCode ^ readAt.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'MessagesModel(id: $id, tripId: $tripId, senderId: $senderId, recipientId: $recipientId, bookingId: $bookingId, messageType: $messageType, content: $content, metadata: $metadata, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
  }
  // Primary identifier is already defined as a field
}


