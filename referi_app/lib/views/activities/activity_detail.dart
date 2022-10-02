import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/theme/colors.dart' as colors;
import 'package:referi_app/controllers/navigation_controller.dart';

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
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _HeaderActivity(),
                _TimeRanges(),
                _Fees(),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          sliver: SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () =>
                          NavigationController.goTo(Routes.activityPayment),
                      child: const Text("INSCRIBIRSE")),
                ],
              )),
        ),
      ],
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 100.w,
              height: 25.h,
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Activity name",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const AutoSizeText("Club regatas"),
                AutoSizeText(
                  "Ver más actividades del club",
                  style: TextStyle(color: colors.secondaryDark),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TimeRanges extends StatelessWidget {
  const _TimeRanges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AutoSizeText(
            "Seleccionar horario",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          _TimeExpansionTile(),
          _TimeExpansionTile(),
          _TimeExpansionTile(),
        ],
      ),
    );
  }
}

class _TimeExpansionTile extends StatefulWidget {
  const _TimeExpansionTile({Key? key}) : super(key: key);

  @override
  State<_TimeExpansionTile> createState() => _TimeExpansionTileState();
}

class _TimeExpansionTileState extends State<_TimeExpansionTile> {
  bool boxValue = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.leading,
      trailing: Checkbox(
          value: boxValue,
          onChanged: (value) {
            boxValue = value!;
            setState(() {});
          }),
      tilePadding: EdgeInsets.zero,
      title: const Text("Horario prueba"),
      children: const [
        ListTile(
          dense: true,
          leading: Text("Lunes"),
          title: Text("16 a 20"),
          visualDensity: VisualDensity.compact,
        )
      ],
    );
  }
}

class _Fees extends StatelessWidget {
  const _Fees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget totalFees = Column(
      children: const [
        ListTile(
          title: AutoSizeText("Inscripción:"),
          trailing: AutoSizeText("\$1600"),
          visualDensity: VisualDensity.compact,
        ),
        ListTile(
          title: AutoSizeText("Cuota mensual:"),
          trailing: AutoSizeText("\$2300"),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
