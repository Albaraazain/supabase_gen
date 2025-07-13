import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/services.dart';
import '../../shared/errors/app_exception.dart';

/// Provider for general RPC service
/// 
/// This provider gives access to the following RPC functions:
/// - execute_sql: No description
final generalRpcServiceProvider = Provider<GeneralRpcService>((ref) {
  final supabase = Supabase.instance.client;
  return GeneralRpcService(supabase);
});

/// Provider for execute_sql RPC function
/// No description available
final generalExecutesqlProvider = FutureProvider<List<dynamic>>((ref) async {
  try {
    final service = ref.read(generalRpcServiceProvider);
    return await service.executeSql();
  } catch (e) {
    throw AppException(message: e.toString(), originalError: e);
  }
});

