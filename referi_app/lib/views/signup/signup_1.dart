import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../widgets/forms/name_and_surname_fields.dart';
import '../../widgets/forms/street_and_number_fields.dart';

import '../../controllers/signup_controller.dart';
import '../../widgets/forms/progress_bar_signup.dart';
import '../../widgets/forms/textfields.dart';

class SignUpFirst extends StatelessWidget {
  const SignUpFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProgressBarSignUp(),
              _Body(formKey),
              Container(
                margin: const EdgeInsets.only(top: 72),
                child: ElevatedButton(
                    onPressed: () => SignUpController.checkFirstForm(formKey),
                    child: const Text("CONTINUAR")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final Key formKey;
  const _Body(this.formKey, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AutoSizeText("Datos personales", style: TextStyle(fontSize: 16)),
          Divider(color: Colors.grey),
          _PersonalFields(),
          AutoSizeText("Domicilio", style: TextStyle(fontSize: 16)),
          Divider(color: Colors.grey),
          _DirectionFields()
        ],
      ),
    );
  }
}

class _PersonalFields extends StatelessWidget {
  const _PersonalFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: const [
          NameAndSurnameTextFields(false),
          NumberTextField(false, label: "DNI", maxLength: 8),
          DateTextField(false, label: "Fecha de nacimiento"),
        ],
      ),
    );
  }
}

class _DirectionFields extends StatelessWidget {
  const _DirectionFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 8), child: StreetAndNumberFields(false));
  }
}
