import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/theme/colors.dart';
import 'package:referi_app/widgets/tile_leading_icon.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: <Widget>[
        const SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: AutoSizeText(
              "Actividad de la cuenta",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            separatorBuilder: (context, index) =>
                Divider(color: primary.shade800, height: 0),
            itemBuilder: (context, index) {
              if (index == 4) {
                return ListTile(
                  onTap: () => NavigationController.goTo(Routes.operationDetail),
                  leading: const TileLeadingIcon(Icons.draw_rounded),
                  title: const Text("Inscipción",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text("Club Andino"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("\$2500",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(DateFormat.Md('es, ES')
                          .format(DateTime.now())
                          .toString()),
                    ],
                  ),
                );
              } else if (index > 4) {
                return ListTile(
                  onTap: () => NavigationController.goTo(Routes.operationDetail),
                  leading: TileLeadingIcon(
                    Icons.payments_rounded,
                    color: Colors.green[400],
                  ),
                  title: const Text("Pago de cuota",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text("Club Obras"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("\$2500",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(DateFormat.Md('es, ES')
                          .format(DateTime.now())
                          .toString()),
                    ],
                  ),
                );
              } else {
                return ListTile(
                  onTap: () => NavigationController.goTo(Routes.operationDetail),
                  leading: TileLeadingIcon(
                    Icons.priority_high_rounded,
                    color: Colors.red[400],
                  ),
                  title: const Text("Pago de cuota rechazado",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text("Club Obras"),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("\$2500",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(DateFormat.Md('es, ES')
                          .format(DateTime.now())
                          .toString()),
                    ],
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
