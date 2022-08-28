import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import 'package:referi_app/widgets/bottom_navbar.dart';
import 'package:referi_app/widgets/home/profile_icon.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ProfileIcon(
          size: 40,
          onPressed: () => NavigationController.goTo(Routes.profile),
        ),
        title: const Text("Hola Diego"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner_rounded)),
          IconButton(
              onPressed: () => NavigationController.goTo(Routes.notifications),
              icon: const Icon(Icons.notifications_rounded))
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
