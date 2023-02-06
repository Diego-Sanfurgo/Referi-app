import 'dart:async';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as bd;
import 'package:flutter_bloc/flutter_bloc.dart';

import '/providers/app_providers.dart';
import '/controllers/navigation_controller.dart';
import '/views/notifications/home/bloc/notifications_bloc.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
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
  int vecesCargado = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationBloc>(context).add(FetchNotifications());

    Timer.periodic(
      const Duration(seconds: 30),
      (timer) {
        BlocProvider.of<NotificationBloc>(context).add(FetchNotifications());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool showBadge = false;

    return ValueListenableBuilder<int>(
      valueListenable: AppProviders.navigationProvider(context).unreadAmount,
      builder: (BuildContext context, int value, Widget? child) {
        showBadge = value > 0 ? true : false;

        return bd.Badge(
          showBadge: showBadge,
          ignorePointer: true,
          badgeAnimation: const bd.BadgeAnimation.scale(),
          badgeContent:
              Text("$value", style: const TextStyle(color: Colors.white)),
          badgeStyle: const bd.BadgeStyle(
            padding: EdgeInsets.all(8),
          ),
          position: bd.BadgePosition.bottomStart(bottom: 0, start: 0),
          child: IconButton(
              onPressed: () => NavigationController.goTo(Routes.notifications),
              icon: const Icon(Icons.notifications_rounded)),
        );
      },
    );
  }
}
