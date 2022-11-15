import 'package:flutter/material.dart';
import 'package:referi_app/controllers/activity_controller.dart';
import 'package:referi_app/providers/app_providers.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/models/activity.dart';

import '../../controllers/navigation_controller.dart';
import '../../theme/colors.dart' as colors;

class ActivityPayment extends StatelessWidget {
  const ActivityPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Activity activity = ModalRoute.of(context)!.settings.arguments as Activity;

    return Scaffold(
      appBar: AppBar(title: const Text("Pago")),
      body: _Body(activity),
    );
  }
}

class _Body extends StatelessWidget {
  final Activity activity;
  const _Body(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 40),
      child: Column(
        children: [
          _ActivityCardDetail(activity),
          const SizedBox(height: 24),
          _ActivityFees(activity.tarifas),
          const Spacer(),
          ElevatedButton(
              onPressed: () =>
                  NavigationController.goTo(Routes.activityPaymentData),
              child: const Text("PAGAR")),
          Container(
            padding: const EdgeInsets.only(top: 8),
            width: double.infinity,
            child: OutlinedButton(
                onPressed: () => ActivityController.reservePlace(activity),
                child: const Text("RESERVAR CUPO")),
          )
        ],
      ),
    );
  }
}

class _ActivityCardDetail extends StatelessWidget {
  final Activity activity;
  const _ActivityCardDetail(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = AppProviders.activityProvider(context);
    List<Widget> timeRanges = [];

    for (var time in provider.timeRangesSelected) {
      timeRanges.add(
          _CardInfoRow(label: "Horario elegido", value: time.values.first));
    }

    Widget cardDetails = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _CardInfoRow(label: "Actividad", value: activity.nombre),
          _CardInfoRow(
              label: "Institución", value: activity.organizacion.nombre),
          ...timeRanges
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Detalle de actividad",
          minFontSize: 20,
          maxFontSize: 26,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 100.w,
          child: Card(
            margin: const EdgeInsets.only(top: 16),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: cardDetails,
          ),
        ),
      ],
    );
  }
}

class _CardInfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _CardInfoRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            label,
            style: TextStyle(color: Colors.grey.shade600),
            maxFontSize: 16,
            minFontSize: 12,
          ),
          AutoSizeText(
            value,
            maxFontSize: 18,
            minFontSize: 16,
          ),
        ],
      ),
    );
  }
}

class _ActivityFees extends StatelessWidget {
  final List<Tarifa> fees;
  const _ActivityFees(this.fees, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalSum = 0;
    List<Widget> feesTiles = [];

    for (var fee in fees) {
      feesTiles.add(_CardInfoRow(label: fee.nombre, value: "\$${fee.monto}"));
      totalSum += fee.monto;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: AutoSizeText(
            "Resumen de pago",
            minFontSize: 20,
            maxFontSize: 26,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        ...feesTiles,
        Divider(color: colors.primary),
        _CardInfoRow(label: "Total", value: "\$$totalSum")
      ],
    );
  }
}
