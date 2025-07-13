import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import './repository_logging.dart';

/// Base repository class that all generated repositories extend
abstract class BaseRepository<T> {
  final SupabaseClient client;
  final String tableName;
  final String primaryKeyColumn;

  const BaseRepository(this.client, this.tableName, {this.primaryKeyColumn = 'id'});
  
  /// Get primary key value from a model
  String? getPrimaryKeyValue(T model);

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
              // If value is a List, use inFilter for proper SQL IN clause
              if (value is List) {
                queryBuilder = queryBuilder.inFilter(key, value);
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
        AppLogger.debug('[$tableName] Finding record with $primaryKeyColumn: $id', loggerName: 'Repository');
        final response = await query.select().eq(primaryKeyColumn, id).maybeSingle();
        if (response == null) {
          AppLogger.debug('[$tableName] No record found with $primaryKeyColumn: $id', loggerName: 'Repository');
          return null;
        }
        return fromJson(response);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'find', 'Failed to find record with $primaryKeyColumn=$id', error: e, stackTrace: stackTrace);
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
            // If value is a List, use inFilter for proper SQL IN clause
            if (value is List) {
              queryBuilder = queryBuilder.inFilter(key, value);
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
              // If value is a List, use inFilter for proper SQL IN clause
              if (value is List) {
                queryBuilder = queryBuilder.inFilter(key, value);
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
        final dynamic json = (model as dynamic).toJsonForInsert();
        
        AppLogger.debug('[$tableName] Inserting new record (excluded generated columns)', loggerName: 'Repository');
        final response = await query.insert(json).select();
        
        if ((response as List<dynamic>).isNotEmpty) {
          final result = fromJson(response.first as Map<String, dynamic>);
          final insertedId = getPrimaryKeyValue(result);
          
          AppLogger.success('[$tableName] Successfully inserted record with $primaryKeyColumn: ${response.first[primaryKeyColumn]}', loggerName: 'Repository');
          
          // Invalidate cache after successful insert
          _invalidateTableCache();
          
          return result;
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
          return (model as dynamic).toJsonForInsert();
        }).toList();
        
        AppLogger.debug('[$tableName] Batch inserting ${models.length} records', loggerName: 'Repository');
        final response = await query.insert(jsonList).select();
        final results = (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
        
        AppLogger.success('[$tableName] Successfully inserted ${results.length} records', loggerName: 'Repository');
        
        // Invalidate cache after successful batch insert
        _invalidateTableCache();
        
        return results;
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
        final String? id = getPrimaryKeyValue(model);
        if (id == null) {
          throw Exception('Cannot update record without primary key value');
        }
        
        final dynamic json = (model as dynamic).toJsonForUpdate();
        AppLogger.debug('[$tableName] Updating record with $primaryKeyColumn: $id (excluded generated columns)', loggerName: 'Repository');
        
        final response = await query
            .update(json)
            .eq(primaryKeyColumn, id)
            .select();
        
        final results = response as List;
        if (results.isNotEmpty) {
          final result = fromJson(results.first);
          
          AppLogger.success('[$tableName] Successfully updated record with $primaryKeyColumn: $id', loggerName: 'Repository');
          
          // Invalidate cache after successful update
          _invalidateTableCache(specificId: id);
          
          return result;
        }
        
        AppLogger.warning('[$tableName] No record found to update with $primaryKeyColumn: $id', loggerName: 'Repository');
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
        final results = (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
        
        AppLogger.success('[$tableName] Successfully updated ${results.length} records', loggerName: 'Repository');
        
        // Invalidate cache after successful batch update
        _invalidateTableCache();
        
        return results;
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
        final dynamic json = (model as dynamic).toJsonForUpdate();
        AppLogger.debug('[$tableName] Upserting record (excluded generated columns)', loggerName: 'Repository');
        
        final response = await query.upsert(json).select();
        
        final results = response as List;
        if (results.isNotEmpty) {
          final result = fromJson(results.first);
          final upsertedId = getPrimaryKeyValue(result);
          
          AppLogger.success('[$tableName] Successfully upserted record with $primaryKeyColumn: ${results.first[primaryKeyColumn]}', loggerName: 'Repository');
          
          // Invalidate cache after successful upsert
          _invalidateTableCache(specificId: upsertedId);
          
          return result;
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
        
        final jsonList = models.map((model) => (model as dynamic).toJsonForUpdate()).toList();
        AppLogger.debug('[$tableName] Batch upserting ${models.length} records (excluded generated columns)', loggerName: 'Repository');
        
        final response = await query.upsert(jsonList).select();
        final results = (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
        
        AppLogger.success('[$tableName] Successfully upserted ${results.length} records', loggerName: 'Repository');
        
        // Invalidate cache after successful batch upsert
        _invalidateTableCache();
        
        return results;
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
        AppLogger.debug('[$tableName] Deleting record with $primaryKeyColumn: $id', loggerName: 'Repository');
        await query.delete().eq(primaryKeyColumn, id);
        
        AppLogger.success('[$tableName] Successfully deleted record with $primaryKeyColumn: $id', loggerName: 'Repository');
        
        // Invalidate cache after successful delete
        _invalidateTableCache(specificId: id);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'delete', 'Failed to delete record with $primaryKeyColumn=$id', error: e, stackTrace: stackTrace);
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
        
        // Invalidate cache after successful batch delete
        _invalidateTableCache();
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
        AppLogger.debug('[$tableName] Checking if record exists with $primaryKeyColumn: $id', loggerName: 'Repository');
        final response = await query
            .select(primaryKeyColumn)
            .eq(primaryKeyColumn, id)
            .maybeSingle();
        return response != null;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'exists', 'Failed to check if record exists with $primaryKeyColumn=$id', error: e, stackTrace: stackTrace);
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
        
        dynamic queryBuilder = query.select(primaryKeyColumn).limit(1);
        
        // Apply conditions
        conditions.forEach((key, value) {
          if (value != null) {
            // If value is a List, use inFilter for proper SQL IN clause
            if (value is List) {
              queryBuilder = queryBuilder.inFilter(key, value);
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
        
        // Use inFilter instead of multiple eq calls - it creates a proper SQL IN clause
        final response = await query.select().inFilter(field, values);
        
        AppLogger.debug('[$tableName] whereIn returned ${(response as List).length} records', loggerName: 'Repository');
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'whereIn', 'Failed to find records where $field in list', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  // ===== REALTIME STREAMING METHODS =====
  // These methods provide realtime data streams from Supabase
  // Note: Realtime must be enabled for your table in Supabase dashboard
  
  /// Stream all records from this table with realtime updates
  /// 
  /// This provides a realtime stream of all records in the table.
  /// The stream will emit initial data and then updates when records change.
  /// 
  /// Note: This method does not apply filters for maximum reliability.
  /// Use streamWhere() if you need filtering with client-side processing.
  /// 
  /// Example:
  /// ```dart
  /// userRepository.streamAll().listen((users) {
  ///   print('Current users: ${users.length}');
  /// });
  /// ```
  Stream<List<T>> streamAll() {
    try {
      AppLogger.debug('[$tableName] Starting realtime stream for all records', loggerName: 'Repository');
      
      return query
          .stream(primaryKey: [primaryKeyColumn])
          .map((data) {
            AppLogger.debug('[$tableName] Realtime stream update: ${data.length} records', loggerName: 'Repository');
            return data.map((json) => fromJson(json as Map<String, dynamic>)).toList();
          })
          .handleError((error, stackTrace) {
            RepositoryLogging.logOperation(tableName, 'streamAll', 'Realtime stream error', error: error, stackTrace: stackTrace);
          });
    } catch (e, stackTrace) {
      RepositoryLogging.logOperation(tableName, 'streamAll', 'Failed to create realtime stream', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
  
  /// Stream a single record by ID with realtime updates
  /// 
  /// This provides a realtime stream for a specific record.
  /// The stream will emit the current record and updates when it changes.
  /// 
  /// Example:
  /// ```dart
  /// userRepository.streamById('user-123').listen((user) {
  ///   if (user != null) {
  ///     print('User updated: ${user.name}');
  ///   }
  /// });
  /// ```
  Stream<T?> streamById(String id) {
    try {
      AppLogger.debug('[$tableName] Starting realtime stream for record with $primaryKeyColumn: $id', loggerName: 'Repository');
      
      return query
          .stream(primaryKey: [primaryKeyColumn])
          .eq(primaryKeyColumn, id)
          .map((data) {
            AppLogger.debug('[$tableName] Realtime stream update for $primaryKeyColumn: $id', loggerName: 'Repository');
            return data.isNotEmpty ? fromJson(data.first as Map<String, dynamic>) : null;
          })
          .handleError((error, stackTrace) {
            RepositoryLogging.logOperation(tableName, 'streamById', 'Realtime stream error for $primaryKeyColumn=$id', error: error, stackTrace: stackTrace);
          });
    } catch (e, stackTrace) {
      RepositoryLogging.logOperation(tableName, 'streamById', 'Failed to create realtime stream for $primaryKeyColumn=$id', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
  
  /// Stream records with client-side filtering
  /// 
  /// This method uses a hybrid approach: streams all records from the table
  /// and applies filters on the client side. This is more reliable than
  /// server-side filters which have known limitations in Supabase realtime.
  /// 
  /// Note: For large tables, consider using streamAll() and filtering manually
  /// in your widget to avoid processing overhead on every update.
  /// 
  /// Example:
  /// ```dart
  /// userRepository.streamWhere({'status': 'active'}).listen((activeUsers) {
  ///   print('Active users: ${activeUsers.length}');
  /// });
  /// ```
  Stream<List<T>> streamWhere(Map<String, dynamic> filters) {
    try {
      AppLogger.debug('[$tableName] Starting realtime stream with client-side filters: $filters', loggerName: 'Repository');
      
      // Create direct stream instead of calling streamAll() to avoid infinite loops
      return query
          .stream(primaryKey: [primaryKeyColumn])
          .map((data) {
            final allRecords = data.map((json) => fromJson(json as Map<String, dynamic>)).toList();
            final filteredRecords = allRecords.where((record) {
              return _matchesFilters(record, filters);
            }).toList();
            
            AppLogger.debug('[$tableName] Client-side filtered ${allRecords.length} records to ${filteredRecords.length}', loggerName: 'Repository');
            return filteredRecords;
          })
          .handleError((error, stackTrace) {
            RepositoryLogging.logOperation(tableName, 'streamWhere', 'Realtime stream error', error: error, stackTrace: stackTrace);
          });
    } catch (e, stackTrace) {
      RepositoryLogging.logOperation(tableName, 'streamWhere', 'Failed to create filtered realtime stream', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }
  
  /// Helper method to check if a record matches the given filters
  /// 
  /// This performs client-side filtering by converting the model to JSON
  /// and checking each filter condition.
  bool _matchesFilters(T record, Map<String, dynamic> filters) {
    try {
      final json = (record as dynamic).toJson() as Map<String, dynamic>;
      
      for (final entry in filters.entries) {
        final key = entry.key;
        final expectedValue = entry.value;
        final actualValue = json[key];
        
        // Handle different comparison types
        if (expectedValue is List) {
          // For list values, check if actual value is in the list
          if (!expectedValue.contains(actualValue)) {
            return false;
          }
        } else {
          // For single values, check equality
          if (actualValue != expectedValue) {
            return false;
          }
        }
      }
      
      return true;
    } catch (e, stackTrace) {
      AppLogger.warning('[$tableName] Error matching filters for record: $e', loggerName: 'Repository');
      return false; // If we can't check, exclude the record for safety
    }
  }
  
  // ===== CACHE INVALIDATION METHODS =====
  // These methods prevent cache stalling by invalidating relevant cache entries
  // when data is modified through this repository
  
  /// Invalidate all cache entries related to this table
  /// 
  /// This is called automatically after mutations (insert, update, delete)
  /// to prevent stale data in the cache.
  void _invalidateTableCache({String? specificId}) {
    try {
      final prefix = '$tableName:';
      final allExpirations = AppCache().expirations;
      final keysToRemove = <String>[];
      
      for (final key in allExpirations.keys) {
        if (key.startsWith(prefix)) {
          // If we have a specific ID, be more selective
          if (specificId != null) {
            // Always remove list caches (they contain the modified record)
            // Only remove specific ID cache if it matches
            if (!key.contains(':id:') || key.contains(':id:$specificId')) {
              keysToRemove.add(key);
            }
          } else {
            // Remove all caches for this table
            keysToRemove.add(key);
          }
        }
      }
      
      for (final key in keysToRemove) {
        AppCache().remove(key);
      }
      
      if (keysToRemove.isNotEmpty) {
        AppLogger.debug(
          '[$tableName] Invalidated ${keysToRemove.length} cache entries${specificId != null ? ' for ID: $specificId' : ''}', 
          loggerName: 'Repository'
        );
      }
    } catch (e, stackTrace) {
      // Don't let cache invalidation errors break the mutation
      AppLogger.warning(
        '[$tableName] Failed to invalidate cache: $e', 
        loggerName: 'Repository',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
