import 'package:flutter/material.dart';
import 'package:referi_app/providers/app_providers.dart';

class SignUpBottomButton extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  final ValueNotifier<bool>? enable;

  const SignUpBottomButton(this.text,
      {Key? key, required this.onPress, this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable:
            enable ?? AppProviders.userProvider(context).isFormValid,
        builder: (context, value, child) {
          return Container(
            margin: const EdgeInsets.only(top: 72),
            child: ElevatedButton(
                onPressed: value ? onPress : null,
                child: Text(text.toUpperCase())),
          );
        });
  }
}
