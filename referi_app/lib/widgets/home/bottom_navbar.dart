import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

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
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (newIndex) {
        index = newIndex;
        NavigationController.changeNavbarIndex(index);
        setState(() {});
      },
      items: _items,
    );
  }
}

List<BottomNavigationBarItem> _items = const [
  BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Inicio'),
  BottomNavigationBarItem(
      icon: Icon(Icons.account_balance_wallet_rounded), label: 'Cuenta'),
  BottomNavigationBarItem(icon: Icon(Icons.sports_rounded), label: 'Clubes'),
  BottomNavigationBarItem(icon: Icon(Icons.badge_rounded), label: 'Credencial'),
];
