import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/messages_query_builder.dart';


class MessagesRepository extends BaseRepository<MessagesModel> {
  MessagesRepository(SupabaseClient client) : super(client, 'messages', primaryKeyColumn: 'message_id');
  
  @override
  MessagesModel fromJson(Map<String, dynamic> json) {
    return MessagesModel.fromJson(json);
  }
  
  @override
  String? getPrimaryKeyValue(MessagesModel model) {
    return model.messageId;
  }

  /// Note: This table has the following database triggers that may affect operations:
    /// - update_conversation_last_message: INSERT AFTER - EXECUTE FUNCTION update_conversation_timestamp()
  ///   Signature: update_conversation_timestamp() RETURNS trigger
  ///   Language: plpgsql
  ///   Body: <Function body not available for update_conversation_timestamp>
  
  /// Create a type-safe query builder for messages
  /// 
  /// The query builder provides a fluent interface to build complex queries
  /// with type safety for filtering, ordering and pagination.
  /// 
  /// Example:
  /// ```dart
  /// final users = await userRepository
  ///   .createQueryBuilder()
  ///   .whereNameEquals("John")
  ///   .whereAgeGreaterThan(18)
  ///   .orderByCreatedAtDesc()
  ///   .limit(10)
  ///   .get();
  /// ```
  MessagesModelQueryBuilder createQueryBuilder() {
    return MessagesModelQueryBuilder(client);
  }
  
  /// Get a MessagesModel by message_id
  /// 
  /// This method looks up a record using a message_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<MessagesModel?> getByMessageId(String messageId) async {
    final result = await client
        .from('messages')
        .select().eq('message_id', messageId)
        .maybeSingle();
    
    if (result == null) return null;
    return MessagesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(MessagesModel model) {
    // Validate check constraints
    // 2200_17802_1_not_null: Database CHECK constraint
    // 2200_17802_2_not_null: Database CHECK constraint
    // 2200_17802_3_not_null: Database CHECK constraint
    // 2200_17802_4_not_null: Database CHECK constraint
    // 2200_17802_6_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the message record associated with this messages
  /// 
  /// This retrieves the parent message record for this messages.
  /// It represents a foreign key relationship from messages.message_id to messages.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<MessagesModel?> getMessage(String messageId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('id', messageId)
        .maybeSingle();
    
    if (result == null) return null;
    return MessagesModel.fromJson(result);
  }
  
  /// Check if the message record exists for this messages
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.messageExists(message.userId);
  /// ```
  Future<bool> messageExists(String messageId) async {
    final result = await client
        .from('messages')
        .select('id')
        .eq('id', messageId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the conversation record associated with this messages
  /// 
  /// This retrieves the parent conversation record for this messages.
  /// It represents a foreign key relationship from messages.conversation_id to conversations.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ConversationsModel?> getConversation(String conversationId) async {
    final result = await client
        .from('conversations')
        .select()
        .eq('id', conversationId)
        .maybeSingle();
    
    if (result == null) return null;
    return ConversationsModel.fromJson(result);
  }
  
  /// Check if the conversation record exists for this messages
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.conversationExists(message.userId);
  /// ```
  Future<bool> conversationExists(String conversationId) async {
    final result = await client
        .from('conversations')
        .select('id')
        .eq('id', conversationId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get the job record associated with this messages
  /// 
  /// This retrieves the parent job record for this messages.
  /// It represents a foreign key relationship from messages.job_id to jobs.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<JobsModel?> getJob(String jobId) async {
    final result = await client
        .from('jobs')
        .select()
        .eq('id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return JobsModel.fromJson(result);
  }
  
  /// Check if the job record exists for this messages
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.jobExists(message.userId);
  /// ```
  Future<bool> jobExists(String jobId) async {
    final result = await client
        .from('jobs')
        .select('id')
        .eq('id', jobId)
        .maybeSingle();
    
    return result != null;
  }
}
