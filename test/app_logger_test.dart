import 'package:supabase_gen/generated/utils/app_logger.dart';
import 'package:test/test.dart';

void main() {
  group('AppLogger Tests', () {
    test('AppLogger initialization and basic logging', () {
      // Initialize the logger
      AppLogger.initialize();

      // Log messages at different levels
      AppLogger.info('This is an info message', loggerName: 'AppTest');
      AppLogger.warning('This is a warning message', loggerName: 'AppTest');
      AppLogger.error('This is an error message', loggerName: 'AppTest');
      AppLogger.debug('This is a debug message', loggerName: 'AppTest');
      AppLogger.success('This is a success message', loggerName: 'AppTest');

      // If we got here without exceptions, the test passes
      expect(true, isTrue);
    });
  });
}