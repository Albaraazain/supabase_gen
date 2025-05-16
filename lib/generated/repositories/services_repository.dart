import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/services_query_builder.dart';


class ServicesRepository extends BaseRepository<ServicesModel> {
  ServicesRepository(SupabaseClient client) : super(client, 'services');
  
  @override
  ServicesModel fromJson(Map<String, dynamic> json) {
    return ServicesModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for services
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
  ServicesModelQueryBuilder createQueryBuilder() {
    return ServicesModelQueryBuilder(client);
  }
  
  /// Get a ServicesModel by service_id
  /// 
  /// This method looks up a record using a service_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<ServicesModel?> getByServiceId(String serviceId) async {
    final result = await client
        .from('services')
        .select().eq('service_id', serviceId)
        .maybeSingle();
    
    if (result == null) return null;
    return ServicesModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(ServicesModel model) {
    // Validate check constraints
    // 2200_17949_1_not_null: Database CHECK constraint
    // 2200_17949_3_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the service record associated with this services
  /// 
  /// This retrieves the parent service record for this services.
  /// It represents a foreign key relationship from services.service_id to services.id
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
  
  /// Check if the service record exists for this services
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

  /// Get all job_broadcasts associated with this services
  /// 
  /// This is a one-to-many relationship where a services has many job_broadcasts.
  /// It will return all job_broadcasts linked to the given servicesId via
  /// the service_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getJobBroadcasts(roomId);
  /// ```
  Future<List<JobBroadcastsModel>> getJobBroadcasts(String servicesId) async {
    final result = await client
        .from('job_broadcasts')
        .select()
        .eq('service_id', servicesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => JobBroadcastsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all job_broadcasts associated with this services with pagination and sorting
  /// 
  /// This is an enhanced version of getJobBroadcasts that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findJobBroadcasts(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<JobBroadcastsModel>> findJobBroadcasts(
    String servicesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('job_broadcasts').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('service_id', servicesId);
    
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
    return (response as List<dynamic>).map((json) => JobBroadcastsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of job_broadcasts associated with this services
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countJobBroadcasts(roomId);
  /// ```
  Future<int> countJobBroadcasts(String servicesId) async {
    final result = await client
        .from('job_broadcasts')
        .select()
        .eq('service_id', servicesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all active_jobs associated with this services
  /// 
  /// This is a one-to-many relationship where a services has many active_jobs.
  /// It will return all active_jobs linked to the given servicesId via
  /// the service_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getActiveJobs(roomId);
  /// ```
  Future<List<ActiveJobsModel>> getActiveJobs(String servicesId) async {
    final result = await client
        .from('active_jobs')
        .select()
        .eq('service_id', servicesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ActiveJobsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all active_jobs associated with this services with pagination and sorting
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
    String servicesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('active_jobs').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('service_id', servicesId);
    
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
  
  /// Count the number of active_jobs associated with this services
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countActiveJobs(roomId);
  /// ```
  Future<int> countActiveJobs(String servicesId) async {
    final result = await client
        .from('active_jobs')
        .select()
        .eq('service_id', servicesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all jobs associated with this services
  /// 
  /// This is a one-to-many relationship where a services has many jobs.
  /// It will return all jobs linked to the given servicesId via
  /// the service_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getJobs(roomId);
  /// ```
  Future<List<JobsModel>> getJobs(String servicesId) async {
    final result = await client
        .from('jobs')
        .select()
        .eq('service_id', servicesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => JobsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all jobs associated with this services with pagination and sorting
  /// 
  /// This is an enhanced version of getJobs that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findJobs(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<JobsModel>> findJobs(
    String servicesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('jobs').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('service_id', servicesId);
    
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
    return (response as List<dynamic>).map((json) => JobsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of jobs associated with this services
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countJobs(roomId);
  /// ```
  Future<int> countJobs(String servicesId) async {
    final result = await client
        .from('jobs')
        .select()
        .eq('service_id', servicesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all professional_services associated with this services
  /// 
  /// This is a one-to-many relationship where a services has many professional_services.
  /// It will return all professional_services linked to the given servicesId via
  /// the service_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getProfessionalServices(roomId);
  /// ```
  Future<List<ProfessionalServicesModel>> getProfessionalServices(String servicesId) async {
    final result = await client
        .from('professional_services')
        .select()
        .eq('service_id', servicesId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ProfessionalServicesModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all professional_services associated with this services with pagination and sorting
  /// 
  /// This is an enhanced version of getProfessionalServices that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findProfessionalServices(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<ProfessionalServicesModel>> findProfessionalServices(
    String servicesId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('professional_services').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('service_id', servicesId);
    
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
    return (response as List<dynamic>).map((json) => ProfessionalServicesModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of professional_services associated with this services
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countProfessionalServices(roomId);
  /// ```
  Future<int> countProfessionalServices(String servicesId) async {
    final result = await client
        .from('professional_services')
        .select()
        .eq('service_id', servicesId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
