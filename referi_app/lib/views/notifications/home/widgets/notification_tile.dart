import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import 'package:referi_app/models/dto/notification_dto.dart';

class NotificationTile extends StatelessWidget {
  final DTONotification notification;
  const NotificationTile(this.notification, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date =
        DateFormat.Md("es, ES").format(DateTime.parse(notification.fecha));
    return ListTile(
      title: Text(notification.titulo),
      subtitle: Text(notification.nombreRemitente),
      // leading: const Icon(Icons.check_circle_rounded, color: Colors.green),
      trailing: Text(date),
      horizontalTitleGap: 0,
      onTap: () => NavigationController.goToWithArguments(
          Routes.notificationDetail,
          args: notification),
    );
  }
}
