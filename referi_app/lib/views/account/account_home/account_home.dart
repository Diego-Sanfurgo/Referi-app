import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/theme/colors.dart';
import 'widgets/operation_tile.dart';
import '/models/activity_fee_payment.dart';
import '/controllers/payment_controller.dart';
import '/theme/animations/activities_not_found.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => PaymentController.getUserFees(),
      child: const CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
        ],
      ),
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
        List<Widget> listTiles = _buildListTile(list);

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

List<Widget> _buildListTile(List<ActivityFeePayment> list) {
  List<Map<String, dynamic>> groupedFees = [];
  for (var cuota in list) {
    var previousItems = list.getRange(0, list.indexOf(cuota));
    bool alreadyRead = previousItems
            .where((element) => element.actividad.id == cuota.actividad.id)
            .isNotEmpty
        ? true
        : false;
    if (alreadyRead) {
      continue;
    }

    groupedFees.add({
      cuota.actividad.nombre: list
          .where((element) => element.actividad.id == cuota.actividad.id)
          .toList()
    });
  }
  List<Widget> auxList = [];

  for (var group in groupedFees) {
    //TODO
    auxList.add(ListTile(
      title: Text(group.keys.first),
      trailing: Icon(Icons.keyboard_arrow_right_rounded),
    ));
  }

  print(groupedFees);
  print(auxList);
  return auxList;

  for (var cuota in list) {
    IconData icon = Icons.request_page_rounded;
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

    auxList.add(OperationTile(
      cuota: cuota,
      icon: icon,
      iconColor: iconColor,
      statusText: statusText,
    ));
  }
  return auxList;
}
