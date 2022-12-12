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
      create: (context) => NotificationsBloc(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatefulWidget {
  const _NotificationsView({Key? key}) : super(key: key);

  @override
  State<_NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<_NotificationsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationsBloc>(context).add(ClearIconNotifications());
  }

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
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsInitial) {
          BlocProvider.of<NotificationsBloc>(context).add(FetchNotifications());
          return const LoadingScreen("Cargando notificaciones...");
        } else if (state is NotificationsResult) {
          if (state.notifications.isEmpty) {
            return notFoundWidget;
          }

          return NotificationsList(state.notifications);
        } else {
          return notFoundWidget;
        }
      },
    );
  }
}
