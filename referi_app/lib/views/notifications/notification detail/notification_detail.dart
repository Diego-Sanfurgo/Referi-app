import 'package:flutter/material.dart';

import '/models/dto/notification_dto.dart';

import 'widgets/notification_body.dart';
import 'widgets/notification_header.dart';

class NotificationDetail extends StatelessWidget {
  const NotificationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    DTONotification notification =
        ModalRoute.of(context)?.settings.arguments as DTONotification;

    return Scaffold(
      appBar: AppBar(title: const Text("Notificación")),
      body: _Body(notification),
    );
  }
}

class _Body extends StatelessWidget {
  final DTONotification notification;
  const _Body(this.notification);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        NotificationHeader(notification: notification),
        NotificationBody(notification: notification),
      ],
    );
  }
}
