import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'auth/auth_provider.dart';
import 'professional/providers/professional_home_provider.dart';
import 'router/app_router.dart';

// Instructions for using ngrok:
// 1. Make sure you have ngrok installed and configured
// 2. Run './start_development.sh' to start Supabase and ngrok
// 3. Copy the ngrok URL from the terminal (e.g., https://your-url.ngrok.io)
// 4. Create a .env file with:
//    SUPABASE_URL=https://your-url.ngrok.io
//    SUPABASE_ANON_KEY=your-anon-key

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize Supabase with local IP
  await Supabase.initialize(
    url: 'http://192.168.137.88:54321',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
    debug: true, // Enable debug mode to see network requests
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(Supabase.instance.client),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ProfessionalHomeProvider>(
          create: (context) => ProfessionalHomeProvider(Supabase.instance.client),
          update: (context, auth, previous) {
            // Force refresh when auth state changes
            if (auth.isAuthenticated && previous != null) {
              print("DEBUG: Auth state changed, refreshing ProfessionalHomeProvider");
              Future.microtask(() => previous.refresh());
            }
            return previous ?? ProfessionalHomeProvider(Supabase.instance.client);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Service App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.grey[50],
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[50],
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
