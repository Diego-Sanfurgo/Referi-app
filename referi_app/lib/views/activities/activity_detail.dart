import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final imagePath = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de actividad")),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  // final String imagePath;
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _HeaderActivity(),
          const _TimeRanges(),
          const _Fees(),
          ElevatedButton(onPressed: () {}, child: const Text("INSCRIBIRSE"))
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
      height: 45.h,
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
            isThreeLine: true,
            title: const AutoSizeText("Activity name"),
            subtitle:
                Column(children: const [AutoSizeText(""), AutoSizeText("")]),
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText("Seleccionar horario"),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text("Lunes y miércoles de 9h a 11h"),
        ),
        CheckboxListTile(
          value: false,
          onChanged: (value) {},
          title: Text("Martes y jueves de 9h a 11h"),
        )
      ],
    );
  }
}

class _Fees extends StatelessWidget {
  const _Fees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText("Tarifas"),
        const AutoSizeText("Inscripción: \$1600"),
        const AutoSizeText("Cuota: \$2300"),
      ],
    );
  }
}
