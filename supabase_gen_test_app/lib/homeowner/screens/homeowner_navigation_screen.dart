import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import '../providers/homeowner_navigation_provider.dart';

class HomeownerNavigationScreen extends StatelessWidget {
  const HomeownerNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeownerNavigationProvider(),
      child: const HomeownerNavigationContent(),
    );
  }
}

class HomeownerNavigationContent extends StatelessWidget {
  const HomeownerNavigationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<HomeownerNavigationProvider>(
      context,
    );

    return Scaffold(
      body: IndexedStack(
        index: navigationProvider.selectedIndex,
        children: HomeownerNavigationProvider.screens,
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: navigationProvider.selectedIndex,
        showElevation: true,
        onItemSelected: navigationProvider.setIndex,
        items: HomeownerNavigationProvider.items,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
      ),
    );
  }
}
