import 'package:flutter/material.dart';

class SignUpBottomButton extends StatelessWidget {
  final String text;
  final void Function() onPress;

  const SignUpBottomButton(this.text, {Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 72),
      child: ElevatedButton(
          onPressed:  onPress,
          child: Text(text.toUpperCase())),
    );
  }
}
