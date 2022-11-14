import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/theme/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavyBar(
      items: _items,
      onItemSelected: (newIndex) {
        index = newIndex;
        NavigationController.changeNavbarIndex(index);
        setState(() {});
      },
      selectedIndex: index,
      backgroundColor: primary.shade400,
    );

    // return BottomNavigationBar(
    //   currentIndex: index,
    //   onTap: (newIndex) {
    //     index = newIndex;
    //     NavigationController.changeNavbarIndex(index);
    //     setState(() {});
    //   },
    //   items: _items,
    // );
  }
}

List<BottomNavyBarItem> _items = [
  BottomNavyBarItem(
      activeColor: Colors.black87,
      inactiveColor: Colors.black87,
      icon: const Icon(Icons.home_rounded),
      title: const Text('Inicio')),
  BottomNavyBarItem(
      activeColor: Colors.black87,
      inactiveColor: Colors.black87,
      icon: const Icon(Icons.account_balance_wallet_rounded),
      title: const Text('Cuenta')),
  BottomNavyBarItem(
      activeColor: Colors.black87,
      inactiveColor: Colors.black87,
      icon: const Icon(Icons.sports_rounded),
      title: const Text('Clubes')),
  BottomNavyBarItem(
      activeColor: Colors.black87,
      inactiveColor: Colors.black87,
      icon: const Icon(Icons.badge_rounded),
      title: const Text('Credencial')),
];
