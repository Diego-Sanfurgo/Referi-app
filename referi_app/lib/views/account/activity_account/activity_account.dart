import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/theme/colors.dart' as colors;
import '/models/activity_fee_payment.dart';
import '../account_home/widgets/operation_tile.dart';

class ActivityAccount extends StatelessWidget {
  const ActivityAccount({super.key});

  @override
  Widget build(BuildContext context) {
    List<ActivityFeePayment> list =
        ModalRoute.of(context)?.settings.arguments as List<ActivityFeePayment>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuenta de actividad"),
      ),
      body: _Body(list),
    );
  }
}

class _Body extends StatelessWidget {
  final List<ActivityFeePayment> list;
  const _Body(this.list);

  @override
  Widget build(BuildContext context) {
    List<Widget> listTiles = _buildListTile(list);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: listTiles.length,
        separatorBuilder: (context, index) =>
            Divider(color: colors.primary.shade800, height: 0),
        itemBuilder: (context, index) {
          return listTiles[index];
        },
      ),
    );
  }
}

List<Widget> _buildListTile(List<ActivityFeePayment> list) {
  List<Widget> auxList = [];

  for (var cuota in list) {
    IconData icon = Icons.request_page_rounded;
    Color iconColor = colors.secondary;
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

    auxList.add(OperationTile(
      cuota: cuota,
      icon: icon,
      iconColor: iconColor,
      statusText: statusText,
    ));
  }
  return auxList;
}
