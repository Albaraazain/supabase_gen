import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/auth_provider.dart';
import '../providers/professional_profile_provider.dart';
import '../providers/professional_services_provider.dart';
import '../../router/app_router.dart';
import '../../services/logger_service.dart';

/// Home screen for professionals
class ProfessionalHomeScreen extends StatefulWidget {
  const ProfessionalHomeScreen({super.key});

  @override
  State<ProfessionalHomeScreen> createState() => _ProfessionalHomeScreenState();
}

class _ProfessionalHomeScreenState extends State<ProfessionalHomeScreen> {
  final LoggerService _logger = LoggerService();
  int _selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _logger.info('ProfessionalHomeScreen initialized', tag: 'ProfessionalHomeScreen');
  }
  
  @override
  void dispose() {
    _logger.info('ProfessionalHomeScreen disposed', tag: 'ProfessionalHomeScreen');
    super.dispose();
  }

  void _onItemTapped(int index) {
    _logger.debug('Bottom navigation item tapped: $index', tag: 'ProfessionalHomeScreen');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    
    _logger.debug('ProfessionalHomeScreen build, user: ${user?.email}', tag: 'ProfessionalHomeScreen');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Dashboard'),
        backgroundColor: Colors.blue.shade800,
        actions: [
          IconButton(
            icon: const Icon(Icons.people),
            onPressed: () {
              _logger.debug('Navigating to Users screen', tag: 'ProfessionalHomeScreen');
              Navigator.pushNamed(context, AppRouter.users);
            },
            tooltip: 'View Users',
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              _logger.debug('Sign out requested', tag: 'ProfessionalHomeScreen');
              await authProvider.signOut();
            },
            tooltip: 'Sign Out',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue.shade100,
                            child: Icon(
                              Icons.handyman,
                              size: 40,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome, Professional!',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (user != null && user.email != null)
                                  Text(
                                    user.email!,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Stats row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard(context, '0', 'Active Jobs'),
                          _buildStatCard(context, '0', 'Completed'),
                          _buildStatCard(context, '\$0', 'Earnings'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Available jobs section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Jobs',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _logger.debug('View All Jobs tapped', tag: 'ProfessionalHomeScreen');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('View All Jobs feature coming soon')),
                      );
                    },
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Placeholder for available jobs
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'No available jobs at the moment',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Quick actions section
              Text(
                'Quick Actions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Action buttons
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildActionCard(
                    context,
                    icon: Icons.search,
                    title: 'Find Jobs',
                    color: Colors.orange,
                    onTap: () {
                      _logger.debug('Find Jobs tapped', tag: 'ProfessionalHomeScreen');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Find Jobs feature coming soon')),
                      );
                    },
                  ),
                  _buildActionCard(
                    context,
                    icon: Icons.work,
                    title: 'My Jobs',
                    color: Colors.green,
                    onTap: () {
                      _logger.debug('My Jobs tapped', tag: 'ProfessionalHomeScreen');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('My Jobs feature coming soon')),
                      );
                    },
                  ),
                  _buildActionCard(
                    context,
                    icon: Icons.account_balance_wallet,
                    title: 'Earnings',
                    color: Colors.purple,
                    onTap: () {
                      _logger.debug('Earnings tapped', tag: 'ProfessionalHomeScreen');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Earnings feature coming soon')),
                      );
                    },
                  ),
                  _buildActionCard(
                    context,
                    icon: Icons.settings,
                    title: 'Settings',
                    color: Colors.grey,
                    onTap: () {
                      _logger.debug('Settings tapped', tag: 'ProfessionalHomeScreen');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Settings feature coming soon')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
  
  Widget _buildStatCard(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade800,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
  
  Widget _buildActionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 