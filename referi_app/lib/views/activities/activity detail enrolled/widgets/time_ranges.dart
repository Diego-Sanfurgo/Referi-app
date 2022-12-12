import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:referi_app/models/enrollment.dart';

class TimeRangesDescription extends StatelessWidget {
  final Enrollment enrollment;

  const TimeRangesDescription(
    this.enrollment, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> shifts = [];

    for (var timeRange in enrollment.turnoActividad.horarios) {
      HorarioHorario horario = timeRange.horario;

      String startTime = horario.horaInicio.toString().length == 1
          ? "0${horario.horaInicio}"
          : horario.horaInicio.toString();

      Widget time = Padding(
        padding: const EdgeInsets.all(8),
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                TableCell(child: Text(horario.diaSemana)),
                TableCell(child: Text("Inicio: ${startTime}h")),
                TableCell(child: Text("Duración: ${horario.duracion}min")),
              ],
            ),
          ],
        ),
      );

      shifts.add(time);
    }

    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText(
                "Horarios",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ...shifts,
            ],
          )),
    );
  }
}
