import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NotFoundAnimation extends StatelessWidget {
  final double? size;
  const NotFoundAnimation({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthAndHeight = size ?? 50.w;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            'assets/animations/lottie_not_found_lens.zip',
            width: widthAndHeight,
            height: widthAndHeight,
            repeat: false,
          ),
          const SizedBox(height: 16),
          const AutoSizeText("No encontramos actividades",
              minFontSize: 20, maxFontSize: 24)
        ],
      ),
    );
  }
}
