import 'dart:async';
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
    final prefix = context != null ? '[$context] ' : '';
    final errorType = error.runtimeType.toString();
    
    // Log the error with full details
    AppLogger.error(
      '${prefix}Error: $errorType', 
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
