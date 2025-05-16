import '../utils/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Extension to add logging capabilities to all repositories
extension RepositoryLogging on Object {
  /// Log repository operations with consistent formatting
  static void logOperation(String repository, String operation, String details, {Object? error, StackTrace? stackTrace}) {
    if (error != null) {
      AppLogger.error('[$repository] $operation failed: $details', loggerName: 'Repository', error: error, stackTrace: stackTrace);
    } else {
      AppLogger.info('[$repository] $operation: $details', loggerName: 'Repository');
    }
  }
  
  /// Log query details for debugging
  static void logQuery(String repository, String method, Map<String, dynamic>? filters, {int? limit, int? offset, String? orderBy}) {
    final filterInfo = filters?.entries.map((e) => '${e.key}=${e.value}').join(', ') ?? 'none';
    final paginationInfo = offset != null ? 'offset=$offset, limit=$limit' : (limit != null ? 'limit=$limit' : 'no pagination');
    final sortingInfo = orderBy != null ? 'orderBy=$orderBy' : 'default sorting';
    
    AppLogger.debug(
      '[$repository] $method: filters=[$filterInfo], $paginationInfo, $sortingInfo',
      loggerName: 'Repository'
    );
  }
  
  /// Log performance metrics for repository operations
  static Future<T> timeOperation<T>(String repository, String operation, Future<T> Function() callback) async {
    final stopwatch = Stopwatch()..start();
    try {
      final result = await callback();
      stopwatch.stop();
      AppLogger.debug('[$repository] $operation completed in ${stopwatch.elapsedMilliseconds}ms', loggerName: 'Performance');
      return result;
    } catch (e, stackTrace) {
      stopwatch.stop();
      AppLogger.error(
        '[$repository] $operation failed after ${stopwatch.elapsedMilliseconds}ms', 
        loggerName: 'Performance',
        error: e,
        stackTrace: stackTrace
      );
      rethrow;
    }
  }
}
