import 'package:flutter/material.dart';

import 'notification_tile.dart';

class NotificationsList extends StatelessWidget {
  final List notifications;
  const NotificationsList(
    this.notifications, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return const NotificationTile(
              "El pago de tu cuota fue realizado con éxito.");
        },
        separatorBuilder: (ctx, idx) =>
            const Divider(color: Colors.grey, height: 8),
      ),
    );
  }
}
