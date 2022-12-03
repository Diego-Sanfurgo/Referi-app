import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '/models/activity.dart';
import 'widgets/detail_row.dart';
import '/models/payment_detail.dart';
import 'widgets/operation_header.dart';
import '/models/activity_fee_payment.dart';
import '/controllers/payment_controller.dart';
import '/controllers/activity_controller.dart';

class OperationDetail extends StatelessWidget {
  const OperationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ActivityFeePayment feePayment =
        ModalRoute.of(context)?.settings.arguments as ActivityFeePayment;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: _Body(feePayment),
    );
  }
}

class _Body extends StatelessWidget {
  final ActivityFeePayment feePayment;
  const _Body(this.feePayment, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _Detail(feePayment),
    );
  }
}

class _Detail extends StatelessWidget {
  final ActivityFeePayment feePayment;

  const _Detail(this.feePayment);

  @override
  Widget build(BuildContext context) {
    late final String idToFetch;
    bool hasPayment = false;

    if (feePayment.pago != null) {
      idToFetch = feePayment.pago!.id;
      hasPayment = true;
    } else {
      idToFetch = feePayment.actividad.id;
      hasPayment = false;
    }

    final Map<String, String> dataFields = _getOperationFillData(feePayment);

    return FutureBuilder(
      future: hasPayment
          ? PaymentController.obtainPaymentById(idToFetch)
          : ActivityController.obtainActivityById(idToFetch),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              heightFactor: 20, child: CircularProgressIndicator());
        }

        late final String orgName;
        if (hasPayment) {
          orgName = (snapshot.data as PaymentDetail).organizacion.nombre;
        } else {
          orgName = (snapshot.data as Activity).organizacion.nombre;
        }

        return Column(
          children: [
            OperationHeader(organizationName: orgName, feePayment: feePayment),
            ListView.separated(
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataFields.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(color: Colors.grey),
              itemBuilder: (BuildContext context, int index) {
                return DetailRow(index, dataFields);
              },
            ),
          ],
        );
      },
    );
  }
}

Map<String, String> _getOperationFillData(ActivityFeePayment feePayment) {
  String period = (feePayment.periodoInicio == feePayment.periodoFin)
      ? "Pago único"
      : "${DateFormat.Md().format(feePayment.periodoInicio)} al ${DateFormat.Md().format(feePayment.periodoFin)}";
  if (feePayment.pago == null) {
    return {
      "Operación": feePayment.tarifa.nombre,
      "Actividad": feePayment.actividad.nombre,
      "Estado": _getState(feePayment),
      "Fecha de vencimiento":
          DateFormat.yMd().format(feePayment.fechaVencimiento),
      "Periodo": period,
    };
  }

  return {
    "Operación": feePayment.tarifa.nombre,
    "Actividad": feePayment.actividad.nombre,
    "Estado": _getState(feePayment),
    "Medio de pago": feePayment.pago!.medioDePago,
    "Fecha": DateFormat.yMd().format(feePayment.pago!.fechaPago),
    "Hora": "${DateFormat.Hm().format(feePayment.pago!.fechaPago)} h",
    "Periodo": period,
    "N° operación": feePayment.pago!.id,
  };
}

String _getState(ActivityFeePayment feePayment) {
  if (feePayment.pago != null) {
    return "PAGADA";
  }
  if (feePayment.pago == null &&
      DateTime.now().isBefore(feePayment.fechaVencimiento)) {
    return "PENDIENTE";
  }

  return "VENCIDA";
}
