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
        children: [
          const CircularProgressIndicator(),
          if (text != null) ...[
            const SizedBox(height: 16),
            AutoSizeText(
              text!,
              maxFontSize: 26,
              minFontSize: 20,
              style: const TextStyle(fontSize: 24),
            )
          ]
        ],
      )),
    );
  }
}
