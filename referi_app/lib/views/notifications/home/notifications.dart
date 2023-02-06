import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/views/loadings/loading_screen.dart';
import '/theme/animations/activities_not_found.dart';

import 'bloc/notifications_bloc.dart';
import 'widgets/notifications_list.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationBloc(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notificaciones")),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget notFoundWidget = const NotFoundAnimation(
      infoText: "No tienes notificaciones",
    );
    return BlocBuilder<NotificationBloc, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsInitial) {
          BlocProvider.of<NotificationBloc>(context).add(FetchNotifications());
          return const LoadingScreen("Cargando notificaciones...");
        }

        if (state is NotificationsResult) {
          if (state.notifications.isEmpty) {
            return notFoundWidget;
          }

          return NotificationsList(state.notifications);
        }

        return notFoundWidget;
      },
    );
  }
}
