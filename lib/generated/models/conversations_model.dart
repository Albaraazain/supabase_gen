
/// Generated model class for table conversations
class ConversationsModel {
  /// Primary key field
  /// Non-nullable field
  final String conversationId;
  /// Unique field
  /// Non-nullable field
  final String homeownerId;
  /// Unique field
  /// Non-nullable field
  final String professionalId;
  /// Unique field
  final String? jobId;
  final DateTime? lastMessageAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ConversationsModel({this.conversationId = "", required this.homeownerId, required this.professionalId, this.jobId, this.lastMessageAt, this.createdAt, this.updatedAt})
      : assert(() { assert(conversationId != null, "conversation_id constraint violation"); assert(homeownerId != null, "homeowner_id constraint violation"); assert(professionalId != null, "professional_id constraint violation"); return true; }());

  factory ConversationsModel.fromJson(Map<String, dynamic> json) {
    return ConversationsModel(
      conversationId: json['conversation_id'] ?? '',
      homeownerId: json['homeowner_id'] ?? '',
      professionalId: json['professional_id'] ?? '',
      jobId: json['job_id'],
      lastMessageAt: json['last_message_at'] != null ? DateTime.parse(json['last_message_at'].toString()) : null,
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversation_id': conversationId,
      'homeowner_id': homeownerId,
      'professional_id': professionalId,
      'job_id': jobId,
      'last_message_at': lastMessageAt?.toIso8601String(),
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConversationsModel && other.conversationId == conversationId && other.homeownerId == homeownerId && other.professionalId == professionalId && other.jobId == jobId && other.lastMessageAt == lastMessageAt && other.createdAt == createdAt && other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => conversationId.hashCode ^ homeownerId.hashCode ^ professionalId.hashCode ^ jobId.hashCode ^ lastMessageAt.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;

  @override
  String toString() {
    return 'ConversationsModel(conversationId: $conversationId, homeownerId: $homeownerId, professionalId: $professionalId, jobId: $jobId, lastMessageAt: $lastMessageAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
  /// Get the primary identifier for this record
  String get id => conversationId;
}


