import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../controllers/navigation_controller.dart';
import '../../theme/colors.dart' as colors;



class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const _ProfileImage(),
        const AutoSizeText("Tu foto se podrá usar para credenciales.",
            maxFontSize: 16, minFontSize: 12),
        const SizedBox(height: 8),
        Divider(color: colors.secondaryDark),
        SizedBox(height: 4.6.h),
        const _ActionsList(),
      ]),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageAndContainerSize = 30.h;

    return SizedBox(
      width: imageAndContainerSize,
      height: imageAndContainerSize,
      child: Badge(
        stackFit: StackFit.loose,
        badgeColor: Colors.black,
        badgeContent: const Icon(Icons.camera_alt_rounded, color: Colors.white),
        position: BadgePosition.bottomEnd(bottom: 2.h, end: 5.w),
        padding: const EdgeInsets.all(8),
        animationType: BadgeAnimationType.scale,
        animationDuration: Duration.zero,
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.account_circle_rounded,
            color: Colors.grey,
            size: imageAndContainerSize,
          ),
        ),
      ),
    );
  }
}

class _ActionsList extends StatelessWidget {
  const _ActionsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person_rounded),
          trailing: const Icon(Icons.keyboard_arrow_right),
          title: const AutoSizeText("Datos personales"),
          onTap: () => NavigationController.goTo(Routes.personalData),
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          trailing: const Icon(Icons.keyboard_arrow_right),
          title: const AutoSizeText("Cerrar sesión"),
          onTap: () {},
        ),
      ],
    );
  }
}
