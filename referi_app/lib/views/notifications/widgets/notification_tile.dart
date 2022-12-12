import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  const NotificationTile(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(title),
      // leading: const Icon(Icons.check_circle_rounded, color: Colors.green),
      horizontalTitleGap: 0,
      onTap: () {},
    );
  }
}
