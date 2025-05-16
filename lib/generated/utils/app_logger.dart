import 'package:logging/logging.dart';

/// Centralized logging utility for app-wide logging
class AppLogger {
  static final Map<String, Logger> _loggers = {};
  static bool _initialized = false;
  
  /// Initialize the logging system with custom settings
  static void initialize({
    Level level = Level.INFO,
    bool includeCallerInfo = true,
    bool colorize = true,
  }) {
    if (_initialized) return;
    
    hierarchicalLoggingEnabled = true;
    Logger.root.level = level;
    
    Logger.root.onRecord.listen((record) {
      final message = _formatLogMessage(record, colorize, includeCallerInfo);
      print(message);
    });
    
    _initialized = true;
  }
  
  /// Format log message with optional coloring and caller info
  static String _formatLogMessage(LogRecord record, bool colorize, bool includeCallerInfo) {
    final level = record.level.name.padRight(7);
    final time = record.time.toIso8601String();
    final loggerName = record.loggerName;
    final message = record.message;
    final error = record.error != null ? '\nERROR: ${record.error}' : '';
    final stackTrace = record.stackTrace != null ? '\nSTACKTRACE:\n${record.stackTrace}' : '';
    
    final callerInfo = includeCallerInfo && record.stackTrace != null
        ? ' [${_extractCallerInfo(record.stackTrace.toString())}]'
        : '';
        
    if (colorize) {
      final color = _getColorForLevel(record.level);
      return "${time}: ${color}${level}${_RESET} [${loggerName}]${callerInfo}: ${message}${error}${stackTrace}";
    } else {
      return "${time}: ${level} [${loggerName}]${callerInfo}: ${message}${error}${stackTrace}";
    }
  }
  
  /// Extract caller info from stack trace (file:line)
  static String _extractCallerInfo(String stackTrace) {
    final lines = stackTrace.split('\n');
    if (lines.length > 1) {
      // Skip first frames which are likely the logging framework
      for (int i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (!line.contains('logging.dart') && 
            !line.contains('logger.dart') && 
            !line.contains('app_logger.dart')) {
          // Extract location info after finding a non-logger frame
          final fileMatch = RegExp(r'\((.+?):(\d+)(?::(\d+))?\)').firstMatch(line);
          if (fileMatch != null) {
            final file = fileMatch.group(1);
            final lineNumber = fileMatch.group(2);
            return "$file:$lineNumber";
          }
          break;
        }
      }
    }
    return 'unknown location';
  }
  
  /// Get ANSI color code for log level
  static String _getColorForLevel(Level level) {
    if (level == Level.FINEST || level == Level.FINER || level == Level.FINE) {
      return _CYAN; // Debug levels
    } else if (level == Level.CONFIG) {
      return _BLUE; // Config
    } else if (level == Level.INFO) {
      return _GREEN; // Info
    } else if (level == Level.WARNING) {
      return _YELLOW; // Warning
    } else if (level == Level.SEVERE) {
      return _RED; // Error
    } else if (level == Level.SHOUT) {
      return _MAGENTA; // Critical
    }
    return '';
  }
  
  // ANSI color codes
  static const String _RESET = '\x1B[0m';
  static const String _RED = '\x1B[31m';
  static const String _GREEN = '\x1B[32m';
  static const String _YELLOW = '\x1B[33m';
  static const String _BLUE = '\x1B[34m';
  static const String _MAGENTA = '\x1B[35m';
  static const String _CYAN = '\x1B[36m';
  
  /// Get or create a named logger
  static Logger getLogger(String name) {
    if (_loggers.containsKey(name)) {
      return _loggers[name]!;
    }
    
    final logger = Logger(name);
    _loggers[name] = logger;
    return logger;
  }
  
  /// Log an info message
  static void info(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final logger = loggerName != null ? getLogger(loggerName) : Logger.root;
    logger.info(message, error, stackTrace);
  }
  
  /// Log a debug message
  static void debug(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final logger = loggerName != null ? getLogger(loggerName) : Logger.root;
    logger.fine(message, error, stackTrace);
  }
  
  /// Log a warning message
  static void warning(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final logger = loggerName != null ? getLogger(loggerName) : Logger.root;
    logger.warning(message, error, stackTrace);
  }
  
  /// Log an error message
  static void error(String message, {String? loggerName, Object? error, StackTrace? stackTrace}) {
    final logger = loggerName != null ? getLogger(loggerName) : Logger.root;
    logger.severe(message, error, stackTrace);
  }
  
  /// Log a success message (INFO level with checkmark prefix)
  static void success(String message, {String? loggerName}) {
    final logger = loggerName != null ? getLogger(loggerName) : Logger.root;
    logger.info('✓ $message');
  }
}
