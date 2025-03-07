// test/schema_reader_test.dart
import 'package:supabase_gen/src/config/config_model.dart';
import 'package:supabase_gen/src/schema/schema_reader.dart';
import 'package:supabase_gen/src/utils/logger.dart';
import 'package:test/test.dart';

void main() {
  // This test requires a real database connection
  group('Schema Reader Tests', () {
    late SupabaseGenConfig config;
    late SchemaReader schemaReader;

    setUp(() {
      Logger.initializeLogging();
      
      // Configuration for local Supabase instance
      config = SupabaseGenConfig(
        host: 'localhost',
        port: 54322,  // Updated to match local Supabase port
        database: 'postgres',
        username: 'postgres',
        password: 'postgres',
        outputDirectory: 'lib/generated',
      );
      
      schemaReader = SchemaReader(config);
    });

    test('Can connect to database', () async {
      try {
        await schemaReader.connect();
        expect(true, true); // Connection success
        await schemaReader.disconnect();
      } catch (e) {
        fail('Could not connect to database: $e');
      }
    });

    test('Can read tables from database', () async {
      try {
        await schemaReader.connect();
        final tables = await schemaReader.readTables();
        
        // Check if we got any tables
        expect(tables.isNotEmpty, true, reason: 'No tables found in the database');
        
        // Print table info for debugging
        for (final table in tables) {
          print('Found table: ${table.schema}.${table.name}');
          for (final column in table.columns) {
            print('  Column: ${column.name} (${column.type})');
          }
        }
        
        await schemaReader.disconnect();
      } catch (e) {
        fail('Error reading tables: $e');
      }
    });
  });
}