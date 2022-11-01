import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../widgets/forms/textfields.dart';
import '../../controllers/user_controller.dart';

import '../../widgets/forms/textfield.dart';
import '../../controllers/signup_controller.dart';
import '../../widgets/forms/progress_bar_signup.dart';

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
            Container(
              margin: const EdgeInsets.only(top: 72),
              child: ElevatedButton(
                onPressed: () => SignUpController.checkSecondForm(formKey),
                child: const Text("CONTINUAR"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: AutoSizeText(
                "En el siguiente paso enviaremos un código de verificación al correo electrónico que ingreses en este formulario.",
                minFontSize: 14,
                maxFontSize: 22,
                textAlign: TextAlign.center,
              ),
            ),
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
          const NameTextField(false, label: "Correo electrónico"),
          PasswordTextField(
            "Contraseña",
            controller: pass_1,
            onChange: (value) => _saveValue(value, 'password'),
            helperText: helperErrorText,
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

void _saveValue(String? value, String label) {
  if (value == null) {
    return;
  }
  UserController.addValueToUser(value, label);
}

String? _comparePasswords(String? value) {
  if (value != null) {
    return SignUpController.comparePasswords(value);
  }
  return "Debe completar este campo.";
}
