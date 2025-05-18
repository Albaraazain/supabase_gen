// bin/supabase_gen.dart
import 'dart:io';
import 'package:args/args.dart';
import 'package:logger/logger.dart' as logger_pkg;
import 'package:supabase_gen/supabase_gen.dart';

Future<void> main(List<String> arguments) async {
  // Initialize the core logger first
  Logger.initializeLogging(verbose: arguments.contains('--verbose'));
  
  // Get a global logger for CLI use
  final cliLogger = Logger.getGlobalLogger();

  final parser =
      ArgParser()
        ..addFlag(
          'help',
          abbr: 'h',
          help: 'Print this usage information',
          negatable: false,
        )
        ..addFlag(
          'version',
          abbr: 'v',
          help: 'Print the version',
          negatable: false,
        )
        ..addOption('config', abbr: 'c', help: 'Path to configuration file')
        ..addFlag(
          'init',
          help: 'Create a sample configuration file',
          negatable: false,
        )
        ..addFlag('verbose', help: 'Enable verbose logging', negatable: false);

  try {
    final results = parser.parse(arguments);

    if (results['help']) {
      _printUsage(parser);
      return;
    }

    if (results['version']) {
      print('supabase_gen version 0.1.0');
      return;
    }

    if (results['init']) {
      final configPath = results['config'] as String? ?? 'supabase_gen.yaml';
      await ConfigLoader.createSampleConfig(configPath);
      final logger = Logger('SupabaseGen');
      logger.success('Created sample configuration file at $configPath');
      return;
    }

    if (results['config'] == null) {
      final logger = Logger('SupabaseGen');
      logger.severe('Error: Missing required option --config');
      _printUsage(parser);
      exit(1);
    }

    final configPath = results['config'] as String;
    final verbose = results['verbose'] as bool;

    // Re-initialize with parsed verbose flag for accuracy
    Logger.initializeLogging(verbose: verbose);
    final logger = Logger('SupabaseGen');

    if (verbose) {
      logger.info('Verbose logging enabled');
    }

    print('🚀 Starting Supabase code generation');
    print('Using config file: $configPath');
    print('Verbose mode: $verbose');
    
    // Force direct print of logs to troubleshoot
    logger.info('Starting code generation with config $configPath');

    try {
      // Load configuration
      final config = ConfigLoader.fromFile(configPath);
      logger.info('📋 Loaded configuration from $configPath');

      // Create generator
      final generator = SupabaseGenerator(config);

      // Run generation
      await generator.generate();

      logger.success('Code generation completed successfully');
    } catch (e, stackTrace) {
      logger.severe('Error during code generation: $e');
      if (verbose) {
        logger.severe('Stack trace: $stackTrace');
      }
      exit(1);
    }
  } catch (e) {
    final logger = Logger('SupabaseGen');
    logger.severe('Error: $e');
    _printUsage(parser);
    exit(1);
  }
}

void _printUsage(ArgParser parser) {
  print('Usage: supabase_gen [options]');
  print(parser.usage);
}
