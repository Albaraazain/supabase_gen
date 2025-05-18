import 'package:supabase_gen/src/utils/logger.dart';
import 'package:test/test.dart';

void main() {
  group('Logger Tests', () {
    test('Logger creation and basic logging', () {
      // Initialize the logger
      Logger.initializeLogging();

      // Create a named logger
      final logger = Logger('TestLogger');

      // Log messages at different levels
      logger.info('This is an info message');
      logger.warning('This is a warning message');
      logger.severe('This is an error message');
      logger.fine('This is a debug message');
      logger.success('This is a success message');

      // If we got here without exceptions, the test passes
      expect(true, isTrue);
    });
  });
}