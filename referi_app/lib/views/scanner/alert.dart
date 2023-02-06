import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '/utils/utils.dart' as util;
import '/theme/colors.dart' as color;

abstract class Alert {
  static showLoadingData() async {
    await showDialog(
      barrierDismissible: false,
      context: util.navigatorContext,
      builder: (context) => Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color.colorOverlay,
          ),
          width: 35.w,
          height: 35.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Material(
                color: Colors.transparent,
                child: AutoSizeText(
                  "Leyendo datos",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  minFontSize: 16,
                  maxFontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static showError() async {
    await showDialog(
      barrierDismissible: false,
      context: util.navigatorContext,
      builder: (context) => Align(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: color.colorOverlay,
          ),
          width: 75.w,
          height: 45.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_rounded,
                color: Colors.red.shade400,
                size: 32,
              ),
              const Material(
                color: Colors.transparent,
                child: AutoSizeText(
                  "Ocurrió un error al leer el código QR. Inténtalo de nuevo o comunicáselo al portero.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                  minFontSize: 16,
                  maxFontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
