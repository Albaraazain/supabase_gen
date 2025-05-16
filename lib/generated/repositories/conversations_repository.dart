import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/conversations_query_builder.dart';


class ConversationsRepository extends BaseRepository<ConversationsModel> {
  ConversationsRepository(SupabaseClient client) : super(client, 'conversations');
  
  @override
  ConversationsModel fromJson(Map<String, dynamic> json) {
    return ConversationsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for conversations
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
  ConversationsModelQueryBuilder createQueryBuilder() {
    return ConversationsModelQueryBuilder(client);
  }
  
  /// Get a ConversationsModel by conversation_id
  /// 
  /// This method looks up a record using a conversation_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ConversationsModel?> getByConversationId(String conversationId) async {
    final result = await client
        .from('conversations')
        .select().eq('conversation_id', conversationId)
        .maybeSingle();
    
    if (result == null) return null;
    return ConversationsModel.fromJson(result);
  }

  /// Get a ConversationsModel by homeowner_id
  /// 
  /// This method looks up a record using a homeowner_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ConversationsModel?> getByHomeownerId(String homeownerId) async {
    final result = await client
        .from('conversations')
        .select().eq('homeowner_id', homeownerId)
        .maybeSingle();
    
    if (result == null) return null;
    return ConversationsModel.fromJson(result);
  }

  /// Get a ConversationsModel by professional_id
  /// 
  /// This method looks up a record using a professional_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ConversationsModel?> getByProfessionalId(String professionalId) async {
    final result = await client
        .from('conversations')
        .select().eq('professional_id', professionalId)
        .maybeSingle();
    
    if (result == null) return null;
    return ConversationsModel.fromJson(result);
  }

  /// Get a ConversationsModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ConversationsModel?> getByJobId(String jobId) async {
    final result = await client
        .from('conversations')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return ConversationsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ConversationsModel model) {
    // Validate check constraints
    // 2200_17655_1_not_null: Database CHECK constraint
    // 2200_17655_2_not_null: Database CHECK constraint
    // 2200_17655_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the conversation record associated with this conversations
  /// 
  /// This retrieves the parent conversation record for this conversations.
  /// It represents a foreign key relationship from conversations.conversation_id to conversations.id
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
  
  /// Check if the conversation record exists for this conversations
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

  /// Get the job record associated with this conversations
  /// 
  /// This retrieves the parent job record for this conversations.
  /// It represents a foreign key relationship from conversations.job_id to jobs.id
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
  
  /// Check if the job record exists for this conversations
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

  /// Get all messages associated with this conversations
  /// 
  /// This is a one-to-many relationship where a conversations has many messages.
  /// It will return all messages linked to the given conversationsId via
  /// the conversation_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getMessages(roomId);
  /// ```
  Future<List<MessagesModel>> getMessages(String conversationsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('conversation_id', conversationsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all messages associated with this conversations with pagination and sorting
  /// 
  /// This is an enhanced version of getMessages that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findMessages(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<MessagesModel>> findMessages(
    String conversationsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('messages').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('conversation_id', conversationsId);
    
    // Apply additional filters if provided
    if (additionalFilters != null) {
      additionalFilters.forEach((key, value) {
        if (value != null) {
          queryBuilder = queryBuilder.eq(key, value);
        }
      });
    }
    
    // Apply ordering if provided
    if (orderBy != null) {
      queryBuilder = queryBuilder.order(orderBy, ascending: ascending);
    }
    
    // Apply limit if provided
    if (limit != null) {
      queryBuilder = queryBuilder.limit(limit);
    }
    
    // Apply pagination range if provided
    if (offset != null) {
      queryBuilder = queryBuilder.range(offset, offset + (limit ?? 10) - 1);
    }
    
    // Execute the query
    final response = await queryBuilder;
    
    // Convert the response to model instances
    return (response as List<dynamic>).map((json) => MessagesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of messages associated with this conversations
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countMessages(roomId);
  /// ```
  Future<int> countMessages(String conversationsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('conversation_id', conversationsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
