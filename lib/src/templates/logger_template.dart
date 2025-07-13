// Templates for generating logger utilities

/// Templates for generating logger utilities for Supabase Gen
class LoggerTemplate {
  /// Helper method to get singular form of a word
  static String _singularize(String word) {
    if (word.endsWith('ies')) {
      return word.substring(0, word.length - 3) + 'y';
    } else if (word.endsWith('es')) {
      return word.substring(0, word.length - 2);
    } else if (word.endsWith('s') && !word.endsWith('ss')) {
      return word.substring(0, word.length - 1);
    }
    return word;
  }

  /// Generate a centralized logger utility class
  static String loggerUtility() {
    return '''import 'package:logger/logger.dart';

/// Centralized logging utility for app-wide logging
class AppLogger {
  static final Map<String, String> _loggerNames = {};
  static bool _initialized = false;
  
  // Single logger instance with custom output
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );
  
  /// Initialize the logging system with custom settings
  static void initialize({
    Level? level,
    bool includeCallerInfo = true,
    bool colorize = true,
  }) {
    if (_initialized) return;
    
    // Logger is automatically initialized with appropriate defaults
    // No additional setup required
    
    _initialized = true;
  }
  
  /// Get logger name for context
  static String _getLoggerContext(String? loggerName) {
    return loggerName ?? 'App';
  }
  
  /// Log an info message
  static void info(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.i('[\$context] \$message', error: error, stackTrace: stackTrace);
    } else {
      _logger.i('[\$context] \$message');
    }
  }
  
  /// Log a debug message
  static void debug(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.d('[\$context] \$message', error: error, stackTrace: stackTrace);
    } else {
      _logger.d('[\$context] \$message');
    }
  }
  
  /// Log a warning message
  static void warning(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.w('[\$context] \$message', error: error, stackTrace: stackTrace);
    } else {
      _logger.w('[\$context] \$message');
    }
  }
  
  /// Log an error message
  static void error(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.e('[\$context] \$message', error: error, stackTrace: stackTrace);
    } else {
      _logger.e('[\$context] \$message');
    }
  }
  
  /// Log a success message (INFO level with checkmark prefix)
  static void success(String message, {String? loggerName}) {
    final context = _getLoggerContext(loggerName);
    _logger.i('[\$context] ✓ \$message');
  }
  
  /// Log a verbose message (for detailed tracing)
  static void verbose(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.v('[\$context] \$message', error: error, stackTrace: stackTrace);
    } else {
      _logger.v('[\$context] \$message');
    }
  }
  
  /// Log a wtf message (what a terrible failure)
  static void wtf(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.wtf('[\$context] \$message', error: error, stackTrace: stackTrace);
    } else {
      _logger.wtf('[\$context] \$message');
    }
  }
}
''';
  }

  /// Generate repository extension with logging
  static String repositoryLoggingExtension() {
    return '''import '../utils/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Extension to add logging capabilities to all repositories
extension RepositoryLogging on Object {
  /// Log repository operations with consistent formatting
  static void logOperation(String repository, String operation, String details, {Object? error, StackTrace? stackTrace}) {
    if (error != null) {
      AppLogger.error('[\$repository] \$operation failed: \$details', loggerName: 'Repository', error: error, stackTrace: stackTrace);
    } else {
      AppLogger.info('[\$repository] \$operation: \$details', loggerName: 'Repository');
    }
  }
  
  /// Log query details for debugging
  static void logQuery(String repository, String method, Map<String, dynamic>? filters, {int? limit, int? offset, String? orderBy}) {
    final filterInfo = filters?.entries.map((e) => '\${e.key}=\${e.value}').join(', ') ?? 'none';
    final paginationInfo = offset != null ? 'offset=\$offset, limit=\$limit' : (limit != null ? 'limit=\$limit' : 'no pagination');
    final sortingInfo = orderBy != null ? 'orderBy=\$orderBy' : 'default sorting';
    
    AppLogger.debug(
      '[\$repository] \$method: filters=[\$filterInfo], \$paginationInfo, \$sortingInfo',
      loggerName: 'Repository'
    );
  }
  
  /// Log performance metrics for repository operations
  static Future<T> timeOperation<T>(String repository, String operation, Future<T> Function() callback) async {
    final stopwatch = Stopwatch()..start();
    try {
      final result = await callback();
      stopwatch.stop();
      AppLogger.debug('[\$repository] \$operation completed in \${stopwatch.elapsedMilliseconds}ms', loggerName: 'Performance');
      return result;
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.error(
        '[\$repository] \$operation failed after \${stopwatch.elapsedMilliseconds}ms', 
        loggerName: 'Performance',
        error: e,
        stackTrace: stackTrace
      );
      rethrow;
    }
  }
}
''';
  }

