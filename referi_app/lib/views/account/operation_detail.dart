import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/theme/colors.dart' as colors;

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
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  height: 15.h,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: AutoSizeText(
                          "Club Obras",
                          minFontSize: 16,
                          maxFontSize: 24,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      AutoSizeText(
                        "\$2500",
                        minFontSize: 20,
                        maxFontSize: 36,
                        style: TextStyle(
                            fontSize: 26, color: colors.primary.shade800),
                      ),
                    ],
                  )),
              // AutoSizeText(
              //     "Realizada el ${DateFormat.yMd('es, ES').format(DateTime.now()).toString()}"),
              // const AutoSizeText("Número de operación: 0123456789"),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: operationFillData.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: colors.primary.shade800),
                itemBuilder: (BuildContext context, int index) {
                  return _DetailRow(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final int index;

  const _DetailRow(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(operationFillData.keys.elementAt(index),
              style: const TextStyle(fontSize: 16, color: Colors.black)),
          Text(operationFillData.values.elementAt(index))
        ],
      ),
    );
  }
}

Map<String, String> get operationFillData => {
      "Actividad": "Fútbol 11 juvenil",
      "Operación": "Inscripcion",
      "Estado": "Completada",
      "Medio de pago": "Tarjeta de débito",
      "Fecha": "08/10/2022",
      "Hora": "12:43 hs",
      "N° operación": "0123456789",
    };
