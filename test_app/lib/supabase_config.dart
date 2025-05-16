import 'package:supabase_flutter/supabase_flutter.dart';

/// Configuration class for Supabase
class SupabaseConfig {
  // Your Supabase URL
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  
  // Your Supabase anon key
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
  
  // Initialize Supabase
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
      debug: true,
    );
  }
  
  // Get the Supabase client instance
  static SupabaseClient get client => Supabase.instance.client;
}