  /// Generate provider logging utility
  static String providerLoggingExtension() {
    return '''import 'app_logger.dart';

/// Extension to add logging capabilities to providers
extension ProviderLogging on Object {
  /// Log provider state changes
  static void logStateChange(String provider, String action, {String? details, Object? error, StackTrace? stackTrace}) {
    final logMessage = details != null ? '\$action: \$details' : action;
    
    if (error != null) {
      AppLogger.error('[\$provider] \$logMessage', loggerName: 'Provider', error: error, stackTrace: stackTrace);
    } else {
      AppLogger.info('[\$provider] \$logMessage', loggerName: 'Provider');
    }
  }
  
  /// Log provider initialization
  static void logInitialization(String provider, {bool success = true, Object? error, StackTrace? stackTrace}) {
    if (success) {
      AppLogger.info('[\$provider] Initialized', loggerName: 'Provider');
    } else {
      AppLogger.error('[\$provider] Initialization failed', loggerName: 'Provider', error: error, stackTrace: stackTrace);
    }
  }
}
''';
  }

  /// Generate a centralized exception handler that uses the logger
  static String exceptionHandler() {
    return '''import 'dart:async';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../../utils/app_logger.dart';

/// Centralized exception handler with logging capabilities
class AppExceptionHandler {
  // Map common errors to user-friendly messages
  static final Map<Type, String> _errorMessages = {
    PostgrestException: 'Database operation failed',
    SocketException: 'Network connection error',
    TimeoutException: 'Operation timed out',
    AuthException: 'Authentication error',
    FormatException: 'Invalid data format',
  };
  
  /// Handle exception with appropriate logging and return user-friendly message
  static String handleException(Object error, StackTrace stackTrace, {String? context}) {
    final prefix = context != null ? '[\$context] ' : '';
    final errorType = error.runtimeType.toString();
    
    // Log the error with full details
    AppLogger.error(
      '\${prefix}Error: \$errorType', 
      error: error,
      stackTrace: stackTrace,
      loggerName: 'ErrorHandler'
    );
    
    // Return a user-friendly message based on error type
    for (final entry in _errorMessages.entries) {
      if (error.runtimeType == entry.key) {
        return entry.value;
      }
    }
    
    // If we have a specific message in the error, use it
    if (error is PostgrestException) {
      return error.message ?? 'Database operation failed';
    } else if (error is AuthException) {
      return error.message;
    }
    
    // Default generic message
    return 'An unexpected error occurred';
  }
  
  /// Run a function with exception handling and logging
  static Future<T?> runWithCatch<T>(
    Future<T> Function() operation,
    {
      String? context,
      T? defaultValue,
      bool shouldRethrow = false,
      Function(String errorMessage)? onError,
    }
  ) async {
    try {
      return await operation();
    } catch (e, stackTrace) {
      final message = handleException(e, stackTrace, context: context);
      if (onError != null) {
        onError(message);
      }
      if (shouldRethrow) {
        throw e;
      }
      return defaultValue;
    }
  }
}
''';
  }

