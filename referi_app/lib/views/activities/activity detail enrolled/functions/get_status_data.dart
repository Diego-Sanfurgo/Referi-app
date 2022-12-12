import 'package:intl/intl.dart';

import '/models/enrollment.dart';
import '/models/activity_fee_payment.dart';

Map<String, String>? getStatusData(
    Enrollment enrollment, List<ActivityFeePayment> payments) {
  Map<String, String> data = {};

  bool hasElements = payments.any((element) =>
      element.actividad.id == enrollment.turnoActividad.actividad.id);
  if (!hasElements) return null;

  ActivityFeePayment? payment = payments.firstWhere((element) =>
      element.actividad.id == enrollment.turnoActividad.actividad.id);
  bool isExpired = DateTime.now().isAfter(payment.fechaVencimiento);

  if (!isExpired || payment.pago != null) {
    data.addAll({"estado": "Activo"});
  } else {
    data.addAll({"estado": "Deuda"});
  }
  data.addAll(
      {"vto": DateFormat.yMd("es, ES").format(payment.fechaVencimiento)});

  return data;
}
