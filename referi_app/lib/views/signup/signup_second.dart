import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/widgets/forms/progress_bar_signup.dart';
import 'package:referi_app/widgets/forms/textfield.dart';
import 'package:referi_app/widgets/signup_bottom_btn.dart';

class SignUpSecond extends StatelessWidget {
  const SignUpSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProgressBarSignUp(),
            const _Body(),
            SignUpBottomButton("CONTINUAR",
                onPress: () =>
                    NavigationController.goTo(Routes.signup_3, popPage: true)),
          ],
        ),
      )),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextField("Correo electrónico",
            keyboard: TextInputType.emailAddress),
        PasswordTextField("Contraseña"),
        PasswordRules(),
        PasswordTextField("Repetir contraseña"),
      ],
    );
  }
}