  /// Update the base repository template with logging
  static String modifyBaseRepository() {
    return '''import 'package:supabase_flutter/supabase_flutter.dart';
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
        AppLogger.debug('[\$tableName] findAll returned \${(response as List).length} records', loggerName: 'Repository');
        
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
        AppLogger.debug('[\$tableName] Finding record with \$primaryKeyColumn: \$id', loggerName: 'Repository');
        final response = await query.select().eq(primaryKeyColumn, id).maybeSingle();
        if (response == null) {
          AppLogger.debug('[\$tableName] No record found with \$primaryKeyColumn: \$id', loggerName: 'Repository');
          return null;
        }
        return fromJson(response);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'find', 'Failed to find record with \$primaryKeyColumn=\$id', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Find a single record by a specific field value
  Future<T?> findBy(String field, dynamic value) async {
    return await RepositoryLogging.timeOperation(tableName, 'findBy', () async {
      try {
        AppLogger.debug('[\$tableName] Finding record where \$field=\$value', loggerName: 'Repository');
        final response = await query.select().eq(field, value).maybeSingle();
        if (response == null) {
          AppLogger.debug('[\$tableName] No record found where \$field=\$value', loggerName: 'Repository');
          return null;
        }
        return fromJson(response);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'findBy', 'Failed to find record where \$field=\$value', error: e, stackTrace: stackTrace);
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
        AppLogger.debug('[\$tableName] findWhere returned \${(response as List).length} records', loggerName: 'Repository');
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
        
        AppLogger.debug('[\$tableName] count returned \$count records', loggerName: 'Repository');
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
        
        AppLogger.debug('[\$tableName] Inserting new record (excluded generated columns)', loggerName: 'Repository');
        final response = await query.insert(json).select();
        
        if ((response as List<dynamic>).isNotEmpty) {
          final result = fromJson(response.first as Map<String, dynamic>);
          final insertedId = getPrimaryKeyValue(result);
          
          AppLogger.success('[\$tableName] Successfully inserted record with \$primaryKeyColumn: \${response.first[primaryKeyColumn]}', loggerName: 'Repository');
          
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
        
        AppLogger.debug('[\$tableName] Batch inserting \${models.length} records', loggerName: 'Repository');
        final response = await query.insert(jsonList).select();
        final results = (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
        
        AppLogger.success('[\$tableName] Successfully inserted \${results.length} records', loggerName: 'Repository');
        
        // Invalidate cache after successful batch insert
        _invalidateTableCache();
        
        return results;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'insertMany', 'Failed to insert \${models.length} records', error: e, stackTrace: stackTrace);
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
        AppLogger.debug('[\$tableName] Updating record with \$primaryKeyColumn: \$id (excluded generated columns)', loggerName: 'Repository');
        
        final response = await query
            .update(json)
            .eq(primaryKeyColumn, id)
            .select();
        
        final results = response as List;
        if (results.isNotEmpty) {
          final result = fromJson(results.first);
          
          AppLogger.success('[\$tableName] Successfully updated record with \$primaryKeyColumn: \$id', loggerName: 'Repository');
          
          // Invalidate cache after successful update
          _invalidateTableCache(specificId: id);
          
          return result;
        }
        
        AppLogger.warning('[\$tableName] No record found to update with \$primaryKeyColumn: \$id', loggerName: 'Repository');
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
        
        AppLogger.debug('[\$tableName] Updating records with conditions: \$conditions', loggerName: 'Repository');
        
        dynamic updateBuilder = query.update(values);
        
        // Apply conditions
        conditions.forEach((key, value) {
          if (value != null) {
            updateBuilder = updateBuilder.eq(key, value);
          }
        });
        
        final response = await updateBuilder.select();
        final results = (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
        
        AppLogger.success('[\$tableName] Successfully updated \${results.length} records', loggerName: 'Repository');
        
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
        AppLogger.debug('[\$tableName] Upserting record (excluded generated columns)', loggerName: 'Repository');
        
        final response = await query.upsert(json).select();
        
        final results = response as List;
        if (results.isNotEmpty) {
          final result = fromJson(results.first);
          final upsertedId = getPrimaryKeyValue(result);
          
          AppLogger.success('[\$tableName] Successfully upserted record with \$primaryKeyColumn: \${results.first[primaryKeyColumn]}', loggerName: 'Repository');
          
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
        AppLogger.debug('[\$tableName] Batch upserting \${models.length} records (excluded generated columns)', loggerName: 'Repository');
        
        final response = await query.upsert(jsonList).select();
        final results = (response as List).map((json) => fromJson(json as Map<String, dynamic>)).toList();
        
        AppLogger.success('[\$tableName] Successfully upserted \${results.length} records', loggerName: 'Repository');
        
        // Invalidate cache after successful batch upsert
        _invalidateTableCache();
        
        return results;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'upsertMany', 'Failed to upsert \${models.length} records', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }

  /// Delete a record by ID
  Future<void> delete(String id) async {
    await RepositoryLogging.timeOperation(tableName, 'delete', () async {
      try {
        AppLogger.debug('[\$tableName] Deleting record with \$primaryKeyColumn: \$id', loggerName: 'Repository');
        await query.delete().eq(primaryKeyColumn, id);
        
        AppLogger.success('[\$tableName] Successfully deleted record with \$primaryKeyColumn: \$id', loggerName: 'Repository');
        
        // Invalidate cache after successful delete
        _invalidateTableCache(specificId: id);
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'delete', 'Failed to delete record with \$primaryKeyColumn=\$id', error: e, stackTrace: stackTrace);
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
        
        AppLogger.debug('[\$tableName] Deleting records with conditions: \$conditions', loggerName: 'Repository');
        
        dynamic deleteBuilder = query.delete();
        
        // Apply conditions
        conditions.forEach((key, value) {
          if (value != null) {
            deleteBuilder = deleteBuilder.eq(key, value);
          }
        });
        
        await deleteBuilder;
        
        AppLogger.success('[\$tableName] Successfully deleted records matching conditions', loggerName: 'Repository');
        
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
        AppLogger.debug('[\$tableName] Checking if record exists with \$primaryKeyColumn: \$id', loggerName: 'Repository');
        final response = await query
            .select(primaryKeyColumn)
            .eq(primaryKeyColumn, id)
            .maybeSingle();
        return response != null;
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'exists', 'Failed to check if record exists with \$primaryKeyColumn=\$id', error: e, stackTrace: stackTrace);
        rethrow;
      }
    });
  }
  
  /// Check if any records exist matching conditions
  Future<bool> existsWhere(Map<String, dynamic> conditions) async {
    return await RepositoryLogging.timeOperation(tableName, 'existsWhere', () async {
      try {
        if (conditions.isEmpty) return false;
        
        AppLogger.debug('[\$tableName] Checking if records exist with conditions: \$conditions', loggerName: 'Repository');
        
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
        
        AppLogger.debug('[\$tableName] Finding records where \$field in [\${values.join(", ")}]', loggerName: 'Repository');
        
        // Use inFilter instead of multiple eq calls - it creates a proper SQL IN clause
        final response = await query.select().inFilter(field, values);
        
        AppLogger.debug('[\$tableName] whereIn returned \${(response as List).length} records', loggerName: 'Repository');
        return (response).map((json) => fromJson(json as Map<String, dynamic>)).toList();
      } catch (e, stackTrace) {
        RepositoryLogging.logOperation(tableName, 'whereIn', 'Failed to find records where \$field in list', error: e, stackTrace: stackTrace);
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
  ///   print('Current users: \${users.length}');
  /// });
  /// ```
  Stream<List<T>> streamAll() {
    try {
      AppLogger.debug('[\$tableName] Starting realtime stream for all records', loggerName: 'Repository');
      
      return query
          .stream(primaryKey: [primaryKeyColumn])
          .map((data) {
            AppLogger.debug('[\$tableName] Realtime stream update: \${data.length} records', loggerName: 'Repository');
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
  ///     print('User updated: \${user.name}');
  ///   }
  /// });
  /// ```
  Stream<T?> streamById(String id) {
    try {
      AppLogger.debug('[\$tableName] Starting realtime stream for record with \$primaryKeyColumn: \$id', loggerName: 'Repository');
      
      return query
          .stream(primaryKey: [primaryKeyColumn])
          .eq(primaryKeyColumn, id)
          .map((data) {
            AppLogger.debug('[\$tableName] Realtime stream update for \$primaryKeyColumn: \$id', loggerName: 'Repository');
            return data.isNotEmpty ? fromJson(data.first as Map<String, dynamic>) : null;
          })
          .handleError((error, stackTrace) {
            RepositoryLogging.logOperation(tableName, 'streamById', 'Realtime stream error for \$primaryKeyColumn=\$id', error: error, stackTrace: stackTrace);
          });
    } catch (e, stackTrace) {
      RepositoryLogging.logOperation(tableName, 'streamById', 'Failed to create realtime stream for \$primaryKeyColumn=\$id', error: e, stackTrace: stackTrace);
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
  ///   print('Active users: \${activeUsers.length}');
  /// });
  /// ```
  Stream<List<T>> streamWhere(Map<String, dynamic> filters) {
    try {
      AppLogger.debug('[\$tableName] Starting realtime stream with client-side filters: \$filters', loggerName: 'Repository');
      
      // Create direct stream instead of calling streamAll() to avoid infinite loops
      return query
          .stream(primaryKey: [primaryKeyColumn])
          .map((data) {
            final allRecords = data.map((json) => fromJson(json as Map<String, dynamic>)).toList();
            final filteredRecords = allRecords.where((record) {
              return _matchesFilters(record, filters);
            }).toList();
            
            AppLogger.debug('[\$tableName] Client-side filtered \${allRecords.length} records to \${filteredRecords.length}', loggerName: 'Repository');
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
      AppLogger.warning('[\$tableName] Error matching filters for record: \$e', loggerName: 'Repository');
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
      final prefix = '\$tableName:';
      final allExpirations = AppCache().expirations;
      final keysToRemove = <String>[];
      
      for (final key in allExpirations.keys) {
        if (key.startsWith(prefix)) {
          // If we have a specific ID, be more selective
          if (specificId != null) {
            // Always remove list caches (they contain the modified record)
            // Only remove specific ID cache if it matches
            if (!key.contains(':id:') || key.contains(':id:\$specificId')) {
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
          '[\$tableName] Invalidated \${keysToRemove.length} cache entries\${specificId != null ? ' for ID: \$specificId' : ''}', 
          loggerName: 'Repository'
        );
      }
    } catch (e, stackTrace) {
      // Don't let cache invalidation errors break the mutation
      AppLogger.warning(
        '[\$tableName] Failed to invalidate cache: \$e', 
        loggerName: 'Repository',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
''';
  }

