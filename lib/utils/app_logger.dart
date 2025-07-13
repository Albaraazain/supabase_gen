import 'package:logger/logger.dart';

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
      _logger.i('[$context] $message', error: error, stackTrace: stackTrace);
    } else {
      _logger.i('[$context] $message');
    }
  }
  
  /// Log a debug message
  static void debug(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.d('[$context] $message', error: error, stackTrace: stackTrace);
    } else {
      _logger.d('[$context] $message');
    }
  }
  
  /// Log a warning message
  static void warning(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.w('[$context] $message', error: error, stackTrace: stackTrace);
    } else {
      _logger.w('[$context] $message');
    }
  }
  
  /// Log an error message
  static void error(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.e('[$context] $message', error: error, stackTrace: stackTrace);
    } else {
      _logger.e('[$context] $message');
    }
  }
  
  /// Log a success message (INFO level with checkmark prefix)
  static void success(String message, {String? loggerName}) {
    final context = _getLoggerContext(loggerName);
    _logger.i('[$context] ✓ $message');
  }
  
  /// Log a verbose message (for detailed tracing)
  static void verbose(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.v('[$context] $message', error: error, stackTrace: stackTrace);
    } else {
      _logger.v('[$context] $message');
    }
  }
  
  /// Log a wtf message (what a terrible failure)
  static void wtf(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final context = _getLoggerContext(loggerName);
    if (error != null || stackTrace != null) {
      _logger.wtf('[$context] $message', error: error, stackTrace: stackTrace);
    } else {
      _logger.wtf('[$context] $message');
    }
  }
}
