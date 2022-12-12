import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/models/dto/notification_dto.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final DTONotification notification;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 60.h,
              width: 90.w,
              child: AutoSizeText(
                notification.cuerpo,
                minFontSize: 16,
                maxFontSize: 26,
              ),
            ),
          )
        ],
      ),
    );
  }
}
