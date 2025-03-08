import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth/auth_provider.dart';
import 'shared/users_provider.dart';
import 'router/app_router.dart';
import 'services/logger_service.dart';

// These imports will be available after running the code generator
// import 'package:supabase_gen_test_app/generated/models/models.dart';
// import 'package:supabase_gen_test_app/generated/repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final logger = LoggerService();
  logger.info('Starting application', tag: 'Main');
  
  try {
    logger.info('Initializing Supabase', tag: 'Main');
    await Supabase.initialize(
      url: 'http://127.0.0.1:54321',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0',
    );
    logger.info('Supabase initialized successfully', tag: 'Main');
  } catch (e) {
    logger.error('Failed to initialize Supabase: ${e.toString()}', tag: 'Main', error: e);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = LoggerService();
    logger.info('Building MyApp', tag: 'MyApp');
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(Supabase.instance.client),
        ),
        ChangeNotifierProvider(
          create: (context) => UsersProvider(Supabase.instance.client),
        ),
      ],
      child: MaterialApp(
        title: 'Supabase Gen Test App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.initial,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _client = Supabase.instance.client;
  
  // These will be uncommented after code generation
  // late final _usersRepo = UsersRepository(_client);
  // List<UsersModel> _users = [];
  // String? _error;

  @override
  void initState() {
    super.initState();
    // This will be uncommented after code generation
    // _loadUsers();
  }

  // This will be uncommented after code generation
  // Future<void> _loadUsers() async {
  //   try {
  //     final users = await _usersRepo.findAll();
  //     setState(() {
  //       _users = users;
  //       _error = null;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _error = e.toString();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // This will be uncommented after code generation
              // _loadUsers();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'After running the code generator and uncommenting the code,\n'
              'this app will display a list of users from your Supabase database.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // These will be uncommented after code generation
            // if (_error != null)
            //   Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: Text(
            //       'Error: $_error',
            //       style: TextStyle(color: Theme.of(context).colorScheme.error),
            //     ),
            //   )
            // else if (_users.isEmpty)
            //   const CircularProgressIndicator()
            // else
            //   Expanded(
            //     child: ListView.builder(
            //       itemCount: _users.length,
            //       itemBuilder: (context, index) {
            //         final user = _users[index];
            //         return ListTile(
            //           leading: CircleAvatar(
            //             child: Text(user.email.substring(0, 1).toUpperCase()),
            //           ),
            //           title: Text(user.email),
            //           subtitle: Text(user.id),
            //         );
            //       },
            //     ),
            //   ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // This will be uncommented after code generation
          // final newUser = UsersModel(
          //   id: DateTime.now().millisecondsSinceEpoch.toString(),
          //   email: 'user${DateTime.now().millisecondsSinceEpoch}@example.com',
          //   createdAt: DateTime.now(),
          // );
          // _usersRepo.insert(newUser).then((_) => _loadUsers());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
} 