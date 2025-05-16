// Generated logger initialization code
import 'package:logging/logging.dart';
import './utils/app_logger.dart';

/// Initialize all logging for the application
void initializeLogging({
  Level level = Level.INFO, 
  bool colorize = true,
  bool includeCallerInfo = true,
}) {
  AppLogger.initialize(
    level: level,
    includeCallerInfo: includeCallerInfo,
    colorize: colorize,
  );

  // Example usage in your application:
  //
  // 1. In your app's main() function:
  // ```dart
  // void main() {
  //   // Initialize logging with more detailed logs during development
  //   initializeLogging(
  //     level: kDebugMode ? Level.FINE : Level.INFO,
  //     colorize: true,
  //   );
  //   runApp(MyApp());
  // }
  // ```
  //
  // 2. The repositories and providers already use logging extensively.
  //
  // 3. In your own code, use these methods:
  // ```dart
  //   // For informational messages:
  //   AppLogger.info('User logged in', loggerName: 'Auth');
  //
  //   // For debug messages (only shown if level is FINE or lower):
  //   AppLogger.debug('Processing item $id', loggerName: 'SyncService');
  //
  //   // For warnings:
  //   AppLogger.warning('Rate limit approaching', loggerName: 'API');
  //
  //   // For errors with stack traces:
  //   try {
  //     // Some code that might throw
  //   } catch (e, stackTrace) {
  //     AppLogger.error(
  //       'Failed to process data', 
  //       loggerName: 'DataProcessor', 
  //       error: e, 
  //       stackTrace: stackTrace
  //     );
  //   }
  //
  //   // For success messages (with checkmark):
  //   AppLogger.success('Data synchronized successfully', loggerName: 'SyncService');
  // ```
  //
  // 4. For operations that need timing:
  // ```dart
  //   // Use the RepositoryLogging extension:
  //   final result = await RepositoryLogging.timeOperation(
  //     'UserRepository', 
  //     'fetchProfileData', 
  //     () async {
  //       // Your expensive operation here
  //       return await someExpensiveOperation();
  //     }
  //   );
  // ```
}