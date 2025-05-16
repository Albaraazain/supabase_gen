import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/models.dart';
import './base_repository.dart';
import '../query_builders/users_query_builder.dart';


class UsersRepository extends BaseRepository<UsersModel> {
  UsersRepository(SupabaseClient client) : super(client, 'users');
  
  @override
  UsersModel fromJson(Map<String, dynamic> json) {
    return UsersModel.fromJson(json);
  }
  
  /// Create a type-safe query builder for users
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
  UsersModelQueryBuilder createQueryBuilder() {
    return UsersModelQueryBuilder(client);
  }
  
  /// Get a UsersModel by user_id
  /// 
  /// This method looks up a record using a user_id field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<UsersModel?> getByUserId(String userId) async {
    final result = await client
        .from('users')
        .select().eq('user_id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return UsersModel.fromJson(result);
  }

  /// Get a UsersModel by email
  /// 
  /// This method looks up a record using a email field, which has a unique constraint.
  /// It will return null if no record is found.
  Future<UsersModel?> getByEmail(String email) async {
    final result = await client
        .from('users')
        .select().eq('email', email)
        .maybeSingle();
    
    if (result == null) return null;
    return UsersModel.fromJson(result);
  }

  /// Validate that the model meets all check constraints
  /// 
  /// This method validates the model against the database check constraints.
  /// It throws an exception if any constraint is violated.
  void validate(UsersModel model) {
    // Validate check constraints
    // 2200_18001_1_not_null: Database CHECK constraint
    // 2200_18001_2_not_null: Database CHECK constraint
    // 2200_18001_3_not_null: Database CHECK constraint
    // 2200_18001_6_not_null: Database CHECK constraint
    // Add custom validation logic here
  }
  /// Get the user record associated with this users
  /// 
  /// This retrieves the parent user record for this users.
  /// It represents a foreign key relationship from users.user_id to users.id
  /// 
  /// Example:
  /// ```dart
  /// // Get the user who created a message
  /// final user = await messageRepository.getUser(message.userId);
  /// ```
  Future<UsersModel?> getUser(String userId) async {
    final result = await client
        .from('users')
        .select()
        .eq('id', userId)
        .maybeSingle();
    
    if (result == null) return null;
    return UsersModel.fromJson(result);
  }
  
  /// Check if the user record exists for this users
  /// 
  /// A utility method to check if the parent record exists without having to fetch the full record.
  /// 
  /// Example:
  /// ```dart
  /// // Check if the user exists
  /// final exists = await messageRepository.userExists(message.userId);
  /// ```
  Future<bool> userExists(String userId) async {
    final result = await client
        .from('users')
        .select('id')
        .eq('id', userId)
        .maybeSingle();
    
    return result != null;
  }

  /// Get all error_logs associated with this users
  /// 
  /// This is a one-to-many relationship where a users has many error_logs.
  /// It will return all error_logs linked to the given usersId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getErrorLogs(roomId);
  /// ```
  Future<List<ErrorLogsModel>> getErrorLogs(String usersId) async {
    final result = await client
        .from('error_logs')
        .select()
        .eq('user_id', usersId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => ErrorLogsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all error_logs associated with this users with pagination and sorting
  /// 
  /// This is an enhanced version of getErrorLogs that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findErrorLogs(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<ErrorLogsModel>> findErrorLogs(
    String usersId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('error_logs').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', usersId);
    
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
    return (response as List<dynamic>).map((json) => ErrorLogsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of error_logs associated with this users
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countErrorLogs(roomId);
  /// ```
  Future<int> countErrorLogs(String usersId) async {
    final result = await client
        .from('error_logs')
        .select()
        .eq('user_id', usersId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all payment_methods associated with this users
  /// 
  /// This is a one-to-many relationship where a users has many payment_methods.
  /// It will return all payment_methods linked to the given usersId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getPaymentMethods(roomId);
  /// ```
  Future<List<PaymentMethodsModel>> getPaymentMethods(String usersId) async {
    final result = await client
        .from('payment_methods')
        .select()
        .eq('user_id', usersId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => PaymentMethodsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all payment_methods associated with this users with pagination and sorting
  /// 
  /// This is an enhanced version of getPaymentMethods that supports
  /// pagination and sorting options.
  /// 
  /// Example:
  /// ```dart
  /// // Get the latest 10 messages in a chat room
  /// final messages = await chatRoomRepository.findPaymentMethods(
  ///   roomId,
  ///   limit: 10,
  ///   orderBy: 'created_at',
  ///   ascending: false,
  /// );
  /// ```
  Future<List<PaymentMethodsModel>> findPaymentMethods(
    String usersId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('payment_methods').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', usersId);
    
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
    return (response as List<dynamic>).map((json) => PaymentMethodsModel.fromJson(json as Map<String, dynamic>)).toList();
  }
  
  /// Count the number of payment_methods associated with this users
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countPaymentMethods(roomId);
  /// ```
  Future<int> countPaymentMethods(String usersId) async {
    final result = await client
        .from('payment_methods')
        .select()
        .eq('user_id', usersId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }

  /// Get all location_verifications associated with this users
  /// 
  /// This is a one-to-many relationship where a users has many location_verifications.
  /// It will return all location_verifications linked to the given usersId via
  /// the user_id foreign key.
  /// 
  /// Example:
  /// ```dart
  /// // Get all messages in a chat room
  /// final messages = await chatRoomRepository.getLocationVerifications(roomId);
  /// ```
  Future<List<LocationVerificationsModel>> getLocationVerifications(String usersId) async {
    final result = await client
        .from('location_verifications')
        .select()
        .eq('user_id', usersId);
    
    final data = result as List<dynamic>;
    
    return data
        .map((item) => LocationVerificationsModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
  
  /// Get all location_verifications associated with this users with pagination and sorting
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
    String usersId, {
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? additionalFilters,
  }) async {
    // Start with a select query
    dynamic queryBuilder = client.from('location_verifications').select();
    
    // Apply the main filter for this relationship
    queryBuilder = queryBuilder.eq('user_id', usersId);
    
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
  
  /// Count the number of location_verifications associated with this users
  /// 
  /// Example:
  /// ```dart
  /// // Count how many messages are in a chat room
  /// final messageCount = await chatRoomRepository.countLocationVerifications(roomId);
  /// ```
  Future<int> countLocationVerifications(String usersId) async {
    final result = await client
        .from('location_verifications')
        .select()
        .eq('user_id', usersId)
        .count();
    
    if (result.count != null) {
      return result.count;
    } else if (result.data is List) {
      return (result.data as List).length;
    }
    return 0;
  }
}
