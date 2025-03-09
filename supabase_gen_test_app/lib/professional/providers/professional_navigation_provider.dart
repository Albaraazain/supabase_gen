import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import '../screens/professional_dashboard_screen.dart';
import '../screens/professional_jobs_screen.dart';
import '../screens/professional_earnings_screen.dart';
import '../screens/professional_profile_screen.dart';

class ProfessionalNavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Define screens for easy access
  static final List<Widget> screens = [
    const ProfessionalDashboardScreen(),
    const ProfessionalJobsScreen(),
    const ProfessionalEarningsScreen(),
    const ProfessionalProfileScreen(),
  ];

  // Define tab items
  static final List<FlashyTabBarItem> items = [
    FlashyTabBarItem(
      icon: const Icon(Icons.dashboard_outlined),
      title: const Text('Dashboard'),
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.work_outline),
      title: const Text('Jobs'),
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.account_balance_wallet_outlined),
      title: const Text('Earnings'),
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.person_outline),
      title: const Text('Profile'),
    ),
  ];
} 