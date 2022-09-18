import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/theme/colors.dart' as colors;

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final imagePath = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de actividad")),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeaderActivity(),
          const _TimeRanges(),
          const _Fees(),
          ElevatedButton(
              onPressed: () =>
                  NavigationController.goTo(Routes.activityPayment),
              child: const Text("INSCRIBIRSE"))
        ],
      ),
    );
  }
}

class _HeaderActivity extends StatelessWidget {
  const _HeaderActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = "assets/images/futbol_regatas.jpg";
    return Container(
      width: 100.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 100.w,
              height: 25.h,
            ),
          ),
          ListTile(
            title: const AutoSizeText(
              "Activity name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const AutoSizeText("Club regatas"),
              AutoSizeText(
                "Ver más actividades del club",
                style: TextStyle(color: colors.secondary),
              )
            ]),
          )
        ],
      ),
    );
  }
}

class _TimeRanges extends StatefulWidget {
  const _TimeRanges({Key? key}) : super(key: key);

  @override
  State<_TimeRanges> createState() => __TimeRangesState();
}

class __TimeRangesState extends State<_TimeRanges> {
  bool box_1 = false;
  bool box_2 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "Seleccionar horario",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          CheckboxListTile(
            value: box_1,
            onChanged: (value) {
              box_1 = value!;
              setState(() {});
            },
            visualDensity: VisualDensity.compact,
            title: const Text("Lunes y miércoles de 9h a 11h"),
          ),
          CheckboxListTile(
            value: box_2,
            visualDensity: VisualDensity.compact,
            onChanged: (value) {
              box_2 = value!;
              setState(() {});
            },
            title: const Text("Martes y jueves de 9h a 11h"),
          )
        ],
      ),
    );
  }
}

class _Fees extends StatelessWidget {
  const _Fees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget totalFees = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AutoSizeText("Inscripción: \$1600"),
        AutoSizeText("Cuota: \$2300"),
      ],
    );

    return Container(
      height: 10.h,
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const AutoSizeText(
            "Tarifas",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          totalFees
        ],
      ),
    );
  }
}