  /// Update provider template with logging and caching
  static String modifyProviderTemplate(
    String tableName,
    String pascalCaseTableName,
    String modelName,
    String repositoryName,
    String camelCaseTableName,
  ) {
    return '''import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

import '../models/${tableName}_model.dart';
import '../repositories/${tableName}_repository.dart';
import '../shared/errors/app_exception.dart';
import '../utils/app_logger.dart';
import '../utils/app_cache.dart';
import '../utils/provider_logging.dart';
import '../shared/errors/app_exception_handler.dart';

// Repository provider
final ${camelCaseTableName}RepositoryProvider = Provider<$repositoryName>((ref) {
  AppLogger.debug('Creating $repositoryName instance', loggerName: 'Provider');
  return $repositoryName(Supabase.instance.client);
});

// Main provider for managing ${tableName} data
final ${camelCaseTableName}Provider = StateNotifierProvider<${pascalCaseTableName}Notifier, AsyncValue<List<$modelName>>>((ref) {
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  AppLogger.debug('Creating ${pascalCaseTableName}Notifier', loggerName: 'Provider');
  return ${pascalCaseTableName}Notifier(repository);
});

// Helper to create a stable cache key from filters
String _createCacheKey(Map<String, dynamic> filters) {
  // Sort the keys to ensure consistent ordering
  final sortedKeys = filters.keys.toList()..sort();
  final parts = <String>[];
  
  for (final key in sortedKeys) {
    final value = filters[key];
    parts.add('\$key=\${value?.toString() ?? 'null'}');
  }
  
  return '${tableName}:\${parts.join(',')}';
}

// Provider to get a single ${tableName} by ID with caching
final ${camelCaseTableName}ByIdProvider = FutureProvider.family<$modelName?, String>((ref, id) async {
  // Create a stable cache key for this ID lookup
  final cacheKey = '${tableName}:id:\$id';
  
  AppLogger.debug('${camelCaseTableName}ByIdProvider called with id: \$id', loggerName: 'Provider');
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  try {
    // Use the app cache to prevent redundant database calls
    final result = await AppCache().getOrFetch<$modelName?>(
      cacheKey,
      () => repository.find(id),
      duration: const Duration(minutes: 2), // Cache items briefly
    );
    
    if (result == null) {
      AppLogger.warning('No ${_singularize(tableName)} found with ID: \$id', loggerName: 'Provider');
    } else {
      AppLogger.debug('Found ${_singularize(tableName)} with ID: \$id', loggerName: 'Provider');
    }
    
    return result;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}ById');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Provider to get filtered ${tableName} with proper caching
final filtered${pascalCaseTableName}Provider = FutureProvider.family<List<$modelName>, Map<String, dynamic>>((ref, filters) async {
  // Create a stable cache key from the filters
  final cacheKey = _createCacheKey(filters);
  
  AppLogger.debug('filtered${pascalCaseTableName}Provider called with key: \$cacheKey', loggerName: 'Provider');
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  try {
    // Check if any filter contains a list of values
    bool hasListValues = false;
    String? listField;
    List<dynamic>? listValues;
    
    // Identify if there's a list filter that we should handle with whereIn
    filters.forEach((key, value) {
      if (value is List && value.isNotEmpty) {
        hasListValues = true;
        listField = key;
        listValues = value;
      }
    });
    
    final results = await AppCache().getOrFetch<List<$modelName>>(
      cacheKey,
      () async {
        // If we have a field with a list of values, use whereIn for better performance
        if (hasListValues && listField != null && listValues != null) {
          // Create a copy of filters without the list field
          final otherFilters = Map<String, dynamic>.from(filters);
          otherFilters.remove(listField);
          
          // First use whereIn for the list values
          final listResults = await repository.whereIn(listField!, listValues!);
          
          // Then filter for any other conditions
          if (otherFilters.isEmpty) {
            return listResults;
          } else {
            // Apply remaining filters manually
            return listResults.where((item) {
              return otherFilters.entries.every((entry) {
                final fieldValue = _getFieldValue(item, entry.key);
                return fieldValue == entry.value;
              });
            }).toList();
          }
        } else {
          // Standard filtering if no lists are present
          return repository.findAll(filters: filters);
        }
      },
      duration: const Duration(seconds: 30), // Short cache time to stay fresh
    );
    
    AppLogger.debug('filtered${pascalCaseTableName}Provider returned \${results.length} items for key: \$cacheKey', loggerName: 'Provider');
    return results;
  } catch (e, stackTrace) {
    final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: 'Filtered${pascalCaseTableName}');
    throw AppException(message: errorMsg, originalError: e);
  }
});

// Helper to get a field value from a model without using reflection
dynamic _getFieldValue(dynamic model, String fieldName) {
  try {
    // Try to access as a Map or dynamic accessor
    return (model as dynamic)[fieldName];
  } catch (e) {
    // Try to convert the model to a map if it has a toJson method
    try {
      final instance = model as dynamic;
      if (instance != null && instance.toJson != null) {
        final Map<String, dynamic> json = instance.toJson();
        return json[fieldName];
      }
    } catch (_) {
      // Ignore errors from toJson attempt
    }
    
    // If all else fails, try to access via a getter method
    try {
      final instance = model as dynamic;
      switch (fieldName) {
        case 'id': return instance.id;
        case 'created_at': return instance.createdAt;
        case 'updated_at': return instance.updatedAt;
        default: return null;
      }
    } catch (_) {
      return null;
    }
  }
}

// ===== REALTIME PROVIDERS =====
// These providers offer automatic realtime updates with proper error handling
// and fallback mechanisms to work around Supabase realtime limitations

/// Realtime provider for all ${tableName} records
/// 
/// This provider streams all records in real-time and automatically handles:
/// - Stream disconnections and reconnections
/// - Error recovery with exponential backoff  
/// - Graceful fallback to cached data when realtime fails
/// 
/// Example usage:
/// ```dart
/// class ${pascalCaseTableName}ListView extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     final ${camelCaseTableName}Stream = ref.watch(realtime${pascalCaseTableName}Provider);
///     
///     return ${camelCaseTableName}Stream.when(
///       data: (${camelCaseTableName}) => ListView.builder(
///         itemCount: ${camelCaseTableName}.length,
///         itemBuilder: (ctx, i) => ${pascalCaseTableName}Tile(
///           key: ValueKey('${tableName}-\${${camelCaseTableName}[i].id}'),
///           ${camelCaseTableName.toLowerCase()}: ${camelCaseTableName}[i],
///         ),
///       ),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtime${pascalCaseTableName}Provider = StreamProvider<List<$modelName>>((ref) {
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  AppLogger.debug('Starting realtime stream for all ${tableName}', loggerName: 'Provider');
  
  return repository
      .streamAll()
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Realtime stream error for ${tableName}: \$error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
        
        // Don't rethrow - let Riverpod handle the error state
        // The stream will automatically attempt to reconnect
      });
});

/// Realtime provider for a single ${tableName} by ID
/// 
/// This provider streams a specific record in real-time with automatic
/// error handling and reconnection logic.
/// 
/// Example usage:
/// ```dart
/// class ${pascalCaseTableName}DetailView extends ConsumerWidget {
///   final String ${camelCaseTableName}Id;
///   
///   const ${pascalCaseTableName}DetailView({required this.${camelCaseTableName}Id});
///   
///   Widget build(BuildContext context, WidgetRef ref) {
///     final ${camelCaseTableName}Stream = ref.watch(realtime${pascalCaseTableName}ByIdProvider(${camelCaseTableName}Id));
///     
///     return ${camelCaseTableName}Stream.when(
///       data: (${camelCaseTableName.toLowerCase()}) => ${camelCaseTableName.toLowerCase()} != null
///         ? ${pascalCaseTableName}Detail(${camelCaseTableName.toLowerCase()}: ${camelCaseTableName.toLowerCase()})
///         : const Text('${pascalCaseTableName} not found'),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtime${pascalCaseTableName}ByIdProvider = StreamProvider.family<$modelName?, String>((ref, id) {
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  AppLogger.debug('Starting realtime stream for ${tableName} ID: \$id', loggerName: 'Provider');
  
  return repository
      .streamById(id)
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Realtime stream error for ${tableName} ID \$id: \$error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
      });
});

/// Realtime provider for filtered ${tableName} records with client-side filtering
/// 
/// This provider streams records matching the given filters using a hybrid approach:
/// - Streams all records from the table (for maximum reliability)
/// - Applies filters on the client side (to work around Supabase limitations)
/// 
/// Note: For large tables, consider using the unfiltered realtime${pascalCaseTableName}Provider
/// and filtering in your widget to reduce processing overhead.
/// 
/// Example usage:
/// ```dart
/// class Active${pascalCaseTableName}Widget extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     // Create stable filter reference to avoid provider recreation
///     final activeFilter = {'status': 'active'};
///     final active${pascalCaseTableName}Stream = ref.watch(
///       realtimeFiltered${pascalCaseTableName}Provider(activeFilter)
///     );
///     
///     return active${pascalCaseTableName}Stream.when(
///       data: (active${pascalCaseTableName}) => Column(
///         children: active${pascalCaseTableName}
///           .map((${camelCaseTableName.toLowerCase()}) => ${pascalCaseTableName}Card(
///             key: ValueKey('active-${tableName}-\${${camelCaseTableName.toLowerCase()}.id}'),
///             ${camelCaseTableName.toLowerCase()}: ${camelCaseTableName.toLowerCase()},
///           ))
///           .toList(),
///       ),
///       loading: () => const CircularProgressIndicator(),
///       error: (e, _) => ErrorWidget.withDetails(message: e.toString()),
///     );
///   }
/// }
/// ```
final realtimeFiltered${pascalCaseTableName}Provider = StreamProvider.family<List<$modelName>, Map<String, dynamic>>((ref, filters) {
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  // Create a readable filter description for logging
  final filterDesc = filters.entries.map((e) => '\${e.key}=\${e.value}').join(', ');
  AppLogger.debug('Starting filtered realtime stream for ${tableName} with filters: \$filterDesc', loggerName: 'Provider');
  
  return repository
      .streamWhere(filters)
      .handleError((error, stackTrace) {
        AppLogger.error(
          'Filtered realtime stream error for ${tableName} (filters: \$filterDesc): \$error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
      });
});

/// Hybrid provider that automatically falls back from realtime to cached data
/// 
/// This provider attempts to use realtime data, but gracefully falls back to
/// cached regular queries if realtime fails. Ideal for critical UI components
/// that must always show data.
/// 
/// Example usage:
/// ```dart
/// class Reliable${pascalCaseTableName}Widget extends ConsumerWidget {
///   Widget build(BuildContext context, WidgetRef ref) {
///     final ${camelCaseTableName}Data = ref.watch(hybrid${pascalCaseTableName}Provider);
///     
///     return ${camelCaseTableName}Data.when(
///       data: (${camelCaseTableName}) => ${pascalCaseTableName}List(${camelCaseTableName}: ${camelCaseTableName}),
///       loading: () => const ${pascalCaseTableName}Skeleton(),
///       error: (e, _) => ${pascalCaseTableName}ErrorView(error: e),
///     );
///   }
/// }
/// ```
final hybrid${pascalCaseTableName}Provider = StreamProvider<List<$modelName>>((ref) {
  final repository = ref.watch(${camelCaseTableName}RepositoryProvider);
  
  AppLogger.debug('Starting hybrid realtime/cached stream for ${tableName}', loggerName: 'Provider');
  
  return repository
      .streamAll()
      .handleError((error, stackTrace) async* {
        AppLogger.warning(
          'Realtime failed for ${tableName}, falling back to cached data: \$error',
          loggerName: 'Provider',
          error: error,
          stackTrace: stackTrace,
        );
        
        try {
          // Fallback to cached regular query
          final fallbackData = await repository.findAll();
          AppLogger.debug('Successfully fell back to cached data for ${tableName} (\${fallbackData.length} records)', loggerName: 'Provider');
          yield fallbackData;
        } catch (fallbackError, fallbackStack) {
          AppLogger.error(
            'Both realtime and fallback failed for ${tableName}: \$fallbackError',
            loggerName: 'Provider',
            error: fallbackError,
            stackTrace: fallbackStack,
          );
          // Re-throw the original realtime error
          Error.throwWithStackTrace(error, stackTrace);
        }
      });
});

/// Notifier class that handles ${tableName} operations
class ${pascalCaseTableName}Notifier extends StateNotifier<AsyncValue<List<$modelName>>> {
  final $repositoryName _repository;

  ${pascalCaseTableName}Notifier(this._repository) : super(const AsyncValue.loading()) {
    // Load initial data when created
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      AppLogger.debug('Loading initial ${tableName} data', loggerName: 'Provider');
      final results = await _repository.findAll();
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Loaded initial data', details: '\${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Failed to load initial data', error: e, stackTrace: stackTrace);
      }
    }
  }

  /// Fetch all $tableName with basic sorting and filtering
  Future<List<$modelName>> fetchAll({
    String? orderBy,
    bool ascending = true,
    Map<String, dynamic>? filters,
    int? limit,
    int? offset,
  }) async {
    try {
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Fetching data', 
        details: 'filters: \$filters, orderBy: \$orderBy, limit: \$limit, offset: \$offset');
      
      // Create a cache key if filters are provided
      String? cacheKey;
      if (filters != null && filters.isNotEmpty) {
        cacheKey = _createCacheKey(filters);
        AppLogger.debug('Using cache key: \$cacheKey for fetchAll', loggerName: 'Provider');
      }
      
      state = const AsyncValue.loading();
      
      // Use cache if filters are provided, otherwise fetch directly
      final List<$modelName> results;
      if (cacheKey != null) {
        results = await AppCache().getOrFetch<List<$modelName>>(
          cacheKey,
          () => _repository.findAll(
            orderBy: orderBy,
            ascending: ascending,
            filters: filters,
            limit: limit,
            offset: offset,
          ),
          duration: const Duration(seconds: 30),
        );
      } else {
        results = await _repository.findAll(
          orderBy: orderBy,
          ascending: ascending,
          filters: filters,
          limit: limit,
          offset: offset,
        );
      }
      
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Data fetched', details: '\${results.length} records');
      }
      
      return results;
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Get a single record by ID with caching
  Future<$modelName?> getById(String id) async {
    try {
      // Create a stable cache key
      final cacheKey = '${tableName}:id:\$id';
      
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Getting record by ID', details: 'id: \$id');
      
      // Use app cache for efficient data access
      final result = await AppCache().getOrFetch<$modelName?>(
        cacheKey,
        () => _repository.find(id),
        duration: const Duration(minutes: 2),
      );
      
      if (result == null) {
        AppLogger.warning('No ${_singularize(tableName)} found with ID: \$id', loggerName: 'Provider');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Create a new record
  Future<$modelName> create($modelName model) async {
    try {
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Creating record');
      final result = await _repository.insert(model);
      
      // Clear any cached list results that might contain this entity
      AppLogger.debug('Clearing ${tableName} list caches after create', loggerName: 'Provider');
      _clearRelatedCaches(result);
      
      // Update state with new data
      if (mounted) {
        final currentData = state.valueOrNull ?? [];
        state = AsyncValue.data([...currentData, result]);
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Record created', details: 'id: \${result.id}');
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Update an existing record
  Future<$modelName?> update($modelName model) async {
    try {
      final modelId = model.id;
      if (modelId == null || modelId.isEmpty) {
        const message = 'Cannot update ${_singularize(tableName)} without ID';
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Update failed', details: message);
        throw AppException(message: message);
      }
      
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Updating record', details: 'id: \$modelId');
      final result = await _repository.update(model);
      
      // Clear related caches
      if (result != null) {
        // Clear both the specific ID cache and list caches
        final idCacheKey = '${tableName}:id:\$modelId';
        AppLogger.debug('Clearing cache for key: \$idCacheKey', loggerName: 'Provider');
        AppCache().remove(idCacheKey);
        
        // Clear list caches that might contain this entity
        _clearRelatedCaches(result);
      }
      
      // Update state if successful
      if (result != null && mounted && state.hasValue) {
        final currentList = state.value!;
        final index = currentList.indexWhere((item) => item.id == modelId);
        
        if (index >= 0) {
          final updated = [...currentList];
          updated[index] = result;
          state = AsyncValue.data(updated);
          ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Record updated', details: 'id: \$modelId');
        }
      }
      
      return result;
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Delete a record
  Future<void> delete(String id) async {
    try {
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Deleting record', details: 'id: \$id');
      await _repository.delete(id);
      
      // Clear cache entries for this ID
      final idCacheKey = '${tableName}:id:\$id';
      AppLogger.debug('Clearing cache for key: \$idCacheKey', loggerName: 'Provider');
      AppCache().remove(idCacheKey);
      
      // Clear list caches that might contain this entity (using a prefix)
      final prefix = '${tableName}:';
      AppLogger.debug('Clearing list caches with prefix: \$prefix', loggerName: 'Provider');
      final allExpirations = AppCache().expirations;
      for (final key in allExpirations.keys) {
        if (key.startsWith(prefix) && key != idCacheKey) {
          AppCache().remove(key);
        }
      }
      
      // Update state if successful
      if (mounted && state.hasValue) {
        final currentList = state.value!;
        state = AsyncValue.data(
          currentList.where((item) => item.id != id).toList(),
        );
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Record deleted', details: 'id: \$id');
      }
    } catch (e, stackTrace) {
      final errorMsg = AppExceptionHandler.handleException(e, stackTrace, context: '${pascalCaseTableName}');
      throw AppException(message: errorMsg, originalError: e);
    }
  }
  
  /// Clear caches related to this entity
  void _clearRelatedCaches($modelName entity) {
    final prefix = '${tableName}:';
    AppLogger.debug('Clearing list caches with prefix: \$prefix', loggerName: 'Provider');
    
    // Scan all keys in the cache
    final allExpirations = AppCache().expirations;
    int count = 0;
    
    for (final key in allExpirations.keys) {
      // Only clear list caches (not individual ID caches)
      if (key.startsWith(prefix) && !key.startsWith('\${prefix}id:')) {
        AppCache().remove(key);
        count++;
      }
    }
    
    if (count > 0) {
      AppLogger.debug('Cleared \$count related cache entries', loggerName: 'Provider');
    }
  }
  
  /// Refresh data from the server
  Future<void> refresh() async {
    try {
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Refreshing data');
      if (mounted) {
        state = const AsyncValue.loading();
      }
      
      // Clear all caches related to this entity type
      final prefix = '${tableName}:';
      AppLogger.debug('Clearing all caches with prefix: \$prefix', loggerName: 'Provider');
      final allExpirations = AppCache().expirations;
      for (final key in allExpirations.keys) {
        if (key.startsWith(prefix)) {
          AppCache().remove(key);
        }
      }
      
      final results = await _repository.findAll();
      
      if (mounted) {
        state = AsyncValue.data(results);
        ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Data refreshed', details: '\${results.length} records');
      }
    } catch (e, stackTrace) {
      if (mounted) {
        state = AsyncValue.error(e, stackTrace);
      }
      ProviderLogging.logStateChange('${pascalCaseTableName}Notifier', 'Refresh failed', error: e, stackTrace: stackTrace);
    }
  }
}
''';
  }
}
