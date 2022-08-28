import 'package:flutter/material.dart';
import 'package:referi_app/widgets/forms/progress_bar_signup.dart';
import 'package:referi_app/widgets/forms/textfield.dart';
import 'package:referi_app/widgets/signup_bottom_btn.dart';

import '../../controllers/navigation_controller.dart';

class SignUpFirst extends StatelessWidget {
  const SignUpFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const SignUpFirstBody(),
              SignUpBottomButton(
                "CONTINUAR",
                onPress: () => NavigationController.goTo(Routes.signup_2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpFirstBody extends StatelessWidget {
  const SignUpFirstBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CustomTextField("Nombre y apellido", keyboard: TextInputType.name),
        CustomTextField("DNI", keyboard: TextInputType.number),
        CustomTextField("Fecha de nacimiento", keyboard: TextInputType.number),
        CustomTextField("Domicilio", keyboard: TextInputType.streetAddress),
      ],
    );
  }
}
