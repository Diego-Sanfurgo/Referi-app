import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LoadingAnimation extends StatelessWidget {
  final double? size;
  const LoadingAnimation({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthAndHeight = size ?? 35.w;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            'assets/animations/lottie_loading_ball.zip',
            width: widthAndHeight,
            height: widthAndHeight,
          ),
          const SizedBox(height: 32),
          const AutoSizeText("Buscando actividades...",
              minFontSize: 20, maxFontSize: 24)
        ],
      ),
    );
  }
}
