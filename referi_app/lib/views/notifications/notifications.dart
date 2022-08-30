import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.separated(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const _NotificationListTile(
              "El pago de tu cuota fue realizado con éxito.");
        },
        separatorBuilder: (ctx, idx) =>
            const Divider(color: Colors.grey, height: 8),
      ),
    );
  }
}

class _NotificationListTile extends StatelessWidget {
  final String title;
  const _NotificationListTile(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: AutoSizeText(title),
      leading: const Icon(Icons.check_circle_rounded, color: Colors.green),
      horizontalTitleGap: 0,
      onTap: () {},
    );
  }
}
