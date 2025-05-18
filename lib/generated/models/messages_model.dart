
/// Generated model class for table messages
/// Database triggers associated with this table:
/// - update_conversation_last_message: INSERT AFTER - EXECUTE FUNCTION update_conversation_timestamp()
///   Signature: update_conversation_timestamp() RETURNS trigger
///   Language: plpgsql
///   Body: <Function body not available for update_conversation_timestamp>
///
class MessagesModel {
  /// Primary key field
  /// Non-nullable field
  final String messageId;
  /// Non-nullable field
  final String conversationId;
  /// Non-nullable field
  final String senderId;
  /// Non-nullable field
  final String receiverId;
  final String? jobId;
  /// Non-nullable field
  final String content;
  final bool? isRead;
  final DateTime? readAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  MessagesModel({this.messageId = "", required this.conversationId, required this.senderId, required this.receiverId, this.jobId, required this.content, this.isRead, this.readAt, this.createdAt, this.updatedAt})
      : assert(() { assert(messageId != null, "message_id constraint violation"); assert(conversationId != null, "conversation_id constraint violation"); assert(senderId != null, "sender_id constraint violation"); assert(receiverId != null, "receiver_id constraint violation"); assert(content != null, "content constraint violation"); return true; }());

  factory MessagesModel.fromJson(Map<String, dynamic> json) {
    return MessagesModel(
      messageId: json['message_id'] ?? '',
      conversationId: json['conversation_id'] ?? '',
      senderId: json['sender_id'] ?? '',
      receiverId: json['receiver_id'] ?? '',
      jobId: json['job_id'],
      content: json['content'] ?? '',
      isRead: json['is_read'],
      readAt: json['read_at'] != null ? DateTime.parse(json['read_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_id': messageId,
      'conversation_id': conversationId,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'job_id': jobId,
      'content': content,
      'is_read': isRead,
      'read_at': readAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessagesModel && other.messageId == messageId && other.conversationId == conversationId && other.senderId == senderId && other.receiverId == receiverId && other.jobId == jobId && other.content == content && other.isRead == isRead && other.readAt == readAt && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => messageId.hashCode ^ conversationId.hashCode ^ senderId.hashCode ^ receiverId.hashCode ^ jobId.hashCode ^ content.hashCode ^ isRead.hashCode ^ readAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'MessagesModel(messageId: $messageId, conversationId: $conversationId, senderId: $senderId, receiverId: $receiverId, jobId: $jobId, content: $content, isRead: $isRead, readAt: $readAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => messageId;
}


