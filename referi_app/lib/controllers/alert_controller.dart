import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:referi_app/utils/utils.dart' as util;

abstract class Alert {
  static Future<String?> showDateAlert() async {
    DateTime? chosenDate = await showDatePicker(
        context: util.navigatorState?.context as BuildContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(1922),
        lastDate: DateTime.now(),
        locale: const Locale('es', ''));

    if (chosenDate == null) {
      return null;
    }

    return DateFormat('dd/MM/yyyy').format(chosenDate.toUtc());
  }
}
