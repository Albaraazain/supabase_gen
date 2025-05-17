/// Logger initialization for generated Supabase code

import 'dart:developer' as developer;

/// Initialize the logging system for generated Supabase code
/// 
/// Call this method early in your application startup to ensure
/// proper logging for database operations.
/// 
/// ```dart
/// void main() {
///   initSupabaseLogger();
///   runApp(MyApp());
/// }
/// ```
void initSupabaseLogger() {
  developer.log('Initializing Supabase Gen logger');
  
  // Any additional logger initialization can be added here
  // in future versions (e.g., custom log levels, filters)
}

/// Log a Supabase database operation
/// 
/// This is used internally by generated code to provide
/// consistent logging for database operations.
void logSupabaseOperation(String operation, String table, {String? details, Object? error}) {
  final timestamp = DateTime.now().toIso8601String();
  
  if (error != null) {
    developer.log(
      '[$timestamp] ERROR: $operation on $table - $details',
      error: error,
      name: 'supabase.db',
    );
  } else {
    developer.log(
      '[$timestamp] $operation on $table${details != null ? " - $details" : ""}',
      name: 'supabase.db',
    );
  }
}

/// Enable detailed logging for database operations
/// 
/// This turns on SQL query logging and detailed timing information.
/// Use this during development for debugging purposes.
/// 
/// ```dart
/// // During development
/// void main() {
///   initSupabaseLogger();
///   enableVerboseLogging(true);
///   runApp(MyApp());
/// }
/// ```
void enableVerboseLogging(bool enabled) {
  _verboseLoggingEnabled = enabled;
  developer.log(
    'Verbose logging ${enabled ? "enabled" : "disabled"} for Supabase Gen',
    name: 'supabase.config',
  );
}

/// Whether verbose logging is enabled
bool _verboseLoggingEnabled = false;

/// Check if verbose logging is enabled
bool isVerboseLoggingEnabled() => _verboseLoggingEnabled;

/// Add trigger function name to errors when applicable
/// 
/// The trigger detection system will check error messages for function names
/// from database triggers to help with debugging trigger-related errors.
/// 
/// For example, if an error occurs in a trigger function, this will help
/// identify which trigger function caused the problem.
String enhanceErrorWithTriggerInfo(String table, String errorMessage) {
  // This method can be expanded in the future to include more sophisticated
  // trigger detection and error enhancement.
  
  // Simple placeholder implementation
  if (errorMessage.contains('violates trigger')) {
    return 'Trigger error on $table: $errorMessage';
  }
  
  return errorMessage;
}