import 'package:flutter/material.dart';
import 'package:referi_app/controllers/activity_controller.dart';
import 'package:referi_app/models/activity.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/theme/colors.dart' as colors;
import 'package:referi_app/controllers/navigation_controller.dart';

class ActivityDetail extends StatelessWidget {
  const ActivityDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activity = ModalRoute.of(context)!.settings.arguments as Activity;

    return Scaffold(
      appBar: AppBar(title: const Text("Detalle de actividad")),
      body: _Body(activity),
    );
  }
}

class _Body extends StatelessWidget {
  final Activity activity;
  const _Body(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderActivity(activity),
                _TimeRanges(activity.turnos),
                const _Fees(),
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
  final Activity activity;
  const _HeaderActivity(this.activity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: activity.imgUrl != null
                ? Image.network(
                    activity.imgUrl!,
                    fit: BoxFit.cover,
                    width: 100.w,
                    height: 25.h,
                  )
                : Image.asset(
                    "assets/images/no_image_placeholder.png",
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
                AutoSizeText(
                  activity.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                AutoSizeText(activity.organizacion.nombre),
                GestureDetector(
                  onTap: () => NavigationController.goTo(Routes.clubDetail),
                  child: AutoSizeText(
                    "Ver más actividades de este lugar",
                    style: TextStyle(color: colors.secondaryDark),
                  ),
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
  final List<Turno> timeRanges;
  const _TimeRanges(this.timeRanges, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_TimeExpansionTile> timeTiles = [];

    for (var shift in timeRanges) {
      timeTiles.add(_TimeExpansionTile(shift));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AutoSizeText(
            "Seleccionar horario",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ...timeTiles,
        ],
      ),
    );
  }
}

class _TimeExpansionTile extends StatefulWidget {
  final Turno shift;
  const _TimeExpansionTile(this.shift, {Key? key}) : super(key: key);

  @override
  State<_TimeExpansionTile> createState() => _TimeExpansionTileState();
}

class _TimeExpansionTileState extends State<_TimeExpansionTile> {
  bool boxValue = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ActivityController.obtainShift(widget.shift.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: LinearProgressIndicator());
        }

        return ExpansionTile(
          controlAffinity: ListTileControlAffinity.leading,
          trailing: Checkbox(
              value: boxValue,
              onChanged: (value) {
                boxValue = value!;
                setState(() {});
              }),
          tilePadding: EdgeInsets.zero,
          title: Text(widget.shift.id),
          children: const [
            ListTile(
              dense: true,
              title: Text("Lunes"),
              trailing: Text("16 a 20"),
              visualDensity: VisualDensity.compact,
            ),
            ListTile(
              dense: true,
              title: Text("Miércoles"),
              trailing: Text("16 a 20"),
              visualDensity: VisualDensity.compact,
            ),
            ListTile(
              dense: true,
              title: Text("Viernes"),
              trailing: Text("16 a 20"),
              visualDensity: VisualDensity.compact,
            )
          ],
        );
      },
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
