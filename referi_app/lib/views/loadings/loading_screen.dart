import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String? text;
  const LoadingScreen(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Visibility(
            visible: text != null,
            child: AutoSizeText(
              text!,
              maxFontSize: 26,
              minFontSize: 20,
              style: const TextStyle(fontSize: 24),
            ),
          )
        ],
      )),
    );
  }
}
