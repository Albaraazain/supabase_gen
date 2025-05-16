import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/jobs_query_builder.dart';


class JobsRepository extends BaseRepository<JobsModel> {
  JobsRepository(SupabaseClient client) : super(client, 'jobs');
  
  @override
  JobsModel fromJson(Map<String, dynamic> json) {
    return JobsModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for jobs
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
  JobsModelQueryBuilder createQueryBuilder() {
    return JobsModelQueryBuilder(client);
  }
  
  /// Get a JobsModel by job_id
  /// 
  /// This method looks up a record using a job_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<JobsModel?> getByJobId(String jobId) async {
    final result = await client
        .from('jobs')
        .select().eq('job_id', jobId)
        .maybeSingle();
    
    if (result == null) return null;
    return JobsModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(JobsModel model) {
    // Validate check constraints
    // 2200_17741_1_not_null: Database CHECK constraint
    // 2200_17741_3_not_null: Database CHECK constraint
    // 2200_17741_4_not_null: Database CHECK constraint
    // 2200_17741_5_not_null: Database CHECK constraint
    // 2200_17741_9_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the job record associated with this jobs
  /// 
  /// This retrieves the parent job record for this jobs.
  /// It represents a foreign key relationship from jobs.job_id to jobs.id
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
  
  /// Check if the job record exists for this jobs
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

  /// Get the service record associated with this jobs
  /// 
  /// This retrieves the parent service record for this jobs.
  /// It represents a foreign key relationship from jobs.service_id to services.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<ServicesModel?> getService(String serviceId) async {
    final result = await client
        .from('services')
        .select()
        .eq('id', serviceId)
        .maybeSingle();
    
    if (result == null) return null;
    return ServicesModel.fromJson(result);
  }
  
  /// Check if the service record exists for this jobs
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.serviceExists(message.userId);
  /// ```
  Future<bool> serviceExists(String serviceId) async {
    final result = await client
        .from('services')
        .select('id')
        .eq('id', serviceId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all diagnosis_phases associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many diagnosis_phases.
  /// It will return all diagnosis_phases linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getDiagnosisPhases(roomId);
  /// ```
  Future<List<DiagnosisPhaseModel>> getDiagnosisPhases(String jobsId) async {
    final result = await client
        .from('diagnosis_phase')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => DiagnosisPhaseModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all diagnosis_phases associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getDiagnosisPhases that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findDiagnosisPhases(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<DiagnosisPhaseModel>> findDiagnosisPhases(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('diagnosis_phase').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => DiagnosisPhaseModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of diagnosis_phases associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countDiagnosisPhases(roomId);
  /// ```
  Future<int> countDiagnosisPhases(String jobsId) async {
    final result = await client
        .from('diagnosis_phase')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all conversations associated with this jobs
  /// 
  /// This is a many-to-many relationship through the conversations junction table.
  /// It will return all conversations linked to the given jobsId.
  /// 
  /// Example:
  /// ```dart
  /// // Get all games that a user is part of
  /// final games = await usersRepository.getGames(userId);
  /// ```
  Future<List<ConversationsModel>> getConversations(String jobsId) async {
    // First get junction records
    final junctionResult = await client
        .from('conversations')
        .select('conversation_id')
        .eq('job_id', jobsId);
    
    final junctionData = junctionResult as List<dynamic>;
    if (junctionData.isEmpty) {
      return [];
    }
    
    // Extract the IDs
    final ids = junctionData
        .map((item) => (item as Map<String, dynamic>)['conversation_id'] as String?)
        .where((id) => id != null)
        .map((id) => id!)
        .toList();
    
    if (ids.isEmpty) {
      return [];
    }
    
    // Now get the actual records
    final result = await client
        .from('conversations')
        .select()
        .inFilter('id', ids);
    
    final resultData = result as List<dynamic>;
    
    return resultData
        .map((item) => ConversationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Shorthand method to check if a conversations is associated with this jobs
  /// through the conversations junction table.
  /// 
  /// Example:
  /// ```dart
  /// // Check if a user is part of a specific game
  /// final isPartOfGame = await usersRepository.hasConversation(userId, gameId);
  /// ```
  Future<bool> hasConversation(
    String jobsId, 
    String conversationId
  ) async {
    final result = await client
        .from('conversations')
        .select()
        .eq('job_id', jobsId)
        .eq('conversation_id', conversationId)
        .maybeSingle();
    
    return result != null;
  }
  
  /// Add a relationship between this jobs and a conversation
  /// using the conversations junction table.
  /// 
  /// Example:
  /// ```dart
  /// // Add a user to a game
  /// await usersRepository.addConversation(userId, gameId);
  /// ```
  Future<void> addConversation(
    String jobsId, 
    String conversationId
  ) async {
    // Check if relationship already exists
    final exists = await hasConversation(jobsId, conversationId);
    if (exists) return;
    
    // Create the relationship
    await client
        .from('conversations')
        .insert({
          'job_id': jobsId,
          'conversation_id': conversationId,
        });
  }
  
  /// Remove a relationship between this jobs and a conversation
  /// using the conversations junction table.
  /// 
  /// Example:
  /// ```dart
  /// // Remove a user from a game
  /// await usersRepository.removeConversation(userId, gameId);
  /// ```
  Future<void> removeConversation(
    String jobsId, 
    String conversationId
  ) async {
    await client
        .from('conversations')
        .delete()
        .eq('job_id', jobsId)
        .eq('conversation_id', conversationId);
  }

  /// Get all en_route_phases associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many en_route_phases.
  /// It will return all en_route_phases linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getEnRoutePhases(roomId);
  /// ```
  Future<List<EnRoutePhaseModel>> getEnRoutePhases(String jobsId) async {
    final result = await client
        .from('en_route_phase')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => EnRoutePhaseModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all en_route_phases associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getEnRoutePhases that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findEnRoutePhases(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<EnRoutePhaseModel>> findEnRoutePhases(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('en_route_phase').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => EnRoutePhaseModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of en_route_phases associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countEnRoutePhases(roomId);
  /// ```
  Future<int> countEnRoutePhases(String jobsId) async {
    final result = await client
        .from('en_route_phase')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all job_stage_histories associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many job_stage_histories.
  /// It will return all job_stage_histories linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getJobStageHistories(roomId);
  /// ```
  Future<List<JobStageHistoryModel>> getJobStageHistories(String jobsId) async {
    final result = await client
        .from('job_stage_history')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => JobStageHistoryModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all job_stage_histories associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getJobStageHistories that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findJobStageHistories(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<JobStageHistoryModel>> findJobStageHistories(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('job_stage_history').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => JobStageHistoryModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of job_stage_histories associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countJobStageHistories(roomId);
  /// ```
  Future<int> countJobStageHistories(String jobsId) async {
    final result = await client
        .from('job_stage_history')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all location_map_settings associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many location_map_settings.
  /// It will return all location_map_settings linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getLocationMapSettings(roomId);
  /// ```
  Future<List<LocationMapSettingsModel>> getLocationMapSettings(String jobsId) async {
    final result = await client
        .from('location_map_settings')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => LocationMapSettingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all location_map_settings associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getLocationMapSettings that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findLocationMapSettings(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<LocationMapSettingsModel>> findLocationMapSettings(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('location_map_settings').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => LocationMapSettingsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of location_map_settings associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countLocationMapSettings(roomId);
  /// ```
  Future<int> countLocationMapSettings(String jobsId) async {
    final result = await client
        .from('location_map_settings')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all messages associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many messages.
  /// It will return all messages linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getMessages(roomId);
  /// ```
  Future<List<MessagesModel>> getMessages(String jobsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => MessagesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all messages associated with this jobs with pagination and sorting
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
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('messages').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
  
  /// Count the number of messages associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countMessages(roomId);
  /// ```
  Future<int> countMessages(String jobsId) async {
    final result = await client
        .from('messages')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all material_usages associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many material_usages.
  /// It will return all material_usages linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getMaterialUsages(roomId);
  /// ```
  Future<List<MaterialUsageModel>> getMaterialUsages(String jobsId) async {
    final result = await client
        .from('material_usage')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => MaterialUsageModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all material_usages associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getMaterialUsages that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findMaterialUsages(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<MaterialUsageModel>> findMaterialUsages(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('material_usage').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => MaterialUsageModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of material_usages associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countMaterialUsages(roomId);
  /// ```
  Future<int> countMaterialUsages(String jobsId) async {
    final result = await client
        .from('material_usage')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all professional_earnings associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many professional_earnings.
  /// It will return all professional_earnings linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getProfessionalEarnings(roomId);
  /// ```
  Future<List<ProfessionalEarningsModel>> getProfessionalEarnings(String jobsId) async {
    final result = await client
        .from('professional_earnings')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ProfessionalEarningsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all professional_earnings associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getProfessionalEarnings that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findProfessionalEarnings(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<ProfessionalEarningsModel>> findProfessionalEarnings(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('professional_earnings').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => ProfessionalEarningsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of professional_earnings associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countProfessionalEarnings(roomId);
  /// ```
  Future<int> countProfessionalEarnings(String jobsId) async {
    final result = await client
        .from('professional_earnings')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all quote_phases associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many quote_phases.
  /// It will return all quote_phases linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getQuotePhases(roomId);
  /// ```
  Future<List<QuotePhaseModel>> getQuotePhases(String jobsId) async {
    final result = await client
        .from('quote_phase')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => QuotePhaseModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all quote_phases associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getQuotePhases that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findQuotePhases(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<QuotePhaseModel>> findQuotePhases(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('quote_phase').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => QuotePhaseModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of quote_phases associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countQuotePhases(roomId);
  /// ```
  Future<int> countQuotePhases(String jobsId) async {
    final result = await client
        .from('quote_phase')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all safety_checks associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many safety_checks.
  /// It will return all safety_checks linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getSafetyChecks(roomId);
  /// ```
  Future<List<SafetyChecksModel>> getSafetyChecks(String jobsId) async {
    final result = await client
        .from('safety_checks')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => SafetyChecksModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all safety_checks associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getSafetyChecks that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findSafetyChecks(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<SafetyChecksModel>> findSafetyChecks(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('safety_checks').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => SafetyChecksModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of safety_checks associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countSafetyChecks(roomId);
  /// ```
  Future<int> countSafetyChecks(String jobsId) async {
    final result = await client
        .from('safety_checks')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all site_photos associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many site_photos.
  /// It will return all site_photos linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getSitePhotos(roomId);
  /// ```
  Future<List<SitePhotosModel>> getSitePhotos(String jobsId) async {
    final result = await client
        .from('site_photos')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => SitePhotosModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all site_photos associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getSitePhotos that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findSitePhotos(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<SitePhotosModel>> findSitePhotos(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('site_photos').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => SitePhotosModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of site_photos associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countSitePhotos(roomId);
  /// ```
  Future<int> countSitePhotos(String jobsId) async {
    final result = await client
        .from('site_photos')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all work_tasks associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many work_tasks.
  /// It will return all work_tasks linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getWorkTasks(roomId);
  /// ```
  Future<List<WorkTasksModel>> getWorkTasks(String jobsId) async {
    final result = await client
        .from('work_tasks')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => WorkTasksModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all work_tasks associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getWorkTasks that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findWorkTasks(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<WorkTasksModel>> findWorkTasks(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('work_tasks').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => WorkTasksModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of work_tasks associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countWorkTasks(roomId);
  /// ```
  Future<int> countWorkTasks(String jobsId) async {
    final result = await client
        .from('work_tasks')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all test_jobs associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many test_jobs.
  /// It will return all test_jobs linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getTestJobs(roomId);
  /// ```
  Future<List<TestJobsModel>> getTestJobs(String jobsId) async {
    final result = await client
        .from('test_jobs')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => TestJobsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all test_jobs associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getTestJobs that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findTestJobs(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<TestJobsModel>> findTestJobs(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('test_jobs').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => TestJobsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of test_jobs associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countTestJobs(roomId);
  /// ```
  Future<int> countTestJobs(String jobsId) async {
    final result = await client
        .from('test_jobs')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all work_sessions associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many work_sessions.
  /// It will return all work_sessions linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getWorkSessions(roomId);
  /// ```
  Future<List<WorkSessionsModel>> getWorkSessions(String jobsId) async {
    final result = await client
        .from('work_sessions')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => WorkSessionsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all work_sessions associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getWorkSessions that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findWorkSessions(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<WorkSessionsModel>> findWorkSessions(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('work_sessions').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => WorkSessionsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of work_sessions associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countWorkSessions(roomId);
  /// ```
  Future<int> countWorkSessions(String jobsId) async {
    final result = await client
        .from('work_sessions')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all work_updates associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many work_updates.
  /// It will return all work_updates linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getWorkUpdates(roomId);
  /// ```
  Future<List<WorkUpdatesModel>> getWorkUpdates(String jobsId) async {
    final result = await client
        .from('work_updates')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => WorkUpdatesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all work_updates associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getWorkUpdates that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findWorkUpdates(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<WorkUpdatesModel>> findWorkUpdates(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('work_updates').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => WorkUpdatesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of work_updates associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countWorkUpdates(roomId);
  /// ```
  Future<int> countWorkUpdates(String jobsId) async {
    final result = await client
        .from('work_updates')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all working_phases associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many working_phases.
  /// It will return all working_phases linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getWorkingPhases(roomId);
  /// ```
  Future<List<WorkingPhaseModel>> getWorkingPhases(String jobsId) async {
    final result = await client
        .from('working_phase')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => WorkingPhaseModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all working_phases associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getWorkingPhases that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findWorkingPhases(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<WorkingPhaseModel>> findWorkingPhases(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('working_phase').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => WorkingPhaseModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of working_phases associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countWorkingPhases(roomId);
  /// ```
  Future<int> countWorkingPhases(String jobsId) async {
    final result = await client
        .from('working_phase')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all active_jobs associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many active_jobs.
  /// It will return all active_jobs linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getActiveJobs(roomId);
  /// ```
  Future<List<ActiveJobsModel>> getActiveJobs(String jobsId) async {
    final result = await client
        .from('active_jobs')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ActiveJobsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all active_jobs associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getActiveJobs that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findActiveJobs(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<ActiveJobsModel>> findActiveJobs(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('active_jobs').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => ActiveJobsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of active_jobs associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countActiveJobs(roomId);
  /// ```
  Future<int> countActiveJobs(String jobsId) async {
    final result = await client
        .from('active_jobs')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all diagnosis_findings associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many diagnosis_findings.
  /// It will return all diagnosis_findings linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getDiagnosisFindings(roomId);
  /// ```
  Future<List<DiagnosisFindingsModel>> getDiagnosisFindings(String jobsId) async {
    final result = await client
        .from('diagnosis_findings')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => DiagnosisFindingsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all diagnosis_findings associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getDiagnosisFindings that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findDiagnosisFindings(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<DiagnosisFindingsModel>> findDiagnosisFindings(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('diagnosis_findings').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => DiagnosisFindingsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of diagnosis_findings associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countDiagnosisFindings(roomId);
  /// ```
  Future<int> countDiagnosisFindings(String jobsId) async {
    final result = await client
        .from('diagnosis_findings')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all job_tasks associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many job_tasks.
  /// It will return all job_tasks linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getJobTasks(roomId);
  /// ```
  Future<List<JobTasksModel>> getJobTasks(String jobsId) async {
    final result = await client
        .from('job_tasks')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => JobTasksModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all job_tasks associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getJobTasks that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findJobTasks(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<JobTasksModel>> findJobTasks(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('job_tasks').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => JobTasksModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of job_tasks associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countJobTasks(roomId);
  /// ```
  Future<int> countJobTasks(String jobsId) async {
    final result = await client
        .from('job_tasks')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all location_bookmarks associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many location_bookmarks.
  /// It will return all location_bookmarks linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getLocationBookmarks(roomId);
  /// ```
  Future<List<LocationBookmarksModel>> getLocationBookmarks(String jobsId) async {
    final result = await client
        .from('location_bookmarks')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => LocationBookmarksModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all location_bookmarks associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getLocationBookmarks that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findLocationBookmarks(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<LocationBookmarksModel>> findLocationBookmarks(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('location_bookmarks').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => LocationBookmarksModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of location_bookmarks associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countLocationBookmarks(roomId);
  /// ```
  Future<int> countLocationBookmarks(String jobsId) async {
    final result = await client
        .from('location_bookmarks')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all location_verifications associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many location_verifications.
  /// It will return all location_verifications linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getLocationVerifications(roomId);
  /// ```
  Future<List<LocationVerificationsModel>> getLocationVerifications(String jobsId) async {
    final result = await client
        .from('location_verifications')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => LocationVerificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all location_verifications associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getLocationVerifications that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findLocationVerifications(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<LocationVerificationsModel>> findLocationVerifications(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('location_verifications').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => LocationVerificationsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of location_verifications associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countLocationVerifications(roomId);
  /// ```
  Future<int> countLocationVerifications(String jobsId) async {
    final result = await client
        .from('location_verifications')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all preparation_checks associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many preparation_checks.
  /// It will return all preparation_checks linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getPreparationChecks(roomId);
  /// ```
  Future<List<PreparationChecksModel>> getPreparationChecks(String jobsId) async {
    final result = await client
        .from('preparation_checks')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => PreparationChecksModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all preparation_checks associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getPreparationChecks that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findPreparationChecks(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<PreparationChecksModel>> findPreparationChecks(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('preparation_checks').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => PreparationChecksModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of preparation_checks associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countPreparationChecks(roomId);
  /// ```
  Future<int> countPreparationChecks(String jobsId) async {
    final result = await client
        .from('preparation_checks')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all work_timeline_events associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many work_timeline_events.
  /// It will return all work_timeline_events linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getWorkTimelineEvents(roomId);
  /// ```
  Future<List<WorkTimelineEventsModel>> getWorkTimelineEvents(String jobsId) async {
    final result = await client
        .from('work_timeline_events')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => WorkTimelineEventsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all work_timeline_events associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getWorkTimelineEvents that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findWorkTimelineEvents(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<WorkTimelineEventsModel>> findWorkTimelineEvents(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('work_timeline_events').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => WorkTimelineEventsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of work_timeline_events associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countWorkTimelineEvents(roomId);
  /// ```
  Future<int> countWorkTimelineEvents(String jobsId) async {
    final result = await client
        .from('work_timeline_events')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all service_quotes associated with this jobs
  /// 
  /// This is a one-to-many relationship where a jobs has many service_quotes.
  /// It will return all service_quotes linked to the given jobsId via
  /// the job_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getServiceQuotes(roomId);
  /// ```
  Future<List<ServiceQuotesModel>> getServiceQuotes(String jobsId) async {
    final result = await client
        .from('service_quotes')
        .select()
        .eq('job_id', jobsId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ServiceQuotesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all service_quotes associated with this jobs with pagination and sorting
  /// 
  /// This is an enhanced version of getServiceQuotes that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findServiceQuotes(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<ServiceQuotesModel>> findServiceQuotes(
    String jobsId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('service_quotes').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('job_id', jobsId);
    
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
    return (response as List<dynamic>).map((json) => ServiceQuotesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of service_quotes associated with this jobs
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countServiceQuotes(roomId);
  /// ```
  Future<int> countServiceQuotes(String jobsId) async {
    final result = await client
        .from('service_quotes')
        .select()
        .eq('job_id', jobsId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
