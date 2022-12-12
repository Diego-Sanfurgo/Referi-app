import 'package:flutter/material.dart';
import 'package:referi_app/providers/app_providers.dart';

import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart';

import '/controllers/alert_controller.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double imageAndContainerSize = 30.h;

    String? imgPath =
        AppProviders.userProvider(context).userRegisterModel.fotoPerfil;

    return SizedBox.square(
      dimension: imageAndContainerSize,
      child: Badge(
        stackFit: StackFit.loose,
        badgeColor: Colors.black,
        badgeContent: IconButton(
            onPressed: () => Alert.showImagePickerSheet(),
            icon: const Icon(Icons.camera_alt_rounded),
            color: Colors.white),
        position: BadgePosition.bottomEnd(bottom: 2.h, end: 5.w),
        padding: const EdgeInsets.all(8),
        animationType: BadgeAnimationType.scale,
        animationDuration: Duration.zero,
        child: GestureDetector(
          onTap: () => Alert.showImagePickerSheet(),
          child: imgPath != null
              ? Image.network(imgPath)
              : Icon(
                  Icons.account_circle_rounded,
                  color: Colors.grey,
                  size: imageAndContainerSize,
                ),
        ),
      ),
    );
  }
}
