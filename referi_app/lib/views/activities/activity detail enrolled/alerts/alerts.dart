import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import 'package:referi_app/utils/utils.dart' as util;

abstract class ActivityDetailEnrolledAlert {
  static Future cannotCancelDialog() async {
    await showDialog(
      context: util.navigatorContext,
      builder: (context) {
        return AlertDialog(
          content: const Text(
            "No puedes cancelar tu inscripción porque tienes deuda. Regulariza tu estado para poder cancelar.",
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton(
                onPressed: () => NavigationController.pop(),
                child: const Text("Entedido"))
          ],
        );
      },
    );
  }

  static Future<bool> askConfirmation() async {
    bool userConfirms = false;
    await showDialog(
        context: util.navigatorContext,
        builder: (context) {
          return AlertDialog(
            content: const Text(
              "Una vez que canceles tu inscripción deberás pagar de nuevo si quieres volver. ¿Seguro que quieres cancelar tu inscripción?",
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                  onPressed: () {
                    NavigationController.pop();
                    userConfirms = false;
                  },
                  child: const Text("Salir")),
              TextButton(
                  onPressed: () {
                    NavigationController.pop();
                    userConfirms = true;
                  },
                  child: const Text("Confirmar")),
            ],
          );
        });

    return userConfirms;
  }
}
