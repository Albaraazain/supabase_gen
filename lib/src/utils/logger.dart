// lib/src/utils/logger.dart
import 'package:logger/logger.dart' as logger_pkg;

/// A singleton logger service that wraps the logger package and provides
/// consistent logging across the app.
class Logger {
  static final Map<String, Logger> _loggers = {};
  static logger_pkg.Level _logLevel = logger_pkg.Level.info;
  static bool _verbose = false;
  
  // Lazily create the logger so its level is set correctly
  late final logger_pkg.Logger _logger;
  final String _name;
  
  /// Factory constructor to get a named logger instance.
  /// Returns an existing logger if one with the same name exists.
  factory Logger(String name) {
    if (_loggers.containsKey(name)) {
      return _loggers[name]!;
    }
    
    final logger = Logger._internal(name);
    _loggers[name] = logger;
    return logger;
  }
  
  Logger._internal(this._name) {
    _logger = _createLoggerInstance();
  }
  
  /// Creates a new logger instance with current level settings
  logger_pkg.Logger _createLoggerInstance() {
    return logger_pkg.Logger(
      filter: null, // No filtering
      output: logger_pkg.ConsoleOutput(),
      printer: logger_pkg.PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
      level: _logLevel,
    );
  }
  
  /// Initialize the logging system with the specified verbosity level
  static void initializeLogging({bool verbose = false}) {
    _verbose = verbose;
    _logLevel = verbose ? logger_pkg.Level.debug : logger_pkg.Level.info;
    
    // Clear existing loggers so new ones will be created with new level
    _loggers.clear();
  }
  
  /// Get a logger instance for use in the CLI or other components
  static logger_pkg.Logger getGlobalLogger() {
    // Force output to console regardless of environment
    return logger_pkg.Logger(
      filter: null, // No filtering
      output: logger_pkg.ConsoleOutput(),
      printer: logger_pkg.PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
      level: _logLevel,
    );
  }
  
  /// Log an info level message
  void info(String message) {
    print('INFO [$_name] $message');
    _logger.i('[$_name] $message');
  }
  
  /// Log a warning level message
  void warning(String message) {
    print('WARNING [$_name] $message');
    _logger.w('[$_name] $message');
  }
  
  /// Log a severe error message
  void severe(String message) {
    print('ERROR [$_name] $message');
    _logger.e('[$_name] $message');
  }
  
  /// Log a debug level message (only shown in verbose mode)
  void fine(String message) {
    if (_verbose) print('DEBUG [$_name] $message');
    _logger.d('[$_name] $message');
  }
  
  /// Log a success message (same as info but with a checkmark)
  void success(String message) {
    print('SUCCESS [$_name] ✓ $message');
    _logger.i('[$_name] ✓ $message');
  }
}