import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';

import '../bloc/notifications_bloc.dart';
import '/models/dto/notification_dto.dart';
import '/controllers/navigation_controller.dart';

class NotificationTile extends StatelessWidget {
  final DTONotification notification;
  const NotificationTile(this.notification, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date =
        DateFormat.Md("es, ES").format(DateTime.parse(notification.fecha));
    return ListTile(
      title: decideIfBold(notification.titulo, notification),
      subtitle: decideIfBold(notification.nombreRemitente, notification),
      trailing: decideIfBold(date, notification),
      tileColor: notification.read ? Colors.white : Colors.blueGrey.shade50,
      horizontalTitleGap: 0,
      onTap: () {
        if (!notification.read) {
          BlocProvider.of<NotificationBloc>(context)
              .add(ReadNotification(notification.parentId!));
        }
        NavigationController.goToWithArguments(Routes.notificationDetail,
            args: notification);
      },
    );
  }
}

decideIfBold(String text, DTONotification notification) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: notification.read ? FontWeight.normal : FontWeight.bold),
  );
}
