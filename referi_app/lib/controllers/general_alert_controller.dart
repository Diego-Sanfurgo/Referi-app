import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/utils/utils.dart' as util;
import '/models/dto/activity_dto.dart';
import '/widgets/circular_container.dart';
import '/controllers/user_controller.dart';
import '/controllers/activity_controller.dart';
import '/controllers/navigation_controller.dart';

final BuildContext _navigatorContext =
    util.navigatorKey.currentContext as BuildContext;

abstract class GeneralAlert {
  static Future<String?> showDateAlert() async {
    DateTime? chosenDate = await showDatePicker(
        context: util.navigatorState?.context as BuildContext,
        initialDate: DateTime.now(),
        firstDate: DateTime(1922),
        lastDate: DateTime.now(),
        locale: const Locale('es', ''));

    if (chosenDate == null) return null;

    return DateFormat('dd/MM/yyyy').format(chosenDate.toUtc());
  }

  static Future showImagePickerSheet() async {
    return await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        // context: util.navigatorKey.currentContext as BuildContext,
        context: util.navigatorContext,
        builder: (context) {
          return Container(
            height: 20.h,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularContainer(
                  child: IconButton(
                      onPressed: () => UserController.captureImage(true),
                      icon: const Icon(Icons.camera_alt_rounded)),
                ),
                CircularContainer(
                  child: IconButton(
                      onPressed: () => UserController.captureImage(false),
                      icon: const Icon(Icons.photo_library_rounded)),
                )
              ],
            ),
          );
        });
  }

  static Future showLoading() async {
    await showDialog(
      context: _navigatorContext,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  static Future showError(String? errorText) async {
    // Timer(const Duration(seconds: 6), () => NavigationController.pop());
    await showDialog(
        context: _navigatorContext,
        builder: (_) {
          return AlertDialog(
            title: const Icon(
              Icons.error_rounded,
              color: Colors.red,
            ),
            content: Text(
              errorText ??
                  "Ocurrió un error al intentar realizar la acción. Intenta de nuevo en unos segundos.",
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
          );
        });
  }

  static showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static showReservePlaceMessage(DTOActivity activity) async {
    String textContent =
        "Podés reservar tu lugar y pagar luego desde la app o en el establecimiento.\nLa reserva dura 3 días y se pierde si no se realizó ningún pago en este tiempo.\n¿Querés reservar?";
    await showDialog(
        context: _navigatorContext,
        builder: (_) {
          return AlertDialog(
            content: Text(
              textContent,
              textAlign: TextAlign.center,
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              TextButton(
                onPressed: () => NavigationController.pop(),
                child: Text(
                  "CANCELAR",
                  style: TextStyle(color: Colors.red.shade400),
                ),
              ),
              TextButton(
                onPressed: () async {
                  NavigationController.pop();
                  await ActivityController.enrollToActivity(activity);
                },
                child: const Text("RESERVAR"),
              ),
            ],
          );
        });
  }
}
