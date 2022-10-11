import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../theme/colors.dart' as colors;

class ActivityPayment extends StatelessWidget {
  const ActivityPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pago")),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const _ActivityCardDetail(),
          const SizedBox(height: 24),
          const _ActivityFees(),
          // SizedBox(height: 20.h),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text("PAGAR"))
        ],
      ),
    );
  }
}

class _ActivityCardDetail extends StatelessWidget {
  const _ActivityCardDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Detalle de actividad",
          minFontSize: 20,
          maxFontSize: 26,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Card(
          margin: const EdgeInsets.only(top: 16),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: AutoSizeText("Actividad:",
                    style: TextStyle(color: Colors.grey.shade600)),
                trailing: const AutoSizeText("Nombre Actividad"),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: AutoSizeText("Club:",
                    style: TextStyle(color: Colors.grey.shade600)),
                trailing: const AutoSizeText("Nombre Club"),
              ),
              ListTile(
                visualDensity: VisualDensity.compact,
                leading: AutoSizeText("Horario elegido:",
                    style: TextStyle(color: Colors.grey.shade600)),
                trailing: const AutoSizeText("Toda la semana"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActivityFees extends StatelessWidget {
  const _ActivityFees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Resumen de pago",
          minFontSize: 20,
          maxFontSize: 26,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const ListTile(
          leading: AutoSizeText("Inscripción"),
          trailing: AutoSizeText("\$1500"),
          visualDensity: VisualDensity.compact,
        ),
        const ListTile(
          leading: AutoSizeText("Pago mensual"),
          trailing: AutoSizeText("\$2800"),
          visualDensity: VisualDensity.compact,
        ),
        Divider(color: colors.primary),
        const ListTile(
          leading: AutoSizeText("Total"),
          trailing: AutoSizeText("\$4300"),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}
