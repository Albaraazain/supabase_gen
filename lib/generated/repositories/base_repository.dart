import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/app_logger.dart';
import './repository_logging.dart';

/// Base repository class that all generated repositories extend
abstract class BaseRepository<T> {
  final SupabaseClient client;
  final String tableName;

  const BaseRepository(this.client, this.tableName);

  /// Get the base query builder for this table
  SupabaseQueryBuilder get query => client.from(tableName);

  /// Convert a JSON map to a model instance
  T fromJson(Map<String, dynamic> json);

  /// Get all records from this table with pagination, sorting and filtering
  Future<List<T>> findAll({
    int? limit,
    int? offset,
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    List<String>? select, // Fields to select
  }) async {
    // Log the query details
    RepositoryLogging.logQuery(tableName, 'findAll', filters, limit: limit, offset: offset, orderBy: orderBy);
    
    return await RepositoryLogging.timeOperation(tableName, 'findAll', () async {
      try {
        // Start with a select query
        dynamic queryBuilder = select != null 
            ? query.select(select.join(','))
            : query.select();
        
        // Apply filters if provided
        if (filters != null) {
          // Apply each filter as an equality condition
          filters.forEach((key, value) {
            if (value != null) {
              // If value is a List, iterate through values with 'or' conditions
              if (value is List) {
                for (var item in value) {
                  queryBuilder = queryBuilder.eq(key, item);
                }
              } else {
                queryBuilder = queryBuilder.eq(key, value);
              }
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
        
        // Log success with count
        AppLogger.debug('[$tableName] findAll returned ${(response as List).length} records', loggerName: 'Repository');
        
        // Convert the response to model instances
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'findAll', 'Failed to fetch records', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }

  /// Find a single record by ID
  Future<T?> find(String id) async {
    return await RepositoryLogging.timeOperation(tableName, 'find', () async {
      try {
        AppLogger.debug('[$tableName] Finding record with ID: $id', loggerName: 'Repository');
        final response = await query.select().eq('id', id).maybeSingle();
        if (response == null) {
          AppLogger.debug('[$tableName] No record found with ID: $id', loggerName: 'Repository');
          return null;
        }
        return fromJson(response);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'find', 'Failed to find record with id=$id', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Find a single record by a specific field value
  Future<T?> findBy(String field, dynamic value) async {
    return await RepositoryLogging.timeOperation(tableName, 'findBy', () async {
      try {
        AppLogger.debug('[$tableName] Finding record where $field=$value', loggerName: 'Repository');
        final response = await query.select().eq(field, value).maybeSingle();
        if (response == null) {
          AppLogger.debug('[$tableName] No record found where $field=$value', loggerName: 'Repository');
          return null;
        }
        return fromJson(response);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'findBy', 'Failed to find record where $field=$value', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Find records matching multiple field values (AND condition)
  Future<List<T>> findWhere(Map<String, dynamic> conditions) async {
    RepositoryLogging.logQuery(tableName, 'findWhere', conditions);
    
    return await RepositoryLogging.timeOperation(tableName, 'findWhere', () async {
      try {
        dynamic queryBuilder = query.select();
        
        // Apply each condition as an equality filter
        conditions.forEach((key, value) {
          if (value != null) {
            // If value is a List, iterate through values with 'or' conditions
            if (value is List) {
              for (var item in value) {
                queryBuilder = queryBuilder.eq(key, item);
              }
            } else {
              queryBuilder = queryBuilder.eq(key, value);
            }
          }
        });
        
        final response = await queryBuilder;
        AppLogger.debug('[$tableName] findWhere returned ${(response as List).length} records', loggerName: 'Repository');
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'findWhere', 'Failed to find records with conditions', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Count records in this table, optionally filtered
  Future<int> count({Map<String, dynamic>? filters}) async {
    RepositoryLogging.logQuery(tableName, 'count', filters);
    
    return await RepositoryLogging.timeOperation(tableName, 'count', () async {
      try {
        // Start with a select query and use count method
        dynamic queryBuilder = query.select();
        
        // Apply filters if provided
        if (filters != null) {
          filters.forEach((key, value) {
            if (value != null) {
              // If value is a List, iterate through values with 'or' conditions
              if (value is List) {
                for (var item in value) {
                  queryBuilder = queryBuilder.eq(key, item);
                }
              } else {
                queryBuilder = queryBuilder.eq(key, value);
              }
            }
          });
        }
        
        // Apply count operation after filters
        queryBuilder = queryBuilder.count();
        
        final response = await queryBuilder;
        
        // Extract count from the response
        int count = 0;
        if (response.count != null) {
          count = response.count;
        } else if (response.data is List) {
          count = (response.data as List).length;
        }
        
        AppLogger.debug('[$tableName] count returned $count records', loggerName: 'Repository');
        return count;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'count', 'Failed to count records', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }

  /// Insert a new record
  Future<T> insert(T model) async {
    return await RepositoryLogging.timeOperation(tableName, 'insert', () async {
      try {
        final dynamic json = (model as dynamic).toJson();
        if (json is Map<String, dynamic> && json.containsKey('id') && json['id'] == null) {
          json.remove('id'); // Remove null ID for auto-generation
        }
        
        AppLogger.debug('[$tableName] Inserting new record', loggerName: 'Repository');
        final response = await query.insert(json).select();
        
        if ((response as List<dynamic>).isNotEmpty) {
          AppLogger.success('[$tableName] Successfully inserted record with ID: ${response.first['id']}', loggerName: 'Repository');
          return fromJson(response.first as Map<String, dynamic>);
        }
        
        throw Exception('Failed to insert record');
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'insert', 'Failed to insert record', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Insert multiple records in a single operation
  Future<List<T>> insertMany(List<T> models) async {
    return await RepositoryLogging.timeOperation(tableName, 'insertMany', () async {
      try {
        if (models.isEmpty) return [];
        
        final jsonList = models.map((model) {
          final dynamic json = (model as dynamic).toJson();
          if (json is Map<String, dynamic> && json.containsKey('id') && json['id'] == null) {
            json.remove('id'); // Remove null ID for auto-generation
          }
          return json;
        }).toList();
        
        AppLogger.debug('[$tableName] Batch inserting ${models.length} records', loggerName: 'Repository');
        final response = await query.insert(jsonList).select();
        AppLogger.success('[$tableName] Successfully inserted ${(response as List).length} records', loggerName: 'Repository');
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'insertMany', 'Failed to insert ${models.length} records', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }

  /// Update an existing record
  Future<T?> update(T model) async {
    return await RepositoryLogging.timeOperation(tableName, 'update', () async {
      try {
        final dynamic json = (model as dynamic).toJson();
        if (json is Map<String, dynamic> && (!json.containsKey('id') || json['id'] == null)) {
          throw Exception('Cannot update record without ID');
        }
        
        final id = json['id'];
        AppLogger.debug('[$tableName] Updating record with ID: $id', loggerName: 'Repository');
        
        final response = await query
            .update(json)
            .eq('id', id)
            .select();
        
        final results = response as List;
        if (results.isNotEmpty) {
          AppLogger.success('[$tableName] Successfully updated record with ID: $id', loggerName: 'Repository');
          return fromJson(results.first);
        }
        
        AppLogger.warning('[$tableName] No record found to update with ID: $id', loggerName: 'Repository');
        return null;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'update', 'Failed to update record', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Update specific fields on records matching a condition
  Future<List<T>> updateWhere(
    Map<String, dynamic> values, 
    Map<String, dynamic> conditions
  ) async {
    return await RepositoryLogging.timeOperation(tableName, 'updateWhere', () async {
      try {
        if (values.isEmpty || conditions.isEmpty) {
          throw Exception('Both values and conditions must be provided');
        }
        
        AppLogger.debug('[$tableName] Updating records with conditions: $conditions', loggerName: 'Repository');
        
        dynamic updateBuilder = query.update(values);
        
        // Apply conditions
        conditions.forEach((key, value) {
          if (value != null) {
            updateBuilder = updateBuilder.eq(key, value);
          }
        });
        
        final response = await updateBuilder.select();
        AppLogger.success('[$tableName] Successfully updated ${(response as List).length} records', loggerName: 'Repository');
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'updateWhere', 'Failed to update records with conditions', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }

  /// Upsert a record (insert or update)
  Future<T> upsert(T model) async {
    return await RepositoryLogging.timeOperation(tableName, 'upsert', () async {
      try {
        final dynamic json = (model as dynamic).toJson();
        AppLogger.debug('[$tableName] Upserting record', loggerName: 'Repository');
        
        final response = await query.upsert(json).select();
        
        final results = response as List;
        if (results.isNotEmpty) {
          AppLogger.success('[$tableName] Successfully upserted record with ID: ${results.first['id']}', loggerName: 'Repository');
          return fromJson(results.first);
        }
        
        throw Exception('Failed to upsert record');
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'upsert', 'Failed to upsert record', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Upsert multiple records in a single operation
  Future<List<T>> upsertMany(List<T> models) async {
    return await RepositoryLogging.timeOperation(tableName, 'upsertMany', () async {
      try {
        if (models.isEmpty) return [];
        
        final jsonList = models.map((model) => (model as dynamic).toJson()).toList();
        AppLogger.debug('[$tableName] Batch upserting ${models.length} records', loggerName: 'Repository');
        
        final response = await query.upsert(jsonList).select();
        AppLogger.success('[$tableName] Successfully upserted ${(response as List).length} records', loggerName: 'Repository');
        return (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'upsertMany', 'Failed to upsert ${models.length} records', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }

  /// Delete a record by ID
  Future<void> delete(String id) async {
    await RepositoryLogging.timeOperation(tableName, 'delete', () async {
      try {
        AppLogger.debug('[$tableName] Deleting record with ID: $id', loggerName: 'Repository');
        await query.delete().eq('id', id);
        AppLogger.success('[$tableName] Successfully deleted record with ID: $id', loggerName: 'Repository');
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'delete', 'Failed to delete record with id=$id', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Delete records matching a condition
  Future<void> deleteWhere(Map<String, dynamic> conditions) async {
    await RepositoryLogging.timeOperation(tableName, 'deleteWhere', () async {
      try {
        if (conditions.isEmpty) {
          throw Exception('Cannot delete with empty conditions - this would delete all records');
        }
        
        AppLogger.debug('[$tableName] Deleting records with conditions: $conditions', loggerName: 'Repository');
        
        dynamic deleteBuilder = query.delete();
        
        // Apply conditions
        conditions.forEach((key, value) {
          if (value != null) {
            deleteBuilder = deleteBuilder.eq(key, value);
          }
        });
        
        await deleteBuilder;
        AppLogger.success('[$tableName] Successfully deleted records matching conditions', loggerName: 'Repository');
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'deleteWhere', 'Failed to delete records with conditions', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Check if a record exists by ID
  Future<bool> exists(String id) async {
    return await RepositoryLogging.timeOperation(tableName, 'exists', () async {
      try {
        AppLogger.debug('[$tableName] Checking if record exists with ID: $id', loggerName: 'Repository');
        final response = await query
            .select('id')
            .eq('id', id)
            .maybeSingle();
        return response != null;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'exists', 'Failed to check if record exists with id=$id', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Check if any records exist matching conditions
  Future<bool> existsWhere(Map<String, dynamic> conditions) async {
    return await RepositoryLogging.timeOperation(tableName, 'existsWhere', () async {
      try {
        if (conditions.isEmpty) return false;
        
        AppLogger.debug('[$tableName] Checking if records exist with conditions: $conditions', loggerName: 'Repository');
        
        dynamic queryBuilder = query.select('id').limit(1);
        
        // Apply conditions
        conditions.forEach((key, value) {
          if (value != null) {
            // If value is a List, iterate through values with 'or' conditions
            if (value is List) {
              for (var item in value) {
                queryBuilder = queryBuilder.eq(key, item);
              }
            } else {
              queryBuilder = queryBuilder.eq(key, value);
            }
          }
        });
        
        final response = await queryBuilder;
        return (response as List).isNotEmpty;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'existsWhere', 'Failed to check if records exist with conditions', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Find records where a field matches any value in a list
  /// 
  /// This is a more explicit and efficient way to query for records where
  /// a field matches any of several values, compared to using multiple
  /// individual queries.
  /// 
  /// Example:
  /// ```dart
  /// // Get all users with specific IDs
  /// final users = await userRepository.whereIn('id', ['user1', 'user2', 'user3']);
  /// ```
  Future<List<T>> whereIn(String field, List<dynamic> values) async {
    RepositoryLogging.logQuery(tableName, 'whereIn', {field: values});
    
    return await RepositoryLogging.timeOperation(tableName, 'whereIn', () async {
      try {
        if (values.isEmpty) return [];
        
        AppLogger.debug('[$tableName] Finding records where $field in [${values.join(", ")}]', loggerName: 'Repository');
        
        dynamic queryBuilder = query.select();
        
        // Apply each value as an OR condition
        for (var value in values) {
          queryBuilder = queryBuilder.eq(field, value);
        }
        
        final response = await queryBuilder;
        
        AppLogger.debug('[$tableName] whereIn returned ${(response as List).length} records', loggerName: 'Repository');
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'whereIn', 'Failed to find records where $field in list', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
}
