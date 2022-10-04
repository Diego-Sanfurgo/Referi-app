import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationDetail extends StatelessWidget {
  const OperationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de operación"),
      ),
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
      child: Center(
        child: Column(
          children: [
            AutoSizeText(
                "Realizada el ${DateFormat.yMd('es, ES').format(DateTime.now()).toString()}"),
            const AutoSizeText("Número de operación: 0123456789"),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.black38),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      AutoSizeText("Operación",
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text("Inscripción")
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
