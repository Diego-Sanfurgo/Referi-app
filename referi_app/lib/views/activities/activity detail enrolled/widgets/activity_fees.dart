import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/models/activity_fee.dart';
import '/controllers/fee_controller.dart';
import '/theme/animations/activities_not_found.dart';

class ActivityFees extends StatelessWidget {
  final String activityId;
  const ActivityFees(this.activityId, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ActivityFee>?>(
      future: FeeController.getActivityFees(activityId),
      builder:
          (BuildContext context, AsyncSnapshot<List<ActivityFee>?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: LinearProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const NotFoundAnimation();
        }

        List<ActivityFee> list = snapshot.data as List<ActivityFee>;
        List<Widget> fees = [];
        for (var fee in list) {
          fees.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(fee.nombre),
              Text(fee.frecuencia.nombre),
              Text("\$${fee.monto}"),
            ],
          ));
        }
        return Padding(
          padding: const EdgeInsets.only(top: 16),
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
    );
  }
}
