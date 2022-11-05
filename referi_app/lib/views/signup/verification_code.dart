import 'dart:async';
import 'package:flutter/material.dart';

import 'package:referi_app/controllers/signup_controller.dart';
import 'package:referi_app/providers/app_providers.dart';

import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../theme/colors.dart' as colors;
import '../../widgets/forms/progress_bar_signup.dart';

ValueNotifier<bool> _enableBtn = ValueNotifier<bool>(false);
late final String _code;

class VerificationCode extends StatelessWidget {
  const VerificationCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verificación")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProgressBarSignUp(
                firstCompleted: true,
                secondCompleted: true,
              ),
              const _Body(),
              Container(
                margin: const EdgeInsets.only(top: 72),
                child: ValueListenableBuilder(
                  valueListenable: _enableBtn,
                  builder: (context, bool enableBtn, child) {
                    return ElevatedButton(
                        onPressed: enableBtn
                            ? () => SignUpController.saveRegisteringUser(_code)
                            : null,
                        child: const Text("CONTINUAR"));
                  },
                ),
              ),
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
  late Timer timer;
  bool isWaiting = true;
  late Duration duration;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer =
        Timer.periodic(const Duration(seconds: 1), (cTimer) => setCountDown());
    duration = const Duration(seconds: 30);
  }

  void stopTimer() => setState(() => timer.cancel());

  void resetTimer() {
    setState(() {
      startTimer();
    });
  }

  void setCountDown() {
    setState(() {
      final seconds = duration.inSeconds - 1;
      if (seconds < 0) {
        timer.cancel();
        isWaiting = false;
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String userEmail = AppProviders.userProvider(context).userRegister['email'];
    List<String> splitEmail = userEmail.split('@');

    String hiddenPart =
        userEmail.replaceRange(2, splitEmail.first.length - 1, "****");

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = strDigits(duration.inSeconds.remainder(60));

    Widget guideText = SizedBox(
      width: double.infinity,
      height: 10.h,
      child: AutoSizeText(
        "Para verificar tu identidad enviaremos un correo a $hiddenPart",
        maxLines: 3,
        maxFontSize: 24,
        minFontSize: 18,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );

    return Column(
      children: [
        guideText,
        const SizedBox(height: 32),
        const Text("Ingrese el código", style: TextStyle(fontSize: 16)),
        const _CodeInputField(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: isWaiting ? null : () => resetTimer(),
                child: const Text("Reenviar", style: TextStyle(fontSize: 16))),
            Visibility(
                visible: isWaiting,
                child: Text("($seconds)", style: const TextStyle(fontSize: 16)))
          ],
        )
      ],
    );
  }
}

class _CodeInputField extends StatefulWidget {
  const _CodeInputField({Key? key}) : super(key: key);

  @override
  State<_CodeInputField> createState() => _CodeInputFieldState();
}

class _CodeInputFieldState extends State<_CodeInputField> {
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
          if (value.length == 4) {
            _enableBtn.value = true;
            _code = codeController.text;
          } else {
            _enableBtn.value = false;
          }
        },
      ),
    );
  }
}
