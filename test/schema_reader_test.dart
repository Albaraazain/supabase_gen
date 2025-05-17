import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:supabase_gen/src/schema/schema_reader.dart';
import 'package:supabase_gen/src/schema/table_info.dart';
import 'package:supabase_gen/src/config/config_model.dart';

class MockDio extends Mock implements Dio {}
class MockResponse extends Mock implements Response {}

void main() {
  group('SchemaReader', () {
    late SchemaReader schemaReader;
    late MockDio mockDio;
    late SupabaseGenConfig config;

    setUp(() {
      mockDio = MockDio();
      
      config = SupabaseGenConfig(
        connectionType: ConnectionType.remote,
        supabaseUrl: 'https://example.supabase.co',
        supabaseKey: 'super-secret-key',
        includeTables: ['*'],
        excludeTables: [],
        generateForAllTables: true,
        outputDirectory: 'lib/generated',
        host: '',
        port: 0,
        database: '',
        username: '',
        password: '',
        ssl: false,
        applyRowLevelSecurity: false,
        probeTables: [],
      );
      
      schemaReader = SchemaReader(config);
      
      // Set the dio client using reflection
      final privateField = schemaReader;
      (privateField as dynamic)._dioClient = mockDio;
    });

    test('_getFunctionDetails returns function details correctly', () async {
      // Setup mock response
      final mockResponse = MockResponse();
      when(() => mockResponse.statusCode).thenReturn(200);
      when(() => mockResponse.data).thenReturn([
        {
          'function_name': 'update_timestamp',
          'function_body': 'BEGIN NEW.updated_at = now(); RETURN NEW; END;',
          'parameters': '',
          'return_type': 'trigger',
          'language_name': 'plpgsql',
          'comment': 'Updates timestamp fields automatically'
        }
      ]);
      
      when(() => mockDio.post(
        '/rest/v1/rpc/get_function_details',
        data: {'p_function_name': 'update_timestamp'},
        options: any(named: 'options'),
      )).thenAnswer((_) async => mockResponse);
      
      // Call the private method using reflection
      final result = await (schemaReader as dynamic)._getFunctionDetails('update_timestamp');
      
      // Verify results
      expect(result, isA<List<Map<String, dynamic>>>());
      expect(result.length, 1);
      expect(result[0]['function_name'], 'update_timestamp');
      expect(result[0]['function_body'], 'BEGIN NEW.updated_at = now(); RETURN NEW; END;');
      expect(result[0]['return_type'], 'trigger');
    });
    
    test('_getFunctionDetails handles errors gracefully', () async {
      // Setup mock to throw error
      when(() => mockDio.post(
        '/rest/v1/rpc/get_function_details',
        data: {'p_function_name': 'update_timestamp'},
        options: any(named: 'options'),
      )).thenThrow(DioError(
        requestOptions: RequestOptions(path: '/rest/v1/rpc/get_function_details'),
        error: 'Connection failed',
      ));
      
      // Call the private method using reflection and verify it doesn't throw
      final result = await (schemaReader as dynamic)._getFunctionDetails('update_timestamp');
      
      // Should return an empty list instead of throwing
      expect(result, isEmpty);
    });
    
    test('TriggerInfo extracts function body correctly', () {
      // Test with standard $$ delimited function
      final triggerWithStandardDelimiters = TriggerInfo(
        name: 'test_trigger',
        eventType: 'UPDATE',
        actionTime: 'BEFORE',
        actionStatement: 'EXECUTE FUNCTION update_timestamp()',
        functionName: 'update_timestamp',
        functionDefinition: 'CREATE OR REPLACE FUNCTION update_timestamp() RETURNS trigger AS $$\nBEGIN\n  NEW.updated_at = now();\n  RETURN NEW;\nEND;\n$$ LANGUAGE plpgsql;',
      );
      
      expect(triggerWithStandardDelimiters.extractFunctionBody(), 
        contains('BEGIN') & contains('NEW.updated_at = now()') & contains('RETURN NEW'));
      
      // Test with $BODY$ delimited function
      final triggerWithCustomDelimiters = TriggerInfo(
        name: 'test_trigger',
        eventType: 'UPDATE',
        actionTime: 'BEFORE',
        actionStatement: 'EXECUTE FUNCTION update_timestamp()',
        functionName: 'update_timestamp',
        functionDefinition: 'CREATE OR REPLACE FUNCTION update_timestamp() RETURNS trigger AS $BODY$\nBEGIN\n  NEW.updated_at = now();\n  RETURN NEW;\nEND;\n$BODY$ LANGUAGE plpgsql;',
      );
      
      expect(triggerWithCustomDelimiters.extractFunctionBody(), 
        contains('BEGIN') & contains('NEW.updated_at = now()') & contains('RETURN NEW'));
    });
  });
}