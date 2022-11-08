import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../utils/network_assets_urls.dart';

class NotFoundAnimation extends StatelessWidget {
  const NotFoundAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthAndHeight = 50.w;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.network(
            NetworkAssets.noDataFound,
            width: widthAndHeight,
            height: widthAndHeight,
            repeat: false,
          ),
          const SizedBox(height: 16),
          const AutoSizeText("No encontramos actividades :(",
              minFontSize: 20, maxFontSize: 24)
        ],
      ),
    );
  }
}
