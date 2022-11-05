import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:referi_app/controllers/navigation_controller.dart';
import 'package:referi_app/widgets/forms/textfields.dart';

class PassRecover extends StatelessWidget {
  const PassRecover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recuperar contraseña"),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AutoSizeText(
              "Introduce un correo electrónico para recibir un código de recuperación.",
              maxLines: 2,
              maxFontSize: 24,
              minFontSize: 18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const NameTextField(false, label: "Correo electrónico"),
            const SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  if(!formKey.currentState!.validate()){
                    return;
                  }
                  formKey.currentState!.save();
                  NavigationController.goTo(Routes.signup_3);
                },
                child: const Text('Enviar código'))
          ],
        ),
      ),
    );
  }
}
