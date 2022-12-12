import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/models/activity_fee.dart';
import '/controllers/fee_controller.dart';

class ActivityFees extends StatelessWidget {
  final String activityId;
  const ActivityFees(this.activityId, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: FutureBuilder<List<ActivityFee>?>(
        future: FeeController.getActivityFees(activityId),
        builder:
            (BuildContext context, AsyncSnapshot<List<ActivityFee>?> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Padding(
                padding: EdgeInsets.all(16), child: LinearProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const AutoSizeText(
                "No se encontraron tarifas para esta actividad.");
          }

          List<ActivityFee> list = snapshot.data as List<ActivityFee>;
          List<Widget> fees = [];

          for (var fee in list) {
            Widget feeRow = Padding(
              padding: const EdgeInsets.all(8),
              child: Table(
                children: [
                  TableRow(children: [
                    TableCell(child: Text(fee.nombre)),
                    TableCell(child: Text(fee.frecuencia.nombre)),
                    TableCell(child: Text("\$${fee.monto}")),
                  ])
                ],
              ),
            );

            fees.add(feeRow);
          }
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Tarifas",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...fees
              ],
            ),
          );
        },
      ),
    );
  }
}
