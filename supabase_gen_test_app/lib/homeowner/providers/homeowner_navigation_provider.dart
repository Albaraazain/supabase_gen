import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import '../screens/homeowner_home_screen.dart';
import '../screens/homeowner_chat_screen.dart';
import '../screens/homeowner_jobs_screen.dart';
import '../screens/homeowner_profile_screen.dart';

class HomeownerNavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  // Define screens for easy access
  static final List<Widget> screens = [
    const HomeownerHomeScreen(),
    const HomeownerChatScreen(),
    const HomeownerJobsScreen(),
    const HomeownerProfileScreen(),
  ];

  // Define tab items
  static final List<FlashyTabBarItem> items = [
    FlashyTabBarItem(
      icon: const Icon(Icons.home_outlined),
      title: const Text('Home'),
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.chat_bubble_outline),
      title: const Text('Chat'),
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.work_outline),
      title: const Text('Jobs'),
    ),
    FlashyTabBarItem(
      icon: const Icon(Icons.person_outline),
      title: const Text('Profile'),
    ),
  ];
} 