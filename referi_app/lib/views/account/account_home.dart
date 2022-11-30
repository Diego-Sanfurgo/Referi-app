import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../theme/colors.dart';
import '../../widgets/tile_leading_icon.dart';
import '../../controllers/payment_controller.dart';
import '../../controllers/navigation_controller.dart';
import '../../theme/animations/activities_not_found.dart';

import '../../models/activity_fee_payment.dart';

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
          child: RefreshIndicator(
              onRefresh: () => PaymentController.getUserFees(),
              child: const _AccountActivity()),
        ),
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
            statusText = "Vencido $statusText";
          }

          listTiles.add(_OperationTile(
            cuota: cuota,
            icon: icon,
            iconColor: iconColor,
            statusText: statusText,
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

class _OperationTile extends StatelessWidget {
  const _OperationTile({
    Key? key,
    required this.cuota,
    required this.icon,
    required this.iconColor,
    required this.statusText,
  }) : super(key: key);

  final ActivityFeePayment cuota;
  final IconData icon;
  final Color iconColor;
  final String statusText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => NavigationController.goToWithArguments(
          Routes.operationDetail,
          args: cuota),
      leading: TileLeadingIcon(icon, color: iconColor),
      title: Text(cuota.tarifa.nombre,
          style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(cuota.actividad.nombre),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("\$${cuota.tarifa.monto}",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(statusText),
        ],
      ),
    );
  }
}
