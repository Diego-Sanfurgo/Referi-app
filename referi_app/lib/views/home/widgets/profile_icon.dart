import 'package:flutter/material.dart';

import '/providers/app_providers.dart';
import '/controllers/navigation_controller.dart';

class ProfileIcon extends StatelessWidget {
  final double size;
  final void Function()? onPressed;
  const ProfileIcon({Key? key, required this.size, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imgPath =
        AppProviders.userProvider(context).currentUser!.fotoPerfil;

    return (imgPath == null)
        ? IconButton(
            icon: const Icon(Icons.account_circle_rounded, size: 40),
            onPressed: () => NavigationController.goTo(Routes.profile))
        : IconButton(
            onPressed: () => NavigationController.goTo(Routes.profile),
            icon: CircleAvatar(backgroundImage: NetworkImage(imgPath)),
          );
  }
}
