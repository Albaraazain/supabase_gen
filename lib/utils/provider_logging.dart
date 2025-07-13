import 'app_logger.dart';

/// Extension to add logging capabilities to providers
extension ProviderLogging on Object {
  /// Log provider state changes
  static void logStateChange(String provider, String action, {String? details, Object? error, StackTrace? stackTrace}) {
    final logMessage = details != null ? '$action: $details' : action;
    
    if (error != null) {
      AppLogger.error('[$provider] $logMessage', loggerName: 'Provider', error: error, stackTrace: stackTrace);
    } else {
      AppLogger.info('[$provider] $logMessage', loggerName: 'Provider');
    }
  }
  
  /// Log provider initialization
  static void logInitialization(String provider, {bool success = true, Object? error, StackTrace? stackTrace}) {
    if (success) {
      AppLogger.info('[$provider] Initialized', loggerName: 'Provider');
    } else {
      AppLogger.error('[$provider] Initialization failed', loggerName: 'Provider', error: error, stackTrace: stackTrace);
    }
  }
}
