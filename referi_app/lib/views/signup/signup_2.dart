import 'package:flutter/material.dart';

import '../../controllers/signup_controller.dart';
import '../../widgets/forms/progress_bar_signup.dart';
import '../../widgets/forms/textfield.dart';
import '../../widgets/signup_bottom_btn.dart';

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
                onPress: () => SignUpController.checkSignUpForm(formKey, 2)),
          ],
        ),
      )),
    );
  }
}

class _Body extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const _Body(this.formKey, {Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late final TextEditingController pass_1;
  late final TextEditingController pass_2;

  @override
  void initState() {
    super.initState();
    pass_1 = TextEditingController();
    pass_2 = TextEditingController();
  }

  @override
  void dispose() {
    pass_1.dispose();
    pass_2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //  \nDebe incluir, al menos, un caracter especial
    String helperErrorText =
        """Debe tener entre 8 y 12 caracteres \nDebe incluir mayúsculas y minúsculas""";

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const CustomTextField(
            "Correo electrónico",
            keyboard: TextInputType.emailAddress,
            showCounter: false,
            saveKeyLabel: "email",
          ),
          PasswordTextField(
            "Contraseña",
            controller: pass_1,
            onChange: (value) => _saveValue(value, 'password'),
            helperText: helperErrorText,
            validator: _passwordValidator,
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: PasswordTextField("Repetir contraseña",
                controller: pass_2,
                saveField: false,
                validator: _comparePasswords),
          ),
        ],
      ),
    );
  }
}

String? _passwordValidator(String? value) {
  String errorText = '';
  if (value == null) {
    errorText == "Debe completar este campo. ";
    return errorText;
  }

  //Primero valido si las condiciones se cumplen
  if ((value.length >= 8 || value.length <= 12) &&
      (value.contains(RegExp(r'[A-Z]'), 0)) &&
      (value.contains(RegExp(r'[a-z]'), 0))) {
    return null;
  }

  //Si no se cumplen, entonces valido por cada condición y la agrego al texto
  if (value.length < 8 || value.length > 12) {
    errorText += errorText.contains('Debe')
        ? "\nDebe tener entre 8 y 12 caracteres."
        : "Debe tener entre 8 y 12 caracteres.";
  }

  if ((!value.contains(RegExp(r'[A-Z]'), 0)) ||
      (!value.contains(RegExp(r'[a-z]'), 0))) {
    errorText += errorText.contains('Debe')
        ? "\nDebe incluir mayúsculas y minúsculas."
        : "Debe incluir mayúsculas y minúsculas.";
  }

  return errorText;
}

void _saveValue(String? value, String label) {
  if (value == null) {
    return;
  }
  SignUpController.saveValue(value, label);
}

String? _comparePasswords(String? value) {
  if (value != null) {
    return SignUpController.comparePasswords(value);
  }
  return "Debe completar este campo.";
}
