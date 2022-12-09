import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:referi_app/controllers/activity_controller.dart';
import 'package:referi_app/models/activity.dart';

import '/models/activity_fee_payment.dart';
import '/controllers/payment_controller.dart';
import '/controllers/navigation_controller.dart';
import '/theme/animations/activities_not_found.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
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
          return const Center(child: CircularProgressIndicator());
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
              Divider(color: Colors.grey.shade400, height: 0),
          itemBuilder: (context, index) {
            return listTiles[index];
          },
        );
      },
    );
  }
}

List<Widget> _buildListTile(List<ActivityFeePayment> list) {
  List<Map<String, List<ActivityFeePayment>>> groupedFees = [];
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
    String activityId = group.values.first.first.actividad.id;
    Widget orgName = FutureBuilder<Activity>(
      future: ActivityController.obtainActivityById(activityId),
      builder: (BuildContext context, AsyncSnapshot<Activity> snapshot) {
        if (!snapshot.hasData) {
          return const Text("Institución");
        }
        return Text(snapshot.data!.organizacion.nombre);
      },
    );

    auxList.add(ListTile(
      title: Text(group.keys.first),
      subtitle: orgName,
      trailing: const Icon(Icons.keyboard_arrow_right_rounded),
      onTap: () => NavigationController.goToWithArguments(
          Routes.activityAccount,
          args: group.values.first),
    ));
  }

  return auxList;
}
