import '../utils/geo_json.dart';

/// Generated model class for table quote_history
class QuoteHistoryModel {
  /// Primary key field
  /// Non-nullable field
  final String historyId;
  /// Non-nullable field
  final String quoteId;
  /// Non-nullable field
  final String action;
  final String? actionBy;
  final DateTime? actionAt;
  final String? notes;
  final Map<String, dynamic>? metadata;
  final DateTime? createdAt;

  QuoteHistoryModel({this.historyId = "", required this.quoteId, required this.action, this.actionBy, this.actionAt, this.notes, this.metadata, this.createdAt})
      : assert(() { assert(historyId != null, "history_id constraint violation"); assert(quoteId != null, "quote_id constraint violation"); assert(action != null, "action constraint violation"); return true; }());

  factory QuoteHistoryModel.fromJson(Map<String, dynamic> json) {
    return QuoteHistoryModel(
      historyId: json['history_id'] ?? '',
      quoteId: json['quote_id'] ?? '',
      action: json['action'] ?? '',
      actionBy: json['action_by'],
      actionAt: json['action_at'] != null ? DateTime.parse(json['action_at'].toString()) : null,
      notes: json['notes'],
      metadata: json['metadata'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history_id': historyId,
      'quote_id': quoteId,
      'action': action,
      'action_by': actionBy,
      'action_at': actionAt?.toIso8601String(),
      'notes': notes,
      'metadata': metadata,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuoteHistoryModel && other.historyId == historyId && other.quoteId == quoteId && other.action == action && other.actionBy == actionBy && other.actionAt == actionAt && other.notes == notes && other.metadata == metadata && other.createdAt == createdAt;
  }

  @override
  int get hashCode => historyId.hashCode ^ quoteId.hashCode ^ action.hashCode ^ actionBy.hashCode ^ actionAt.hashCode ^ notes.hashCode ^ metadata.hashCode ^ createdAt.hashCode;

  @override
  String toString() {
    return 'QuoteHistoryModel(historyId: $historyId, quoteId: $quoteId, action: $action, actionBy: $actionBy, actionAt: $actionAt, notes: $notes, metadata: $metadata, createdAt: $createdAt)';
  }
  /// Get the primary identifier for this record
  String get id => historyId;
}


