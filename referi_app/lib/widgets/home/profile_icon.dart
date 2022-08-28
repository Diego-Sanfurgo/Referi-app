import 'package:flutter/material.dart';

import '../../controllers/navigation_controller.dart';

class ProfileIcon extends StatelessWidget {
  final double size;
  final void Function()? onPressed;
  const ProfileIcon({Key? key, required this.size, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //       image: DecorationImage(
    //           image: NetworkImage(
    //         'url',
    //       )),
    //       shape: BoxShape.circle),
    // );
    return IconButton(
        icon: const Icon(Icons.account_circle_rounded, size: 40),
        onPressed: () => NavigationController.goTo(Routes.profile));
  }
}
