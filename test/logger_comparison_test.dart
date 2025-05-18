import 'package:logger/logger.dart' as logger_pkg;
import 'package:test/test.dart';
import 'package:supabase_gen/src/utils/logger.dart';

void main() {
  test('Logger comparison test', () {
    // Initialize our custom wrapper logger
    final customLogger = Logger('CustomLogger');
    
    // Initialize the direct Logger package
    final directLogger = logger_pkg.Logger(
      printer: logger_pkg.PrettyPrinter(
        methodCount: 0,
        errorMethodCount: 5,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        printTime: false,
      ),
    );
    
    print('\n=== CUSTOM LOGGER MESSAGES ===\n');
    customLogger.info('This is an info message from custom logger');
    customLogger.warning('This is a warning message from custom logger');
    customLogger.severe('This is an error message from custom logger');
    customLogger.fine('This is a debug message from custom logger');
    customLogger.success('This is a success message from custom logger');
    
    print('\n=== DIRECT LOGGER MESSAGES ===\n');
    directLogger.i('This is an info message from direct logger');
    directLogger.w('This is a warning message from direct logger');
    directLogger.e('This is an error message from direct logger');
    directLogger.d('This is a debug message from direct logger');
    directLogger.i('✓ This is a success message from direct logger');
    
    // Verify the test runs successfully
    expect(true, true);
  });
}