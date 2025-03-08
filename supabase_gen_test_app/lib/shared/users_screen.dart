import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'users_provider.dart';
import '../services/logger_service.dart';

/// Screen for displaying all users
class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final LoggerService _logger = LoggerService();
  
  @override
  void initState() {
    super.initState();
    _logger.info('UsersScreen initialized', tag: 'UsersScreen');
    _loadUsers();
  }
  
  @override
  void dispose() {
    _logger.info('UsersScreen disposed', tag: 'UsersScreen');
    super.dispose();
  }

  Future<void> _loadUsers() async {
    _logger.info('Loading users', tag: 'UsersScreen');
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    await usersProvider.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    _logger.debug('UsersScreen build', tag: 'UsersScreen');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Consumer<UsersProvider>(
        builder: (context, usersProvider, child) {
          if (usersProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (usersProvider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${usersProvider.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadUsers,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          final users = usersProvider.users;
          if (users.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: user.userType == 'homeowner' 
                      ? Colors.green.shade100 
                      : Colors.blue.shade100,
                  child: Icon(
                    user.userType == 'homeowner' ? Icons.home : Icons.handyman,
                    color: user.userType == 'homeowner' 
                        ? Colors.green.shade700 
                        : Colors.blue.shade700,
                  ),
                ),
                title: Text(user.fullName ?? 'No name'),
                subtitle: Text(user.email),
                trailing: Chip(
                  label: Text(
                    user.userType == 'homeowner' ? 'Homeowner' : 'Professional',
                    style: TextStyle(
                      color: user.userType == 'homeowner' 
                          ? Colors.green.shade700 
                          : Colors.blue.shade700,
                    ),
                  ),
                  backgroundColor: user.userType == 'homeowner' 
                      ? Colors.green.shade50 
                      : Colors.blue.shade50,
                ),
              );
            },
          );
        },
      ),
    );
  }
} 