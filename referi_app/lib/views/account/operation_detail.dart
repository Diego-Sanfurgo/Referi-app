import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../models/payment_detail.dart';
import '../../theme/colors.dart' as colors;
import '../../models/activity_fee_payment.dart';
import '../../controllers/payment_controller.dart';
import '../../theme/animations/activities_not_found.dart';

class OperationDetail extends StatelessWidget {
  const OperationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ActivityFeePayment feePayment =
        ModalRoute.of(context)?.settings.arguments as ActivityFeePayment;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle de operación"),
      ),
      body: _Body(feePayment),
    );
  }
}

class _Body extends StatelessWidget {
  final ActivityFeePayment feePayment;
  const _Body(this.feePayment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Map<String, String> dataFields = getOperationFillData(feePayment);

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
                          "NOMBRE CLUB",
                          minFontSize: 16,
                          maxFontSize: 24,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      AutoSizeText(
                        "\$${feePayment.monto}",
                        minFontSize: 20,
                        maxFontSize: 36,
                        style: TextStyle(
                            fontSize: 26, color: colors.primary.shade800),
                      ),
                    ],
                  )),

              _Detail(feePayment),
              // AutoSizeText(
              //     "Realizada el ${DateFormat.yMd('es, ES').format(DateTime.now()).toString()}"),
              // const AutoSizeText("Número de operación: 0123456789"),
              // ListView.separated(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: dataFields.length,
              //   separatorBuilder: (BuildContext context, int index) =>
              //       Divider(color: colors.primary.shade800),
              //   itemBuilder: (BuildContext context, int index) {
              //     return _DetailRow(index, dataFields);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  final ActivityFeePayment feePayment;

  const _Detail(this.feePayment);

  @override
  Widget build(BuildContext context) {
    final String paymentId = feePayment.id;
    final Map<String, String> dataFields = _getOperationFillData(feePayment);

    return FutureBuilder<PaymentDetail?>(
      future: PaymentController.obtainPaymentById(paymentId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return const NotFoundAnimation();
        }

        PaymentDetail paymentDetail = snapshot.data;

        return Column(
          children: [
            Container(
                alignment: Alignment.center,
                height: 15.h,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: AutoSizeText(
                        paymentDetail.organizacion.nombre,
                        minFontSize: 16,
                        maxFontSize: 24,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    AutoSizeText(
                      "\$${paymentDetail.cuotas.length}",
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
              itemCount: dataFields.length,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: colors.primary.shade800),
              itemBuilder: (BuildContext context, int index) {
                return _DetailRow(index, dataFields);
              },
            ),
          ],
        );
      },
    );
  }
}

class _DetailRow extends StatelessWidget {
  final int index;
  final Map<String, String> dataFields;

  const _DetailRow(this.index, this.dataFields, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(dataFields.keys.elementAt(index),
              style: const TextStyle(fontSize: 16, color: Colors.black)),
          Text(dataFields.values.elementAt(index))
        ],
      ),
    );
  }
}

Map<String, String> _getOperationFillData(ActivityFeePayment feePayment) => {
      "Actividad": feePayment.actividad.nombre,
      "Operación": feePayment.tarifa.nombre,
      // "Estado": "Completada",
      "Medio de pago": feePayment.pago!.medioDePago,
      "Fecha": feePayment.pago!.fechaPago.toString(),
      "Hora": DateFormat.H(feePayment.pago!.fechaPago).toString(),
      "N° operación": feePayment.pago!.id,
    };
