import 'package:flutter/material.dart';

import 'package:referi_app/theme/colors.dart' as colors;
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeInputField extends StatefulWidget {
  const CodeInputField({Key? key}) : super(key: key);

  @override
  State<CodeInputField> createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<CodeInputField> {
  late final TextEditingController codeController;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController();
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: PinCodeTextField(
        appContext: context,
        controller: codeController,
        length: 4,
        keyboardType: TextInputType.number,
        autoDismissKeyboard: false,
        animationType: AnimationType.scale,
        autoDisposeControllers: false,
        pinTheme: PinTheme(
            activeColor: colors.secondary,
            selectedColor: colors.secondary,
            borderRadius: BorderRadius.circular(10),
            shape: PinCodeFieldShape.box,
            inactiveColor: Colors.grey,
            fieldWidth: 56,
            fieldHeight: 56),
        onChanged: (value) {
          // if (value.length == 4) {
          //   _enableBtn.value = true;
          //   _code = codeController.text;
          // } else {
          //   _enableBtn.value = false;
          // }
        },
      ),
    );
  }
}