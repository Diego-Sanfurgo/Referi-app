import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '/models/turno.dart';
import '/models/activity.dart';
import '/controllers/activity_controller.dart';

class TimeRanges extends StatelessWidget {
  final List<TurnoId> timeRanges;
  const TimeRanges(this.timeRanges, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_TimeExpansionTile> timeTiles = [];

    for (var i = 0; i < timeRanges.length; i++) {
      timeTiles.add(_TimeExpansionTile(timeRanges[i], i));
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
  final TurnoId turnoId;
  final int index;
  const _TimeExpansionTile(this.turnoId, this.index, {Key? key})
      : super(key: key);

  @override
  State<_TimeExpansionTile> createState() => _TimeExpansionTileState();
}

class _TimeExpansionTileState extends State<_TimeExpansionTile> {
  bool boxValue = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Turno?>(
      future: ActivityController.obtainShift(widget.turnoId.id),
      builder: (BuildContext context, AsyncSnapshot<Turno?> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: LinearProgressIndicator());
        }

        if (snapshot.data == null) {
          return const SizedBox();
        }

        Turno turno = snapshot.data!;
        List<Widget> timeRange = [];
        for (var hourRange in turno.horarios) {
          timeRange.add(Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    TableCell(child: Text(hourRange.horario.diaSemana)),
                    TableCell(
                        child:
                            Text("Inicio: ${hourRange.horario.horaInicio}h")),
                    TableCell(
                        child:
                            Text("Duración: ${hourRange.horario.duracion}min")),
                  ],
                ),
              ],
            ),
          ));
        }

        String label = "Turno ${widget.index + 1}";
        return ExpansionTile(
          controlAffinity: ListTileControlAffinity.leading,
          trailing: Checkbox(
              value: boxValue,
              onChanged: (value) {
                boxValue = value!;
                ActivityController.addTimeRange(turno.id, label, boxValue);
                setState(() {});
              }),
          tilePadding: EdgeInsets.zero,
          title: Text(label),
          children: timeRange,
        );
      },
    );
  }
}
