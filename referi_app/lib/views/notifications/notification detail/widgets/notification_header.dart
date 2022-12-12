import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/theme/colors.dart';
import '/models/dto/notification_dto.dart';

class NotificationHeader extends StatelessWidget {
  const NotificationHeader({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final DTONotification notification;

  @override
  Widget build(BuildContext context) {
    String date =
        DateFormat.yMMMd("es, ES").format(DateTime.parse(notification.fecha));

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AutoSizeText(
                    date,
                    minFontSize: 16,
                    maxFontSize: 22,
                  ),
                ],
              ),
            ),
            AutoSizeText(
              notification.titulo,
              minFontSize: 18,
              maxFontSize: 28,
              maxLines: 3,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Divider(color: primary.shade300),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AutoSizeText(
                  notification.nombreRemitente,
                  minFontSize: 16,
                  maxFontSize: 22,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
