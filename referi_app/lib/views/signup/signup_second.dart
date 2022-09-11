import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/controllers/signup_controller.dart';
import 'package:referi_app/widgets/forms/progress_bar_signup.dart';
import 'package:referi_app/widgets/forms/textfield.dart';
import 'package:referi_app/widgets/signup_bottom_btn.dart';

class SignUpSecond extends StatelessWidget {
  const SignUpSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(title: const Text("Registro")),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProgressBarSignUp(firstCompleted: true),
            _Body(formKey),
            SignUpBottomButton("CONTINUAR",
                onPress: () => SignUpController.checkSecondForm(formKey)),
          ],
        ),
      )),
    );
  }
}

class _Body extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const _Body(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: const [
          CustomTextField(
            "Correo electrónico",
            keyboard: TextInputType.emailAddress,
            showCounter: false,
            saveKeyLabel: "email",
          ),
          PasswordTextField("Contraseña"),
          PasswordRules(),
          PasswordTextField(
            "Repetir contraseña",
            saveField: false,
          ),
        ],
      ),
    );
  }
}
