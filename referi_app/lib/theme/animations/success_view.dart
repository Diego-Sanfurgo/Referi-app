import 'dart:async';

import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';

import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SuccessView extends StatelessWidget {
  final double? size;
  const SuccessView({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    double widthAndHeight = size ?? 50.w;

    Timer(const Duration(seconds: 10),
        () => NavigationController.goTo(Routes.home, popUntil: true));

    return Scaffold(
      body: _SuccessAnimation(widthAndHeight),
    );
  }
}

class _SuccessAnimation extends StatelessWidget {
  final double widthAndHeight;
  const _SuccessAnimation(this.widthAndHeight);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            'assets/animations/lottie_succes.json',
            width: widthAndHeight,
            height: widthAndHeight,
            repeat: false,
          ),
          const SizedBox(height: 16),
          const AutoSizeText("¡Pago realizado exitosamente!",
              minFontSize: 20, maxFontSize: 24)
        ],
      ),
    );
  }
}
