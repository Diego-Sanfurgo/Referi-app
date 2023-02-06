import 'package:flutter/material.dart';
import 'package:referi_app/models/dto/notification_dto.dart';

import 'notification_tile.dart';

class NotificationsList extends StatelessWidget {
  final List<DTONotification> notifications;
  const NotificationsList(
    this.notifications, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    notifications.sort(
      (a, b) {
        DateTime first = DateTime.parse(a.fecha);
        DateTime second = DateTime.parse(b.fecha);
        return second.compareTo(first);
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationTile(notifications[index]);
        },
        separatorBuilder: (ctx, idx) =>
            const Divider(color: Colors.grey, height: 8),
      ),
    );
  }
}
