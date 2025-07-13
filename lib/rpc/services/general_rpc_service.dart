import 'package:supabase_flutter/supabase_flutter.dart';
import '../base_rpc_service.dart';

/// RPC service for general-related functions
/// 
/// This service provides type-safe access to the following RPC functions:
/// - execute_sql: No description
class GeneralRpcService extends BaseRpcService {
  GeneralRpcService(
    SupabaseClient client, {
    bool enableLogging = true,
    bool enableCaching = true,
  }) : super(
         client,
         'general',
         enableLogging: enableLogging,
         enableCaching: enableCaching,
       );

  /// Call the execute_sql RPC function
  /// 
  /// Function signature: execute_sql() RETURNS json
  /// Returns: json
  Future<List<dynamic>> executeSql({
    Duration? timeout
  }
) async {
    // Validate parameters
    final parameters = <String, dynamic>{};

    // Call the RPC function
    return await callFunction<List<dynamic>>(
      'execute_sql',
      parameters: parameters,
      fromJson: (json) => json as List<dynamic>,
      timeout: timeout,
    );
  }


}
