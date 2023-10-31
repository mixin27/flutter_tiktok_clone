import 'package:flutter/material.dart';
import 'package:tiktok_clone/src/pages/discover_page.dart';
import 'package:tiktok_clone/src/pages/home_page.dart';
import 'package:tiktok_clone/src/pages/profile_page.dart';

import 'src/widgets/custom_bottom_navigation_bar.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({super.key});

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedPageIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    DiscoverPage(),
    ProfilePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_selectedPageIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedPageIndex: _selectedPageIndex,
        onSelect: (index) => setState(() => _selectedPageIndex = index),
      ),
    );
  }
}
