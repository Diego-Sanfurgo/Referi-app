import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/widgets/signup_bottom_btn.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:referi_app/styles/colors.dart' as colors;
import 'package:referi_app/widgets/forms/progress_bar_signup.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verificación"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProgressBarSignUp(),
              const _Body(),
              SignUpBottomButton("INGRESAR",
                  onPress: (() =>
                      NavigationController.goTo(context, route: Routes.home)))
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String timeToResend = "30";
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      timeToResend = timer.tick.toString();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget guideText = SizedBox(
      width: double.infinity,
      height: 10.h,
      child: const AutoSizeText(
        "Para verificar tu identidad enviaremos un correo a *****@ejemplo.com",
        maxLines: 3,
        maxFontSize: 24,
        minFontSize: 18,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );

    return Column(
      children: [
        guideText,
        const SizedBox(height: 32),
        const Text("Ingrese el código", style: TextStyle(fontSize: 16)),
        const CodeInputField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Reenviar",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )),
            Text("($timeToResend)", style: const TextStyle(fontSize: 16))
          ],
        )
      ],
    );
  }
}

class CodeInputField extends StatelessWidget {
  const CodeInputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        keyboardType: TextInputType.number,
        autoDismissKeyboard: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            activeColor: colors.secondary,
            selectedColor: colors.secondary,
            borderRadius: BorderRadius.circular(10),
            shape: PinCodeFieldShape.box,
            inactiveColor: Colors.grey,
            fieldWidth: 56,
            fieldHeight: 56),
        onChanged: (value) {},
      ),
    );
  }
}
