import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/views/activities/home_activities.dart';

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
        actions: _appBarActions(),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: const HomeActivities(),
    );
  }
}

List<Widget> _appBarActions() => [
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.qr_code_scanner_rounded)),
      IconButton(
          onPressed: () => NavigationController.goTo(Routes.notifications),
          icon: const Icon(Icons.notifications_rounded)),
      // Badge(
      //   ignorePointer: true,
      //   animationType: BadgeAnimationType.scale,
      //   badgeContent: const Text("1", style: TextStyle(color: Colors.white)),
      //   padding: const EdgeInsets.all(8),
      //   position: BadgePosition.bottomStart(bottom: 0, start: 0),
      //   child: IconButton(
      //       onPressed: () => NavigationController.goTo(Routes.notifications),
      //       icon: const Icon(Icons.notifications_rounded)),
      // ),
    ];
