// example/lib/main.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// These imports will be available after running the code generator
// import 'package:example/generated/models/models.dart';
// import 'package:example/generated/repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Gen Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
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
  
  // Example: After running the generator, you can use the generated repositories like this:
  // late final _usersRepo = UsersRepository(_client);
  // List<UsersModel> _users = [];

  @override
  void initState() {
    super.initState();
    // Example: Load users
    // _loadUsers();
  }

  // Example: Load users using the generated repository
  // Future<void> _loadUsers() async {
  //   try {
  //     final users = await _usersRepo.findAll();
  //     setState(() {
  //       _users = users;
  //     });
  //   } catch (e) {
  //     // Handle error
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Gen Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'After running the code generator, uncomment the code to see it in action!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            // Example: Display users
            // if (_users.isEmpty)
            //   const CircularProgressIndicator()
            // else
            //   Expanded(
            //     child: ListView.builder(
            //       itemCount: _users.length,
            //       itemBuilder: (context, index) {
            //         final user = _users[index];
            //         return ListTile(
            //           title: Text(user.name ?? 'No name'),
            //           subtitle: Text(user.email),
            //         );
            //       },
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}