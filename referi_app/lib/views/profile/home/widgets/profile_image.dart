import 'package:flutter/material.dart';
import 'package:referi_app/providers/app_providers.dart';

import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart' as bd;

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
      child: bd.Badge(
        stackFit: StackFit.loose,
        badgeStyle: const bd.BadgeStyle(
          badgeColor: Colors.black,
          padding: EdgeInsets.all(8),
        ),
        badgeContent: IconButton(
            onPressed: () => Alert.showImagePickerSheet(),
            icon: const Icon(Icons.camera_alt_rounded),
            color: Colors.white),
        position: bd.BadgePosition.bottomEnd(bottom: 2.h, end: 5.w),
        badgeAnimation: const bd.BadgeAnimation.scale(
          animationDuration: Duration.zero,
        ),
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
