import 'package:flutter/material.dart';

import '/providers/app_providers.dart';
import '../clubs/clubs home/clubs_home.dart';
import '../activities/home/activities_home.dart';
import '/controllers/navigation_controller.dart';
import '../account/account_home/account_home.dart';
import '../credential/credential home/credential_home.dart';

import 'widgets/bottom_navbar.dart';
import 'widgets/notification_icon.dart';
import 'widgets/profile_icon.dart';

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
        valueListenable: AppProviders.navigationProvider(context).navbarIndex,
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
      valueListenable: AppProviders.navigationProvider(context).navbarIndex,
      builder: (BuildContext context, int value, Widget? child) {
        String nombre =
            AppProviders.userProvider(context).currentUser?.nombre ?? '';
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
      const NotificationIcon(),
    ];
