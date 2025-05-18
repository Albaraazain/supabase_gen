# Migration from `logging` to `logger` package

This package has been migrated from the `logging` package to the `logger` package for better output formatting, additional log levels, and improved developer experience.

## Key Changes

1. **Dependency Change**
   - Replaced `logging: ^1.2.0` with `logger: ^2.0.2+1` in `pubspec.yaml`

2. **Enhanced Log Output**
   - Colorized log output with emojis
   - Better formatted stack traces
   - Timestamps on log messages

3. **Same API with Extended Capabilities**
   - All existing log methods (`info`, `warning`, `error`, etc.) continue to work
   - Added new log levels like `verbose` and `wtf` (what a terrible failure)

## Example Usage

```dart
// Initialize logging system
AppLogger.initialize(); 

// Log at different levels
AppLogger.info('User logged in', loggerName: 'Auth');
AppLogger.debug('Processing data...', loggerName: 'DataProcessor');
AppLogger.warning('Rate limit approaching', loggerName: 'API');
AppLogger.error(
  'Failed to connect', 
  loggerName: 'Database', 
  error: exception,
  stackTrace: stackTrace
);
AppLogger.success('Operation completed', loggerName: 'Task');
```

## Configuring Log Levels

In your application, you can configure the logging level when initializing:

```dart
// In Flutter, typically in main()
AppLogger.initialize(
  // Only show info and above in production, show all in development
  level: kDebugMode ? Level.verbose : Level.info,
  colorize: true,
);
```

## Verbose Output in Command Line Tool

When using the command-line tool, you can enable verbose output with the `--verbose` flag:

```bash
dart run bin/supabase_gen.dart -c config/supabase_gen.yaml --verbose
```

This will display more detailed information about the generation process.