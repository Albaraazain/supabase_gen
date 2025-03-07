// example/lib/main.dart
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:example/generated/models/models.dart';
import 'package:example/generated/repositories/repositories.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'YOUR_SUPABASE_URL',
    anonKey: 'YOUR_SUPABASE_ANON_KEY',
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _usersRepository = UsersRepository(Supabase.instance.client);
  List<UsersModel> _users = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      final users = await _usersRepository.findAll();
      setState(() {
        _users = users;
        _loading = false;
      });
    } catch (e) {
      print('Error loading users: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Example of creating a new user
          final newUser = UsersModel(
            id: 'new-uuid', // In a real app, you'd generate this or let Supabase do it
            name: 'New User',
            email: 'newuser@example.com',
            createdAt: DateTime.now(),
          );
          
          await _usersRepository.insert(newUser);
          await _loadUsers();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}