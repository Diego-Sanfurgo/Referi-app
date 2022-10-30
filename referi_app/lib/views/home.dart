import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../controllers/navigation_controller.dart';
import '../../providers/app_providers.dart';

import '../../views/clubs/clubs_home.dart';
import '../../views/account/account_home.dart';
import 'credential/credential_home.dart';
import '../../views/activities/activities_home.dart';

import '../widgets/home/bottom_navbar.dart';
import '../../widgets/home/profile_icon.dart';

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
        title: const _AppBarTitle(),
        actions: _appBarActions,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: ValueListenableBuilder<int>(
        valueListenable: AppProviders.navigationProvider.navbarIndex,
        builder: (BuildContext context, int value, Widget? child) {
          switch (value) {
            case 0:
              return const ActivitiesHome();
            case 1:
              return const AccountHome();
            case 2:
              return const ClubsHome();
            case 3:
              return const CredentialHome();
            default:
              return const ActivitiesHome();
          }
        },
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: AppProviders.navigationProvider.navbarIndex,
      builder: (BuildContext context, int value, Widget? child) {
        String nombre = AppProviders.userProvider(context).currentUser?.nombre ?? '';
        switch (value) {
          case 0:
            return Text("Hola $nombre");
          case 1:
            return const Text("Cuenta");
          case 2:
            return const Text("Clubes");
          case 3:
            return const Text("Credenciales");
          default:
            return const Text("Hola Diego");
        }
      },
    );
  }
}

List<Widget> get _appBarActions => [
      IconButton(
          onPressed: () => NavigationController.goTo(Routes.scanner),
          icon: const Icon(Icons.qr_code_scanner_rounded)),
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
