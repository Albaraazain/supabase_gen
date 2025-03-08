import 'package:logger/logger.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  late Logger _logger;

  factory LoggerService() {
    return _instance;
  }

  LoggerService._internal() {
    _logger = Logger(
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
        printTime: true,
      ),
    );
  }

  void verbose(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.v('[$tag] $message', error: error, stackTrace: stackTrace);
  }

  void debug(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.d('[$tag] $message', error: error, stackTrace: stackTrace);
  }

  void info(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.i('[$tag] $message', error: error, stackTrace: stackTrace);
  }

  void warning(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.w('[$tag] $message', error: error, stackTrace: stackTrace);
  }

  void error(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.e('[$tag] $message', error: error, stackTrace: stackTrace);
  }

  void wtf(String message, {String? tag, dynamic error, StackTrace? stackTrace}) {
    _logger.wtf('[$tag] $message', error: error, stackTrace: stackTrace);
  }
} 