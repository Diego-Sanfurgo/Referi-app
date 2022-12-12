import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/controllers/navigation_controller.dart';
import '/views/notifications/home/bloc/notifications_bloc.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc(),
      child: const _BadgeIcon(),
    );
  }
}

class _BadgeIcon extends StatefulWidget {
  const _BadgeIcon();

  @override
  State<_BadgeIcon> createState() => _BadgeIconState();
}

class _BadgeIconState extends State<_BadgeIcon> {
  @override
  Widget build(BuildContext context) {
    bool showBadge = false;
    String notificationAmount = "1";

    return BlocBuilder<NotificationsBloc, NotificationsState>(
      // buildWhen: (previous, current) {
      //   if (current is IconNotificationResults) {
      //     return true;
      //   }

      //   return false;
      // },
      builder: (context, state) {
        if (state is IconNotificationResults) {
          notificationAmount = state.amount;
          showBadge = true;
        } else {
          showBadge = false;
        }

        return Badge(
          showBadge: showBadge,
          ignorePointer: true,
          animationType: BadgeAnimationType.scale,
          badgeContent: Text(notificationAmount,
              style: const TextStyle(color: Colors.white)),
          padding: const EdgeInsets.all(8),
          position: BadgePosition.bottomStart(bottom: 0, start: 0),
          child: IconButton(
              onPressed: () => NavigationController.goTo(Routes.notifications),
              icon: const Icon(Icons.notifications_rounded)),
        );
      },
    );
  }
}
