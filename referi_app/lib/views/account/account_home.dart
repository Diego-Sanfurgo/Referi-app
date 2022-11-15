import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/controllers/payment_controller.dart';
import 'package:referi_app/theme/animations/activities_not_found.dart';
import 'package:referi_app/theme/colors.dart';
import 'package:referi_app/widgets/tile_leading_icon.dart';

import '../../models/activity_fee_payment.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: AutoSizeText(
              "Actividad de la cuenta",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: _AccountActivity(),
        ),
        // SliverToBoxAdapter(
        //   child: ListView.separated(
        //     physics: const NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     itemCount: 10,
        //     separatorBuilder: (context, index) =>
        //         Divider(color: primary.shade800, height: 0),
        //     itemBuilder: (context, index) {
        //       if (index == 4) {
        //         return ListTile(
        //           onTap: () =>
        //               NavigationController.goTo(Routes.operationDetail),
        //           leading: const TileLeadingIcon(Icons.draw_rounded),
        //           title: const Text("Inscipción",
        //               style: TextStyle(fontWeight: FontWeight.bold)),
        //           subtitle: const Text("Club Andino"),
        //           trailing: Column(
        //             crossAxisAlignment: CrossAxisAlignment.end,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               const Text("\$2500",
        //                   style: TextStyle(fontWeight: FontWeight.bold)),
        //               Text(DateFormat.Md('es, ES')
        //                   .format(DateTime.now())
        //                   .toString()),
        //             ],
        //           ),
        //         );
        //       } else if (index > 4) {
        //         return ListTile(
        //           onTap: () =>
        //               NavigationController.goTo(Routes.operationDetail),
        //           leading: TileLeadingIcon(
        //             Icons.payments_rounded,
        //             color: Colors.green[400],
        //           ),
        //           title: const Text("Pago de cuota",
        //               style: TextStyle(fontWeight: FontWeight.bold)),
        //           subtitle: const Text("Club Obras"),
        //           trailing: Column(
        //             crossAxisAlignment: CrossAxisAlignment.end,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               const Text("\$2500",
        //                   style: TextStyle(fontWeight: FontWeight.bold)),
        //               Text(DateFormat.Md('es, ES')
        //                   .format(DateTime.now())
        //                   .toString()),
        //             ],
        //           ),
        //         );
        //       } else {
        //         return ListTile(
        //           onTap: () =>
        //               NavigationController.goTo(Routes.operationDetail),
        //           leading: TileLeadingIcon(
        //             Icons.priority_high_rounded,
        //             color: Colors.red[400],
        //           ),
        //           title: const Text("Pago de cuota rechazado",
        //               style: TextStyle(fontWeight: FontWeight.bold)),
        //           subtitle: const Text("Club Obras"),
        //           trailing: Column(
        //             crossAxisAlignment: CrossAxisAlignment.end,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               const Text("\$2500",
        //                   style: TextStyle(fontWeight: FontWeight.bold)),
        //               Text(DateFormat.Md('es, ES')
        //                   .format(DateTime.now())
        //                   .toString()),
        //             ],
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // )
      ],
    );
  }
}

class _AccountActivity extends StatelessWidget {
  const _AccountActivity();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActivityFeePayment>>(
      future: PaymentController.getUserFees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData) {
          return const NotFoundAnimation();
        }
        List<ActivityFeePayment> list = snapshot.data;
        List<Widget> listTiles = [];

        for (var cuota in list) {
          IconData icon = Icons.draw_rounded;
          Color iconColor = secondary;
          bool isExpired = DateTime.now().isAfter(cuota.fechaVencimiento);
          String statusText =
              "vto:${DateFormat.Md('es, ES').format(cuota.fechaVencimiento)}";

          if (cuota.pago != null) {
            icon = Icons.payments_rounded;
            iconColor = Colors.green.shade400;
            statusText = "Pagado";
          }
          if (cuota.pago == null && isExpired) {
            icon = Icons.priority_high_rounded;
            iconColor = Colors.red.shade400;
            statusText = "Vencido$statusText";
          }

          listTiles.add(ListTile(
            onTap: () => NavigationController.goTo(Routes.operationDetail),
            leading: TileLeadingIcon(icon, color: iconColor),
            title: Text(cuota.tarifa.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(cuota.tarifa.actividad.nombre),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\$${cuota.tarifa.monto}",
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(statusText),
              ],
            ),
          ));
        }

        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listTiles.length,
          separatorBuilder: (context, index) =>
              Divider(color: primary.shade800, height: 0),
          itemBuilder: (context, index) {
            return listTiles[index];
          },
        );
      },
    );
  }
}
